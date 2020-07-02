#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)




class CA2_DefaultListBox : RscListBox
{
	access = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	autoScrollSpeed = -1;
	colorBackground[] = {0,0,0,0.3};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorSelectRight[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	font = "RobotoCondensed";
	h = 0.3;
	maxHistoryDelay = 1;
	period = 1.2;
	rowHeight = 0;
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	style = 16;
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 5;
	w = 0.3;
	x = 0;
	y = 0;
};




class CA2_DefaultEdit : RscEdit
{
	access = 0;
	autocomplete = "";
	canModify = 1;
	colorBackground[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorText[] = {0.95,0.95,0.95,1};
	deletable = 0;
	fade = 0;
	font = "RobotoCondensed";
	h = 0.04;
	shadow = 2;
	size = 0.2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	style = "0x00 + 0x40";
	text = "";
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 2;
	w = 0.2;
	x = 0;
	y = 0;
};




class CA2_DefaultButton : RscButton
{
    access = 0;
    borderSize = 0;
    colorBackground[] = {0,0,0,0.5};
    colorBackgroundActive[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0,0,0,0.5};
    colorBorder[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    font = "RobotoCondensed";
    h = 0.039216;
    idc = -1;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    style = 2;
    text = "";
    type = 1;
    url = "";
    w = 0.095589;
    x = 0;
    y = 0;

};



class CA2_DefaultText : RscText
{
    access = 0;
    colorBackground[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0.5};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    fixedWidth = 0;
    font = "RobotoCondensed";
    h = 0.037;
    idc = -1;
    linespacing = 1;
    shadow = 1;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 0;
    text = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 0;
    w = 0.3;
    x = 0;
    y = 0;

};




class CA2_DefaultTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	colorText[] = {1,0,0,1};
	color[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
    colorBackgroundActive[] = {0,0,0,1};
	colorTextSelect[] = {0,0.8.0.1};
	colorSelectedBg[] = {0,0,0,0.5};
	colorSelect[] = {0,0,0,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorDisable[] = {0.4,0.4,0.4,1};
    colorFocused[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = {"UNCHECKED"};
	checked_strings[] = {"CHECKED"};
};




class CA2_DefaultSlider
{
	access = 0;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	h = 0.025;
	shadow = 0;
	style = 1024;
	type = 3;
	w = 0.3;
	x = 0;
	y = 0;

};




class CA2_DefaultCombo
{
	access = 0;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	colorActive[] = {1,0,0,1};
	colorBackground[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorSelectRight[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	font = "RobotoCondensed";
	h = 0.035;
	maxHistoryDelay = 1;
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	style = "0x10 + 0x200";
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 4;
	w = 0.12;
	wholeHeight = 0.45;
	x = 0;
	y = 0;
	
	class ComboScrollBar
	{
		color[] = {1,1,1,1};
	};
	
};
