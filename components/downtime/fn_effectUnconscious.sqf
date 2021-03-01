// Provide a wrapper around ace_medical_feedback_fnc_effectUnconscious to stop unconscious effects being applied when in spectator.
// This... isn't great.  It's only valid for as long as the underlying function does not fundamentally change.  Keep an eye on this.

#include "macros.hpp"

if (isNil "f_var_originalFunction_effectUnconscious") then
{
    // Why isn't this easier to do in SQF?  Why does it have to be so brittle?  what the christ
    f_var_originalFunction_effectUnconscious = compile preprocessFileLineNumbers "z\ace\addons\medical_feedback\functions\fnc_effectUnconscious.sqf";
};

params ["_enable", "_mode"];

if (_enable and {IS_TRUE(ace_spectator_isSet)}) exitWith {};

_this call f_var_originalFunction_effectUnconscious
