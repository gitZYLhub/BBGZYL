------------------------------------------------------------------------------
-- FILE:    Base/Icons.sql
-- PURPOSE: Shark resource and Monopolies & Corporations icons.
------------------------------------------------------------------------------

INSERT OR REPLACE INTO IconTextureAtlases
	(Name, IconSize, IconsPerRow, IconsPerColumn, Filename)
VALUES
	('ICON_ATLAS_ZYL_LBM_SHARK', 256, 8, 8, 'Suk_Resource_Atlas_256.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK', 64, 8, 8, 'Suk_Resource_Atlas_64.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK', 50, 8, 8, 'Suk_Resource_Atlas_50.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK', 38, 8, 8, 'Suk_Resource_Atlas_38.dds');

INSERT OR REPLACE INTO IconTextureAtlases
	(Name, Baseline, IconSize, IconsPerRow, IconsPerColumn, Filename)
VALUES
	('ICON_ATLAS_ZYL_LBM_SHARK', 6, 22, 8, 8, 'Suk_Resource_Atlas_22.dds');

INSERT OR REPLACE INTO IconTextureAtlases
	(Name, IconSize, IconsPerRow, IconsPerColumn, Filename)
VALUES
	('ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 256, 8, 8, 'Suk_AlternateResources_Atlas_256.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 64, 8, 8, 'Suk_AlternateResources_Atlas_64.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 50, 8, 8, 'Suk_AlternateResources_Atlas_50.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 38, 8, 8, 'Suk_AlternateResources_Atlas_38.dds'),
	('ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 32, 8, 8, 'Suk_AlternateResources_Atlas_32.dds');

INSERT OR REPLACE INTO IconDefinitions (Name, Atlas, "Index") VALUES
	('ICON_RESOURCE_ZYL_LBM_SHARK', 'ICON_ATLAS_ZYL_LBM_SHARK', 5),
	('RESOURCE_ZYL_LBM_SHARK', 'ICON_ATLAS_ZYL_LBM_SHARK', 5),
	('ICON_RESOURCE_ZYL_LBM_SHARK_FOW', 'ICON_ATLAS_ZYL_LBM_SHARK', 37),
	('ICON_MONOPOLIES_AND_CORPS_RESOURCE_ZYL_LBM_SHARK', 'ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 5),
	('ICON_PROJECT_CREATE_CORPORATION_PRODUCT_ZYL_LBM_SHARK', 'ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 5),
	('ICON_MONOPOLIES_AND_CORPS_RESOURCE_ZYL_LBM_SHARK_FOW', 'ICON_ATLAS_ZYL_LBM_SHARK_ALTERNATE', 37);
