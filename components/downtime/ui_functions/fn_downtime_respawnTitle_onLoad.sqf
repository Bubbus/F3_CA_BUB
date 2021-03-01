#include "../macros.hpp"

params ["_display"];

_subtitle = _display displayCtrl IDC_DOWNTIMERESPAWN_REASON;
_text = "";
_side = side group player;

_text = switch RESPAWN_TYPE(_side) do
{
    case (RESPAWN_TYPE_WAVES):
    {
        _waveInfo = GET_RESPAWN_WAVE(_side);

        if (count _waveInfo <= 0) exitWith {"A respawn wave has recently ended.  This is a bug.  Tell Bubbus."};

        _waveStarted = _waveInfo select WAVEINFO_TIMESTARTED;
        _waveLength = RESPAWN_WAVE_DURATION(_side);
        _timeLeft = 0 max ((_waveStarted + _waveLength) - serverTime);
        _asTimeStr = [_timeLeft] call f_fnc_formatTimeDuration;

        _template = "A respawn wave has been called (%1 left).";
        format [_template, _asTimeStr]
    };

    default
    {
        "(respawn type not detected)"
    };
};

_subtitle ctrlSetText _text;
