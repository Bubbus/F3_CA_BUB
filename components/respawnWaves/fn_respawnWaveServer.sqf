#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_respawnWaveServer);
SERVER_ONLY;

params [["_posOrObject", []], "_side"];


if (_posOrObject isEqualTo []) then
{
    _posOrObject = RESPAWN_MARKER_POS(_side);
};



_squadMode = RESPAWN_SQUAD_MODE(_side);

_respawnGroupId = switch (_squadMode) do
{
    case (RESPAWN_REJOIN_OLD_SQUAD):
    {
        ORIGINAL_SQUAD
    };

    case (RESPAWN_JOIN_REINFORCEMENT_SQUAD):
    {
        _squads = RESPAWN_WAVE_SQUADS(_side);
        _squadName = "";

        if (count _squads <= 0) then
        {
            _squadName = "Reinforcements";
        }
        else
        {
            _squadName = _squads deleteAt 0;
        };

        _groups = allGroups;
        _respawnGroup = _groups param [_groups findIf {(toLower groupId _x) isEqualTo (toLower _squadName)}, grpNull];

        if (isNull _respawnGroup) then
        {
            _respawnGroup = createGroup [_side, false];
            _respawnGroup setGroupIdGlobal [_squadName];
            SET_SQUAD_IMPORTANT_DIRECT(_respawnGroup,true);

        };

        _squadName

    };

};





SET_RESPAWN_WAVE_READY(_side,false);

_waveArray = [true, _posOrObject, _respawnGroupId, serverTime];
SET_RESPAWN_WAVE(_side,_waveArray);

_curWaves = RESPAWN_WAVES(_side);
SET_RESPAWN_WAVES(_side,(_curWaves - 1));

_message = RESPAWN_MESSAGE(_side);
_message remoteExec ["systemChat", _side];




sleep RESPAWN_WAVE_DURATION(_side);

CLEAR_RESPAWN_WAVE(_side);

sleep RESPAWN_WAVE_COOLDOWN(_side);

SET_RESPAWN_WAVE_READY(_side,true);
