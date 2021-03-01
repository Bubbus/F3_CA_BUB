#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeMonitor);


waitUntil
{
    waitUntil { sleep 0.25; SHOULD_DO_DOWNTIME };

    SHOULD_CONTINUE = true;

    _startedTime = time;
    waitUntil
    {
        sleep 0.25;
        (!IS_UNCONSCIOUS(player)) or {(time - _startedTime > DOWNTIME_SNOOZE_TIME) and {!HAS_OPTED_OUT}}
    };

    if (SHOULD_DO_DOWNTIME) then
    {
        [] spawn f_fnc_downtimeSpectate;
    };

    waitUntil {sleep 0.25; !SHOULD_DO_DOWNTIME};

    SHOULD_CONTINUE = false;

    false

};
