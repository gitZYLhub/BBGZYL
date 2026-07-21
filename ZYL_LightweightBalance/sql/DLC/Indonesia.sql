------------------------------------------------------------------------------
-- FILE:    DLC/Indonesia.sql
-- PURPOSE: Indonesia civilization balance changes.
------------------------------------------------------------------------------

-- Great Nusantara: Coast and Lake tiles provide a standard adjacency bonus
-- to Holy Sites. Campuses, Industrial Zones, and Theater Squares retain their
-- vanilla minor adjacency bonus.
UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'TRAIT_NUSANTARA_COAST_HOLY_SITE'
  AND Name = 'TilesRequired';
