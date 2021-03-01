// We need to remove lingering unconscious effects that sometimes appear in spectator.  The effectUnconscious wrapper doesn't do all the work unfortunately.

#include "macros.hpp"

CLIENT_ONLY;

waitUntil
{
    waitUntil { sleep 1; IS_UNCONSCIOUS(player) };

    _cancelledEffect = false;

    while { IS_UNCONSCIOUS(player) and {IS_TRUE(ace_spectator_isSet)} } do
    {
        if ((!(isNil 'ace_medical_feedback_ppUnconsciousBlackout')) and {ppEffectEnabled ace_medical_feedback_ppUnconsciousBlackout}) then
        {
            ace_medical_feedback_ppUnconsciousBlur     ppEffectEnable false;
            ace_medical_feedback_ppUnconsciousBlackout ppEffectEnable false;
            _cancelledEffect = true;
        };

        uiSleep 0.1;

    };

    // In the event that we exit spectator while still unconscious, call the effect function ourselves so the above effects get re-applied immediately.
    if (IS_UNCONSCIOUS(player) and _cancelledEffect) then
    {
        [true, 0] call ace_medical_feedback_fnc_effectUnconscious;
    };

    false

};
