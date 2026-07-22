------------------------------------------------------------------------------
-- Base technology adjustments
------------------------------------------------------------------------------

-- Match Team PVP: Celestial Navigation allows every land unit to embark.
UPDATE Technologies
SET EmbarkAll = 1,
	Description = 'LOC_TECH_ZYL_LBM_CELESTIAL_NAVIGATION_DESCRIPTION'
WHERE TechnologyType = 'TECH_CELESTIAL_NAVIGATION';
