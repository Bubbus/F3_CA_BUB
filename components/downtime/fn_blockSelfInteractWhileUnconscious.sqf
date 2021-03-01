// When we start messing around with the unconscious state, protections against using keybinds start to break down.
// From testing, you can't open the medical menu via hotkey, but you can open the self-interact menu.  Not great.

#include "macros.hpp"

CLIENT_ONLY;

waitUntil
{
    waitUntil { sleep 1; IS_UNCONSCIOUS(player) };

    while { IS_UNCONSCIOUS(player) and {!(isNil STRING(RUNNING_ACTIVITY))} and {RUNNING_ACTIVITY isEqualTo ACTIVITY_NOTHING} } do
    {
        // Dialog ID of the ACE self-interact menu.
        _display = findDisplay 91919;
        if !(isNull _display) then
        {
            _display closeDisplay 2;
        };

        uiSleep 0.01;

    };

    false

};
