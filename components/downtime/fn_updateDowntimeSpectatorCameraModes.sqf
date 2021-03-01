#include "macros.hpp"

CLIENT_ONLY;

params ["_shouldRestrict"];

_args = if (_shouldRestrict) then
{
    _chosenValue = DOWNTIME_CAMERA_OPTIONS;
    GET_SPECTATOR_CAM_ARGS(_chosenValue)
}
else
{
    // Based upon approach in ACE addons/spectator/XEH_postInit.sqf.
    _aceOriginalModes = [[0,1,2], [1,2], [0], [1], [2]] select ace_spectator_restrictModes;
    _removeModes = [0,1,2] - _aceOriginalModes;
    [_aceOriginalModes, _removeModes]
};

_args call ace_spectator_fnc_updateCameraModes;
