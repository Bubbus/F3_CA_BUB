
#include "downtime_macros.hpp"

// Downtime: opt-out of the spectator cam when you go unconscious.  Does not affect spectator upon death.
[
	"CA2_Downtime_OptOut",
	"CHECKBOX",
	[
		"Opt-out of unconscious spectator",
		"Opt-out of entering spectator mode when you go unconscious.\nInstead, you will stay in the black screen until you wake up or die.\n\nDoes not affect entering spectator upon death.\n"
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	false,
	2,
	nil,
	false

] call CBA_fnc_addSetting;


// Downtime: customise the time it takes to enter spectator after going unconscious.
[
	"CA2_Downtime_SpectatorWaitTime",
	"SLIDER",
	[
		"Seconds until unconscious spectator",
		"Customise the waiting time between you going unconscious and the spectator mode activating (in seconds).\nAllows you to spend longer in the black screen before switching.\n\nDoes not affect entering spectator upon death.\n"
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	[16, 180, 16, 0, false],
	2,
	nil,
	false

] call CBA_fnc_addSetting;


// Downtime: disable the reminder to unconscious spectators that they can respawn.
[
	"CA2_Downtime_NoRespawnReminders",
	"CHECKBOX",
	[
		"Disable spectator respawn reminders",
		"Disable the text that appears in spectator to let you know when you can manually respawn."
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	false,
	2,
	nil,
	false

] call CBA_fnc_addSetting;


// Downtime: configure camera modes that unconscious spectators can use.
[
	"CA2_Downtime_SpectatorCameraModes",
	"LIST",
	[
		"Restrict unconscious spectator cameras",
		"Disallow certain camera modes for unconscious spectators.\nBe aware that unnecessarily restricting camera options can adversely affect the gameplay experience.\n\nDoes not affect dead spectators - use the normal ACE spectator option for that.\n"
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	[
		[CAM_ARGS_ALL, CAM_ARGS_NOFREECAM, CAM_ARGS_1PPONLY, CAM_ARGS_3PPONLY],
		["Allow all modes", "Disallow free-cam", "1st-person only", "3rd-person only"],
		0
	],
	1,
	nil,
	false

] call CBA_fnc_addSetting;
