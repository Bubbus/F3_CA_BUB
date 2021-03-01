class F
{

#include "briefing\functions.hpp"
#include "ftMemberMarkers\functions.hpp"
#include "safeStart\functions.hpp"
#include "safeEnd\functions.hpp"
#include "aiCache\functions.hpp"
#include "aiDriver\functions.hpp"
#include "radios\functions.hpp"
#include "gearScript\functions.hpp"
#include "miscClient\functions.hpp"
#include "miscShared\functions.hpp"
#include "respawnWaves\functions.hpp"
#include "spawnNpcs\functions.hpp"
#include "joinInProgress\functions.hpp"
#include "mapClick\functions.hpp"
#include "aiBehaviour\functions.hpp"
#include "zeus_ui\functions.hpp"
#include "aceActions\functions.hpp"
#include "killTracker\functions.hpp"
#include "gravestones\functions.hpp"
#include "squadMarkers\functions.hpp"
#include "endings\functions.hpp"
#include "lootBox\functions.hpp"
#include "viewDistanceEditor\functions.hpp"
#include "downtime\functions.hpp"
#include "identity\functions.hpp"
#include "zenFunctions\functions.hpp"


}

class BIS
{
	class overrides
	{
		file = "components\miscShared";
		class moduleCivilianPresence{};
	};
};

class ace_medical_feedback
{
	class overrides
	{
		file = "components\downtime";
		class effectUnconscious{};
	};
};
