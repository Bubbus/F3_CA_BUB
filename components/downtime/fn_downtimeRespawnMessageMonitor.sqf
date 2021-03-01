#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeRespawnMessageMonitor);

while {true} do
{
    sleep 2;

    if ((!HAS_DISABLED_RESPAWN_MESSAGE) and {IS_UNCONSCIOUS(player)}) then
    {
        uiSleep 7.5;

        while {(!HAS_DISABLED_RESPAWN_MESSAGE) and {IS_UNCONSCIOUS(player)}} do
        {
            waitUntil
            {
                sleep 1;
                ([side group player] call f_fnc_canPlayerOfSideRespawn) or {!IS_UNCONSCIOUS(player)}
            };

            if (IS_UNCONSCIOUS(player)) then
            {
                "CA2_DowntimeRespawn" cutRsc ["CA2_DowntimeRespawn", "PLAIN", -1, false];
            };

            waitUntil
            {
                sleep 1;
                !(([side group player] call f_fnc_canPlayerOfSideRespawn) and {IS_UNCONSCIOUS(player)})
            };

        };

    };

};
