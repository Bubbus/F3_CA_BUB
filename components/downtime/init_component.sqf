#include "macros.hpp"

DEBUG_PRINT_LOG("initting downtime")

// Should only run for players.
if (!hasInterface) exitWith {DEBUG_PRINT_LOG("jumped out of downtime")};

// Setting up variables for "unconscious cam restriction" settings.
// The ACE spectator "updateCameraModes" function is a bit odd.
f_var_downtime_spectatorModes_AllowAll = [[0,1,2],[]];
f_var_downtime_spectatorModes_NoFreeCam = [[1,2],[0]];
f_var_downtime_spectatorModes_FirstPersonOnly = [[1],[0,2]];
f_var_downtime_spectatorModes_ThirdPersonOnly = [[2],[0,1]];

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
waitUntil
{
	uiSleep 1;
	!isNull player
};

DEBUG_PRINT_LOG("finished waiting: downtime")

[] spawn f_fnc_downtimeMonitor;
[] spawn f_fnc_downtimeRespawnMessageMonitor;
[] spawn f_fnc_blockSelfInteractWhileUnconscious;
