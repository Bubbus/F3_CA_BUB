#include "macros.hpp"


// Temporary - won't be needed when radio refactor is merged and pre-init config groups become available.
RUN_AS_ASYNC(f_fnc_applyIdentity);
waitUntil
{
    sleep 1;
    IS_TRUE(f_var_identity_loaded)
};


params ["_unit"];

if (isPlayer _unit) exitWith {};

_faction = toLower (faction _unit);

/*
// For future use - allows faction override, gearscript-style.
if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};
*/

_sideName = [_faction] call f_fnc_factionToSideName;

DEBUG_FORMAT1_LOG("[IDENTITY]: Attempting to apply identity for sideName %1.",_sideName)

_identity = GET_FACTION_IDENTITY_DYNAMIC(_sideName);

_unit setVariable ["f_var_identity", _identity, true];

_speakers = GET_SPEAKERS_FOR_IDENTITY_DYNAMIC(_identity);
_faces = GET_FACES_FOR_IDENTITY_DYNAMIC(_identity);

_unit setSpeaker (selectRandom _speakers);
_unit setFace (selectRandom _faces);
_unit setNameSound "";
