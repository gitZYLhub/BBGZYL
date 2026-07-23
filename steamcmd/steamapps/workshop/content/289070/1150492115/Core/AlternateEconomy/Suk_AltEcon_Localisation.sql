--========================================================================================================================
-- Automated Stuff
-- Some of this can be automated...
-- Your really just need to populate this table below
-- and provide 5 resource names. Everything else will be done for you!
--========================================================================================================================
	-- PRODUCT
	--------------------------------------------------------------------
		-- Name
		-------------------------------------
			INSERT OR REPLACE INTO BaseGameText
					(
						Tag,
						Text
					)
			SELECT
				"LOC_PROJECT_CREATE_CORPORATION_PRODUCT_"||ResourceTypeShort||"_NAME",
				"[ICON_"||ResourceType||"] {LOC_"||ResourceType||"_NAME} Corporation: Create New Product"
			FROM Suk_Resources;
		-------------------------------------
		-- Short Name
		-------------------------------------
			INSERT OR REPLACE INTO BaseGameText
					(
						Tag,
						Text
					)
			SELECT
				"LOC_PROJECT_CREATE_CORPORATION_PRODUCT_"||ResourceTypeShort||"_SHORT_NAME",
				"[ICON_"||ResourceType||"] Create New {LOC_"||ResourceType||"_NAME} Product"
			FROM Suk_Resources;
		-------------------------------------
		-- Description
		-------------------------------------
			INSERT OR REPLACE INTO BaseGameText
					(
						Tag,
						Text
					)
			SELECT
				"LOC_PROJECT_CREATE_CORPORATION_PRODUCT_"||ResourceTypeShort||"_DESCRIPTION",
				"Create a new product for the world based on the [ICON_"||ResourceType||"] {LOC_"||ResourceType||"_NAME} resource. {LOC_INDUSTRY_"||BonusType||"_DESCRIPTION}"
			FROM Suk_Resources;
		-------------------------------------
		-- Pedia Blurb
		-------------------------------------
			INSERT OR REPLACE INTO BaseGameText
					(
						Tag,
						Text
					)
			SELECT
				"LOC_PEDIA_CONCEPTS_"||ResourceTypeShort,
				"[NEWLINE][ICON_BULLET] {LOC_"||ResourceType||"_NAME}: {LOC_SUK_RESOURCE_"||BonusType||"_DESCRIPTION}"
			FROM Suk_Resources;
--========================================================================================================================
-- Civilopedia Entry
--========================================================================================================================
UPDATE LocalizedText
	SET Text = Text || "[NEWLINE][NEWLINE]Sukritact's Resources:"||(SELECT GROUP_CONCAT("{LOC_PEDIA_CONCEPTS_"||ResourceTypeShort||"}","") FROM Suk_Resources)
	WHERE Tag = "LOC_PEDIA_CONCEPTS_PAGE_MONOPOLIES_CHAPTER_INDUSTRIES_PARA_2";
--========================================================================================================================
-- Product Effects
--========================================================================================================================
INSERT OR REPLACE INTO BaseGameText
		(Tag,					Text)
VALUES
		(
			"LOC_SUK_RESOURCE_CITY_GROWTH_DISCOUNT_DESCRIPTION",
			"+20% Growth and +3 [ICON_Housing] Housing."
		),
		(
			"LOC_SUK_RESOURCE_MILITARY_UNIT_DISCOUNT_DESCRIPTION",
			"+30% [ICON_Production] Production toward military units."
		),
		(
			"LOC_SUK_RESOURCE_CIVILIAN_UNIT_DISCOUNT_DESCRIPTION",
			"+30% [ICON_Production] Production toward civilian units."
		),
		(
			"LOC_SUK_RESOURCE_BUILDING_DISCOUNT_DESCRIPTION",
			"+30% [ICON_Production] Production toward buildings."
		),
		(
			"LOC_SUK_RESOURCE_GOLD_YIELD_BONUS_DESCRIPTION",
			"+25% [ICON_Gold] Gold yield."
		),
		(
			"LOC_SUK_RESOURCE_FAITH_YIELD_BONUS_DESCRIPTION",
			"+25% [ICON_Faith] Faith yield."
		),
		(
			"LOC_SUK_RESOURCE_SCIENCE_YIELD_BONUS_DESCRIPTION",
			"+15% [ICON_Science] Science yield."
		),
		(
			"LOC_SUK_RESOURCE_CULTURE_YIELD_BONUS_DESCRIPTION",
			"+20% [ICON_Culture] Culture yield."
		);
--========================================================================================================================
-- Product Names
--========================================================================================================================
INSERT OR REPLACE INTO BaseGameText
		(Tag,					Text)
VALUES
	--------------------------------------------------------------------
	-- Cheese
	--------------------------------------------------------------------
		(
			"LOC_GREATWORK_PRODUCT_SUK_CHEESE_1_NAME",
			"SMAKELIJK! Gouda"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_CHEESE_2_NAME",
			"Tigahb Brand Ayibe and Appetizers"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_CHEESE_3_NAME",
			"Chetal’s Fine Paneer"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_CHEESE_4_NAME",
			"Fromagerie Heureuses Chèvres"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_CHEESE_5_NAME",
			"Aristaios Feta and Dairy"
		),
	--------------------------------------------------------------------
	-- Obsidian
	--------------------------------------------------------------------
		(
			"LOC_GREATWORK_PRODUCT_SUK_OBSIDIAN_1_NAME",
			"Disseco Surgical Blades"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_OBSIDIAN_2_NAME",
			"Motu Ika Obsidian Accessories"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_OBSIDIAN_3_NAME",
			"Tezcatlipoca Brand Jewelry"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_OBSIDIAN_4_NAME",
			"Ek Chuaj’s Fine Blades"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_OBSIDIAN_5_NAME",
			"Glass Mountain Obsidian"
		),
	--------------------------------------------------------------------
	-- Gold
	--------------------------------------------------------------------
		(
			"LOC_GREATWORK_PRODUCT_GOLD_1_NAME",
			"Saninumoo’s Precious Trinkets"
		),
		(
			"LOC_GREATWORK_PRODUCT_GOLD_2_NAME",
			"Nebu’s Luxury Decor"
		),
		(
			"LOC_GREATWORK_PRODUCT_GOLD_3_NAME",
			"Goldteeth’s Dental Prostheses"
		),
		(
			"LOC_GREATWORK_PRODUCT_GOLD_4_NAME",
			"Yinjin Microprocessors"
		),
		(
			"LOC_GREATWORK_PRODUCT_GOLD_5_NAME",
			"Grapefruit Inc. Electronic Components"
		),
	--------------------------------------------------------------------
	-- Sharks
	--------------------------------------------------------------------
		(
			"LOC_GREATWORK_PRODUCT_SUK_SHARK_1_NAME",
			"Binwei Shark Fins"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_SHARK_2_NAME",
			"Hamada Samegawa Products"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_SHARK_3_NAME",
			"Víkings Hákarl"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_SHARK_4_NAME",
			"Crikey Adventures’ Shark Diving Tours"
		),
		(
			"LOC_GREATWORK_PRODUCT_SUK_SHARK_5_NAME",
			"Kāmohoali’i Shark Encounters"
		);