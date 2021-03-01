// CA respawn system with wave respawns

#include "macros.hpp"

params ["_unit", "_corpse"];

DEBUG_PRINT_LOG("[RespawnWaves] Player respawning...")

CLIENT_ONLY;
LOCAL_ONLY(_unit);

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
WAIT_UNTIL_PLAYER_EXISTS();

#include "..\parts\tryTeleport.sqf"


// Set language of the units depending on side (BABEL API)
[_unit] spawn f_fnc_clientSetLanguages;



_tryJoinSquad =
{
    params ["_unit", "_groupId"];

    _side = side _unit;
    _foundGroup = grpNull;

    waitUntil
    {
        sleep 1;
        _group = GET_SQUAD_ON_SIDE_DYNAMIC(_groupId,_side);

        if !(_group isEqualTo grpNull) exitWith
        {
            _foundGroup = _group;
            true
        };

        false
    };

    sleep 2;

    [_unit] joinSilent _foundGroup;

    sleep 2;

    if !((groupId (group _unit)) isEqualTo _groupId) then
    {
        sleep 10;
        _text = format ["Unable to auto-join squad '%1'.<br/><br/>You will need to re-join or re-create the squad using 'CA Squad Actions'.", _groupId];
        [_text] call f_fnc_createSubtitleText;

    };

};




_doRespawn =
{
    params ["_unit", "_corpse", "_isJip"];

    #include "..\parts\applyOldLoadout.sqf"
    [_unit, _corpse] spawn _applyOldLoadout;

    if ((_isJip and IS_TRUE(f_var_JIPTeleport)) or ((!_isJip) and IS_TRUE(f_var_RespawnTeleport))) then
    {
        player setVariable ["f_var_mayTeleportToGroup", true, true];
    };

    [_unit, true] call f_fnc_activatePlayer;
    f_var_playerHasBeenKilled = false;

};




_waitToShowRespawnTitle =
{
    params ["_groupId", "_mode"];

    waitUntil
    {
        sleep 0.25;
        !IS_TRUE(f_var_playerHasBeenKilled);
    };

    f_var_respawnTitle_squadMode = _mode;
    f_var_respawnTitle_targetSquad = _groupId;
    "CA2_RespawnTitle" cutRsc ["CA2_RespawnTitle", "PLAIN", -1, false];
};




if (time < 30) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Time < 30, skipping respawn wave...")
    [_unit, _corpse, false] call _doRespawn;
}; // Apply a grace period at mission start.




_hasBeenKilled = missionNamespace getVariable ["f_var_playerHasBeenKilled", false];

DEBUG_FORMAT1_LOG("[RespawnWaves] Player has been killed?: %1",_hasBeenKilled)




// Join in progress and instant respawn handling
if (!_hasBeenKilled) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was not killed, handling as JIP...")
    [_unit, _corpse, true] call _doRespawn;

};




if (_hasBeenKilled) then
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was killed, adding to respawn wave...")
    DEBUG_PRINT_LOG("[RespawnWaves] Joining player to spectator group.")
    [_unit, "Spectators"] spawn _tryJoinSquad;
    sleep 2;

    [_unit, false] call f_fnc_activatePlayer;

    // Wait for respawn to happen
    _waveInfo = false;
    _side = side _unit;

    waitUntil
    {
        sleep 0.5;

        _hasSpawner = !(isNull (_unit getVariable ["mySpawner", objNull]));
        if (_hasSpawner) exitWith { true };

        _waveInfo = GET_RESPAWN_WAVE(_side);
        _hasWave = ((count _waveInfo) > 0) and {(_waveInfo select WAVEINFO_ISACTIVE) isEqualTo true};
        if (_hasWave) exitWith { true };

		false

    };

    if !((_unit getVariable ["mySpawner", objNull]) isEqualTo objNull) then
    {
        _waveInfo = [true, _unit getVariable ["mySpawner", objNull], ORIGINAL_SQUAD, serverTime];
    };

    DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave enabled, teleporting...")

    // Try spawning at designated location, or fallback to base location.
    _spawnAt = _waveInfo param [WAVEINFO_SPAWNAT, []];
    _joinGroup = _waveInfo param [WAVEINFO_JOINGROUP, ""];

    // Try *real hard* to get the player out of the damned spectator group.
    [_unit] joinSilent grpNull;
    sleep 2;

    switch (_joinGroup) do
    {
        case (ORIGINAL_SQUAD):
        {
            _originalGroupId = missionNamespace getVariable ["f_var_playerOriginalGroupName", ""];

            if (_originalGroupId isEqualTo "") then
            {
                DEBUG_PRINT_LOG("[RespawnWaves] Respawn group was ORIGINAL_SQUAD, but player does not have an original squad.  Joining player to empty group.")
                //[_unit] joinSilent grpNull;
            	["", "Error"] spawn _waitToShowRespawnTitle;

            }
            else
            {
                DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to join player to original group: %1",_originalGroupId)
                [_unit, _originalGroupId] spawn _tryJoinSquad;

                [_originalGroupId, "OriginalSquad"] spawn _waitToShowRespawnTitle;

            };

        };

        case (""):
        {
            DEBUG_PRINT_LOG("[RespawnWaves] Respawn group was absent, joining player to empty group.")
            //[_unit] joinSilent grpNull;

            ["", "Error"] spawn _waitToShowRespawnTitle;

        };

        default
        {
            DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to join player to respawn group: %1",_joinGroup)
            [_unit, _joinGroup] spawn _tryJoinSquad;

            [_joinGroup, "RespawnSquad"] spawn _waitToShowRespawnTitle;

        };

    };


    if ((_spawnAt isEqualTo []) or {((typeName _spawnAt) isEqualTo (typeName objNull)) and {isNull _spawnAt}}) then
    {
        DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave did not include a position or entity, using respawn marker pos.")
        _spawnAt = RESPAWN_MARKER_POS(_side);
    };

    _tpHandle = [_spawnAt] spawn _tryTeleport;

    waitUntil { scriptDone _tpHandle };

    [_unit, _corpse, true] call _doRespawn;

    DEBUG_PRINT_LOG("[RespawnWaves] All done.")

}
