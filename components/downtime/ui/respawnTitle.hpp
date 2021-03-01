#include "../ui_macros.hpp"

class CA2_DowntimeRespawn
{
    idd = -1;

	movingEnable = false;
	enableSimulation = true;

    fadein = 1;
    duration = 20;
	fadeout = 5;

    onLoad = "_this call f_fnc_downtime_respawnTitle_onLoad;";

    class ControlsBackground
    {
        class YouCanRespawn: CA2_DefaultText
        {
            idc = IDC_DOWNTIMERESPAWN_HEADER;
        	text = "You can now respawn.";
            font = "PuristaBold";
            style = ST_CENTER;
        	x = 7 * GUI_GRID_W + GUI_GRID_X;
        	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 26 * GUI_GRID_W;
        	h = 3 * GUI_GRID_H;
        	sizeEx = 2.4 * GUI_GRID_H;
        };

        class RespawnReason: CA2_DefaultText
        {
            idc = IDC_DOWNTIMERESPAWN_REASON;
        	text = "";
            style = ST_CENTER;
        	x = 5 * GUI_GRID_W + GUI_GRID_X;
        	y = 10 * GUI_GRID_H + GUI_GRID_Y;
        	w = 30 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class HowToRespawn: CA2_DefaultStructuredText
        {
            idc = IDC_DOWNTIMERESPAWN_INSTRUCTION;
        	text = "<t align=""center"" size=""1"">You may use the ""<t font=""PuristaBold"" size=""0.9"">RESPAWN</t>"" button in your menu to be included.</t>";
        	x = 7 * GUI_GRID_W + GUI_GRID_X;
        	y = 11 * GUI_GRID_H + GUI_GRID_Y;
        	w = 26 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };


        class Disclaimer: CA2_DefaultStructuredText
        {
            idc = IDC_DOWNTIMERESPAWN_DISCLAIMER;
        	text = "<t align=""center"" size=""0.9""><t font=""PuristaBold"" color=""#ff0000"" size=""0.8"">PLEASE NOTE:</t>  You are still unconscious.  Think about whether someone is still trying to save you before using this option.  It is considered bad manners to respawn unless you have been left behind or forgotten about.</t>";
        	x = 8 * GUI_GRID_W + GUI_GRID_X;
        	y = 13 * GUI_GRID_H + GUI_GRID_Y;
        	w = 23.5 * GUI_GRID_W;
        	h = 4 * GUI_GRID_H;
        };

    };

};
