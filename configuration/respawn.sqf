#include "..\respawn_macros.hpp"


// When a player respawns, do they automatically re-join their group?
f_var_respawnInGroup = true;

// When a player JIPs, do they get to teleport to a group of their choosing?
f_var_JIPTeleport = true;

// When a player respawns, do they get to teleport to a group of their choosing?
f_var_RespawnTeleport = true;

// nothing to see here (yet :)) )
SET_RESPAWN_TYPE(west,RESPAWN_TYPE_WAVES);
SET_RESPAWN_TYPE(east,RESPAWN_TYPE_WAVES);
SET_RESPAWN_TYPE(independent,RESPAWN_TYPE_WAVES);
SET_RESPAWN_TYPE(civilian,RESPAWN_TYPE_WAVES);
