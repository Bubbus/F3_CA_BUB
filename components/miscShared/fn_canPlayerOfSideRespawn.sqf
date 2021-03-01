#include "../../respawn_macros.hpp"

params ["_side"];

_canRespawn = switch (RESPAWN_TYPE(_side)) do
{
    case (RESPAWN_TYPE_WAVES):
    {
        (count GET_RESPAWN_WAVE(_side)) > 0
    };

    case (RESPAWN_TYPE_NONE):
    {
        false
    };

    default
    {
        false
    };
};

_canRespawn
