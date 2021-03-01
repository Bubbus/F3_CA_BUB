
#define SHOULD_CONTINUE f_var_downtimeExperienceActive

#define CAM_ARGS_ALL                    "AllowAll"
#define CAM_ARGS_NOFREECAM              "NoFreeCam"
#define CAM_ARGS_1PPONLY                "FirstPersonOnly"
#define CAM_ARGS_3PPONLY                "ThirdPersonOnly"

#define DOWNTIME_SNOOZE_TIME            (["CA2_Downtime_SpectatorWaitTime" call CBA_settings_fnc_get] param [0, 16])
#define DOWNTIME_CAMERA_OPTIONS         (["CA2_Downtime_SpectatorCameraModes" call CBA_settings_fnc_get] param [0, CAM_ARGS_ALL])

#define HAS_OPTED_OUT                   (["CA2_Downtime_OptOut" call CBA_settings_fnc_get] param [0, false])
#define HAS_DISABLED_RESPAWN_MESSAGE    (["CA2_Downtime_NoRespawnReminders" call CBA_settings_fnc_get] param [0, false])

#define IS_UNCONSCIOUS(UNIT)            ((UNIT getVariable ["ACE_isUnconscious", false]) and {alive player})
#define PLAYER_IS_AWAITING_RESPAWN      (missionNamespace getVariable ["f_var_playerHasBeenKilled", false])
#define PLAYER_IS_DOWN                  (IS_UNCONSCIOUS(player) or {!alive player} or {PLAYER_IS_AWAITING_RESPAWN})
#define PLAYER_IS_GHOST                 (PLAYER_IS_AWAITING_RESPAWN and {alive player})
#define SHOULD_DO_DOWNTIME              ((IS_UNCONSCIOUS(player) and {!HAS_OPTED_OUT}) or {!alive player} or {PLAYER_IS_AWAITING_RESPAWN})

#define GET_SPECTATOR_CAM_ARGS(MODE)    (missionNamespace getVariable [format ["f_var_downtime_spectatorModes_%1", MODE], f_var_downtime_spectatorModes_AllowAll])
