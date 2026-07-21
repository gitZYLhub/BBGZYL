------------------------------------------------------------------------------
-- FILE:    Base/Religion.sql
-- PURPOSE: Use the base game's highest supported religion cap on every map.
------------------------------------------------------------------------------

-- Seven is the vanilla cap used by Huge maps. Replacing every loaded map-size
-- row also covers custom map sizes that have already registered in Maps.
INSERT OR REPLACE INTO Map_GreatPersonClasses
	(MapSizeType, GreatPersonClassType, MaxWorldInstances)
SELECT MapSizeType, 'GREAT_PERSON_CLASS_PROPHET', 7
FROM Maps;
