--披甲战士 科技移至战术
UPDATE Units SET PrereqTech='TECH_MILITARY_ENGINEERING',MandatoryObsoleteTech="TECH_SCIENTIFIC_THEORY",Cost=160,Combat=45 WHERE UnitType='UNIT_MAN_AT_ARMS';
--线列步兵 科技移至战科学理论
UPDATE Units SET PrereqTech='TECH_SCIENTIFIC_THEORY',BaseMoves=3,Cost=320,Combat=63 WHERE UnitType='UNIT_LINE_INFANTRY';
--投石机 150锤 3速 35近战力-》30
UPDATE Units SET Combat=30,Cost=150,BaseMoves=3 WHERE UnitType='UNIT_TREBUCHET';
--刚果UU
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='NAGAO_RANGED_DEFENSE' and Name='Amount';
--毛利UU
UPDATE Units SET Combat=36 WHERE UnitType='UNIT_MAORI_TOA';

--玛雅不送工人
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_LEADER_NEARBY_CITIES_GAIN_BUILDER'and Name='Amount';
--苏美尔 同盟+2力
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_ADJUST_ALLIANCE_ADJUST_COMBAT_STRENGTH'and Name='Amount';
--中国 只送ulk 移除鼓舞
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_CIVIC_BOOST_WONDER_ERA'and Name='Amount';
--希腊 军事+0力 UU回调
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='GORGO_POLICY_SLOT_COMBAT_BONUS'and Name='Amount';
UPDATE Units SET Combat=25 WHERE UnitType='UNIT_GREEK_HOPLITE';
--高棉 根据圣地相邻提供食物-》回调+1食物，沿河+2，高棉教堂每个人口+0.5-》0.2，移除Mod提供的水渠、圣地加速
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_MONASTERIES_KING_HOLY_SITE_RIVER_ADJACENCY'and Name='Amount';
--寺庙
UPDATE Building_YieldChanges SET YieldChange="6" WHERE BuildingType='BUILDING_PRASAT';
--1住房
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_HOLY_SITE_RIVER_2HOUSING'and Name='Amount';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FOOD', 'Amount' , '1');	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FOOD', 'YieldType' , 'YIELD_FOOD');	
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FOOD', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','PLOT_IS_HOLY_SITE_RIVER_FOOD_REQUIREMENTS');

UPDATE TraitModifiers SET ModifierId='TRAIT_HOLY_SITE_RIVER_FOOD' WHERE TraitType='TRAIT_LEADER_MONASTERIES_KING'and ModifierId='TRAIT_MONASTERIES_KING_ADJACENCY_FOOD';
--UPDATE TraitModifiers SET ModifierId='TRAIT_HOLY_SITE_RIVER_HOUSING' WHERE TraitType='TRAIT_LEADER_MONASTERIES_KING'and ModifierId='TRAIT_HOLY_SITE_RIVER_2HOUSING';
--高棉教堂文化
UPDATE ModifierArguments SET Value='.1' WHERE ModifierId='PRASAT_CULTURE_POPULATION'and Name='Amount';
--西班牙 不送工人，横跨多个大陆区域加速+20%
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_INTERCONTINENTAL_BUILDER'and Name='Amount';
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_INTERCONTINENTAL_DISTRICT_PRODUCTION'and Name='Amount';
--西班牙贸易路线 贸易路线+1金1锤1信仰，横跨大陆+3金币+1锤+2信仰 移除mod对西班牙商路的修改
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_DOMESTIC_FAITH'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_INTERNATIONAL_FAITH'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_INTERCONTINENTAL_INTERNATIONAL_FAITH'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_INTERCONTINENTAL_DOMESTIC_FAITH'and Name='Amount';

UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_DOMESTIC_GOLD'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_INTERNATIONAL_GOLD'and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD'and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_INTERCONTINENTAL_DOMESTIC_GOLD'and Name='Amount';
--改为加食物
--UPDATE ModifierArguments SET Value='YIELD_FOOD' WHERE ModifierId='TRAIT_DOMESTIC_PRODUCTION'and Name='YieldType';
--UPDATE ModifierArguments SET Value='YIELD_FOOD' WHERE ModifierId='TRAIT_INTERNATIONAL_PRODUCTION'and Name='YieldType';
--
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_DOMESTIC_PRODUCTION'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_INTERNATIONAL_PRODUCTION'and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_INTERCONTINENTAL_INTERNATIONAL_PRODUCTION'and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION'and Name='Amount';
--马普切 翻3倍-》2倍 基础经验+10-》50% ，因基础提升，翻倍也提升-》14%
UPDATE ModifierArguments SET Value='14' WHERE ModifierId='TOQUI_CULTURE_GOVERNOR_NOT_FOUNDED'and Name='Amount';
UPDATE ModifierArguments SET Value='14' WHERE ModifierId='TOQUI_PRODUCTION_GOVERNOR_NOT_FOUNDED'and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='TOQUI_GOVERNOR_UNIT_EXPERIENCE'and Name='Amount';
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='TOQUI_GOVERNOR_UNIT_EXPERIENCE_NOT_FOUNDED'and Name='Amount';
--加拿大
--UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TUNDRA_MINES_PRODUCTION'and Name='Amount';
--UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TUNDRA_HILLS_MINES_PRODUCTION'and Name='Amount';
--UPDATE ModifierArguments SET Value='1' WHERE ModifierId='SNOW_MINES_PRODUCTION'and Name='Amount';
--UPDATE ModifierArguments SET Value='1' WHERE ModifierId='SNOW_HILLS_MINES_PRODUCTION'and Name='Amount';
--祖鲁 兵营建筑+2金-》0
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_IKANDA_BARRACKS_GOLD'and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_IKANDA_STABLE_GOLD'and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_IKANDA_ARMORY_GOLD'and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_IKANDA_MILITARY_ACADEMY_GOLD'and Name='Amount';
--马里uu
UPDATE Units SET Combat=51 WHERE UnitType='UNIT_MALI_MANDEKALU_CAVALRY';

--帝国卫队
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='GARDE_CONTINENT_COMBAT'and Name='Amount';

--红衫军
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='REDCOAT_FOREIGN_COMBAT'and Name='Amount';
UPDATE Units SET BaseMoves=3,Combat=65 WHERE UnitType='UNIT_ENGLISH_REDCOAT';
--矿工
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='DIGGER_BONUS_ON_COAST'and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='DIGGER_NON_DOMESTIC_BONUS'and Name='Amount';

--武士
UPDATE Units SET Cost=200 WHERE UnitType='UNIT_JAPANESE_SAMURAI';

--时代分数
UPDATE GlobalParameters SET Value='15' WHERE Name='DARK_AGE_SCORE_BASE_THRESHOLD';
--UPDATE GlobalParameters SET Value='20' WHERE Name='GOLDEN_AGE_SCORE_BASE_THRESHOLD';
UPDATE GlobalParameters SET Value='2' WHERE Name='THRESHOLD_SHIFT_PER_CITY';

--移除地热在冻土
DELETE FROM Feature_ValidTerrains WHERE FeatureType='FEATURE_GEOTHERMAL_FISSURE' and TerrainType="TERRAIN_TUNDRA";
DELETE FROM Feature_ValidTerrains WHERE FeatureType='FEATURE_GEOTHERMAL_FISSURE' and TerrainType="TERRAIN_TUNDRA_HILLS";
DELETE FROM Feature_ValidTerrains WHERE FeatureType='FEATURE_GEOTHERMAL_FISSURE' and TerrainType="TERRAIN_SNOW";
DELETE FROM Feature_ValidTerrains WHERE FeatureType='FEATURE_GEOTHERMAL_FISSURE' and TerrainType="TERRAIN_SNOW_HILLS";

--攻城塔
UPDATE Units SET Cost=65 WHERE UnitType='UNIT_SIEGE_TOWER';
--攻城锤
DELETE FROM UnitUpgrades WHERE Unit='UNIT_BATTERING_RAM' and UpgradeUnit="UNIT_SIEGE_TOWER";
UPDATE Units SET MandatoryObsoleteTech="TECH_ROBOTICS" WHERE UnitType='UNIT_BATTERING_RAM';

--越南
INSERT INTO District_GreatPersonPoints (DistrictType, GreatPersonClassType,PointsPerTurn)
	VALUES ('DISTRICT_THANH', 'GREAT_PERSON_CLASS_GENERAL','1');

--荷兰 文化
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_CULTURE_FROM_INTERNATIONAL_TRADE_ROUTES'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_CULTURE_FROM_INCOMING_TRADE_ROUTES'and Name='Amount';

--勇士过期
UPDATE Units SET MandatoryObsoleteTech="TECH_GUNPOWDER" WHERE UnitType='UNIT_WARRIOR';
--
--中上线ulk调整
--天文学ulk 大学-》图书馆
--UPDATE Boosts SET BuildingType="BUILDING_GREAT_LIBRARY" Where TechnologyType='TECH_ASTRONOMY';

--科学理论 解锁 启蒙运动市政-》人文主义市政
--UPDATE Boosts SET BoostingCivicType="CIVIC_HUMANISM" Where TechnologyType='TECH_SCIENTIFIC_THEORY';

--修复官方加拿大BUG
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TUNDRA_HILLS_LUMBER_MILLS_PRODUCTION' AND Name='Amount';

--移除钢铁给城墙
--城墙本身不会过期
DELETE FROM TechnologyModifiers WHERE TechnologyType='TECH_STEEL' and ModifierId="STEEL_UNLOCK_URBAN_DEFENSES";

--造船术 下海提前至 天文导航
UPDATE Technologies SET EmbarkAll=1 WHERE TechnologyType="TECH_CELESTIAL_NAVIGATION";

--腹壁ULK 建造灯塔 
--UPDATE Boosts SET BoostClass="BOOST_TRIGGER_CONSTRUCT_BUILDING",BuildingType="BUILDING_LIGHTHOUSE" Where TechnologyType='TECH_BUTTRESS';


--港口区域 移至航海术
--UPDATE Districts SET PrereqTech="TECH_SAILING" Where DistrictType='DISTRICT_HARBOR';
--UPDATE Districts SET PrereqTech="TECH_SAILING" Where DistrictType='DISTRICT_ROYAL_NAVY_DOCKYARD';
--UPDATE Districts SET PrereqTech="TECH_SAILING" Where DistrictType='DISTRICT_COTHON';

--高棉水渠
UPDATE ModifierArguments SET Value='.8' WHERE ModifierId='BARAYS_FAITH_POPULATION' AND Name='Amount';

--间谍 递增
UPDATE Units SET CostProgressionParam1="55" WHERE UnitType='UNIT_SPY';

--地热改良矿山
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType)
	VALUES ('IMPROVEMENT_MINE', 'FEATURE_GEOTHERMAL_FISSURE');

--礁石-1粮
UPDATE Feature_YieldChanges SET YieldChange=0 WHERE FeatureType='FEATURE_REEF' AND YieldType='YIELD_FOOD';
--乌龟+1粮
--civis
--气球 产能
UPDATE Units SET Cost=300 WHERE UnitType='UNIT_OBSERVATION_BALLOON';

--港口相邻市中心+3
UPDATE Adjacency_YieldChanges SET YieldChange=3 WHERE ID='Harbor_City_Gold';
--商业沿河+3
UPDATE Adjacency_YieldChanges SET YieldChange=3 WHERE ID='River_Gold';

--特色港口商业沿河
UPDATE Adjacency_YieldChanges SET YieldChange=3 WHERE ID='RoyalDock_City_Gold';

--马里 信仰需要采矿科技
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_MALI_MALI' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_MALI_MALI' , 'PLAYER_HAS_TECH_ASTROLOGY_CAIKUANG');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_ASTROLOGY_CAIKUANG' , 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_ASTROLOGY_CAIKUANG' , 'TechnologyType' , 'TECH_MINING');

--UPDATE Modifiers SET SubjectRequirementSetId='REQUIRES_RUSSIA_HAS_HOLY_SITE_MALI_MALI' WHERE  ModifierId='TRAIT_DESERT_CITY_CENTER_FAITH';
--UPDATE Modifiers SET SubjectRequirementSetId='REQUIRES_RUSSIA_HAS_HOLY_SITE_MALI_MALI' WHERE  ModifierId='TRAIT_DESERT_HILLS_CITY_CENTER_FAITH';

--大英：世界工程 若解锁铁、煤、硝石，每回合+1
--见 kub

--帝舵：开拓者在海中+2移动视野-》+1
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='MEDITERRANEAN_COLONIES_EXTRA_MOVEMENT' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='MEDITERRANEAN_COLONIES_EXTRA_SIGHT' AND Name='Amount';

--灯塔判断
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('REQUIREMENTS_CITY_HAS_DENGTA'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('REQUIREMENTS_CITY_HAS_DENGTA'		, 	'REQUIRES_CITY_HAS_DENGTA_BASE');
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES
	('REQUIRES_CITY_HAS_DENGTA_BASE'		, 	'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_CITY_HAS_DENGTA_BASE'		, 	'BuildingType','BUILDING_LIGHTHOUSE');
--英国港口点数
UPDATE District_GreatPersonPoints SET PointsPerTurn='1' WHERE DistrictType='DISTRICT_ROYAL_NAVY_DOCKYARD' and GreatPersonClassType='GREAT_PERSON_CLASS_ADMIRAL';

INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_ROYAL_NAVY_DOCKYARD', 'TRAIT_HUANGJIA_GANGKOU_DIANSHU');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HUANGJIA_GANGKOU_DIANSHU', 'Amount' , '1');	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HUANGJIA_GANGKOU_DIANSHU', 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_ADMIRAL');	
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('TRAIT_HUANGJIA_GANGKOU_DIANSHU', 'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BASE','REQUIREMENTS_CITY_HAS_DENGTA');
/*--U型港口
UPDATE Modifiers SET SubjectRequirementSetId='REQUIREMENTS_CITY_HAS_DENGTA' WHERE ModifierId='COTHON_SETTLER_PRODUCTION';
UPDATE Modifiers SET SubjectRequirementSetId='REQUIREMENTS_CITY_HAS_DENGTA' WHERE ModifierId='COTHON_NAVAL_UNIT_PRODUCTION';
*/
--狄多 移民，海军速度20%
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='COTHON_SETTLER_PRODUCTION' AND Name='Amount';
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='COTHON_NAVAL_UNIT_PRODUCTION' AND Name='Amount';

--天文导航不需要占星
DELETE FROM TechnologyPrereqs WHERE Technology='TECH_CELESTIAL_NAVIGATION' and PrereqTech="TECH_ASTROLOGY";

--毛利
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='SCIENCE_PRESETTLEMENT' AND Name='Amount';

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI', 'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE',"PLAYER_HAS_NO_CITIES");
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI', 'Amount','7');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_KUPES_VOYAGE', 'SCIENCE_PRESETTLEMENT_MAOLI_JINBI');

--印尼学院不吃礁石
/*INSERT INTO ExcludedAdjacencies (TraitType , YieldChangeId)
   VALUES
  ('TRAIT_CIVILIZATION_INDONESIA_NUSANTARA' , 'Reef_Science');*/

--学院相邻礁石科技-》1
UPDATE Adjacency_YieldChanges SET YieldChange='1' WHERE ID='Reef_Science';

--印尼 UI 行政部门+1锤 CIVIC_CIVIL_SERVICE
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_KAMPUNG_P1' , 'IMPROVEMENT_KAMPUNG' , 'YIELD_PRODUCTION' , '1' , 'CIVIC_FEUDALISM');

--祖鲁兵营
UPDATE ModifierArguments SET Value='15' WHERE ModifierId='IKANDA_TRAINED_CORPS_ARMY_DISCOUNT' AND Name='Amount';

--英国基础点数+1
INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_CPLMOD_YINGGUO' , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS' , 'PLAYER_HAS_ASTROLOGY_REQUIREMENTS_CPLMOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_CPLMOD_YINGGUO' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_ADMIRAL');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_CPLMOD_YINGGUO' , 'Amount' , '1');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_CPLMOD' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_CPLMOD' , 'REQUIRES_PLAYER_HAS_ASTROLOGY_CPLMOD');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_ASTROLOGY_CPLMOD' , 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_PLAYER_HAS_ASTROLOGY_CPLMOD' , 'TechnologyType' , 'TECH_CELESTIAL_NAVIGATION');


INSERT INTO TraitModifiers (TraitType, ModifierId) 
VALUES ('TRAIT_CIVILIZATION_ROYAL_NAVY_DOCKYARD', 'TRAIT_BONUS_GREAT_PROPHET_POINT_CPLMOD_YINGGUO');

--火枪硝石
UPDATE Units_XP2 SET ResourceCost="16" WHERE UnitType="UNIT_MUSKETMAN";

--海洋之神
INSERT INTO Tags(Tag , Vocabulary)
	VALUES ('CLASS_YU_PANGXIE', 'RESOURCE_CLASS');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_FISH', 'CLASS_YU_PANGXIE');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_CRABS', 'CLASS_YU_PANGXIE');	

INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES ('REQUIRES_PLOT_HAS_YU', 'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');
INSERT INTO RequirementArguments(RequirementId , Name, Value)
	VALUES ('REQUIRES_PLOT_HAS_YU', 'Tag', 'CLASS_YU_PANGXIE');

INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_PLOT_HAS_FISHINGBOATS_YU' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_PLOT_HAS_FISHINGBOATS_YU' , 'REQUIRES_PLOT_HAS_YU');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_PLOT_HAS_FISHINGBOATS_YU' , 'REQUIRES_PLOT_HAS_FISHINGBOATS');

UPDATE Modifiers SET SubjectRequirementSetId="REQUIRES_PLOT_HAS_FISHINGBOATS_YU" WHERE ModifierId='GOD_OF_THE_SEA_FISHINGBOATS_PRODUCTION_MODIFIER';

--埃及 UI 法典
UPDATE Improvements SET PrereqCivic="CIVIC_CODE_OF_LAWS" WHERE ImprovementType="IMPROVEMENT_SPHINX";

--印加 梯田
UPDATE Improvements SET Housing="1" WHERE ImprovementType="IMPROVEMENT_TERRACE_FARM";
--印加 古典+1锤中世纪+1锤
UPDATE RequirementArguments SET Value="ERA_MEDIEVAL" WHERE RequirementId="REQUIRES_ERA_ATLEASTEXPANSION_INDUSTRIAL" and Name="EraType";
--UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_PRODUCTION_MOUNTAIN_LATE' AND Name='Amount';
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('TRAIT_PRODUCTION_MOUNTAIN_LATE_2_TEAMPVP' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','REQUIREMENTS_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_PRODUCTION_MOUNTAIN_LATE_2_TEAMPVP' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_PRODUCTION_MOUNTAIN_LATE_2_TEAMPVP' , 'Amount' , '1');
--条件
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_ERA_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP', 'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_ERA_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP', 'EraType', 'ERA_CLASSICAL');

INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIREMENTS_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP' , 'REQUIRES_ERA_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIREMENTS_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP' , 'PLOT_IS_MOUNTAIN');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIREMENTS_PLOT_IS_MOUNTAIN_LATE_2_TEAMPVP' , 'REQUIREMENTSET_TEST_ALL');
--
INSERT INTO TraitModifiers (TraitType, ModifierId) 
VALUES ('TRAIT_CIVILIZATION_GREAT_MOUNTAINS', 'TRAIT_PRODUCTION_MOUNTAIN_LATE_2_TEAMPVP');


--挪威 教堂
--替换
--UPDATE BuildingReplaces SET ReplacesBuildingType="BUILDING_SHRINE" WHERE CivUniqueBuildingType="BUILDING_STAVE_CHURCH" and ReplacesBuildingType="BUILDING_TEMPLE";
--建筑等级
--DELETE FROM BuildingPrereqs WHERE Building="BUILDING_STAVE_CHURCH" and PrereqBuilding="BUILDING_SHRINE";
--INSERT INTO BuildingPrereqs (Building , PrereqBuilding)
--	VALUES ('BUILDING_TEMPLE' , 'BUILDING_STAVE_CHURCH');
--产出
--UPDATE Building_YieldChanges SET  YieldChange="2" WHERE BuildingType="BUILDING_STAVE_CHURCH" and YieldType="YIELD_FAITH";
--UPDATE Buildings SET PrereqCivic=NULL,PrereqTech="TECH_ASTROLOGY",Cost="70" WHERE BuildingType="BUILDING_STAVE_CHURCH";
--木板教堂 减少花费
UPDATE Buildings SET Cost="65" WHERE BuildingType="BUILDING_STAVE_CHURCH";


--祠堂 此城建造开拓者不消耗人口
--INSERT INTO BuildingModifiers (BuildingType, ModifierId)
--	VALUES ('BUILDING_GOV_WIDE', 'EXPEDITION_ADJUST_SETTLERS_CONSUME_POPULATION');

--商人共和国
UPDATE Government_SlotCounts SET NumSlots='1' WHERE GovernmentType="GOVERNMENT_MERCHANT_REPUBLIC" and GovernmentSlotType="SLOT_DIPLOMATIC";
UPDATE Government_SlotCounts SET NumSlots='2' WHERE GovernmentType="GOVERNMENT_MERCHANT_REPUBLIC" and GovernmentSlotType="SLOT_WILDCARD";

--军阀 所有城+2锤
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_CONQUEST' , 'GOV_TCONQUEST_PRODUCTION_BUFF_TPB');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('GOV_TCONQUEST_PRODUCTION_BUFF_TPB' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GOV_TCONQUEST_PRODUCTION_BUFF_TPB' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GOV_TCONQUEST_PRODUCTION_BUFF_TPB' , 'Amount' , '1');

--梁 右2 城市中的每个区域+1住房
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId="WATER_WORKS_NEIGHBORHOOD_HOUSING" and  ModifierType="MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING";
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId="WATER_WORKS_AQUEDUCT_HOUSING" and  ModifierType="MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING";
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId="WATER_WORKS_CANAL_AMENITY" and  ModifierType="MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY";
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId="WATER_WORKS_NEIGHBORHOOD_HOUSING" and  ModifierType="MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY";

UPDATE ModifierArguments SET Value='0' WHERE ModifierId='WATER_WORKS_NEIGHBORHOOD_HOUSING' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='WATER_WORKS_AQUEDUCT_HOUSING' AND Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='WATER_WORKS_CANAL_AMENITY' AND Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='WATER_WORKS_NEIGHBORHOOD_HOUSING' AND Name='Amount';

--香料：2粮-》1粮1金，只出现在雨林上。
UPDATE Resource_YieldChanges SET YieldChange="1" WHERE ResourceType="RESOURCE_SPICES" and YieldType="YIELD_FOOD";
INSERT INTO Resource_YieldChanges (ResourceType , YieldType , YieldChange)
	VALUES ('RESOURCE_SPICES' , 'YIELD_GOLD' , '1');
DELETE FROM Resource_ValidFeatures WHERE ResourceType="RESOURCE_SPICES" and FeatureType="FEATURE_FOREST";

--巴西 与雨林关联度2-》1（3雨林的几率应该会更高），新增巴西2关联度资源香蕉
INSERT INTO StartBiasResources (CivilizationType , ResourceType , Tier)
	VALUES ('CIVILIZATION_BRAZIL' , 'RESOURCE_BANANAS' , '2');

--巴西 雨林的加成对工业区也有效果
INSERT INTO TraitModifiers (TraitType, ModifierId) 
    VALUES ('TRAIT_CIVILIZATION_AMAZON', 'TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY_GYQ');

INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY_GYQ' , 'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY_GYQ' , 'DistrictType' , 'DISTRICT_INDUSTRIAL_ZONE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY_GYQ' , 'FeatureType' , 'FEATURE_JUNGLE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY_GYQ' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY_GYQ' , 'Amount' , '1');


--君主崇拜
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='GOD_KING_FAITH' AND Name='Amount';

--埃塞开拓者
INSERT INTO Types (Type, Kind) VALUES
('FSS_MODIFIER_PLAYER_UNITS_ADJUST_IGNORE_TERRAIN_COST_AISAI', 'KIND_MODIFIER');

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES
('FSS_MODIFIER_PLAYER_UNITS_ADJUST_IGNORE_TERRAIN_COST_AISAI', 'COLLECTION_PLAYER_UNITS', 'EFFECT_ADJUST_UNIT_IGNORE_TERRAIN_COST');
--条件
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AISAI_UNIT_IS_SETTLER' , 'REQUIREMENT_UNIT_IS_SETTLER');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AISAI_UNIT_IS_SETTLER' , 'REQUIRES_PLAYER_NOT_HAS_CITY_TEAM_PVP');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AISAI_UNIT_IS_SETTLER' , 'REQUIREMENTSET_TEST_ALL');

INSERT INTO TraitModifiers (TraitType, ModifierId) 
    VALUES ('TRAIT_CIVILIZATION_ETHIOPIA', 'STAVE_CHURCH_INCREASED_MOVEMENT_MODIFIER_AISAI');
INSERT INTO Modifiers (ModifierId, ModifierType,Permanent, SubjectRequirementSetId)
	VALUES ('STAVE_CHURCH_INCREASED_MOVEMENT_MODIFIER_AISAI', 'FSS_MODIFIER_PLAYER_UNITS_ADJUST_IGNORE_TERRAIN_COST_AISAI',1,"AISAI_UNIT_IS_SETTLER");
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('STAVE_CHURCH_INCREASED_MOVEMENT_MODIFIER_AISAI', 'Ignore','true');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('STAVE_CHURCH_INCREASED_MOVEMENT_MODIFIER_AISAI', 'Type','HILLS');

--印度 文化炸弹
INSERT INTO TraitModifiers (TraitType, ModifierId) 
    VALUES ('TRAIT_CIVILIZATION_DHARMA', 'TRAIT_HOLY_SITE_CULTURE_BOMB');

--巴西 雨林加锤
--TRAIT_MAORI_PRODUCTION_RAINFOREST
--要求游戏娱乐
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG', 'CivicType', 'CIVIC_STATE_WORKFORCE');
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_DIGUOCHUQI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_DIGUOCHUQI', 'CivicType', 'CIVIC_EARLY_EMPIRE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_DIGUOCHUQI');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG', 'REQUIREMENTSET_TEST_ALL');
--
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('TRAIT_BAXI_PRODUCTION_RAINFOREST', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_HAS_JUNGLE_REQUIREMENTS','PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_BAXI_PRODUCTION_RAINFOREST', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_BAXI_PRODUCTION_RAINFOREST', 'Amount','1');
INSERT INTO TraitModifiers (TraitType, ModifierId) 
    VALUES ('TRAIT_CIVILIZATION_AMAZON', 'TRAIT_BAXI_PRODUCTION_RAINFOREST');
/*INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('TRAIT_BAXI_PRODUCTION_RAINFOREST', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_HAS_JUNGLE_NO_IMPROVEMENT_REQUIREMENTS','PLAYER_HAS_POLITICAL_PHILOSOPHY_Z_BAXI_XINGZHENG');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_BAXI_PRODUCTION_RAINFOREST', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_BAXI_PRODUCTION_RAINFOREST', 'Amount','1');
INSERT INTO TraitModifiers (TraitType, ModifierId) 
    VALUES ('TRAIT_CIVILIZATION_AMAZON', 'TRAIT_BAXI_PRODUCTION_RAINFOREST');*/

--斯基泰 牧场文化炸弹
/*INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('TRAIT_CULTURE_BOMB_TRIGGER_PASTURE_SJT', 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_CULTURE_BOMB_TRIGGER_PASTURE_SJT', 'ImprovementType','IMPROVEMENT_PASTURE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_CULTURE_BOMB_TRIGGER_PASTURE_SJT', 'CaptureOwnedTerritory','False');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'TRAIT_CULTURE_BOMB_TRIGGER_PASTURE_SJT');*/
--马普切
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TOQUI_CULTURE_FROM_GOVERNOR' AND Name='Amount';
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TOQUI_PRODUCTION_FROM_GOVERNOR' AND Name='Amount';

	
--瑞娜左1 每个区域+2金
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('CARDINAL_GOLD_DISTRICT_RUINA', 'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_DISTRICT');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('CARDINAL_GOLD_DISTRICT_RUINA', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('CARDINAL_GOLD_DISTRICT_RUINA', 'Amount','2');
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) 
    VALUES ('GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER', 'CARDINAL_GOLD_DISTRICT_RUINA');

--教育家
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='LIBRARIAN_SCIENCE_YIELD_BONUS' AND Name='Amount';
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='LIBRARIAN_CULTURE_YIELD_BONUS' AND Name='Amount';

--老马 马格努斯 右2 +1锤1粮
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MAGENUSI_PRODUCTION_YOU2', 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('MAGENUSI_PRODUCTION_YOU2', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('MAGENUSI_PRODUCTION_YOU2', 'Amount','1');
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) 
    VALUES ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER', 'MAGENUSI_PRODUCTION_YOU2');

INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MAGENUSI_FOOD_YOU2', 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('MAGENUSI_FOOD_YOU2', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('MAGENUSI_FOOD_YOU2', 'Amount','1');
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) 
    VALUES ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER', 'MAGENUSI_FOOD_YOU2');

--拜火神庙
UPDATE Building_YieldChanges SET YieldChange=4 WHERE BuildingType='BUILDING_DAR_E_MEHR';
--大教堂
UPDATE Building_YieldChanges SET YieldChange=4 WHERE BuildingType='BUILDING_CATHEDRAL';

--佛寺
--UPDATE Buildings SET Cost=220  WHERE BuildingType='BUILDING_WAT';
--UPDATE Building_YieldChanges SET YieldChange=4 WHERE BuildingType='BUILDING_WAT' and YieldType="YIELD_FAITH";
UPDATE Building_YieldChanges SET YieldChange=1 WHERE BuildingType='BUILDING_WAT' and YieldType="YIELD_SCIENCE";

--哥伦比亚UI
UPDATE Improvement_YieldChanges SET YieldChange="2" where ImprovementType="IMPROVEMENT_HACIENDA" and YieldType="YIELD_PRODUCTION";
UPDATE Improvement_YieldChanges SET YieldChange="0" where ImprovementType="IMPROVEMENT_HACIENDA" and YieldType="YIELD_GOLD";

--哥伦比亚总指挥
--骑兵+2战斗力
--近战、抗骑兵+2战斗力
--AOE单位、进攻区域加力+4-》+2战斗力
--单个单位加力+7-》+4
--AOE炸血 30血-》25血 
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='COMMANDANTE_CAVALRY_BUFF' and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='COMMANDANTE_MELEE_ANTICAV_BUFF' and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='COMMANDANTE_UNIT_STR_VS_DISTRICTS' and Name='Amount';
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='ABILITY_COMMANDANTE_UNIT_STRENGTH_BUFF' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='GREAT_PERSON_INDIVIDUAL_RIBAS_DAMAGE_NEARBY_UNITS' and Name='Amount';
--次数
--立即生产最强陆地战斗单位 1次-》2次
--提供1次升级，并获得购买费用50%的金币 1次-》2次
--2个单元格内的敌人失去25生命值 1次-》1次
--2格内陆地单位重新获得移动和攻击能力 1次-》1次
--近战、抗骑兵+2战斗力 1次-》1次
UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_JOSE_DE_SUCRE';
UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MACGREGOR';
UPDATE GreatPersonIndividuals SET ActionCharges="1" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_RIBAS';
UPDATE GreatPersonIndividuals SET ActionCharges="1" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_URDANETA';
UPDATE GreatPersonIndividuals SET ActionCharges="1" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MARINO';

--玉米
UPDATE Resource_YieldChanges SET YieldChange="1",YieldType="YIELD_FOOD" WHERE ResourceType="RESOURCE_MAIZE" and YieldType="YIELD_GOLD";

--阿拉伯 加大预言家点数
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_Z' , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS','PLAYER_HAS_ASTROLOGY_REQUIREMENTS_Z');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_Z' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_PROPHET');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_Z' , 'Amount' , '1');
--UPDATE TraitModifiers SET ModifierId='TRAIT_BONUS_GREAT_PROPHET_POINT_Z' WHERE ModifierId='TRAIT_GUARANTEE_ONE_PROPHET';
INSERT INTO TraitModifiers (TraitType, ModifierId) 
    VALUES ('TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH', 'TRAIT_BONUS_GREAT_PROPHET_POINT_Z');
--条件
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_Z' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_Z' , 'REQUIRES_PLAYER_HAS_ASTROLOGY_Z');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_ASTROLOGY_Z' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_PLAYER_HAS_ASTROLOGY_Z' , 'CivicType' , 'CIVIC_CODE_OF_LAWS');


--军阀 所有城+1住房
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_CONQUEST' , 'GOV_TCONQUEST_HOURSE_BUFF_TPB');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('GOV_TCONQUEST_HOURSE_BUFF_TPB' , 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GOV_TCONQUEST_HOURSE_BUFF_TPB' , 'Amount' , '1');

--澳大利亚 内陆牧场
--改良
UPDATE Improvements SET PrereqCivic="CIVIC_CRAFTSMANSHIP" WHERE ImprovementType="IMPROVEMENT_OUTBACK_STATION";
INSERT INTO Improvement_BonusYieldChanges (Id,ImprovementType,YieldType,BonusYieldChange,PrereqCivic)
	VALUES ('IMPROVEMENT_OUTBACK_STATION_PRODUCTION','IMPROVEMENT_OUTBACK_STATION','YIELD_PRODUCTION',"1","CIVIC_GUILDS");
--掠夺
UPDATE Improvements SET PlunderAmount=PlunderAmount*0.75 WHERE PlunderType="PLUNDER_GOLD";

--著作
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_BEATRIX_POTTER_1' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_BEATRIX_POTTER_2' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_VALMIKI_1' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_VALMIKI_2' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_RUMI_1' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_RUMI_2' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_GABRIELA_MISTRAL_1' AND YieldType='YIELD_CULTURE';
UPDATE GreatWork_YieldChanges SET YieldChange='2' WHERE GreatWorkType='GREATWORK_BABYLON_GABRIELA_MISTRAL_2' AND YieldType='YIELD_CULTURE';

--什一税 每5人口+1金
INSERT INTO BeliefModifiers (BeliefType , ModifierId )
	VALUES ('BELIEF_TITHE' , 'TITHE_GOLD_FOLLOWER');
--朝圣 每5人口+1信仰
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER','PLAYER_FOUNDED_RELIGION_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP', 'ModifierId','PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP_MODIFIER');

INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP_MODIFIER', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP_MODIFIER', 'BeliefYieldType','BELIEF_YIELD_PER_FOLLOWER');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP_MODIFIER', 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP_MODIFIER', 'Amount',1);
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP_MODIFIER', 'PerXItems',4);

INSERT INTO BeliefModifiers (BeliefType , ModifierId )
	VALUES ('BELIEF_PILGRIMAGE' , 'PILGRIMAGE_FAITH_FOLLOWER_TEAMPVP');
--朝圣 每城市+2-》+1
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='PILGRIMAGE_FAITH_CITY_MODIFIER' and Name='Amount';
--埃特曼安吉神庙 沼特拉
UPDATE Modifiers SET ModifierType='MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD' WHERE ModifierId='ETEMENANKI_SCIENCE_MARSH';
UPDATE Modifiers SET ModifierType='MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD' WHERE ModifierId='ETEMENANKI_PRODUCTION_MARSH';

UPDATE ModifierArguments SET Value='0' WHERE ModifierId='ETEMENANKI_PRODUCTION_PLAINS_FLOODPLAINS' and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='ETEMENANKI_PRODUCTION_GRASS_FLOODPLAINS' and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='ETEMENANKI_PRODUCTION_FLOODPLAINS' and Name='Amount';
--DELETE FROM BuildingModifiers Where BuildingType="BUILDING_ETEMENANKI" and ModifierId!="ETEMENANKI_SCIENCE_MARSH" and ModifierId!="ETEMENANKI_PRODUCTION_MARSH" and ModifierId!="ETEMENANKI_SCIENCE_FLOODPLAINS";
--雄伟壮丽BUG
--雄伟时代
--UPDATE CommemorationTypes SET MaximumGameEra='ERA_CLASSICAL' WHERE CommemorationType="COMMEMORATION_INFRASTRUCTURE";
--布道者的远行
--UPDATE CommemorationTypes SET 
--GoldenAgeBonusDescription="LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_GOLDEN_AGE",
--NormalAgeBonusDescription="LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_NORMAL_AGE",
--DarkAgeBonusDescription="LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_DARK_AGE" 
--WHERE CommemorationType="COMMEMORATION_RELIGIOUS";

--DELETE FROM CommemorationModifiers WHERE CommemorationType="COMMEMORATION_RELIGIOUS" AND ModifierId="COMMEMORATION_RELIGIOUS_GA_CHARGES";
--DELETE FROM CommemorationModifiers WHERE CommemorationType="COMMEMORATION_RELIGIOUS" AND ModifierId="COMMEMORATION_RELIGIOUS_GA_MOVEMENT";
--DELETE FROM CommemorationModifiers WHERE CommemorationType="COMMEMORATION_RELIGIOUS" AND ModifierId="COMMEMORATION_RELIGIOUS_GA_GREAT_PROPHET_POINTS";
--DELETE FROM CommemorationModifiers WHERE CommemorationType="COMMEMORATION_RELIGIOUS" AND ModifierId="COMMEMORATION_RELIGIOUS_QUEST";


--+3海军
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='CHOLA_NAVAL_UNITS_COMBAT_STRENGTH' and Name='Amount';

--双星与入深海互换技能
--双星-》中世纪
--UPDATE GreatPersonIndividualActionModifiers SET ModifierId='GREATPERSON_LEIF_ERIKSON_SIGHT_BONUS' WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_GAIUS_DUILIUS" ;
UPDATE GreatPersonIndividuals SET EraType="ERA_MEDIEVAL" WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_GAIUS_DUILIUS";
UPDATE GreatPersonIndividualBirthModifiers SET ModifierId="GREATPERSON_COMBAT_STRENGTH_AOE_MEDIEVAL_SEA" WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_GAIUS_DUILIUS" and ModifierId="GREATPERSON_COMBAT_STRENGTH_AOE_CLASSICAL_SEA";
UPDATE GreatPersonIndividualBirthModifiers SET ModifierId="GREATPERSON_MOVEMENT_AOE_MEDIEVAL_SEA" WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_GAIUS_DUILIUS" and ModifierId="GREATPERSON_MOVEMENT_AOE_CLASSICAL_SEA";

--中世纪升级-》古典
--UPDATE GreatPersonIndividualActionModifiers SET ModifierId='GREATPERSON_GAIUS_DUILIUS_ACTIVE' WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON" ;
UPDATE GreatPersonIndividuals SET EraType="ERA_CLASSICAL" WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_HIMERIOS";
UPDATE GreatPersonIndividualBirthModifiers SET ModifierId="GREATPERSON_COMBAT_STRENGTH_AOE_CLASSICAL_SEA" WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_HIMERIOS" and ModifierId="GREATPERSON_COMBAT_STRENGTH_AOE_MEDIEVAL_SEA";
UPDATE GreatPersonIndividualBirthModifiers SET ModifierId="GREATPERSON_MOVEMENT_AOE_CLASSICAL_SEA" WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_HIMERIOS" and ModifierId="GREATPERSON_MOVEMENT_AOE_MEDIEVAL_SEA";
DELETE FROM GreatPersonIndividualActionModifiers WHERE GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_HIMERIOS" and
ModifierId="GREAT_PERSON_INDIVIDUAL_HIMERIOS_ACTIVE_UNIT_BONUS";
--渔船 制图学
UPDATE Improvement_BonusYieldChanges SET YieldType="YIELD_PRODUCTION",BonusYieldChange="1" WHERE ImprovementType="IMPROVEMENT_FISHING_BOATS" and YieldType="YIELD_GOLD" and PrereqTech="TECH_CARTOGRAPHY";

--荷兰 七省级护卫舰
UPDATE Units SET Combat=48,RangedCombat=58 WHERE UnitType='UNIT_DE_ZEVEN_PROVINCIEN';

--斗兽场 2文-》1文，2宜居度-》1宜居度
UPDATE Building_YieldChanges SET  YieldChange="1" WHERE BuildingType="BUILDING_COLOSSEUM" and YieldType="YIELD_CULTURE";
UPDATE Buildings SET Entertainment="1" WHERE BuildingType="BUILDING_COLOSSEUM";

--战象相邻-5-》-3
UPDATE Units SET Cost="105" WHERE UnitType='UNIT_INDIAN_VARU';
UPDATE ModifierArguments SET Value='-3' WHERE ModifierId='VARU_NEGATIVE_COMBAT_MODIFIER' and Name='Amount';
--托阿相邻-5-》-3
UPDATE Units SET Cost="105" WHERE UnitType='UNIT_MAORI_TOA';
UPDATE ModifierArguments SET Value='-3' WHERE ModifierId='TOA_NEGATIVE_COMBAT_MODIFIER' and Name='Amount';

--葡萄酒
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_WINE" and TerrainType="TERRAIN_GRASS";
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_WINE" and TerrainType="TERRAIN_PLAINS";

--印度 梯田
UPDATE Improvements SET Housing="1" WHERE ImprovementType="IMPROVEMENT_STEPWELL";

--西班牙 传教团 解锁
UPDATE Improvements SET PrereqTech="TECH_CURRENCY" WHERE ImprovementType="IMPROVEMENT_MISSION";

--修行制度
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('xiuxingzhidu_shengdi', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','DISTRICT_IS_HOLY_SITE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('xiuxingzhidu_shengdi', 'Amount','3');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('xiuxingzhidu_shengdi', 'YieldType','YIELD_SCIENCE');
INSERT INTO PolicyModifiers (PolicyType, ModifierId)
	VALUES ('POLICY_MONASTICISM', 'xiuxingzhidu_shengdi');

--禅修
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ZEN_MEDITATION_AMENITY_MODIFIER' and Name='Amount';

--宗教移民 减人口 
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
    VALUES ('CIVILIZATION_AYUTTHAYA_GONGDIAN', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
    VALUES ('CIVILIZATION_AYUTTHAYA_GONGDIAN', 'REQ_ZBQOHA83');
INSERT INTO Requirements (RequirementId, RequirementType)
    VALUES ('REQ_ZBQOHA83', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
    VALUES ('REQ_ZBQOHA83', 'BuildingType','BUILDING_PALACE');

/*INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('RELIGIOUS_SETTLEMENTS_SETTLER_RENKOU', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',"PLAYER_HAS_PANTHEON_REQUIREMENTS");
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('RELIGIOUS_SETTLEMENTS_SETTLER_RENKOU', 'ModifierId', 'RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER_RENKOU');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES
	('RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER_RENKOU', 'MODIFIER_PLAYER_CITIES_ADD_POPULATION',1,1,"CIVILIZATION_AYUTTHAYA_GONGDIAN","PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING");
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER_RENKOU', 'Amount', '-1');

INSERT INTO BeliefModifiers (BeliefType, ModifierId)
	VALUES 
	('BELIEF_RELIGIOUS_SETTLEMENTS', 'RELIGIOUS_SETTLEMENTS_SETTLER_RENKOU');*/
--宗教移民 减人口
-- -2
/*INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('RELIGIOUS_SETTLEMENTS_SETTLER_RENKOU_2', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',"PLAYER_HAS_PANTHEON_REQUIREMENTS");
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('RELIGIOUS_SETTLEMENTS_SETTLER_RENKOU_2', 'ModifierId', 'RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER_RENKOU_2');
INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
	VALUES
	('RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER_RENKOU_2', 'MODIFIER_PLAYER_CITIES_ADD_POPULATION',1,1,"CIVILIZATION_AYUTTHAYA_GONGDIAN");
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER_RENKOU_2', 'Amount', '-1');--减2
INSERT INTO BeliefModifiers (BeliefType, ModifierId)
	VALUES 
	('BELIEF_RELIGIOUS_SETTLEMENTS', 'RELIGIOUS_SETTLEMENTS_SETTLER_RENKOU_2');*/

--移除 英国 送小船
--需要海军传统文化
/*
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_HJCT', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_HJCT', 'CivicType', 'CIVIC_NAVAL_TRADITION');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_HJCT', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_HJCT');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_HJCT', 'REQUIREMENTSET_TEST_ALL');

UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_HJCT' WHERE ModifierId='TRAIT_ROYAL_NAVY_DOCKYARD_NAVAL_UNIT'; 
*/
--葡萄牙 贸易路线提升距离
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='TRAIT_WATER_TRADE_ROUTE_RANGE' and Name='Amount';


--毛利
--船不能下深海
UPDATE Modifiers SET SubjectRequirementSetId='UNIT_IS_DOMAIN_LAND' WHERE ModifierId='TRAIT_MAORI_MANA_OCEAN';

--马里 改版
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_DESERT_CITY_CENTER_FAITH' and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_DESERT_HILLS_CITY_CENTER_FAITH' and Name='Amount';
--判断沙漠单元格
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_CITY_HAS_SHAMO_QIULING', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_CITY_HAS_SHAMO_QIULING', 'TerrainType', 'TERRAIN_DESERT_HILLS');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('CITY_HAS_SHAMO_QIULING', 'REQUIRES_CITY_HAS_SHAMO_QIULING');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('CITY_HAS_SHAMO_QIULING', 'REQUIREMENTSET_TEST_ALL');
--沙漠丘陵给锤
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('TRAIT_INCREASED_SHAMO_CHUI', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',"CITY_HAS_SHAMO_QIULING");
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('TRAIT_INCREASED_SHAMO_CHUI', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('TRAIT_INCREASED_SHAMO_CHUI', 'Amount', '1');

INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES 
	('TRAIT_CIVILIZATION_MALI_GOLD_DESERT', 'TRAIT_INCREASED_SHAMO_CHUI');
--初始赋予2点信仰
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI_MALI', 'MODIFIER_PLAYER_GRANT_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI_MALI', 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI_MALI', 'Amount','2');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_MALI_GOLD_DESERT', 'SCIENCE_PRESETTLEMENT_MAOLI_JINBI_MALI');

--圣地 相邻 曼丁哥市场
/*INSERT INTO Adjacency_YieldChanges(ID,Description,YieldType,YieldChange,TilesRequired,AdjacentDistrict)
    VALUES ('DISTRICT_HOLY_SITE_MALI_SHANGYE', 'LOC_DISTRICT_HOLY_SITE_MALI_SHANGYE_1',"YIELD_FAITH","1","1","DISTRICT_SUGUBA");

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
	VALUES ('DISTRICT_HOLY_SITE', 'DISTRICT_HOLY_SITE_MALI_SHANGYE');*/

--加拿大 冰球场
UPDATE Adjacency_YieldChanges SET TilesRequired="2" WHERE ID="Hockey_TundraAdjacency";
UPDATE Adjacency_YieldChanges SET TilesRequired="2" WHERE ID="Hockey_TundraHillsAdjacency";
UPDATE Adjacency_YieldChanges SET TilesRequired="2" WHERE ID="Hockey_SnowAdjacency";
UPDATE Adjacency_YieldChanges SET TilesRequired="2" WHERE ID="Hockey_SnowHillsAdjacency";
--人文主义解锁
UPDATE Improvements SET PrereqCivic="CIVIC_HUMANISM" WHERE ImprovementType="IMPROVEMENT_ICE_HOCKEY_RINK";
--基础锤，粮，金
UPDATE Improvement_YieldChanges SET YieldChange="1" WHERE ImprovementType="IMPROVEMENT_ICE_HOCKEY_RINK" AND YieldType="YIELD_PRODUCTION";
UPDATE Improvement_YieldChanges SET YieldChange="1" WHERE ImprovementType="IMPROVEMENT_ICE_HOCKEY_RINK" AND YieldType="YIELD_FOOD";
--INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
--	VALUES ('IMPROVEMENT_ICE_HOCKEY_RINK' , 'YIELD_FOOD' , '1');
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_ICE_HOCKEY_RINK' , 'YIELD_GOLD' , '2');

--瑞典 生态博物馆
UPDATE Improvements SET PrereqCivic="CIVIC_HUMANISM" WHERE ImprovementType="IMPROVEMENT_OPEN_AIR_MUSEUM";
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='OPEN_AIR_MUSEUM_CULTURE_FOR_TERRAIN_CLASS_CITIES' and Name='Amount';
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_OPEN_AIR_MUSEUM' , 'YIELD_FOOD' , '1');
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_OPEN_AIR_MUSEUM' , 'YIELD_PRODUCTION' , '1');

--河神 宜居度
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='RIVER_GODDESS_HOLY_SITE_AMENITIES_MODIFIER' and Name='Amount';

--金字塔
DELETE FROM BuildingModifiers Where BuildingType="BUILDING_PYRAMIDS" and ModifierId="PYRAMID_GRANT_BUILDERS";

--加拿大 骑警
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ALL_PARK_COMBAT_BONUS' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='OWNER_PARK_COMBAT_BONUS' and Name='Amount';

INSERT INTO UnitReplaces (CivUniqueUnitType , ReplacesUnitType )
	VALUES ('UNIT_CANADA_MOUNTIE' , 'UNIT_CAVALRY');

--苏美尔 神型金字塔
--UPDATE Improvements SET SameAdjacentValid=0 WHERE ImprovementType='IMPROVEMENT_ZIGGURAT';
UPDATE Improvement_YieldChanges SET YieldChange='0' WHERE ImprovementType='IMPROVEMENT_ZIGGURAT' and YieldType='YIELD_SCIENCE';
--沿河
UPDATE ModifierArguments SET Value='YIELD_FOOD' WHERE ModifierId='ZIGGURAT_RIVERADJACENCY_CULTURE' and Name='YieldType';
--
INSERT INTO ImprovementModifiers (ImprovementType, ModifierId)
	VALUES ('IMPROVEMENT_ZIGGURAT', 'ZIGGURAT_RIVERADJACENCY_PRODUCTION');
--
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('ZIGGURAT_RIVERADJACENCY_PRODUCTION', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS','PLOT_ADJACENT_TO_RIVER_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('ZIGGURAT_RIVERADJACENCY_PRODUCTION', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('ZIGGURAT_RIVERADJACENCY_PRODUCTION', 'Amount','1');
--
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_ZIGGURAT' , 'YIELD_PRODUCTION' , '0');
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_ZIGGURAT-01' , 'IMPROVEMENT_ZIGGURAT' , 'YIELD_PRODUCTION' , '1' , 'CIVIC_FEUDALISM');
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_ZIGGURAT-02' , 'IMPROVEMENT_ZIGGURAT' , 'YIELD_SCIENCE' , '1' , 'CIVIC_STATE_WORKFORCE');
--掘石之神
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GODDESS_OF_THE_HARVEST', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GODDESS_OF_THE_HARVEST', 'LOC_BELIEF_GODDESS_OF_THE_HARVEST_NAME_2', 'LOC_BELIEF_GODDESS_OF_THE_HARVEST_NAME_3', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_HARVEST', 'STONE_CIRCLES_QUARRY_FAITH_JUESHI');
--
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('STONE_CIRCLES_QUARRY_FAITH_JUESHI', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
	INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('STONE_CIRCLES_QUARRY_FAITH_JUESHI_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_QUARRY_REQUIREMENTS');
--
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('STONE_CIRCLES_QUARRY_FAITH_JUESHI', 'ModifierId','STONE_CIRCLES_QUARRY_FAITH_JUESHI_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('STONE_CIRCLES_QUARRY_FAITH_JUESHI_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('STONE_CIRCLES_QUARRY_FAITH_JUESHI_MODIFIER', 'Amount','1');

--苏美尔
INSERT INTO Modifiers 
	(ModifierId                              , ModifierType                          )
	VALUES 
	('CHARISMATICLEADER_INFLUENCEPOINTS_SUMEIER' , 'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');
INSERT INTO ModifierArguments 
	(ModifierId                              , Name           , Value)
	VALUES 
	('CHARISMATICLEADER_INFLUENCEPOINTS_SUMEIER' , 'Amount'    , '1'                     );
--
INSERT INTO TraitModifiers (TraitType,ModifierId)
	VALUES 
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION', 'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
    ('TRAIT_CIVILIZATION_FIRST_CIVILIZATION', 'CHARISMATICLEADER_INFLUENCEPOINTS_SUMEIER');

--英国 维多利亚 政治哲学+1贸易路线
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_WEIDUOLIYA', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_WEIDUOLIYA', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_WEIDUOLIYA', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_WEIDUOLIYA');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_WEIDUOLIYA', 'REQUIREMENTSET_TEST_ALL');
--+1
INSERT INTO Modifiers (ModifierId , ModifierType, OwnerRequirementSetId)
    VALUES ('TRAIT_JOAO_TRADE_ROUTE_ON_MEET_WEIDUOLIYA' , 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY','PLAYER_HAS_POLITICAL_PHILOSOPHY_WEIDUOLIYA');	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("TRAIT_JOAO_TRADE_ROUTE_ON_MEET_WEIDUOLIYA","Amount","1");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_PAX_BRITANNICA","TRAIT_JOAO_TRADE_ROUTE_ON_MEET_WEIDUOLIYA");

--雄伟壮丽只能买工人
--UPDATE ModifierArguments SET Value='CLASS_BUILDER' WHERE ModifierId='COMMEMORATION_INFRASTRUCTURE_GA_PURCHASE_CIVILIAN' and Name='Tag';

--挪威 购买uu打折
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('BUY_KUANGZHANSHI_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_KUANGZHANSHI_ZHEKOU","UnitType","UNIT_NORWEGIAN_BERSERKER");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_KUANGZHANSHI_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER","BUY_KUANGZHANSHI_ZHEKOU");
--斯基泰 购买uu打折
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('BUY_GONGQIBING_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_GONGQIBING_ZHEKOU","UnitType","UNIT_SCYTHIAN_HORSE_ARCHER");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_GONGQIBING_ZHEKOU","Amount","0");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY","BUY_GONGQIBING_ZHEKOU");

--印度尼西亚 印尼 购买uu打折
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('BUY_RONGKECHUAN_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_RONGKECHUAN_ZHEKOU","UnitType","UNIT_INDONESIAN_JONG");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_RONGKECHUAN_ZHEKOU","Amount","25");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_INDONESIA_NUSANTARA","BUY_RONGKECHUAN_ZHEKOU");

--奥斯曼 提前送总督
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_AOSIMAN' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_AOSIMAN' , 'PLAYER_HAS_TECH_BRONZE_WORKING_TPB');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_BRONZE_WORKING_TPB' , 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_BRONZE_WORKING_TPB' , 'TechnologyType' , 'TECH_CONSTRUCTION');

UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_AOSIMAN' WHERE ModifierId='SULEIMAN_GOVERNOR_POINTS' and ModifierType="MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS";

--拜占庭 阴间传教
DELETE FROM Modifiers WHERE ModifierId='BYZANTIUM_PRESSURE_KILLS';

--高棉 农场
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_FARM_AQUEDUCT_ADJECENCY_FOOD' and Name='Amount';

--朝鲜 书院 相邻食物-》金
UPDATE Adjacency_YieldChanges SET YieldType='YIELD_GOLD' WHERE ID="Farm_FoodSeowonAdjacency" and YieldType="YIELD_FOOD";
--朝鲜 书院 相邻农场不提供加成
--DELETE FROM Adjacency_YieldChanges WHERE ID="Farm_FoodSeowonAdjacency" and YieldType="YIELD_FOOD";

--军阀宝座 移除20%生产力提升 bug
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_GOV_CONQUEST" and ModifierId="GOV_PRODUCTION_BOOST_FROM_CAPTURE";
--军阀宝座 新增建造军营30、港口加速20
INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('VETERANCY_HARBOR_PRODUCTION_2' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION');	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("VETERANCY_HARBOR_PRODUCTION_2","DistrictType","DISTRICT_HARBOR");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("VETERANCY_HARBOR_PRODUCTION_2","Amount","20");

INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('VETERANCY_HARBOR_BUILDINGS_PRODUCTION_2' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("VETERANCY_HARBOR_BUILDINGS_PRODUCTION_2","DistrictType","DISTRICT_HARBOR");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("VETERANCY_HARBOR_BUILDINGS_PRODUCTION_2","Amount","20");

INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_CONQUEST' , 'VETERANCY_HARBOR_PRODUCTION_2');
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_CONQUEST' , 'VETERANCY_HARBOR_BUILDINGS_PRODUCTION_2');
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_CONQUEST' , 'VETERANCY_ENCAMPMENT_PRODUCTION');
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_CONQUEST' , 'VETERANCY_ENCAMPMENT_BUILDINGS_PRODUCTION');

--俄罗斯 冻土信仰需要圣地
UPDATE Modifiers SET SubjectRequirementSetId='REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA' WHERE  ModifierId='TRAIT_INCREASED_TUNDRA_FAITH';
UPDATE Modifiers SET SubjectRequirementSetId='REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_HILLS' WHERE  ModifierId='TRAIT_INCREASED_TUNDRA_HILLS_FAITH';

INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('PLAYER_HAS_WANGQUAN_ELUOSI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('PLAYER_HAS_WANGQUAN_ELUOSI', 'CivicType', 'CIVIC_REFORMED_CHURCH');

INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA' , 'REQUIRES_CITY_HAS_HOLY_SITE');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA' , 'REQUIRES_PLOT_HAS_TUNDRA');
	
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_HILLS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_HILLS' , 'REQUIRES_CITY_HAS_HOLY_SITE');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_HILLS' , 'PLAYER_HAS_WANGQUAN_ELUOSI');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_HILLS' , 'REQUIRES_PLOT_HAS_TUNDRA_HILLS');	

--加拿大
--冻土平原+2-》+1
/*
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TUNDRA_FARMS_FOOD' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TUNDRA_MINES_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TUNDRA_CAMPS_FOOD' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TUNDRA_LUMBER_MILLS_PRODUCTION' and Name='Amount';
*/

--农场基础金
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_FARM' , 'YIELD_GOLD' , '0');


--军事探索
INSERT INTO Types (Type, Kind)
	VALUES ('POLICY_JUNSHITANSUO', 'KIND_POLICY');	
INSERT INTO Policies (PolicyType, Name ,Description,PrereqCivic,GovernmentSlotType)
	VALUES ('POLICY_JUNSHITANSUO', 'LOC_POLICY_JUNSHITANSUO_NAME_NS',"LOC_POLICY_JUNSHITANSUO_DESCRIPTION_NS","CIVIC_MERCENARIES","SLOT_MILITARY");
INSERT INTO PolicyModifiers (PolicyType, ModifierId)
	VALUES ('POLICY_JUNSHITANSUO', 'MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingying');
	INSERT INTO PolicyModifiers (PolicyType, ModifierId)
	VALUES ('POLICY_JUNSHITANSUO', 'MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_majiu');
	INSERT INTO PolicyModifiers (PolicyType, ModifierId)
	VALUES ('POLICY_JUNSHITANSUO', 'MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingong');
	--INSERT INTO PolicyModifiers (PolicyType, ModifierId)
	--VALUES ('POLICY_JUNSHITANSUO', 'MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_erduo');
	--INSERT INTO PolicyModifiers (PolicyType, ModifierId)
	--VALUES ('POLICY_JUNSHITANSUO', 'MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_xuetang');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingying', 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingying', 'YieldType' , 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingying', 'BuildingType' , 'BUILDING_BARRACKS');	
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingying', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_majiu', 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_majiu', 'YieldType' , 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_majiu', 'BuildingType' , 'BUILDING_STABLE');	
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_majiu', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingong', 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingong', 'YieldType' , 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingong', 'BuildingType' , 'BUILDING_ARMORY');	
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_bingong', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

--耳朵
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_erduo', 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_erduo', 'YieldType' , 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_erduo', 'BuildingType' , 'BUILDING_ORDU');	
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_erduo', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_xuetang', 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_xuetang', 'YieldType' , 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_xuetang', 'BuildingType' , 'BUILDING_BASILIKOI_PAIDES');	
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER_xuetang', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');


--蘑菇
---工人
--遗物 联机速减半
UPDATE GoodyHutSubTypes SET Turn="46" WHERE GoodyHut="GOODYHUT_SURVIVORS" and SubTypeGoodyHut="GOODYHUT_GRANT_BUILDER";
UPDATE GoodyHutSubTypes SET Weight="0" WHERE GoodyHut="GOODYHUT_DIPLOMACY" and SubTypeGoodyHut="GOODYHUT_GOVERNOR_TITLE";
UPDATE GoodyHutSubTypes SET Turn="20" WHERE GoodyHut="GOODYHUT_CULTURE" and SubTypeGoodyHut="GOODYHUT_ONE_RELIC";

--苏美尔 初始给金币
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI_SUMEIER', 'MODIFIER_PLAYER_GRANT_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI_SUMEIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('SCIENCE_PRESETTLEMENT_MAOLI_JINBI_SUMEIER', 'Amount','30');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_FIRST_CIVILIZATION', 'SCIENCE_PRESETTLEMENT_MAOLI_JINBI_SUMEIER');

--玛雅 农场相邻天文台+金
UPDATE Adjacency_YieldChanges SET YieldType='YIELD_GOLD' WHERE ID="Farm_FoodObservatoryAdjacency";

--斯基泰 弓骑手 移动后可攻击
INSERT INTO Tags(Tag , Vocabulary)
	VALUES ('CLASS_SCYTHIAN_HORSE_ARCHER', 'ABILITY_CLASS');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('UNIT_SCYTHIAN_HORSE_ARCHER', 'CLASS_SCYTHIAN_HORSE_ARCHER');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('ABILITY_VOI_CHIEN', 'CLASS_SCYTHIAN_HORSE_ARCHER');
--斯基泰 购买轻骑兵打折
--条件
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_WQ', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_WQ', 'CivicType', 'CIVIC_DIVINE_RIGHT');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_SQ', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_WQ');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_SQ', 'REQUIREMENTSET_TEST_ALL');
--骑手
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_HORSEMAN_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_SQ");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_HORSEMAN_ZHEKOU","UnitType","UNIT_HORSEMAN");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_HORSEMAN_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY","BUY_UNIT_HORSEMAN_ZHEKOU");
--追猎
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_COURSER_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_SQ");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_COURSER_ZHEKOU","UnitType","UNIT_COURSER");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_COURSER_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY","BUY_UNIT_COURSER_ZHEKOU");
--骑手
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_CAVALRY_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_SQ");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_CAVALRY_ZHEKOU","UnitType","UNIT_CAVALRY");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_CAVALRY_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY","BUY_UNIT_CAVALRY_ZHEKOU");
--直升机
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_HELICOPTER_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_SIJITAI_SQ");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_HELICOPTER_ZHEKOU","UnitType","UNIT_HELICOPTER");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_HELICOPTER_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY","BUY_UNIT_HELICOPTER_ZHEKOU");

--挪威 购买海军近战打折
--可以购买海军近战
/*
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER' , 'SCYTHIA_FAITH_PURCHASE_CLASS_NAVAL_MELEE_NUOWEI');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_CLASS_NAVAL_MELEE_NUOWEI' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_CLASS_NAVAL_MELEE_NUOWEI' , 'Tag' , 'CLASS_NAVAL_MELEE'); 
--条件
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX', 'TechnologyType' , 'TECH_CARTOGRAPHY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX', 'REQUIREMENTSET_TEST_ALL');
--桨帆船
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_GALLEY_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_GALLEY_ZHEKOU","UnitType","UNIT_GALLEY");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_GALLEY_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER","BUY_UNIT_GALLEY_ZHEKOU");
--轻快帆船
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_CARAVEL_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_CARAVEL_ZHEKOU","UnitType","UNIT_CARAVEL");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_CARAVEL_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER","BUY_UNIT_CARAVEL_ZHEKOU");
--装甲舰
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_IRONCLAD_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_IRONCLAD_ZHEKOU","UnitType","UNIT_IRONCLAD");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_IRONCLAD_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER","BUY_UNIT_IRONCLAD_ZHEKOU");
--驱逐舰
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit,OwnerRequirementSetId)
    VALUES ('BUY_UNIT_DESTROYER_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1,"PLAYER_HAS_POLITICAL_PHILOSOPHY_NUOWEI_SX");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_DESTROYER_ZHEKOU","UnitType","UNIT_DESTROYER");

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("BUY_UNIT_DESTROYER_ZHEKOU","Amount","15");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER","BUY_UNIT_DESTROYER_ZHEKOU");
    */

--马里 圣地 +宜居度
--条件 圣地
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('SHAMO_PLOT_HAS_HOLY_SITE_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SHAMO_PLOT_HAS_HOLY_SITE_REQUIREMENTS' , 'REQUIRES_CITY_HAS_HOLY_SITE');
--
INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('SHAMO_HOLY_SITE_AMENITY_MODIFIER' , 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',"SHAMO_PLOT_HAS_HOLY_SITE_REQUIREMENTS");	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("SHAMO_HOLY_SITE_AMENITY_MODIFIER","Amount","1");
--
--INSERT INTO	TraitModifiers(TraitType,ModifierId)
--    VALUES ("TRAIT_CIVILIZATION_MALI_GOLD_DESERT","SHAMO_HOLY_SITE_AMENITY_MODIFIER");

--荷兰 圩田
UPDATE Improvement_BonusYieldChanges SET BonusYieldChange="2" WHERE ImprovementType="IMPROVEMENT_POLDER" and YieldType="YIELD_GOLD";
UPDATE Adjacency_YieldChanges SET YieldChange="1" WHERE ID="Polder_Polder_Food_Late";

--越南 九龙三角洲 陆地特色区域+1金
--区域判断 
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHUIQU'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES'),--水渠
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_DIBA'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES'),--堤坝
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_YUNHE'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES'),--运河
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHEQU'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES'),--社区
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_GANGKOU'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES'),--港口
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHIZHONGXIN'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES'),--市中心
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_CHENGSHI'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES');--城池
INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHUIQU',     'DistrictType','DISTRICT_AQUEDUCT'),--水渠
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_DIBA',     'DistrictType','DISTRICT_DAM'),--堤坝
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_YUNHE',     'DistrictType','DISTRICT_AQUEDUCT'),--运河
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHEQU',     'DistrictType','DISTRICT_NEIGHBORHOOD'),--社区
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_GANGKOU',     'DistrictType','DISTRICT_HARBOR'),--港口
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHIZHONGXIN',     'DistrictType','DISTRICT_CITY_CENTER'),--市中心
	('REQUIRES_DISTRICT_IS_HARBOR_YUENAN_CHENGSHI',     'DistrictType','DISTRICT_THANH');--城池
--所有区域+1金
INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI' , 'Amount' , '1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI');
--城池
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_CHENGSHI'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_CHENGSHI'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_CHENGSHI');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_CHENGSHI' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_CHENGSHI');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_CHENGSHI' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_CHENGSHI' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_CHENGSHI');
--市中心
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_SHIZHONGXIN'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_SHIZHONGXIN'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHIZHONGXIN');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHIZHONGXIN' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_SHIZHONGXIN');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHIZHONGXIN' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHIZHONGXIN' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHIZHONGXIN');
--港口
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_GANGKOU'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_GANGKOU'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_GANGKOU');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_GANGKOU' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_GANGKOU');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_GANGKOU' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_GANGKOU' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_GANGKOU');
--水渠
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_SHUIQU'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_SHUIQU'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHUIQU');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHUIQU' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_SHUIQU');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHUIQU' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHUIQU' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHUIQU');
--社区
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_SHEQU'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_SHEQU'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_SHEQU');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHEQU' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_SHEQU');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHEQU' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHEQU' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_SHEQU');
--运河
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_YUNHE'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_YUNHE'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_YUNHE');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_YUNHE' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_YUNHE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_YUNHE' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_YUNHE' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_YUNHE');
--堤坝
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('YUENAN_HAS_DIBA'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('YUENAN_HAS_DIBA'		, 	'REQUIRES_DISTRICT_IS_HARBOR_YUENAN_DIBA');

INSERT INTO Modifiers (ModifierId , ModifierType, SubjectRequirementSetId)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_DIBA' , 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','YUENAN_HAS_DIBA');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_DIBA' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_DIBA' , 'Amount' , '-1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_VIETNAM', 'YUENAN_JIULONGSANJIAOZHOU_JIAJINBI_DIBA');
--加拿大 宫殿+1粮
INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
('JIANADA_GONGDIAN_JIASHIWU', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('JIANADA_GONGDIAN_JIASHIWU', 'BuildingType', 'BUILDING_PALACE'),
('JIANADA_GONGDIAN_JIASHIWU', 'YieldType',    'YIELD_FOOD'),
('JIANADA_GONGDIAN_JIASHIWU', 'Amount',       '1');

INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_CIVILIZATION_FACES_OF_PEACE' , 'JIANADA_GONGDIAN_JIASHIWU');	

--堤坝
UPDATE Districts SET Cost=54 WHERE DistrictType="DISTRICT_DAM";

--法国 奇观加速
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='TRAIT_WONDER_MEDIAVALINDUSTRIAL_PRODUCTION' and Name='Amount';

--苏丹亲兵
UPDATE Units SET Cost=160 WHERE UnitType='UNIT_SULEIMAN_JANISSARY';

--p51美国
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='ANTI_FIGHTER_AIRCRAFT_COMBAT_BONUS' and Name='Amount';

--进步党 美国 加魅力
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI', 'CivicType', 'CIVIC_CIVIL_SERVICE');
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_FENGJIAN', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_FENGJIAN', 'CivicType', 'CIVIC_FEUDALISM');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_FENGJIAN');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI', 'REQUIREMENTSET_TEST_ALL');
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_GONGHUI' WHERE ModifierId='TRAIT_NATIONAL_PARK_APPEAL_BONUS' and ModifierType='MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL';


--刚果 精神实体
/*UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_GREAT_WORK_PRODUCTION_SCULPTURE' and Name='YieldChange';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_GREAT_WORK_PRODUCTION_ARTIFACT' and Name='YieldChange';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_GREAT_WORK_PRODUCTION_RELIC' and Name='YieldChange';
*/
--圣地大科
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES
	('REQUIRES_DISTRICT_IS_SD'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_DISTRICT_IS_SD',     'DistrictType','DISTRICT_HOLY_SITE');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('ShengDiDaKe_HAS_HIGH_ADJACENCY1'		, 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY3'	, 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'REQUIREMENTSET_TEST_ALL'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('ShengDiDaKe_HAS_HIGH_ADJACENCY1'		, 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY1'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY2'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY3'	, 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY3'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY4'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY5'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY6'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY7'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY8'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY9'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY10'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY11'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY12');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('ShengDiDaKe_HAS_HIGH_ADJACENCY1'		, 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY3'	, 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'REQUIRES_DISTRICT_IS_SD'),
	('ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'REQUIRES_DISTRICT_IS_SD');

INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY1'		, 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY3'	, 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT');

INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY1',     'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY3', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'DistrictType','DISTRICT_HOLY_SITE'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'DistrictType','DISTRICT_HOLY_SITE');

INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY1'		, 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY3'	, 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'YieldType','YIELD_FAITH'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'YieldType','YIELD_FAITH');

INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY1'		, 	'Amount','1'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY2', 	'Amount','2'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY3'	, 	'Amount','3'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY4', 	'Amount','4'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY5', 	'Amount','5'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY6', 	'Amount','6'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY7', 	'Amount','7'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY8', 	'Amount','8'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY9', 	'Amount','9'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY10', 	'Amount','10'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY11', 	'Amount','11'),
	('REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY12', 	'Amount','12');

INSERT INTO Types (Type, Kind)
	VALUES
	('MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_CHANGE_ShengDiDaKe_TPB'		, 	'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType,EffectType)
	VALUES
	('MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_CHANGE_ShengDiDaKe_TPB'		, 	'COLLECTION_CITY_DISTRICTS','EFFECT_ADJUST_DISTRICT_YIELD_CHANGE');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('ShengDiDaKe_MODIFIER_NEW1', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY1'),
	('ShengDiDaKe_MODIFIER_NEW2', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY2'),
	('ShengDiDaKe_MODIFIER_NEW3', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY3'),
	('ShengDiDaKe_MODIFIER_NEW4', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY4'),
	('ShengDiDaKe_MODIFIER_NEW5', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY5'),
	('ShengDiDaKe_MODIFIER_NEW6', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY6'),
	('ShengDiDaKe_MODIFIER_NEW7', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY7'),
	('ShengDiDaKe_MODIFIER_NEW8', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY8'),
	('ShengDiDaKe_MODIFIER_NEW9', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY9'),
	('ShengDiDaKe_MODIFIER_NEW10', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY10'),
	('ShengDiDaKe_MODIFIER_NEW11', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY11'),
	('ShengDiDaKe_MODIFIER_NEW12', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ShengDiDaKe_HAS_HIGH_ADJACENCY12');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('ShengDiDaKe_MODIFIER_NEW1', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW2', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW3', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW4', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW5', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW6', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW7', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW8', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW9', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW10', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW11', 'YieldType', 'YIELD_SCIENCE'),
	('ShengDiDaKe_MODIFIER_NEW12', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('ShengDiDaKe_MODIFIER_NEW1', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW2', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW3', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW4', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW5', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW6', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW7', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW8', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW9', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW10', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW11', 'Amount', '1'),
	('ShengDiDaKe_MODIFIER_NEW12', 'Amount', '1');

INSERT INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId,AttachmentTargetType)
	VALUES 
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW1',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW2',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW3',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW4',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW5',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW6',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW7',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW8',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW9',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW10',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW11',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE"),
	('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'ShengDiDaKe_MODIFIER_NEW12',"GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE");

DELETE FROM GreatPersonIndividualActionModifiers Where GreatPersonIndividualType="GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN" and 
ModifierId="GREATPERSON_HOLY_SITE_ADJACENCY_AS_SCIENCE" ;
  
UPDATE ModifierStrings SET ModifierId='ShengDiDaKe_MODIFIER_NEW1' WHERE ModifierId='GREATPERSON_HOLY_SITE_ADJACENCY_AS_SCIENCE';

--大军团BUG修复
/*DELETE FROM PolicyModifiers Where PolicyType="POLICY_GRANDE_ARMEE" and 
ModifierId="GRANDEARMEE_MODERN_MELEE_PRODUCTION" ;
DELETE FROM PolicyModifiers Where PolicyType="POLICY_GRANDE_ARMEE" and 
ModifierId="GRANDEARMEE_MODERN_ANTI_CAVALRY_PRODUCTION" ;
DELETE FROM PolicyModifiers Where PolicyType="POLICY_GRANDE_ARMEE" and 
ModifierId="GRANDEARMEE_MODERN_RANGED_PRODUCTION" ;*/

--外交官 点数+1
INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('WAIJIAOGUAN_WAIJIAODIANSHU' , 'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('WAIJIAOGUAN_WAIJIAODIANSHU' , 'Amount' , '1');
--使者+1
INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('WAIJIAOGUAN_SHIZHE' , 'MODIFIER_GOVERNOR_ADJUST_CITY_ENVOYS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('WAIJIAOGUAN_SHIZHE' , 'Amount' , '1');

INSERT INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId)
	VALUES 
	('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR', 'WAIJIAOGUAN_WAIJIAODIANSHU'),
	('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR', 'WAIJIAOGUAN_SHIZHE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'WAIJIAOGUAN_WAIJIAODIANSHU'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE', 'WAIJIAOGUAN_SHIZHE'),
	('GOVERNOR_PROMOTION_LOCAL_INFORMANTS', 'WAIJIAOGUAN_WAIJIAODIANSHU'),
	('GOVERNOR_PROMOTION_LOCAL_INFORMANTS', 'WAIJIAOGUAN_SHIZHE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY', 'WAIJIAOGUAN_WAIJIAODIANSHU'),
	('GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY', 'WAIJIAOGUAN_SHIZHE');

/*
GOVERNOR_PROMOTION_AMBASSADOR_PRESTIGE
GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY
GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE
GOVERNOR_PROMOTION_LOCAL_INFORMANTS
*/

--神圣之光
--移除 图书馆、剧院+1伟人点
--DELETE FROM BeliefModifiers Where ModifierId="DIVINE_SPARK_SCIENTIST" and 
--BeliefType="BELIEF_DIVINE_SPARK" ;
DELETE FROM BeliefModifiers Where ModifierId="DIVINE_SPARK_WRITER" and 
BeliefType="BELIEF_DIVINE_SPARK" ;
--新增 学院、剧院+1伟人点
--学院
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_CAMPUS_TPB' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_CAMPUS_MODIFIER_TPB' , 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS','DISTRICT_IS_CAMPUS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_CAMPUS_TPB' , 'ModifierId' , 'DIVINE_SPARK_CAMPUS_MODIFIER_TPB');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_CAMPUS_MODIFIER_TPB' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_SCIENTIST');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_CAMPUS_MODIFIER_TPB' , 'Amount' , '1');
--剧院
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_THEATER_TPB' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_THEATER_MODIFIER_TPB' , 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS','DISTRICT_IS_THEATER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_THEATER_TPB' , 'ModifierId' , 'DIVINE_SPARK_THEATER_MODIFIER_TPB');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_THEATER_MODIFIER_TPB' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_WRITER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_THEATER_MODIFIER_TPB' , 'Amount' , '1');
--
--INSERT INTO BeliefModifiers (BeliefType , ModifierId)
--    VALUES ('BELIEF_DIVINE_SPARK' , 'DIVINE_SPARK_CAMPUS_TPB');
INSERT INTO BeliefModifiers (BeliefType , ModifierId)
    VALUES ('BELIEF_DIVINE_SPARK' , 'DIVINE_SPARK_THEATER_TPB');


--启蒙会 所有城+1粮2金币
--
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('XINYANG_QIMENGHUI_JIALIANGSHI' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIALIANGSHI' , 'ModifierId' , 'XINYANG_QIMENGHUI_JIALIANGSHI_Modifier');

INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('XINYANG_QIMENGHUI_JIALIANGSHI_Modifier' , 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIALIANGSHI_Modifier' , 'YieldType' , 'YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIALIANGSHI_Modifier' , 'Amount' , '1');
--
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('XINYANG_QIMENGHUI_JIAJINBI' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIAJINBI' , 'ModifierId' , 'XINYANG_QIMENGHUI_JIAJINBI_Modifier');

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('XINYANG_QIMENGHUI_JIAJINBI_Modifier' , 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',"CIVILIZATION_AYUTTHAYA_GONGDIAN");
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIAJINBI_Modifier' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIAJINBI_Modifier' , 'Amount' , '2');
--
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('XINYANG_QIMENGHUI_JIAZHUFANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIAZHUFANG' , 'ModifierId' , 'XINYANG_QIMENGHUI_JIAZHUFANG_Modifier');

INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('XINYANG_QIMENGHUI_JIAZHUFANG_Modifier' , 'MODIFIER_SINGLE_CITY_ADJUST_CITY_HOUSING_FROM_GREAT_PEOPLE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('XINYANG_QIMENGHUI_JIAZHUFANG_Modifier' , 'Amount' , '1');

INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
('BELIEF_INITIATION_RITES', 'XINYANG_QIMENGHUI_JIALIANGSHI');
INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
('BELIEF_INITIATION_RITES', 'XINYANG_QIMENGHUI_JIAJINBI');
--INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
--('BELIEF_INITIATION_RITES', 'XINYANG_QIMENGHUI_JIAZHUFANG');

--埃及UI魅力
UPDATE Improvements SET Appeal='1' WHERE ImprovementType="IMPROVEMENT_SPHINX";

--圣地、圣地建筑加速
INSERT INTO Types (Type, Kind) VALUES
('MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB', 'KIND_MODIFIER');
INSERT INTO Types (Type, Kind) VALUES
('MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB', 'KIND_MODIFIER');

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES
('MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB', 'COLLECTION_OWNER', 'EFFECT_ADJUST_BUILDING_PRODUCTION');
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES
('MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB', 'COLLECTION_OWNER', 'EFFECT_ADJUST_DISTRICT_PRODUCTION');

INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , OwnerRequirementSetId)
	VALUES
	('BELIEFS_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB' , 'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB' , NULL , NULL);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('BELIEFS_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB' , 'DistrictType' , 'DISTRICT_HOLY_SITE'),
	('BELIEFS_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB' , 'Amount'       , '10' );	

INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , OwnerRequirementSetId)
	VALUES
	('BELIEFS_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB' , 'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB' , NULL , NULL);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('BELIEFS_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB' , 'DistrictType' , 'DISTRICT_HOLY_SITE'),
	('BELIEFS_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB' , 'Amount'       , '10' );	
--
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES
	('BELIEF_DIVINE_SPARK_BUILDING_PRODUCTION_TPB' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' );
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('BELIEF_DIVINE_SPARK_BUILDING_PRODUCTION_TPB' , 'ModifierId' , 'BELIEFS_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_TPB');

INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES
	('BELIEF_DIVINE_SPARK_DISTRICT_PRODUCTION_TPB' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' );
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('BELIEF_DIVINE_SPARK_DISTRICT_PRODUCTION_TPB' , 'ModifierId' , 'BELIEFS_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_TPB');
--极光之舞
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DANCE_OF_THE_AURORA","BELIEF_DIVINE_SPARK_BUILDING_PRODUCTION_TPB");	
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DANCE_OF_THE_AURORA","BELIEF_DIVINE_SPARK_DISTRICT_PRODUCTION_TPB");	
--沙漠民俗
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DESERT_FOLKLORE","BELIEF_DIVINE_SPARK_BUILDING_PRODUCTION_TPB");	
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DESERT_FOLKLORE","BELIEF_DIVINE_SPARK_DISTRICT_PRODUCTION_TPB");	
--神圣道路
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_SACRED_PATH","BELIEF_DIVINE_SPARK_BUILDING_PRODUCTION_TPB");	
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_SACRED_PATH","BELIEF_DIVINE_SPARK_DISTRICT_PRODUCTION_TPB");	


--禅修 圣地区域+1宜居度
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_ZEN_MEDITATION_HAS_HOLY_SITE' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_ZEN_MEDITATION_HAS_HOLY_SITE' , 'REQUIRES_CITY_HAS_BUILDING_SHRINE_CHANXIU');--REQUIRES_CITY_HAS_HOLY_SITE
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_ZEN_MEDITATION_HAS_HOLY_SITE' , 'REQUIRES_CITY_FOLLOWS_RELIGION');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_BUILDING_SHRINE_CHANXIU' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_BUILDING_SHRINE_CHANXIU' , 'BuildingType' , 'BUILDING_SHRINE');
--
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('ZEN_MEDITATION_HAS_HOLY_SITE_TPB_MODIFIER' , 'MODIFIER_SINGLE_CITY_ADJUST_CITY_AMENITIES_FROM_RELIGION' );
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('ZEN_MEDITATION_HAS_HOLY_SITE_TPB_MODIFIER' , 'Amount' , '1');
--
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES
	('ZEN_MEDITATION_HAS_HOLY_SITE_TPB' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'REQUIRES_ZEN_MEDITATION_HAS_HOLY_SITE' );
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('ZEN_MEDITATION_HAS_HOLY_SITE_TPB' , 'ModifierId' , 'ZEN_MEDITATION_HAS_HOLY_SITE_TPB_MODIFIER');

INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_ZEN_MEDITATION","ZEN_MEDITATION_HAS_HOLY_SITE_TPB");	


--埃塞俄比亚
--是否拥有资源和改良
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AISAIEBIYA_HAS_ANY_IMPROVEMENT' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AISAIEBIYA_HAS_ANY_IMPROVEMENT' , 'PLOT_HAS_ANY_IMPROVEMENT_TPB');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AISAIEBIYA_HAS_ANY_IMPROVEMENT' , 'PLOT_PLOT_HAS_ANY_TPB');

INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLOT_HAS_ANY_IMPROVEMENT_TPB' , 'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLOT_PLOT_HAS_ANY_TPB' , 'REQUIREMENT_PLOT_HAS_ANY_RESOURCE');
--若有地块+1信仰
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AISAIEBIYA_RES_ADDFAITH', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AISAIEBIYA_HAS_ANY_IMPROVEMENT');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('AISAIEBIYA_RES_ADDFAITH', 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('AISAIEBIYA_RES_ADDFAITH', 'Amount', '1');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_ETHIOPIA' , 'AISAIEBIYA_RES_ADDFAITH');
--每个资源提供信仰1-》0.2
UPDATE ModifierArguments SET Value='.2' WHERE ModifierId='TRAIT_FAITH_RESOURCES'and Name='Amount';

--康提
UPDATE ModifierArguments SET Value='110' WHERE ModifierId='MINOR_CIV_KANDY_BETTER_RELIC_BONUS'and Name='ScalingFactor';

--印度UI基础+1锤
--基础
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
    VALUES
	('STEPWELL_HOLYSITEADJACENCY_5_JICHU' , 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS' , 'PLOT_ADJACENT_TO_HOLYSITE_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES 
	('STEPWELL_HOLYSITEADJACENCY_5_JICHU','Amount', '1'),
	('STEPWELL_HOLYSITEADJACENCY_5_JICHU','YieldType','YIELD_PRODUCTION');
INSERT INTO ImprovementModifiers (ImprovementType,ModifierId)
    VALUES 
	('IMPROVEMENT_STEPWELL','STEPWELL_HOLYSITEADJACENCY_5_JICHU');


--闪闪 苏美尔
--对抗抗骑兵能力适用所有近战
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_SHANSHAN', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_SHANSHAN', 'CLASS_HEAVY_CAVALRY');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_SHANSHAN', 'LOC_ABILITY_SHANSHAN_NAME','LOC_ABILITY_SHANSHAN_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_SHANSHAN','Modifier_SHANSHAN_FightToXX');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Modifier_SHANSHAN_FightToXX','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH','ANTI_SPEAR_OPPONENT_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('Modifier_SHANSHAN_FightToXX','Amount','10');
INSERT INTO ModifierStrings (ModifierId, Context,Text)
	VALUES ('Modifier_SHANSHAN_FightToXX','Preview','LOC_ABILITY_ANIT_SPEAR_MODIFIER_SHANSHAN_FightToXX_DESCRIPTION');
--
INSERT INTO Modifiers (ModifierId, ModifierType,Permanent)
	VALUES ('GRANT_SHANSHAN_ABILITY', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',1);
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('GRANT_SHANSHAN_ABILITY', 'AbilityType','ABILITY_SHANSHAN');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_FIRST_CIVILIZATION', 'GRANT_SHANSHAN_ABILITY');


--战争之神
INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
('BELIEF_GOD_OF_WAR', 'ZHANZHENZHISHEN_Modifiers');
--
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('ZHANZHENZHISHEN_Modifiers','MODIFIER_ALL_CITIES_ATTACH_MODIFIER','PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ZHANZHENZHISHEN_Modifiers','ModifierId','ZHANZHENZHISHEN_Modifiers_ADD');
--
INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent)
	VALUES ('ZHANZHENZHISHEN_Modifiers_ADD','MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST',1,1);
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ZHANZHENZHISHEN_Modifiers_ADD','YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ZHANZHENZHISHEN_Modifiers_ADD','UnitProductionPercent','20');
--烂地夫人
INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
('BELIEF_LADY_OF_THE_REEDS_AND_MARSHES', 'LANDIFUREN_HONGSHUI_1_Modifiers');
INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
('BELIEF_LADY_OF_THE_REEDS_AND_MARSHES', 'LANDIFUREN_HONGSHUI_2_Modifiers');
INSERT INTO BeliefModifiers (BeliefType, ModifierId) VALUES
('BELIEF_LADY_OF_THE_REEDS_AND_MARSHES', 'LANDIFUREN_HONGSHUI_3_Modifiers');
--
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('LANDIFUREN_HONGSHUI_1_Modifiers','MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER','PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('LANDIFUREN_HONGSHUI_1_Modifiers','ModifierId','TRAIT_AVOID_MODERATE_FLOOD');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('LANDIFUREN_HONGSHUI_2_Modifiers','MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER','PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('LANDIFUREN_HONGSHUI_2_Modifiers','ModifierId','TRAIT_AVOID_MAJOR_FLOOD');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('LANDIFUREN_HONGSHUI_3_Modifiers','MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER','PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('LANDIFUREN_HONGSHUI_3_Modifiers','ModifierId','TRAIT_AVOID_THOUSAND_FLOOD');
--工艺之神
/*<Row>
			<ModifierId>RELIGIOUS_IDOLS_BONUS_MINE_FAITH</ModifierId>
			<ModifierType>MODIFIER_ALL_CITIES_ATTACH_MODIFIER</ModifierType>
			<SubjectRequirementSetId>CITY_FOLLOWS_PANTHEON_REQUIREMENTS</SubjectRequirementSetId>
		</Row>
		<Row>
			<ModifierId>RELIGIOUS_IDOLS_BONUS_MINE_FAITH_MODIFIER</ModifierId>
			<ModifierType>MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD</ModifierType>
			<SubjectRequirementSetId>PLOT_HAS_BONUS_MINE_REQUIREMENTS</SubjectRequirementSetId>
		</Row>*/
--城市名称
INSERT INTO CityNames (CivilizationType, CityName) VALUES
('CIVILIZATION_CHINA', 'LOC_CITY_NAME_TAIWAN');
INSERT INTO CityNames (CivilizationType, CityName) VALUES
('CIVILIZATION_CHINA', 'LOC_CITY_NAME_XIANGGANG');


--玛雅农场 不加金
DELETE FROM Improvement_Adjacencies WHERE ImprovementType='IMPROVEMENT_FARM' and YieldChangeId="Farm_FoodObservatoryAdjacency";
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_MAYA_FARMS_PRODUCTION'and Name='Amount';
--玛雅农场+1锤
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType )
	VALUES ('PLOT_ADJACENT_TO_FARM_REQUIREMENTS_MAYA' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId )
	VALUES ('PLOT_ADJACENT_TO_FARM_REQUIREMENTS_MAYA' , 'REQUIRES_PLOT_HAS_FARM');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId )
	VALUES ('PLOT_ADJACENT_TO_FARM_REQUIREMENTS_MAYA' , 'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_OBSERVATORY');


INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_MINES_PRODUCTION_SEOWON_DISTRICT_OBSERVATORY_NONGCHANG' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_ADJACENT_TO_FARM_REQUIREMENTS_MAYA' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_MINES_PRODUCTION_SEOWON_DISTRICT_OBSERVATORY_NONGCHANG' , 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_MINES_PRODUCTION_SEOWON_DISTRICT_OBSERVATORY_NONGCHANG' , 'Amount','1');


INSERT INTO TraitModifiers (TraitType , ModifierId )
	VALUES ('TRAIT_CIVILIZATION_MAYAB' , 'TRAIT_MINES_PRODUCTION_SEOWON_DISTRICT_OBSERVATORY_NONGCHANG');

--#工艺女神：加成、奢侈资源矿山+1锤 

INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Technology', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Technology', 'LOC_BELIEF_RELIGIOUS_Technology_NAME', 'LOC_BELIEF_RELIGIOUS_Technology_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Technology', 'BELIEF_Technology_BONUS_PRODUCTION');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Technology', 'BELIEF_Technology_LUXURY_PRODUCTION');
--加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Technology_BONUS_PRODUCTION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Technology_BONUS_PRODUCTION', 'ModifierId','BELIEF_Technology_BONUS_PRODUCTION_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Technology_BONUS_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BONUS_MINE_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Technology_BONUS_PRODUCTION_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Technology_BONUS_PRODUCTION_MODIFIER', 'Amount','1');
--奢侈
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Technology_LUXURY_PRODUCTION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Technology_LUXURY_PRODUCTION', 'ModifierId','BELIEF_Technology_LUXURY_PRODUCTION_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Technology_LUXURY_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_LUXURY_MINE_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Technology_LUXURY_PRODUCTION_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Technology_LUXURY_PRODUCTION_MODIFIER', 'Amount','1');

--#雨神：所有城市+1住房，没有淡水资源的城市再+1住房 

INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Rain_God', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Rain_God', 'LOC_BELIEF_RELIGIOUS_Rain_God_NAME', 'LOC_BELIEF_RELIGIOUS_Rain_God_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Rain_God', 'BELIEF_Rain_God_HOUSING');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Rain_God', 'BELIEF_Rain_God_All_HOUSING');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Rain_God', 'BELIEF_Rain_God_Haian_HOUSING');
--无水+1
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Rain_God_HOUSING', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Rain_God_HOUSING', 'ModifierId','BELIEF_Rain_God_HOUSING_MODIFIER');


INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Rain_God_HOUSING_MODIFIER', 'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING', 'SPM_SPIRIT_OF_SHELTER_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Rain_God_HOUSING_MODIFIER', 'Amount','1');
--全部+1
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Rain_God_All_HOUSING', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Rain_God_All_HOUSING', 'ModifierId','BELIEF_Rain_God_All_HOUSING_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Rain_God_All_HOUSING_MODIFIER', 'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING','SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_ALL');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Rain_God_All_HOUSING_MODIFIER', 'Amount','1');
--无水海岸-1
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Rain_God_Haian_HOUSING', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Rain_God_Haian_HOUSING', 'ModifierId','BELIEF_Rain_God_Haian_HOUSING_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Rain_God_Haian_HOUSING_MODIFIER', 'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING','SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_HAIAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Rain_God_Haian_HOUSING_MODIFIER', 'Amount','-1');
--沿海减住房
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_HAIAN' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_HAIAN' , 'SPM_SHELTER_REQUIRES_DISTRICT_IS_CITY_CENTER');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_HAIAN' , 'REQUIRES_PLOT_IS_ADJACENT_TO_COAST');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_HAIAN' , 'SPM_SHELTER_REQUIRES_PLOT_HAS_NO_FRESH_WATER');
--全部加住房
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_ALL' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS_ALL' , 'SPM_SHELTER_REQUIRES_DISTRICT_IS_CITY_CENTER');
--无水加住房
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS' , 'SPM_SHELTER_REQUIRES_DISTRICT_IS_CITY_CENTER');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('SPM_SPIRIT_OF_SHELTER_REQUIREMENTS' , 'SPM_SHELTER_REQUIRES_PLOT_HAS_NO_FRESH_WATER');
--
INSERT INTO Requirements (RequirementId , RequirementType,Inverse)
	VALUES ('SPM_SHELTER_REQUIRES_PLOT_HAS_NO_FRESH_WATER' , 'REQUIREMENT_PLOT_IS_FRESH_WATER',1);
----
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('SPM_SHELTER_REQUIRES_DISTRICT_IS_CITY_CENTER' , 'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('SPM_SHELTER_REQUIRES_DISTRICT_IS_CITY_CENTER' , 'DistrictType' , 'DISTRICT_CITY_CENTER');

--#恩惠之神：种植园提供的生产力、金币+1 

INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Goddess_Of_Grace', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Goddess_Of_Grace', 'LOC_BELIEF_RELIGIOUS_Goddess_Of_Grace_NAME', 'LOC_BELIEF_RELIGIOUS_Goddess_Of_Grace_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Goddess_Of_Grace', 'BELIEF_BELIEF_Goddess_Of_Grace_Food');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Goddess_Of_Grace', 'BELIEF_BELIEF_Goddess_Of_Grace_GOLD');
--
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_Food', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_Food', 'ModifierId','BELIEF_BELIEF_Goddess_Of_Grace_Food_MODIFIER');


INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_Food_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_PLANTATION_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_Food_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_Food_MODIFIER', 'Amount','1');
--
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_GOLD', 'ModifierId','BELIEF_BELIEF_Goddess_Of_Grace_GOLD_MODIFIER');


INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_PLANTATION_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_GOLD_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_BELIEF_Goddess_Of_Grace_GOLD_MODIFIER', 'Amount','1');
--辉煌之光：从拥有1级建筑的港口、商业、军营区域获得的伟人点数+1 
--
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Brilliant_Light', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Brilliant_Light', 'LOC_BELIEF_RELIGIOUS_Brilliant_Light_NAME', 'LOC_BELIEF_RELIGIOUS_Brilliant_Light_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_GANGKOU_TPB_HUIHUANG');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_SHANGYEZHONGXIN_TPB_HUIHUANG');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_JUNYING_BINGYING_TPB_HUIHUANG');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_JUNYING_MAJIU_TPB_HUIHUANG');
	INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_GONGYEQU_TPB_HUIHUANG');
/*INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_JUNYING_ERDUO_TPB_HUIHUANG');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Brilliant_Light', 'DIVINE_SPARK_JUNYING_XUETANG_TPB_HUIHUANG')*/;
--港口
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_GANGKOU_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_GANGKOU_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT','CITY_FOLLOWS_RELIGION_HAS_DENGTA');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_GANGKOU_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_GANGKOU_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_GANGKOU_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_ADMIRAL');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_GANGKOU_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--商业中心
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_SHANGYEZHONGXIN_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_SHANGYEZHONGXIN_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT','CITY_FOLLOWS_RELIGION_HAS_SHICHANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_SHANGYEZHONGXIN_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_SHANGYEZHONGXIN_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_SHANGYEZHONGXIN_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_MERCHANT');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_SHANGYEZHONGXIN_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--军营 兵营
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_BINGYING_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_BINGYING_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT','CITY_FOLLOWS_RELIGION_HAS_BINGYING');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_BINGYING_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_JUNYING_BINGYING_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_BINGYING_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_GENERAL');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_BINGYING_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--军营 马厩
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_MAJIU_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_MAJIU_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT','CITY_FOLLOWS_RELIGION_HAS_MAJIU');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_MAJIU_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_JUNYING_MAJIU_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_MAJIU_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_GENERAL');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_MAJIU_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--军营 耳朵
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_ERDUO_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_ERDUO_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT','CITY_FOLLOWS_RELIGION_HAS_ERDUO');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_ERDUO_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_JUNYING_ERDUO_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_ERDUO_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_GENERAL');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_ERDUO_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--军营 皇家学堂
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_XUETANG_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_JUNYING_XUETANG_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT','CITY_FOLLOWS_RELIGION_HAS_XUETANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_XUETANG_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_JUNYING_XUETANG_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_XUETANG_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_GENERAL');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_JUNYING_XUETANG_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--
--拥有灯塔
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_DENGTA' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_DENGTA' , 'REQUIRES_CITY_HAS_DENGTA');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_DENGTA' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_DENGTA' , 'BuildingType' , 'BUILDING_LIGHTHOUSE');
--拥有市场
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_SHICHANG' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_SHICHANG' , 'REQUIRES_CITY_HAS_SHICHANG');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_SHICHANG' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_SHICHANG' , 'BuildingType' , 'BUILDING_MARKET');
--拥有兵营
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_BINGYING' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_BINGYING' , 'REQUIRES_CITY_HAS_BINGYING');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_BINGYING' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_BINGYING' , 'BuildingType' , 'BUILDING_BARRACKS');
--拥有马厩
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_MAJIU' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_MAJIU' , 'REQUIRES_CITY_HAS_MAJIU');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_MAJIU' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_MAJIU' , 'BuildingType' , 'BUILDING_STABLE');
--拥有蒙古耳朵
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_ERDUO' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_ERDUO' , 'REQUIRES_CITY_HAS_ERDUO');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_ERDUO' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_ERDUO' , 'BuildingType' , 'BUILDING_ORDU');
--拥有皇家学堂
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_XUETANG' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_XUETANG' , 'REQUIRES_CITY_HAS_XUETANG');
--
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_CITY_HAS_XUETANG' , 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_CITY_HAS_XUETANG' , 'BuildingType' , 'BUILDING_BASILIKOI_PAIDES');

--工业区+1伟人点，商业中心、港口+1伟人点
--工业区
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_GONGYEQU_TPB_HUIHUANG' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_GONGYEQU_MODIFIER_TPB_HUIHUANG' , 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS','CITY_FOLLOWS_RELIGION_HAS_GONGYEQU_TPB');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_GONGYEQU_TPB_HUIHUANG' , 'ModifierId' , 'DIVINE_SPARK_GONGYEQU_MODIFIER_TPB_HUIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_GONGYEQU_MODIFIER_TPB_HUIHUANG' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_ENGINEER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('DIVINE_SPARK_GONGYEQU_MODIFIER_TPB_HUIHUANG' , 'Amount' , '1');
--区域判断
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_GONGYEQU_TPB' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('CITY_FOLLOWS_RELIGION_HAS_GONGYEQU_TPB' , 'REQUIRES_DISTRICT_IS_GONGYEQU_TPB');
--拥有工业区
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES
	('REQUIRES_DISTRICT_IS_GONGYEQU_TPB'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name,Value)
	VALUES
	('REQUIRES_DISTRICT_IS_GONGYEQU_TPB',     'DistrictType','DISTRICT_INDUSTRIAL_ZONE');
--#致禽仪式：营地提供的生产力+1、金币+1
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Ceremony_Send_Birds', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Ceremony_Send_Birds', 'LOC_BELIEF_RELIGIOUS_Ceremony_Send_Birds_NAME', 'LOC_BELIEF_RELIGIOUS_Ceremony_Send_Birds_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Ceremony_Send_Birds', 'GODDESS_OF_THE_HUNT_CAMP_PRODUCTION');--前置修改
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Ceremony_Send_Birds', 'GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB');
--
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB' , 'ModifierId' , 'GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB_MODIFIER');
--
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB_MODIFIER' , 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_CAMP_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB_MODIFIER' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GODDESS_OF_THE_HUNT_CAMP_FOOD_TPB_MODIFIER' , 'Amount' , '1');



--牛顿大学+1科技
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GREATPERSON_UNIVERSITIES_SMALL_SCIENCE'and Name='Amount';


--澳大利亚 沿海城市+10%生产力
INSERT INTO Modifiers (ModifierId,ModifierType,SubjectRequirementSetId)
	VALUES ('AODALIYA_PLOT_IS_COASTAL_LAND_TEAMPVP','MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER','PLOT_IS_COASTAL_LAND_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('AODALIYA_PLOT_IS_COASTAL_LAND_TEAMPVP','YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('AODALIYA_PLOT_IS_COASTAL_LAND_TEAMPVP','Amount','8');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_LAND_DOWN_UNDER', 'AODALIYA_PLOT_IS_COASTAL_LAND_TEAMPVP');

--刚果 所有步兵+3对远程防御力
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_GANGGUO_RANGED_DEFENSE', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_GANGGUO_RANGED_DEFENSE', 'CLASS_MELEE');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_GANGGUO_RANGED_DEFENSE', 'LOC_ABILITY_GANGGUO_RANGED_DEFENSE_NAME','LOC_ABILITY_GANGGUO_RANGED_DEFENSE_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_GANGGUO_RANGED_DEFENSE', 'GANGGUO_RANGED_DEFENSE');

INSERT INTO Modifiers (ModifierId,ModifierType,SubjectRequirementSetId)
	VALUES ('GANGGUO_RANGED_DEFENSE','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH','TORTOISE_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('GANGGUO_RANGED_DEFENSE','Amount','3');
INSERT INTO ModifierStrings(ModifierId, Context, Text)
	VALUES ('GANGGUO_RANGED_DEFENSE', 'Preview', 'LOC_TRAIT_GANGGUO_RANGED_DEFENSE_DESCRIPTION');

INSERT INTO Modifiers (ModifierId, ModifierType,Permanent)
	VALUES ('TRAIT_GANGGUO_RANGED_DEFENSE_ABILITY', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',1);
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_GANGGUO_RANGED_DEFENSE_ABILITY', 'AbilityType','ABILITY_GANGGUO_RANGED_DEFENSE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_RELIGIOUS_CONVERT', 'TRAIT_GANGGUO_RANGED_DEFENSE_ABILITY');

--梁 右2 加食物
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType,ModifierId)
	VALUES ('GOVERNOR_PROMOTION_WATER_WORKS','LIANGSHI_YOU2_JIASHIWU_TEAMPVP');
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('LIANGSHI_YOU2_JIASHIWU_TEAMPVP','MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('LIANGSHI_YOU2_JIASHIWU_TEAMPVP','YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('LIANGSHI_YOU2_JIASHIWU_TEAMPVP','Amount','2');

--凯撒
--没凯撒DLC BUG修正
INSERT OR IGNORE INTO Types(Type,Kind)
VALUES('TRAIT_LEADER_CAESAR','KIND_TRAIT');
INSERT OR IGNORE INTO Traits(TraitType,Name,Description)
VALUES('TRAIT_LEADER_CAESAR','LOC_TRAIT_LEADER_CAESAR_NAME','LOC_TRAIT_LEADER_CAESAR_DESCRIPTION');
--要求相邻罗马军团
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AOE_LUOMAJUNTUAN_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AOE_LUOMAJUNTUAN_REQUIREMENTS' , 'REQUIRES_UNIT_IS_ADJACENT_LUOMAJUNTUAN');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_UNIT_IS_ADJACENT_LUOMAJUNTUAN' , 'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_UNIT_IS_ADJACENT_LUOMAJUNTUAN' , 'Tag' , 'CLASS_LEGION');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_UNIT_IS_ADJACENT_LUOMAJUNTUAN' , 'IncludeCenter' , 'false');

--能力：+1力，相邻罗马军团
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_KAISA_LUOMA_JIALI', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_KAISA_LUOMA_JIALI', 'CLASS_ALL_COMBAT_UNITS');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_KAISA_LUOMA_JIALI', 'LOC_ABILITY_KAISA_LUOMA_JIALI_NAME','LOC_ABILITY_KAISA_LUOMA_JIALI_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_KAISA_LUOMA_JIALI','Modifier_KAISA_LUOMA_JIALI');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Modifier_KAISA_LUOMA_JIALI','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH','AOE_LUOMAJUNTUAN_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('Modifier_KAISA_LUOMA_JIALI','Amount','1');
INSERT INTO ModifierStrings (ModifierId, Context,Text)
	VALUES ('Modifier_KAISA_LUOMA_JIALI','Preview','LOC_Modifier_KAISA_LUOMA_JIALI_DESCRIPTION');

--罗马军团为周围单位+1力能力
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_KAISA_LUOMA', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_KAISA_LUOMA', 'CLASS_LEGION');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_KAISA_LUOMA', 'LOC_ABILITY_KAISA_LUOMA_NAME','LOC_ABILITY_KAISA_LUOMA_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_KAISA_LUOMA','Modifier_KAISA_LUOMA_JIA_NENGLI');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Modifier_KAISA_LUOMA_JIA_NENGLI','MODIFIER_PLAYER_UNITS_GRANT_ABILITY','AOE_TAGMA_NONRELIGIOUS_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('Modifier_KAISA_LUOMA_JIA_NENGLI','AbilityType','ABILITY_KAISA_LUOMA_JIALI');

--为罗马军团添加 为周围单位+1力能力的能力
INSERT INTO Modifiers (ModifierId, ModifierType,Permanent)
	VALUES ('TRAIT_KASAI_LUOMA_ADD_ABILITY', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',1);
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('TRAIT_KASAI_LUOMA_ADD_ABILITY', 'AbilityType','ABILITY_KAISA_LUOMA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'TRAIT_KASAI_LUOMA_ADD_ABILITY');

--法典 独裁
--要求 帝国初期
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_KASAI_FADIAN', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_KASAI_FADIAN', 'CivicType', 'CIVIC_EARLY_EMPIRE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_KASAI_FADIAN', 'REQUIRES_PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_KASAI_FADIAN', 'REQUIREMENTSET_TEST_ALL');
--宫殿
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_1', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_PALACE','PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_1', 'Amount','1');
--市政区建筑
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER1','PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_2', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER2','PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_3', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_4', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER3','PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_4', 'Amount','1');
--外交区建筑
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_5', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_CONSULATE','PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_5', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_6', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_CHANCERY','PLAYER_HAS_POLITICAL_KASAI_FADIAN');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_FADIAN_DUCAI_6', 'Amount','1');
--
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_FADIAN_DUCAI_1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_FADIAN_DUCAI_2');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_FADIAN_DUCAI_3');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_FADIAN_DUCAI_4');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_FADIAN_DUCAI_5');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_FADIAN_DUCAI_6');


--行政部门 独裁
--要求行政部门
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_KASAI_GONGHUI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_KASAI_GONGHUI', 'CivicType', 'CIVIC_FEUDALISM');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_KASAI_GONGHUI', 'REQUIRES_PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_KASAI_GONGHUI', 'REQUIREMENTSET_TEST_ALL');
--宫殿
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_1', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_PALACE','PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_1', 'Amount','1');
--市政区建筑
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER1','PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_2', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER2','PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_3', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_4', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER3','PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_4', 'Amount','1');
--外交区建筑
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_5', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_CONSULATE','PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_5', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_6', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_CHANCERY','PLAYER_HAS_POLITICAL_KASAI_GONGHUI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_GONGHUI_DUCAI_6', 'Amount','1');
--
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_GONGHUI_DUCAI_1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_GONGHUI_DUCAI_2');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_GONGHUI_DUCAI_3');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_GONGHUI_DUCAI_4');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_GONGHUI_DUCAI_5');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_GONGHUI_DUCAI_6');

--人文主义 独裁
--要求人文主义
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI', 'CivicType', 'CIVIC_HUMANISM');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI', 'REQUIRES_PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI', 'REQUIREMENTSET_TEST_ALL');
--宫殿
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_1', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_PALACE','PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_1', 'Amount','1');
--市政区建筑
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER1','PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_2', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER2','PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_3', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_4', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_TIER3','PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_4', 'Amount','1');
--外交区建筑
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_5', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_CONSULATE','PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_5', 'Amount','1');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_6', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE','BUILDING_IS_CHANCERY','PLAYER_HAS_POLITICAL_KASAI_RENWENZHUYI');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_KAISA_RENWENZHUYI_DUCAI_6', 'Amount','1');
--
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_RENWENZHUYI_DUCAI_1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_RENWENZHUYI_DUCAI_2');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_RENWENZHUYI_DUCAI_3');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_RENWENZHUYI_DUCAI_4');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_RENWENZHUYI_DUCAI_5');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_CAESAR', 'Modifier_KAISA_RENWENZHUYI_DUCAI_6');

--林肯
--工业区忠诚度
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='TRAIT_LINCOLN_INDUSTRIAL_ZONE_LOYALTY'and Name='Amount';
--种植园忠诚度
UPDATE ModifierArguments SET Value='-1' WHERE ModifierId='PLANTATION_NEGATIVE_LOYALTY'and Name='Amount';
/*--条件：城市拥有工业
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_CITY_HAS_LIKEN_HAS_GONGYEQU', 'REQUIREMENT_CITY_HAS_DISTRICT');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_CITY_HAS_LIKEN_HAS_GONGYEQU', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('Requirement_LIKEN_HAS_GONGYEQU', 'REQUIRES_CITY_HAS_LIKEN_HAS_GONGYEQU');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('Requirement_LIKEN_HAS_GONGYEQU', 'REQUIREMENTSET_TEST_ALL');*/
--赋予有工业区城市 加力能力
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Modifier_LINKEN_GONGYEQU_CITY_ADD_NENGLI', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER','REQUIRES_CITY_HAS_INDUSTRIAL_ZONE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_LINKEN_GONGYEQU_CITY_ADD_NENGLI', 'ModifierId','Modifier_LINKEN_GONGYEQU_CITY_ADD_NENGLI_Modifier');

INSERT INTO Modifiers (ModifierId, ModifierType,Permanent)
	VALUES ('Modifier_LINKEN_GONGYEQU_CITY_ADD_NENGLI_Modifier', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',1);
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Modifier_LINKEN_GONGYEQU_CITY_ADD_NENGLI_Modifier', 'AbilityType','ABILITY_LINKEN_JINZHAN_JIALI');
--能力：近战+3力
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_LINKEN_JINZHAN_JIALI', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_LINKEN_JINZHAN_JIALI', 'CLASS_MELEE');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_LINKEN_JINZHAN_JIALI', 'LOC_ABILITY_LINKEN_JINZHAN_JIALI_NAME','LOC_ABILITY_LINKEN_JINZHAN_JIALI_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_LINKEN_JINZHAN_JIALI', 'LINKEN_JINZHAN_JIALI');

INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('LINKEN_JINZHAN_JIALI','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('LINKEN_JINZHAN_JIALI','Amount','3');
INSERT INTO ModifierStrings(ModifierId, Context, Text)
	VALUES ('LINKEN_JINZHAN_JIALI', 'Preview', 'LOC_LINKEN_JINZHAN_JIALI_DESCRIPTION');
--
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_LINCOLN', 'Modifier_LINKEN_GONGYEQU_CITY_ADD_NENGLI');
--移除工业区生成近战+5战斗力
UPDATE ModifierArguments SET Value='ABILITY_LINKEN_JINZHAN_JIALI' WHERE ModifierId='TRAIT_LINCOLN_INDUSTRIAL_ZONE_FREE_MELEE_UNIT'and Name='UnitAbilityType';
--DELETE From ModifierStrings WHERE ModifierId='LINCOLN_MELEE_BUFF';
--UPDATE ModifierArguments SET Value='0' WHERE ModifierId='LINCOLN_MELEE_BUFF'and Name='Amount';
--工业区、工业区建筑加速
--建筑
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_LINCOLN' , 'THEATER_BUILDING_PRODUCTION_BONUS_LINKEN');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , OwnerRequirementSetId)
	VALUES
	('THEATER_BUILDING_PRODUCTION_BONUS_LINKEN' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION' , NULL , NULL);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('THEATER_BUILDING_PRODUCTION_BONUS_LINKEN' , 'DistrictType' , 'DISTRICT_INDUSTRIAL_ZONE'),
	('THEATER_BUILDING_PRODUCTION_BONUS_LINKEN' , 'Amount'       , '20' );	
--区域
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_LINCOLN' , 'TRAIT_GANGKOU_AQUEDUCT_PRODUCTION_LINKEN2');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , OwnerRequirementSetId)
	VALUES
	('TRAIT_GANGKOU_AQUEDUCT_PRODUCTION_LINKEN2' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , NULL , NULL);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('TRAIT_GANGKOU_AQUEDUCT_PRODUCTION_LINKEN2' , 'DistrictType' , 'DISTRICT_INDUSTRIAL_ZONE' ),
	('TRAIT_GANGKOU_AQUEDUCT_PRODUCTION_LINKEN2' , 'Amount'       , '100'               );
--水渠
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_LINCOLN' , 'TRAIT_BOOST_AQUEDUCT_PRODUCTION_LINKEN_SHUIQU');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_LINKEN_SHUIQU' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , NULL );
INSERT INTO ModifierArguments (ModifierId , Name , Value, Extra , SecondExtra)
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_LINKEN_SHUIQU' , 'DistrictType' , 'DISTRICT_AQUEDUCT', null , null ),
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_LINKEN_SHUIQU' , 'Amount'       , '100'               , null , null );


--女刚果
--同大陆+10%-》+5% 加成不再包含食物
UPDATE ModifierArguments SET Value='5, 0, 5, 5, 5, 5' WHERE ModifierId='TRAIT_SAME_CONTINENT_YIELD'and Name='Amount';
--异大陆-15%-》-5% 加成不再包含食物
UPDATE ModifierArguments SET Value='-5, 0, -5, -5, -5, -5' WHERE ModifierId='TRAIT_FOREIGN_CONTINENT_YIELD'and Name='Amount';
--同大陆+5%城市发展速度
INSERT INTO Modifiers (ModifierId,ModifierType,SubjectRequirementSetId)
	VALUES ('NVGANGGUO_JIA_RENKOUSUDU','MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH','REQUIRES_CITY_IS_SAME_CONTINENT');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('NVGANGGUO_JIA_RENKOUSUDU','Amount','5');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_NZINGA_MBANDE' , 'NVGANGGUO_JIA_RENKOUSUDU');
--异大陆-5%城市发展速度
INSERT INTO Modifiers (ModifierId,ModifierType,SubjectRequirementSetId)
	VALUES ('NVGANGGUO_JIAN_RENKOUSUDU','MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH','REQUIRES_CITY_IS_OTHER_CONTINENT');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('NVGANGGUO_JIAN_RENKOUSUDU','Amount','-5');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_NZINGA_MBANDE' , 'NVGANGGUO_JIAN_RENKOUSUDU');

--阿拉伯 苏丹
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='SALADIN_FLANKING_BONUS_UNITS'and Name='Percent';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='SALADIN_SUPPORT_BONUS_UNITS'and Name='Percent';

--删除无用世界会议 未来触发
--外交点数
UPDATE Resolutions SET EarliestEra='ERA_FUTURE' WHERE ResolutionType='WC_RES_DIPLOVICTORY';
--世界宗教
UPDATE Resolutions SET EarliestEra='ERA_FUTURE' WHERE ResolutionType='WC_RES_WORLD_RELIGION';
--旅游业绩
UPDATE Resolutions SET EarliestEra='ERA_FUTURE' WHERE ResolutionType='WC_RES_HERITAGE_ORG';
--不满
UPDATE Resolutions SET EarliestEra='ERA_FUTURE' WHERE ResolutionType='WC_RES_PUBLIC_RELATIONS';

--提前部分世界会议
--大规模杀伤武器
UPDATE Resolutions SET EarliestEra='ERA_MODERN' WHERE ResolutionType='WC_RES_ARMS_CONTROL';
--政体加槽位
UPDATE Resolutions SET EarliestEra='ERA_MEDIEVAL' WHERE ResolutionType='WC_RES_WORLD_IDEOLOGY';
--项目加生产力
UPDATE Resolutions SET EarliestEra='ERA_MODERN' WHERE ResolutionType='WC_RES_PUBLIC_WORKS';
--建造建筑
UPDATE Resolutions SET EarliestEra='ERA_RENAISSANCE' WHERE ResolutionType='WC_RES_GLOBAL_ENERGY_TREATY';
--城市人口
UPDATE Resolutions SET EarliestEra='ERA_MEDIEVAL' WHERE ResolutionType='WC_RES_MIGRATION_TREATY';
--地貌
UPDATE Resolutions SET EarliestEra='ERA_RENAISSANCE' WHERE ResolutionType='WC_RES_DEFORESTATION_TREATY';
--间谍
UPDATE Resolutions SET EarliestEra='ERA_RENAISSANCE' WHERE ResolutionType='WC_RES_ESPIONAGE_PACT';

--修复增加、减少战斗力的世界议会 减少战斗力失效的问题
UPDATE ModifierArguments SET Name='ModifierId' WHERE ModifierId='APPLY_RES_UNIT_COMBAT_DEBUFF'and Name='Amount';
--加力、减力-》+3
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='WC_RES_UNIT_COMBAT_BUFF'and Name='Amount';
UPDATE ModifierArguments SET Value='-3' WHERE ModifierId='WC_RES_UNIT_COMBAT_DEBUFF'and Name='Amount';


--阿拉伯 苏丹 信仰购买奴隶骑 CLASS_MAMLUK
--购买
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('ALABO_SUDAN_GOUMAI_NULIQIBING' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('ALABO_SUDAN_GOUMAI_NULIQIBING' , 'Tag' , 'CLASS_MAMLUK'); 
--打折
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('ALABO_SUDAN_GOUMAI_NULIQIBING_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_GOUMAI_NULIQIBING_ZHEKOU","UnitType","UNIT_ARABIAN_MAMLUK");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_GOUMAI_NULIQIBING_ZHEKOU","Amount","15");

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('ALABO_SUDAN_GOUMAI_HEAVY_CHARIOT_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_GOUMAI_HEAVY_CHARIOT_ZHEKOU","UnitType","UNIT_HEAVY_CHARIOT");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_GOUMAI_HEAVY_CHARIOT_ZHEKOU","Amount","15");

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('ALABO_SUDAN_CUIRASSIER_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_CUIRASSIER_ZHEKOU","UnitType","UNIT_CUIRASSIER");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_CUIRASSIER_ZHEKOU","Amount","15");

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('ALABO_SUDAN_TANK_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_TANK_ZHEKOU","UnitType","UNIT_TANK");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_TANK_ZHEKOU","Amount","15");

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectStackLimit)
    VALUES ('ALABO_SUDAN_MODERN_ARMOR_ZHEKOU' , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',1);	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_MODERN_ARMOR_ZHEKOU","UnitType","UNIT_MODERN_ARMOR");
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES ("ALABO_SUDAN_MODERN_ARMOR_ZHEKOU","Amount","15");
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_SALADIN_ALT","ALABO_SUDAN_GOUMAI_NULIQIBING");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_SALADIN_ALT","ALABO_SUDAN_GOUMAI_NULIQIBING_ZHEKOU");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_SALADIN_ALT","ALABO_SUDAN_GOUMAI_HEAVY_CHARIOT_ZHEKOU");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_SALADIN_ALT","ALABO_SUDAN_CUIRASSIER_ZHEKOU");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_SALADIN_ALT","ALABO_SUDAN_TANK_ZHEKOU");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_SALADIN_ALT","ALABO_SUDAN_MODERN_ARMOR_ZHEKOU");
/*INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_RECON');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_MELEE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_RANGED');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_SIEGE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_HEAVY_CAVALRY');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_LIGHT_CAVALRY');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_RANGED_CAVALRY');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_ANTI_CAVALRY');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_HEAVY_CHARIOT');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_SALADIN_ALT', 'GOV_FAITH_PURCHASE_LIGHT_CHARIOT');*/
--阿拉伯 苏丹 军营+信仰
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('ALABO_SUDAN_JUNYING_JIA_XINYANG', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','DISTRICT_IS_ENCAMPMENT');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('ALABO_SUDAN_JUNYING_JIA_XINYANG', 'Amount','3');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('ALABO_SUDAN_JUNYING_JIA_XINYANG', 'YieldType','YIELD_FAITH');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_SALADIN_ALT', 'ALABO_SUDAN_JUNYING_JIA_XINYANG');

--姆班赞 +1锤
/*INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('GANGGUO_MUBANZAN_JIA_CHUI', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('GANGGUO_MUBANZAN_JIA_CHUI', 'Amount','1');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('GANGGUO_MUBANZAN_JIA_CHUI', 'YieldType','YIELD_PRODUCTION');
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
	VALUES ('DISTRICT_MBANZA', 'GANGGUO_MUBANZAN_JIA_CHUI');*/
 
--新波斯 纳迪尔沙阿
--修复BUG
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('CITY_WAS_NOT_FOUNDED_BY_THEM_REQUIREMENTS', 'REQUIRES_CITY_WAS_NOT_FOUNDED_WARLORDS');
--打满血+5-》+3
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='NADER_SHAH_COMBAT_BUFF'and Name='Amount';
--内商额外+1金
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('NADER_SHAH_TRADE_GOLD_TRADE_ROUTE_GOLD_TEAMPVP','MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('NADER_SHAH_TRADE_GOLD_TRADE_ROUTE_GOLD_TEAMPVP', 'YieldType', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('NADER_SHAH_TRADE_GOLD_TRADE_ROUTE_GOLD_TEAMPVP', 'Amount', '1');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('NADER_SHAH_TRADE_GOLD_TRADE_ROUTE_GOLD_TEAMPVP', 'Intercontinental', 'false');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_NADER_SHAH', 'NADER_SHAH_TRADE_GOLD_TRADE_ROUTE_GOLD_TEAMPVP');
--波斯文明 本国贸易路线+金币 移动至 波斯领袖居鲁士
--UPDATE TraitModifiers SET TraitType='TRAIT_LEADER_FALL_BABYLON' WHERE TraitType="TRAIT_CIVILIZATION_SATRAPIES" and ModifierId="TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD";

--新日本 德川家康 每个区域内商 +1科1文2金-》1科1文2金-》0.5科0.5文1金
UPDATE ModifierArguments SET Value='0.5' WHERE ModifierId='TOKUGAWA_POSITIVE_DOMESTIC_CULTURE_DISTRICTS'and Name='Amount';
UPDATE ModifierArguments SET Value='0.5' WHERE ModifierId='TOKUGAWA_POSITIVE_DOMESTIC_SCIENCE_DISTRICTS'and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TOKUGAWA_POSITIVE_DOMESTIC_GOLD_DISTRICTS'and Name='Amount';

--新奥斯曼 苏莱曼大帝
--黑暗普通 对战 黑暗普通 +4-》+3
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='SULEIMAN_COMBAT_BUFF'and Name='Amount';
--黄金时代 瓶文加成15%-》+7%
UPDATE ModifierArguments SET Value='7,7' WHERE ModifierId='TRAIT_SULEIMAN_ALT_SCIENCE_CULTURE_GOLDEN_AGE'and Name='Amount';


--黑暗 精兵政策
UPDATE ModifierArguments SET Value='-1' WHERE ModifierId='ELITEFORCES_EXTRA_MAINTENANCE'and Name='Amount';

--中国领袖包
--永乐皇帝
--项目转换食物、信仰比例50%-》75%，转换金币100%-》150%
UPDATE Project_YieldConversions SET PercentOfProductionRate='95' WHERE ProjectType="PROJECT_LIJIA_FAITH";
UPDATE Project_YieldConversions SET PercentOfProductionRate='70' WHERE ProjectType="PROJECT_LIJIA_FOOD";
UPDATE Project_YieldConversions SET PercentOfProductionRate='135' WHERE ProjectType="PROJECT_LIJIA_GOLD";
--拥有10点或以上人口的城市中每有一点人口+2金币+1科技+1文化值-》+0.4金币+0.3科技+0.1文化值
UPDATE ModifierArguments SET Value='0.3' WHERE ModifierId='YONGLE_SCIENCE_POPULATION'and Name='Amount';
UPDATE ModifierArguments SET Value='0.1' WHERE ModifierId='YONGLE_CULTURE_POPULATION'and Name='Amount';
UPDATE ModifierArguments SET Value='0.4' WHERE ModifierId='YONGLE_GOLD_POPULATION'and Name='Amount';
--武则天
--解锁“防御战术”获得间谍和间谍容量-》解锁“防御战术”获得1个间谍容量，解锁“行政部门”获得1个间谍和1个间谍容量
--间谍的王权神授条件
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' , 'REQUIRES_PLAYER_HAS_Divine_grant_of_kingship_WuZeTian');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' , 'REQUIRES_CAPITAL_CITY');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' , 'CivicType' , 'CIVIC_CIVIL_SERVICE');

UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' WHERE ModifierId='WU_ZETIAN_FREE_SPY';
--间谍+1容量
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('WU_ZETIAN_FREE_SPY_CAPACITY_WANGQUAN' , 'MODIFIER_PLAYER_GRANT_SPY','PLAYER_HAS_Divine_grant_of_kingship_WuZeTian');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('WU_ZETIAN_FREE_SPY_CAPACITY_WANGQUAN' , 'Amount' , '1'); 
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_WU_ZETIAN","WU_ZETIAN_FREE_SPY_CAPACITY_WANGQUAN");
--间谍百分比
UPDATE ModifierArguments SET Value='35' WHERE ModifierId='WU_ZETIAN_OFFENSIVE_SPY_SCIENCE'and Name='Percent';
UPDATE ModifierArguments SET Value='35' WHERE ModifierId='WU_ZETIAN_OFFENSIVE_SPY_CULTURE'and Name='Percent';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='WU_ZETIAN_OFFENSIVE_SPY_FAITH'and Name='Percent';


--武秦始皇
--原技能改为-》近战单位在击败敌方单位时，有概率将其俘获
--判断为近战
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_WU_QINSHIHUANG_UNIT_IS_JINZHAN' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_WU_QINSHIHUANG_UNIT_IS_JINZHAN' , 'UNIT_IS_JINZHAN_WU_QINSHIHUANG');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('UNIT_IS_JINZHAN_WU_QINSHIHUANG' , 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('UNIT_IS_JINZHAN_WU_QINSHIHUANG' , 'UnitPromotionClass' , 'PROMOTION_CLASS_MELEE');
--进攻判定
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_ATTACKER_OPPONENT_IS_WU_QINSHIHUANG' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_ATTACKER_OPPONENT_IS_WU_QINSHIHUANG' , 'PLAYER_IS_ATTACKER_REQUIREMENTS');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_ATTACKER_OPPONENT_IS_WU_QINSHIHUANG' , 'OPPONENT_IS_WU_QINGSHIHUANG_REQUIREMENTS_MET');

INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('OPPONENT_IS_WU_QINGSHIHUANG_REQUIREMENTS_MET' , 'REQUIREMENT_REQUIREMENTSET_IS_MET');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('OPPONENT_IS_WU_QINGSHIHUANG_REQUIREMENTS_MET' , 'RequirementSetId' , 'OPPONENT_IS_WU_QINGSHIHUANG_UNIT_REQUIREMENTS');
--被俘虏单位判定
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('OPPONENT_IS_WU_QINGSHIHUANG_UNIT_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');--REQUIREMENTSET_TEST_ANY
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('OPPONENT_IS_WU_QINGSHIHUANG_UNIT_REQUIREMENTS' , 'OPPONENT_IS_JINZHAN_WU_QINGSHIHUANG');
/*INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('OPPONENT_IS_WU_QINGSHIHUANG_UNIT_REQUIREMENTS' , 'OPPONENT_IS_YUANCHENG_WU_QINGSHIHUANG');*/
--被俘虏单位判定 近战
--REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('OPPONENT_IS_JINZHAN_WU_QINGSHIHUANG' , 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('OPPONENT_IS_JINZHAN_WU_QINGSHIHUANG' , 'UnitPromotionClass' , 'PROMOTION_CLASS_MELEE');
--被俘虏单位判定 远程
/*INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('OPPONENT_IS_YUANCHENG_WU_QINGSHIHUANG' , 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('OPPONENT_IS_YUANCHENG_WU_QINGSHIHUANG' , 'UnitPromotionClass' , 'PROMOTION_CLASS_RANGED');
*/
--赋予近战能力
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('WU_QINSHIHUANG_JINZHAN_ZHUAREN' , 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER','PLAYER_WU_QINSHIHUANG_UNIT_IS_JINZHAN');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('WU_QINSHIHUANG_JINZHAN_ZHUAREN' , 'ModifierId' , 'WU_QINSHIHUANG_JINZHAN_ZHUAREN_MODIFIER'); 
--击杀俘虏
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('WU_QINSHIHUANG_JINZHAN_ZHUAREN_MODIFIER' , 'MODIFIER_UNIT_ADJUST_COMBAT_UNIT_CAPTURE','PLAYER_ATTACKER_OPPONENT_IS_WU_QINSHIHUANG');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('WU_QINSHIHUANG_JINZHAN_ZHUAREN_MODIFIER' , 'CanCapture' , 1); 
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_QIN","WU_QINSHIHUANG_JINZHAN_ZHUAREN");
--移除原技能
DELETE FROM TraitModifiers Where TraitType="TRAIT_LEADER_QIN" and ModifierId="QIN_MELEE_UNIT_ABILITY";

--万神殿 宗教移民
--添加帝国初期要求
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING', 'REQUIRES_PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING', 'REQUIREMENTSET_TEST_ALL');

UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_DIGUOCHUQI_ZONGJIAOYIMING' WHERE ModifierId='RELIGIOUS_SETTLEMENTS_SETTLER_MODIFIER'; 


--新埃及 拉美西斯二世 奇观+建筑基础+40%，单独建筑-15%（15原版）
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='RAMSES_CULTURE_POSITIVE_WONDERS_BUILDINGS'and Name='BuildingProductionPercent';


--移除中世纪城墙 破城槌抗性
--DELETE FROM BuildingModifiers Where BuildingType="BUILDING_CASTLE" and ModifierId="CASTLE_PREVENT_MELEE_ATTACK_OUTER_DEFENSES";
--移除文艺复兴城墙 攻城塔抗性
DELETE FROM BuildingModifiers Where BuildingType="BUILDING_STAR_FORT" and ModifierId="STAR_FORT_PREVENT_BYPASS_OUTER_DEFENSE";


--新埃及 克利欧佩特拉（托勒密）
--移除加食物
UPDATE ModifierArguments SET Value='0, 1' WHERE ModifierId='CLEOPATRA_FLOODPLAINS_RESOURCE_YIELD'and Name='Amount';

--泛滥大米类资源+1食物
--条件 判断是泛滥+大米
--是泛滥
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AIJI_TUOLEMI_FANLAN_DAMI_RequirementSets' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_DAMI_RequirementSets' , 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_DAMI_RequirementSets' , 'REQUIRES_RICE_IN_PLOT');
	
--方法
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AIJI_TUOLEMI_FANLAN_DAMI', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AIJI_TUOLEMI_FANLAN_DAMI_RequirementSets');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_DAMI' , 'YieldType' , 'YIELD_FOOD'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_DAMI' , 'Amount' , '1'); 

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_CLEOPATRA_ALT","AIJI_TUOLEMI_FANLAN_DAMI");

--条件 判断是泛滥+玉米
--是泛滥
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AIJI_TUOLEMI_FANLAN_YUMI_RequirementSets' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_YUMI_RequirementSets' , 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_YUMI_RequirementSets' , 'REQUIRES_WHEAT_IN_PLOT');
	
--方法
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AIJI_TUOLEMI_FANLAN_YUMI', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AIJI_TUOLEMI_FANLAN_YUMI_RequirementSets');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_YUMI' , 'YieldType' , 'YIELD_FOOD'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_YUMI' , 'Amount' , '1'); 

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_CLEOPATRA_ALT","AIJI_TUOLEMI_FANLAN_YUMI");

--条件 判断是泛滥+小麦
--是泛滥
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AIJI_TUOLEMI_FANLAN_MAIZE_RequirementSets' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_MAIZE_RequirementSets' , 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_MAIZE_RequirementSets' , 'REQUIRES_MAIZE_IN_PLOT');
	
--方法
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AIJI_TUOLEMI_FANLAN_MAIZE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AIJI_TUOLEMI_FANLAN_MAIZE_RequirementSets');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_MAIZE' , 'YieldType' , 'YIELD_FOOD'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_MAIZE' , 'Amount' , '1'); 

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_CLEOPATRA_ALT","AIJI_TUOLEMI_FANLAN_MAIZE");


--判断改良是狮神人面像
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('PLOT_HAS_SHISHEN_RENMIANXIANG_REQUIREMENTS', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('PLOT_HAS_SHISHEN_RENMIANXIANG_REQUIREMENTS', 'ImprovementType', 'IMPROVEMENT_SPHINX');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_RequirementSets' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_RequirementSets' , 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_RequirementSets' , 'PLOT_HAS_SHISHEN_RENMIANXIANG_REQUIREMENTS');

--方法
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_RequirementSets');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG' , 'YieldType' , 'YIELD_PRODUCTION'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG' , 'Amount' , '0'); 

--方法
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_GOLD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_RequirementSets');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_GOLD' , 'YieldType' , 'YIELD_GOLD'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_GOLD' , 'Amount' , '3'); 

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_CLEOPATRA_ALT","AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_CLEOPATRA_ALT","AIJI_TUOLEMI_FANLAN_SHISHEN_RENMIANXIANG_GOLD");
/*--资源农田-1食物
--条件 判断是泛滥+农田+资源
--是泛滥
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN_RequirementSets' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN_RequirementSets' , 'REQUIRES_FLOODPLAINS_REQUIREMENT');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN_RequirementSets' , 'REQUIRES_PLOT_HAS_FARM');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN_RequirementSets' , 'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE');
--方法
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN_RequirementSets');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN' , 'YieldType' , 'YIELD_FOOD'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN' , 'Amount' , '-1'); 

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_CLEOPATRA_ALT","AIJI_TUOLEMI_FANLAN_NONGTIAN_ZIYUAN");*/

--拜占庭 狄奥多拉
--农场为圣地+1信仰相邻-》1金币相邻
UPDATE ModifierArguments SET Value='YIELD_GOLD' WHERE ModifierId='THEODORA_HOLY_SITE_ADJACENCY_FARM'and Name='YieldType';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='THEODORA_HOLY_SITE_ADJACENCY_FARM'and Name='Amount';
--农场为跑马场+1信仰相邻-》2
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='THEODORA_HIPPODROME_ADJACENCY_FARM'and Name='Amount';
--圣地提供文化
--修改器
INSERT INTO Types (Type,Kind) 
	VALUES ('MODIFIER_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE_TEAMPVP', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType,EffectType)
	VALUES ('MODIFIER_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE_TEAMPVP', 'COLLECTION_PLAYER_DISTRICTS', 'EFFECT_ADJUST_DISTRICT_BASE_YIELD_CHANGE');
--条件
--1相邻圣地
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('BAIZHANTING_HAS_HIGH_ADJACENCY1'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('BAIZHANTING_HAS_HIGH_ADJACENCY1'		, 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY2');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('BAIZHANTING_HAS_HIGH_ADJACENCY1'		, 	'REQUIRES_DISTRICT_IS_SD');

--3相邻圣地
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES
	('BAIZHANTING_HAS_HIGH_ADJACENCY3'		, 	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('BAIZHANTING_HAS_HIGH_ADJACENCY3'		, 	'REQUIRES_ShengDiDaKe_HAS_HIGH_ADJACENCY3');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES
	('BAIZHANTING_HAS_HIGH_ADJACENCY3'		, 	'REQUIRES_DISTRICT_IS_SD');
--方法
--至少+1信仰相邻的圣地+1文化
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW1', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE_TEAMPVP', 'BAIZHANTING_HAS_HIGH_ADJACENCY1');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW1', 'YieldType', 'YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW1', 'Amount', '1');
--辉煌圣地再+1文化
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW2', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE_TEAMPVP', 'BAIZHANTING_HAS_HIGH_ADJACENCY3');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW2', 'YieldType', 'YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW2', 'Amount', '1');
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_THEODORA","BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW1");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_THEODORA","BAIZHANTING_HAS_HIGH_SHENGDI_MODIFIER_NEW2");
--移除原版为圣地加文化
DELETE FROM TraitModifiers Where TraitType="TRAIT_LEADER_THEODORA" and ModifierId="THEODORA_CULTURE_HOLY_SITE";


--新德国
--为奇观区域+文化
--修改器
INSERT INTO Types (Type,Kind) 
	VALUES ('MODIFIER_PLAYER_CITY_ADJUST_WONDER_YIELD_CHANGE_TEAMPVP', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType,EffectType)
	VALUES ('MODIFIER_PLAYER_CITY_ADJUST_WONDER_YIELD_CHANGE_TEAMPVP', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_WONDER_YIELD_CHANGE');
--方法
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES
	('DEGUO_HAS_QIGUAN_MODIFIER', 'MODIFIER_PLAYER_CITY_ADJUST_WONDER_YIELD_CHANGE_TEAMPVP');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('DEGUO_HAS_QIGUAN_MODIFIER', 'YieldType', 'YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('DEGUO_HAS_QIGUAN_MODIFIER', 'Amount', '3');
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_LUDWIG","DEGUO_HAS_QIGUAN_MODIFIER");
--移除原版为奇观加文化、旅游业绩
DELETE FROM TraitModifiers Where TraitType="TRAIT_LEADER_LUDWIG" and ModifierId="LUDWIG_WONDER_ADJACENCY";
DELETE FROM TraitModifiers Where TraitType="TRAIT_LEADER_LUDWIG" and ModifierId="LUDWIG_CULTURE_TOURISM_DISTRICTS";
--新增奇观加速15%
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES
	('DEGUO_QIGUAN_JIASU_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_ERA_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('DEGUO_QIGUAN_JIASU_MODIFIER', 'IsWonder', 'true');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('DEGUO_QIGUAN_JIASU_MODIFIER', 'Amount', '0');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('DEGUO_QIGUAN_JIASU_MODIFIER', 'StartEra', 'ERA_ANCIENT');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('DEGUO_QIGUAN_JIASU_MODIFIER', 'EndEra', 'ERA_INFORMATION');
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_LUDWIG","DEGUO_QIGUAN_JIASU_MODIFIER");

--新朝鲜 世宗大王
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_CLASSICAL_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_MEDIEVAL_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_RENAISSANCE_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_INDUSTRIAL_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_MODERN_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_ATOMIC_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_INFORMATION_SCIENCE_INTO_CULTURE'and Name='Multiplier';
UPDATE ModifierArguments SET Value='1.2' WHERE ModifierId='SEJONG_FUTURE_SCIENCE_INTO_CULTURE'and Name='Multiplier';
--加金币
INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_CLASSICAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_CLASSICAL_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_CLASSICAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_CLASSICAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_CLASSICAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_MEDIEVAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_MEDIEVAL_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_MEDIEVAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_MEDIEVAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_MEDIEVAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_RENAISSANCE_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_RENAISSANCE_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_RENAISSANCE_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_RENAISSANCE_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_RENAISSANCE_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_INDUSTRIAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_INDUSTRIAL_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_INDUSTRIAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_INDUSTRIAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_INDUSTRIAL_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_MODERN_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_MODERN_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_MODERN_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_MODERN_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_MODERN_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_ATOMIC_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_ATOMIC_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_ATOMIC_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_ATOMIC_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_ATOMIC_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_INFORMATION_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_INFORMATION_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_INFORMATION_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_INFORMATION_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_INFORMATION_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO Modifiers (ModifierId, ModifierType,RunOnce,Permanent,SubjectRequirementSetId)
VALUES ('SEJONG_FUTURE_SCIENCE_INTO_GOLD_TEAMPVP' , 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE',1,1,"PLAYER_HAS_FUTURE_TECH");
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_FUTURE_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToGrant', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_FUTURE_SCIENCE_INTO_GOLD_TEAMPVP' , 'YieldToBaseOn', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
VALUES ('SEJONG_FUTURE_SCIENCE_INTO_GOLD_TEAMPVP' , 'Multiplier', '0.7');

INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_CLASSICAL_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_MEDIEVAL_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_RENAISSANCE_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_INDUSTRIAL_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_MODERN_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_ATOMIC_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_INFORMATION_SCIENCE_INTO_GOLD_TEAMPVP");
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES("TRAIT_LEADER_SEJONG","SEJONG_FUTURE_SCIENCE_INTO_GOLD_TEAMPVP");

--挪威征兵折扣-》50%
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='HARALD_LEVY_DISCOUNT'and Name='Percent';

--挪威新增获得使者，影响力
--方法
--初始+1影响力
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('CHARISMATICLEADER_INFLUENCEPOINTS_XINNUOWEI' , 'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CHARISMATICLEADER_INFLUENCEPOINTS_XINNUOWEI' , 'Amount', '1');
--帝国初期+1使者
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_XINNUOWEI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_XINNUOWEI', 'CivicType', 'CIVIC_EARLY_EMPIRE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_XINNUOWEI', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_XINNUOWEI');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_XINNUOWEI', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO Modifiers (ModifierId, ModifierType,OwnerRequirementSetId)
	VALUES
	('ADD_ONE_INFLUENCE_TOKEN_XINNUOWEI', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',"PLAYER_HAS_POLITICAL_PHILOSOPHY_XINNUOWEI");
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('ADD_ONE_INFLUENCE_TOKEN_XINNUOWEI', 'Amount', '1');
--初始+1使者
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES
	('ADD_ONE_INFLUENCE_TOKEN_XINNUOWEI_START', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('ADD_ONE_INFLUENCE_TOKEN_XINNUOWEI_START', 'Amount', '0');
--
INSERT INTO TraitModifiers (TraitType,ModifierId)
	VALUES 
	('TRAIT_LEADER_HARALD_ALT', 'ADD_ONE_INFLUENCE_TOKEN_XINNUOWEI_START'),
	('TRAIT_LEADER_HARALD_ALT', 'ADD_ONE_INFLUENCE_TOKEN_XINNUOWEI'),
    ('TRAIT_LEADER_HARALD_ALT', 'CHARISMATICLEADER_INFLUENCEPOINTS_XINNUOWEI');

--蒸汽英国
--战略+2锤-》+1锤
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='VICTORIA_STRATEGIC_RESOURCE'and Name='Amount';
--工业区建筑10%-》5%
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='VICTORIA_PRODUCTION_WORKSHOP'and Name='Amount';
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='VICTORIA_PRODUCTION_FACTORY'and Name='Amount';
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='VICTORIA_PRODUCTION_POWER_PLANT'and Name='Amount';
--要求解锁港口天文导航科技
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_TECH_CELESTIAL_NAVIGATION_TEAMPVP' , 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_TECH_CELESTIAL_NAVIGATION_TEAMPVP' , 'TechnologyType' , 'TECH_CELESTIAL_NAVIGATION');
--要求有任意改良
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP', 'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP', 'PLAYER_HAS_TECH_TECH_CELESTIAL_NAVIGATION_TEAMPVP');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP', 'REQUIRES_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP', 'REQUIRES_PLOT_HAS_STRATEGIC');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP', 'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP', 'REQUIREMENTSET_TEST_ALL');
--方法
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES
	('VICTORIA_STRATEGIC_RESOURCE_IMPROVEMENT_TEAMPVP', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLAYER_PLOT_HAS_ANY_IMPROVEMENT_TEAMPVP');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('VICTORIA_STRATEGIC_RESOURCE_IMPROVEMENT_TEAMPVP', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES 
	('VICTORIA_STRATEGIC_RESOURCE_IMPROVEMENT_TEAMPVP', 'Amount', '1');
--
INSERT INTO TraitModifiers (TraitType,ModifierId)
	VALUES 
	('TRAIT_LEADER_VICTORIA_ALT', 'VICTORIA_STRATEGIC_RESOURCE_IMPROVEMENT_TEAMPVP');
--工业区区域加速
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_VICTORIA_ALT' , 'TRAIT_GANGYEQU_AQUEDUCT_PRODUCTION_ZHENGQI_YINGGUO');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , OwnerRequirementSetId)
	VALUES
	('TRAIT_GANGYEQU_AQUEDUCT_PRODUCTION_ZHENGQI_YINGGUO' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , NULL , NULL);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES
	('TRAIT_GANGYEQU_AQUEDUCT_PRODUCTION_ZHENGQI_YINGGUO' , 'DistrictType' , 'DISTRICT_INDUSTRIAL_ZONE' ),
	('TRAIT_GANGYEQU_AQUEDUCT_PRODUCTION_ZHENGQI_YINGGUO' , 'Amount'       , '20'               );

--新马里
--著作+4金-》+6金
UPDATE ModifierArguments SET Value='6' WHERE ModifierId='SUNDIATA_KEITA_GREAT_WORK_GOLD_WRITING'and Name='YieldChange';

--大统一 秦始皇 中国 武秦
--所有近战+1战斗力
INSERT INTO Modifiers
	(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES
	('TRAIT_WUQING_COMBAT_BONUS_TEAMPVP', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'ATTACKING_REQUIREMENT_SET1');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
	VALUES
	('TRAIT_WUQING_COMBAT_BONUS_TEAMPVP', 'Amount', '1');
INSERT INTO ModifierStrings
	(ModifierId, Context, Text)
	VALUES
	('TRAIT_WUQING_COMBAT_BONUS_TEAMPVP', 'Preview', 'LOC_ABILITY_WUQING_NAME');
--
INSERT INTO TraitModifiers (TraitType,ModifierId)
	VALUES 
	('TRAIT_LEADER_QIN', 'TRAIT_WUQING_COMBAT_BONUS_TEAMPVP');
	

--航空港
--石油 +1
/*INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
	('OIL_FROM_DISTRICT_AERODROME_TEAM_PVP', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('OIL_FROM_DISTRICT_AERODROME_TEAM_PVP', 'ResourceType', 'RESOURCE_OIL'),
	('OIL_FROM_DISTRICT_AERODROME_TEAM_PVP', 'Amount', '1');*/
--
/*INSERT INTO DistrictModifiers (DistrictType,ModifierId)
	VALUES 
	('DISTRICT_AERODROME', 'OIL_FROM_DISTRICT_AERODROME_TEAM_PVP');*/


--拜占庭 娱乐区
UPDATE Districts SET Entertainment=2 where DistrictType="DISTRICT_HIPPODROME";

--新挪威 +海军力
INSERT INTO Modifiers(ModifierId, ModifierType)
	VALUES
	('TRAIT_NUOWEO_HAIJUN_COMBAT_BONUS', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');
INSERT INTO ModifierArguments(ModifierId, Name, Value)
	VALUES
	('TRAIT_NUOWEO_HAIJUN_COMBAT_BONUS', 'Amount', '2');
INSERT INTO ModifierStrings(ModifierId, Context, Text)
	VALUES
	('TRAIT_NUOWEO_HAIJUN_COMBAT_BONUS', 'Preview', 'LOC_NUOWEO_HAIJUN_COMBAT_BONUS1_NAME');
/*INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES
	('ATTACKING_REQUIREMENT_SET_NUOWEO_HAIJUN_COMBAT', 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET_NUOWEO_HAIJUN_COMBAT', 'UNIT_NUOWEO_HAIJUN1_REQUIREMENT');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET_NUOWEO_HAIJUN_COMBAT', 'UNIT_NUOWEO_HAIJUN2_REQUIREMENT');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET_NUOWEO_HAIJUN_COMBAT', 'UNIT_NUOWEO_HAIJUN3_REQUIREMENT');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET_NUOWEO_HAIJUN_COMBAT', 'UNIT_NUOWEO_HAIJUN4_REQUIREMENT');*/
/*INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES
	('UNIT_NUOWEO_HAIJUN1_REQUIREMENT', 'REQUIREMENT_UNIT_TAG_MATCHES');	

INSERT INTO RequirementArguments(RequirementId, Name, Value)
	VALUES
	('UNIT_NUOWEO_HAIJUN1_REQUIREMENT', 'Tag', 'CLASS_NAVAL_MELEE');
INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES
	('UNIT_NUOWEO_HAIJUN2_REQUIREMENT', 'REQUIREMENT_UNIT_TAG_MATCHES');	

INSERT INTO RequirementArguments(RequirementId, Name, Value)
	VALUES
	('UNIT_NUOWEO_HAIJUN2_REQUIREMENT', 'Tag', 'CLASS_NAVAL_RANGED');
INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES
	('UNIT_NUOWEO_HAIJUN3_REQUIREMENT', 'REQUIREMENT_UNIT_TAG_MATCHES');	

INSERT INTO RequirementArguments
	VALUES
	('UNIT_NUOWEO_HAIJUN3_REQUIREMENT', 'Tag', 'CLASS_NAVAL_RAIDER');
INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES
	('UNIT_NUOWEO_HAIJUN4_REQUIREMENT', 'REQUIREMENT_UNIT_TAG_MATCHES');	

INSERT INTO RequirementArguments(RequirementId, Name, Value)
	VALUES
	('UNIT_NUOWEO_HAIJUN4_REQUIREMENT', 'Tag', 'CLASS_NAVAL_CARRIER');*/
--
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'CLASS_NAVAL_RANGED');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'CLASS_NAVAL_MELEE');	
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'CLASS_NAVAL_RAIDER');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'CLASS_NAVAL_CARRIER');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'LOC_ABILITY_LONGSHIP_JIALI_NAME','LOC_ABILITY_LONGSHIP_JIALI_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_LONGSHIP_JIALI_XIN_NUOWEI', 'TRAIT_NUOWEO_HAIJUN_COMBAT_BONUS');
--
--要求领袖
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('LEADR_IS_XINNUOWEI' , 'REQUIREMENT_LEADR_IS_XINNUOWEI');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('LEADR_IS_XINNUOWEI' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIREMENT_LEADR_IS_XINNUOWEI' , 'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIREMENT_LEADR_IS_XINNUOWEI' , 'LeaderType' , 'LEADER_HARALD_ALT');
--新挪威海军+2战斗力
INSERT INTO Modifiers (ModifierId, ModifierType,Permanent,SubjectRequirementSetId)
	VALUES ('STAVE_CHURCH_INCREASED_JIALI_MODIFIER2', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',1,"LEADR_IS_XINNUOWEI");
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('STAVE_CHURCH_INCREASED_JIALI_MODIFIER2', 'AbilityType','ABILITY_LONGSHIP_JIALI_XIN_NUOWEI');
INSERT INTO BuildingModifiers (BuildingType, ModifierId)
	VALUES ('BUILDING_STAVE_CHURCH', 'STAVE_CHURCH_INCREASED_JIALI_MODIFIER2');
--
/*INSERT INTO TraitModifiers(TraitType, ModifierId)
	VALUES
	('TRAIT_LEADER_HARALD_ALT', 'TRAIT_NUOWEO_HAIJUN_COMBAT_BONUS');*/


--古树林 不能叠加 增对应着减
--基础条件
INSERT INTO Requirements (RequirementId , RequirementType )
VALUES ('REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN' , 'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES');
INSERT INTO RequirementArguments(RequirementId, Name, Value)
VALUES ('REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN' , 'BuildingType' ,'BUILDING_GROVE');

INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLOT_GUSHULIN_HAS_ANY_IMPROVEMENT_TPB' , 'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');
--2魅力效果
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2', 'REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU2');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2', 'REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN');

INSERT INTO Requirements(RequirementId , RequirementType)
VALUES('REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU2', 'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN');	
INSERT INTO RequirementArguments(RequirementId, Name, Value)
VALUES('REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU2', 'MinimumAppeal', '2');
--食物
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU2' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD' , 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD' , 'Amount','1');
--信仰
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU2' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH' , 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH' , 'Amount','0');
--添加
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH');


--4魅力效果
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4', 'REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU4');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4', 'REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN');

INSERT INTO Requirements(RequirementId , RequirementType)
VALUES('REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU4', 'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN');	
INSERT INTO RequirementArguments(RequirementId, Name, Value)
VALUES('REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU4', 'MinimumAppeal', '4');
--食物
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU4' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD' , 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD' , 'Amount','1');
--文化
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU4' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE' , 'YieldType','YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE' , 'Amount','1');
--添加
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE');

--5魅力效果
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5', 'REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU5');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5', 'REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN');

INSERT INTO Requirements(RequirementId , RequirementType)
VALUES('REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU5', 'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN');	
INSERT INTO RequirementArguments(RequirementId, Name, Value)
VALUES('REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU5', 'MinimumAppeal', '5');
--文化
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU5' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE' , 'YieldType','YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE' , 'Amount','0');
--添加
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE');

--有改良时 不具备效果
--2魅力不具备效果
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2_DELETE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2_DELETE', 'REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU2');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2_DELETE', 'REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU2_DELETE', 'PLOT_GUSHULIN_HAS_ANY_IMPROVEMENT_TPB');

--食物
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD_DELETE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU2_DELETE' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD_DELETE' , 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD_DELETE' , 'Amount','-1');
--信仰
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH_DELETE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU2_DELETE' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH_DELETE' , 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH_DELETE' , 'Amount','0');
--添加
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FOOD_DELETE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU2_FAITH_DELETE');

--4魅力不具备效果
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4_DELETE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4_DELETE', 'REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU4');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4_DELETE', 'REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU4_DELETE', 'PLOT_GUSHULIN_HAS_ANY_IMPROVEMENT_TPB');

--食物
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD_DELETE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU4_DELETE' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD_DELETE' , 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD_DELETE' , 'Amount','-1');
--文化
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE_DELETE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU4_DELETE' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE_DELETE' , 'YieldType','YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE_DELETE' , 'Amount','-1');
--添加
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_FOOD_DELETE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU4_CULTURE_DELETE');

--5魅力不具备效果
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5_DELETE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5_DELETE', 'REQUIRES_PLOT_APPEAL_GUSHULIN_DAYU5');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5_DELETE', 'REQUIRES_PLOT_ADJACENT_TO_BUILD_GUSHULIN');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_APPEAL_GUSHULIN_DAYU5_DELETE', 'PLOT_GUSHULIN_HAS_ANY_IMPROVEMENT_TPB');
--文化
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE_DELETE' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_APPEAL_GUSHULIN_DAYU5_DELETE' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE_DELETE' , 'YieldType','YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE_DELETE' , 'Amount','0');
--添加
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_PLOT_ADJACENT_TO_BUILD_GUSHULIN_DAYU5_CULTURE_DELETE');

--澳大利亚 土澳
--内陆牧场
UPDATE Adjacency_YieldChanges SET PrereqTech="TECH_MASS_PRODUCTION" where ID="Outback_Outback_Production";

--大统一 秦始皇 中国 武秦
--解锁 火枪科技为 所有近战+1战斗力
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('WUQING_COMBAT_BONUS_2_REQUIREMENT_SET1', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('WUQING_COMBAT_BONUS_2_REQUIREMENT_SET1', 'PLAYER_HAS_TECH_GUNPOWDER_WUQING_COMBAT_BONUS_2');

INSERT INTO Requirements (RequirementId , RequirementType)
VALUES('PLAYER_HAS_TECH_GUNPOWDER_WUQING_COMBAT_BONUS_2' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
VALUES('PLAYER_HAS_TECH_GUNPOWDER_WUQING_COMBAT_BONUS_2' , 'CivicType' , 'CIVIC_DEFENSIVE_TACTICS');
--实现
INSERT INTO Modifiers(ModifierId, ModifierType, OwnerRequirementSetId,SubjectRequirementSetId)
VALUES('TRAIT_WUQING_COMBAT_BONUS_2_TEAMPVP', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'WUQING_COMBAT_BONUS_2_REQUIREMENT_SET1',"ATTACKING_REQUIREMENT_SET1");
INSERT INTO ModifierArguments(ModifierId, Name, Value)
VALUES('TRAIT_WUQING_COMBAT_BONUS_2_TEAMPVP', 'Amount', '1');
INSERT INTO ModifierStrings(ModifierId, Context, Text)
VALUES('TRAIT_WUQING_COMBAT_BONUS_2_TEAMPVP', 'Preview', 'LOC_ABILITY_WUQING_2_NAME');
--
INSERT INTO TraitModifiers(TraitType,ModifierId)
VALUES('TRAIT_LEADER_QIN', 'TRAIT_WUQING_COMBAT_BONUS_2_TEAMPVP');

--永乐皇帝 修改10人口收益 10-》7人口
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('STADIUM_7_POPULATION_REQUIREMENTS_TMP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('STADIUM_7_POPULATION_REQUIREMENTS_TMP', 'Requirements_STADIUM_7_POPULATION_REQUIREMENTS_TMP');

INSERT INTO Requirements (RequirementId , RequirementType)
VALUES('Requirements_STADIUM_7_POPULATION_REQUIREMENTS_TMP' , 'REQUIREMENT_CITY_HAS_X_POPULATION');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
VALUES('Requirements_STADIUM_7_POPULATION_REQUIREMENTS_TMP' , 'Amount' , '7');

UPDATE Modifiers SET SubjectRequirementSetId='STADIUM_7_POPULATION_REQUIREMENTS_TMP' WHERE  ModifierId='YONGLE_SCIENCE_POPULATION';
UPDATE Modifiers SET SubjectRequirementSetId='STADIUM_7_POPULATION_REQUIREMENTS_TMP' WHERE  ModifierId='YONGLE_CULTURE_POPULATION';
UPDATE Modifiers SET SubjectRequirementSetId='STADIUM_7_POPULATION_REQUIREMENTS_TMP' WHERE  ModifierId='YONGLE_GOLD_POPULATION';


--祈龙仪式
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GODDESS_OF_Dragon_Prayer_Ceremony', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GODDESS_OF_Dragon_Prayer_Ceremony', 'LOC_BELIEF_GODDESS_OF_Dragon_Prayer_Ceremony_NAME', 'LOC_BELIEF_GODDESS_OF_Dragon_Prayer_Ceremony_explain', 'BELIEF_CLASS_PANTHEON');
--
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_Dragon_Prayer_Ceremony', 'Dragon_Prayer_Ceremony_YUCHUAN_FAITH');
	INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_Dragon_Prayer_Ceremony', 'Dragon_Prayer_Ceremony_JIAOSHI_FAITH');
--渔船+1信仰
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Dragon_Prayer_Ceremony_YUCHUAN_FAITH', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Dragon_Prayer_Ceremony_YUCHUAN_FAITH_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_FISHINGBOATS_REQUIREMENTS');
--
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_YUCHUAN_FAITH', 'ModifierId','Dragon_Prayer_Ceremony_YUCHUAN_FAITH_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_YUCHUAN_FAITH_MODIFIER', 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_YUCHUAN_FAITH_MODIFIER', 'Amount','1');
--礁石+2信仰
--条件
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES('PLOT_HAS_JIASOHI_TMP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES('PLOT_HAS_JIASOHI_TMP', 'REQUIRES_PLOT_HAS_JIASOHI_TMP');

INSERT INTO Requirements (RequirementId , RequirementType)
VALUES('REQUIRES_PLOT_HAS_JIASOHI_TMP' , 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
VALUES('REQUIRES_PLOT_HAS_JIASOHI_TMP' , 'FeatureType' , 'FEATURE_REEF');
--实现
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Dragon_Prayer_Ceremony_JIAOSHI_FAITH', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Dragon_Prayer_Ceremony_JIAOSHI_FAITH_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_JIASOHI_TMP');
--
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_JIAOSHI_FAITH', 'ModifierId','Dragon_Prayer_Ceremony_JIAOSHI_FAITH_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_JIAOSHI_FAITH_MODIFIER', 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_JIAOSHI_FAITH_MODIFIER', 'Amount','2');


--神钓仪式
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Divine_Fishing_Ceremony', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Divine_Fishing_Ceremony', 'LOC_BELIEF_GODDESS_OF_Divine_Fishing_Ceremony_NAME', 'LOC_BELIEF_GODDESS_OF_Divine_Fishing_Ceremony_explain', 'BELIEF_CLASS_PANTHEON');
--
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Divine_Fishing_Ceremony', 'Dragon_Prayer_Ceremony_Divine_Fishing');
--条件
--基础
INSERT INTO Tags(Tag , Vocabulary)
	VALUES ('CLASS_YU_Divine_Fishing', 'RESOURCE_CLASS');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_CRABS', 'CLASS_YU_Divine_Fishing');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_WHALES', 'CLASS_YU_Divine_Fishing');
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_PEARLS', 'CLASS_YU_Divine_Fishing');	
--封装
INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES ('REQUIRES_PLOT_HAS_Divine_Fishing', 'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');
INSERT INTO RequirementArguments(RequirementId , Name, Value)
	VALUES ('REQUIRES_PLOT_HAS_Divine_Fishing', 'Tag', 'CLASS_YU_Divine_Fishing');

INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_Divine_Fishing' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_Divine_Fishing' , 'REQUIRES_PLOT_HAS_Divine_Fishing');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_Divine_Fishing' , 'REQUIRES_PLOT_HAS_FISHINGBOATS');
--特殊渔船+1文化
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Dragon_Prayer_Ceremony_Divine_Fishing', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('Dragon_Prayer_Ceremony_Divine_Fishing_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_Divine_Fishing');
--
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_Divine_Fishing', 'ModifierId','Dragon_Prayer_Ceremony_Divine_Fishing_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_Divine_Fishing_MODIFIER', 'YieldType','YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('Dragon_Prayer_Ceremony_Divine_Fishing_MODIFIER', 'Amount','1');


--明道之主
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Master_of_Ming_Dao', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Master_of_Ming_Dao', 'LOC_BELIEF_Master_of_Ming_Dao_NAME', 'LOC_BELIEF_Master_of_Ming_Dao_explain', 'BELIEF_CLASS_PANTHEON');
--
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Master_of_Ming_Dao', 'Master_of_Ming_Dao_JIA_CHUI');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Master_of_Ming_Dao', 'Master_of_Ming_Dao_JIA_JINBI');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Master_of_Ming_Dao', 'Master_of_Ming_Dao_JIA_YIJUDU');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Master_of_Ming_Dao', 'Master_of_Ming_Dao_ShouDu_JianChui');
--加1锤
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('Master_of_Ming_Dao_JIA_CHUI' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_CHUI' , 'ModifierId' , 'Master_of_Ming_Dao_JIA_CHUI_Modifier');

INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('Master_of_Ming_Dao_JIA_CHUI_Modifier' , 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_CHUI_Modifier' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_CHUI_Modifier' , 'Amount' , '1');
--加1金
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('Master_of_Ming_Dao_JIA_JINBI' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_JINBI' , 'ModifierId' , 'Master_of_Ming_Dao_JIA_JINBI_Modifier');

INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('Master_of_Ming_Dao_JIA_JINBI_Modifier' , 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_JINBI_Modifier' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_JINBI_Modifier' , 'Amount' , '0');
--首都+1宜居度
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('Master_of_Ming_Dao_JIA_YIJUDU' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_YIJUDU' , 'ModifierId' , 'Master_of_Ming_Dao_JIA_YIJUDU_Modifier');

INSERT INTO Types (Type, Kind)
VALUES('MODIFIER_CITY_DISTRICTS_ADJUST_CITY_AMENITIES_FROM_RELIGION_TMP', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) 
VALUES('MODIFIER_CITY_DISTRICTS_ADJUST_CITY_AMENITIES_FROM_RELIGION_TMP', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_AMENITIES_FROM_RELIGION');


INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('Master_of_Ming_Dao_JIA_YIJUDU_Modifier' , 'MODIFIER_CITY_DISTRICTS_ADJUST_CITY_AMENITIES_FROM_RELIGION_TMP',"CIVILIZATION_AYUTTHAYA_GONGDIAN");
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_JIA_YIJUDU_Modifier' , 'Amount' , '1');
--首都-1锤
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('Master_of_Ming_Dao_ShouDu_JianChui' , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_ShouDu_JianChui' , 'ModifierId' , 'Master_of_Ming_Dao_ShouDu_JianChui_Modifier');

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('Master_of_Ming_Dao_ShouDu_JianChui_Modifier' , 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',"CIVILIZATION_AYUTTHAYA_GONGDIAN");
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_ShouDu_JianChui_Modifier' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('Master_of_Ming_Dao_ShouDu_JianChui_Modifier' , 'Amount' , '-1');
/*--航空港 送飞机
INSERT INTO Modifiers (ModifierId , ModifierType,RunOnce,Permanent)
	VALUES ('HANGKONGGANG_SONG_SHUANGYIJI_TEAMPVP' , 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',1,1);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('HANGKONGGANG_SONG_SHUANGYIJI_TEAMPVP' , 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('HANGKONGGANG_SONG_SHUANGYIJI_TEAMPVP' , 'UnitType' , 'UNIT_BIPLANE');

INSERT INTO DistrictModifiers (DistrictType , ModifierId)
	VALUES ('DISTRICT_AERODROME' , 'HANGKONGGANG_SONG_SHUANGYIJI_TEAMPVP');
*/
--所有间谍+2逃跑等级
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_SPY_TAOPAO', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_SPY_TAOPAO', 'CLASS_SPY');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_SPY_TAOPAO', 'LOC_ABILITY_SPY_TAOPAO_NAME','LOC_SPY_TAOPAO_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_SPY_TAOPAO','Modifier_SPY_TAOPAO');
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('Modifier_SPY_TAOPAO','MODIFIER_PLAYER_UNIT_ESCAPE_BOOST');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('Modifier_SPY_TAOPAO','Amount','2');
--
INSERT INTO Modifiers (ModifierId, ModifierType,Permanent)
	VALUES ('GRANT_SPY_TAOPAO_ABILITY', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',1);
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('GRANT_SPY_TAOPAO_ABILITY', 'AbilityType','ABILITY_SPY_TAOPAO');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_MAJOR_CIV', 'GRANT_SPY_TAOPAO_ABILITY');

--新挪威 影响力点数
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='STAVE_CHURCH_INFLUENCEPOINTS'and Name='Amount';
--新挪威 维护费
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='HARALD_MAINTENANCE_DISCOUNT'and Name='Amount';

--新罗马 调整金币
UPDATE ModifierArguments SET Value='200' WHERE ModifierId='TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER'and Name='Amount';--基础
UPDATE ModifierArguments SET Value='150' WHERE ModifierId='TRAIT_CAESAR_GOLD_CAPTURED_CITY_METAL_CASTING_MODIFIER'and Name='Amount';--提升
UPDATE ModifierArguments SET Value='300' WHERE ModifierId='TRAIT_CAESAR_GOLD_CAPTURED_CITY_STEEL_MODIFIER'and Name='Amount';--提升


--武则天 信仰购买间谍 行政部门解锁
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_Divine_grant_of_kingship_WuZeTian' WHERE ModifierId='WU_ZETIAN_PURCHASE_SPY';

--黄金时代 货币改革 3金币-》2金币
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='COMMEMORATION_ECONOMIC_GA_TRADE_ROUTE_YIELDS'and Name='Amount';

--印加
--+150%水渠
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS' , 'TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2_YINDU_SHUIQU');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2_YINDU_SHUIQU' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , NULL );
INSERT INTO ModifierArguments (ModifierId , Name , Value, Extra , SecondExtra)
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2_YINDU_SHUIQU' , 'DistrictType' , 'DISTRICT_AQUEDUCT', null , null ),
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2_YINDU_SHUIQU' , 'Amount'       , '150'               , null , null );

--蒙古 骑兵军事学+1力
--条件
/*INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_JUNSHIXUE_MENGGU' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_JUNSHIXUE_MENGGU' , 'PLAYER_HAS_TECH_POTTERY_JUNSHIXUE_MENGGU');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_JUNSHIXUE_MENGGU' , 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_POTTERY_JUNSHIXUE_MENGGU' , 'TechnologyType' , 'TECH_MILITARY_SCIENCE');
--效果
INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId )
	VALUES('GENGHIS_KHAN_CAVALRY_BONUS_MENGGU_JUNSHIXUE' , 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH' , "PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_JUNSHIXUE_MENGGU" );
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES('GENGHIS_KHAN_CAVALRY_BONUS_MENGGU_JUNSHIXUE' , 'Amount' , '1');
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_GENGHIS_KHAN_CAVALRY_BONUS','GENGHIS_KHAN_CAVALRY_BONUS_MENGGU_JUNSHIXUE');
INSERT INTO ModifierStrings (ModifierId, Context,Text)
	VALUES ('GENGHIS_KHAN_CAVALRY_BONUS_MENGGU_JUNSHIXUE','Preview','LOC_LEADER_CAVALRY_COMBAT_BONUS_PREVIEW_TEXT_MENGGU_JUNSHIXUE');*/

--新增爱法技能
INSERT INTO Types (Type, Kind) VALUES
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP', 'KIND_TRAIT');
INSERT INTO LeaderTraits (LeaderType, TraitType) VALUES
    ('LEADER_ELEANOR_FRANCE', 'TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP');
Delete FROM LeaderTraits WHERE LeaderType ='LEADER_ELEANOR_FRANCE' and TraitType='TRAIT_LEADER_ELEANOR_LOYALTY';
INSERT INTO Traits (TraitType, Name,Description) VALUES
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP', 'LOC_TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP_NAME', 'LOC_TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP_DESCRIPTION');

INSERT INTO AiLists (ListType, LeaderType,System) VALUES
    ('EleanorCivics', 'TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP','Civics'),
    ('EleanorDistricts', 'TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP','Districts'),
    ('EleanorWonders', 'TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP','Buildings'),
    ('EleanorGreatWorks', 'TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP','PseudoYields'),
    ('EleanorAlliances', 'TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP','Alliances');
INSERT INTO TraitModifiers (TraitType , ModifierId) VALUES
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'TRAIT_EXTRA_PALACE_SLOTS_AILINUO'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'TRAIT_EXTRA_PALACE_SLOTS_AILINUO_DISTRICT_THEATER2'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'TRAIT_EXTRA_PALACE_SLOTS_AILINUO_DISTRICT_BUILD_THEATER3'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'SKIP_FREE_CITY'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'IDENTITY_NEARBY_GREATWORKS'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'ELEANOR_DOUBLE_SCULPTURE_S1'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'ELEANOR_DOUBLE_SCULPTURE_S2'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'ELEANOR_DOUBLE_SCULPTURE_S3'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'ELEANOR_DOUBLE_SCULPTURE_S4'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'ELEANOR_DOUBLE_SCULPTURE_S5'),
    ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP' , 'ELEANOR_DOUBLE_SCULPTURE_S6');

--巨作点数
--条件
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
    VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_C' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
    VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_C' , 'TRAIT_BONUS_GREAT_PROPHET_POINT1');
INSERT INTO Requirements (RequirementId , RequirementType)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT1' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT1' , 'CivicType' , 'CIVIC_POLITICAL_PHILOSOPHY');
--效果
INSERT INTO Modifiers (ModifierId , ModifierType, OwnerRequirementSetId)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_c' , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS' , 'PLAYER_HAS_ASTROLOGY_REQUIREMENTS_C');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_c' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_WRITER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_c' , 'Amount' , '1');
--实现
INSERT INTO TraitModifiers (TraitType, ModifierId)
    VALUES ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP', 'TRAIT_BONUS_GREAT_PROPHET_POINT_c');

--爱英与爱法一致
--巨作点数
--条件
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
    VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_D' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
    VALUES ('PLAYER_HAS_ASTROLOGY_REQUIREMENTS_D' , 'TRAIT_BONUS_GREAT_PROPHET_POINT1_D');
INSERT INTO Requirements (RequirementId , RequirementType)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT1_D' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT1_D' , 'CivicType' , 'CIVIC_DRAMA_POETRY');
--效果
INSERT INTO Modifiers (ModifierId , ModifierType, OwnerRequirementSetId)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_D' , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS' , 'PLAYER_HAS_ASTROLOGY_REQUIREMENTS_D');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_D' , 'GreatPersonClassType' , 'GREAT_PERSON_CLASS_WRITER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('TRAIT_BONUS_GREAT_PROPHET_POINT_D' , 'Amount' , '1');
INSERT INTO TraitModifiers (TraitType, ModifierId)
    VALUES ('TRAIT_LEADER_ELEANOR_LOYALTY', 'TRAIT_BONUS_GREAT_PROPHET_POINT_D');

--城堡改良+1金币
--判断是否城堡
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
    VALUES ('PLOT_HAS_CHENGBAO_TEAM_PVP' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
    VALUES ('PLOT_HAS_CHENGBAO_TEAM_PVP' , 'REQUIRES_PLOT_HAS_CHENGBAO_TEAM_PVP');
INSERT INTO Requirements (RequirementId , RequirementType)
    VALUES ('REQUIRES_PLOT_HAS_CHENGBAO_TEAM_PVP' , 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
    VALUES ('REQUIRES_PLOT_HAS_CHENGBAO_TEAM_PVP' , 'ImprovementType' , 'IMPROVEMENT_CHATEAU');
--效果
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('AIFA_CHENGBAO_JIA1JINBI_TEAM_PVP', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_HAS_CHENGBAO_TEAM_PVP');
--
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('AIFA_CHENGBAO_JIA1JINBI_TEAM_PVP', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name ,Value)
	VALUES ('AIFA_CHENGBAO_JIA1JINBI_TEAM_PVP', 'Amount','1');
--实现
INSERT INTO TraitModifiers (TraitType, ModifierId)
    VALUES ('TRAIT_LEADER_ELEANOR_FRANCE_LOYALTY_TEAM_PVP', 'AIFA_CHENGBAO_JIA1JINBI_TEAM_PVP');


--毛利 建立首都前+2移动力
--判断没有城市
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
    VALUES ('PLAYER_NOT_HAS_CITY_TEAM_PVP' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
    VALUES ('PLAYER_NOT_HAS_CITY_TEAM_PVP' , 'REQUIRES_PLAYER_NOT_HAS_CITY_TEAM_PVP');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
    VALUES ('PLAYER_NOT_HAS_CITY_TEAM_PVP' , 'REQUIRES_UNIT_IS_EMBARKED');
INSERT INTO Requirements (RequirementId , RequirementType,Inverse)
    VALUES ('REQUIRES_PLAYER_NOT_HAS_CITY_TEAM_PVP' , 'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUMBER_CITIES',1);
INSERT INTO RequirementArguments (RequirementId , Name , Value)
    VALUES ('REQUIRES_PLAYER_NOT_HAS_CITY_TEAM_PVP' , 'Amount' , '1');
--效果
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_MANA','MANA_EMBARKED_EXTRA_MOVEMENT_NOT_HAS_CITY_TEAM_PVP');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('MANA_EMBARKED_EXTRA_MOVEMENT_NOT_HAS_CITY_TEAM_PVP','MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT','PLAYER_NOT_HAS_CITY_TEAM_PVP');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('MANA_EMBARKED_EXTRA_MOVEMENT_NOT_HAS_CITY_TEAM_PVP','Amount','2');
INSERT INTO ModifierStrings (ModifierId, Context,Text)
	VALUES ('MANA_EMBARKED_EXTRA_MOVEMENT_NOT_HAS_CITY_TEAM_PVP','Preview','LOC_ABILITY_ANIT_SPEAR_MODIFIER_MAORI_DESCRIPTION');
--
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='MANA_EMBARKED_EXTRA_MOVEMENT'and Name='Amount';

--砍二 工人区域加速
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_BUILDER_DISTRICT_PERCENT'and Name='Amount';

--克里 移除棚屋行政+住房
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='MEKEWAP_HOUSING_WITHCIVILSERVICE'and Name='Amount';

--修改蘑菇最小间距 蘑菇将会充分填充地图 3->7
UPDATE Improvements SET GoodyRange="7" WHERE ImprovementType="IMPROVEMENT_GOODY_HUT";

--跨文化对话 
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='CROSS_CULTURAL_DIALOGUE_SCIENCE_FOLLOWER_MODIFIER' AND Name='PerXItems';

--武僧 新增 圣地建筑加成
--1、2级建筑
INSERT INTO Modifiers 
	(ModifierId                              , ModifierType                          , SubjectRequirementSetId)
	VALUES 
	('WARRIOR_MONKS_SHRINE_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_SHRINE'),--<
	('WARRIOR_MONKS_TEMPLE_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_TEMPLE'),
	('WARRIOR_MONKS_SHRINE_PRODUCTION_MODIFIER' , 'MODIFIER_BUILDING_YIELD_CHANGE'      , null                              ),--<
	('WARRIOR_MONKS_TEMPLE_PRODUCTION_MODIFIER' , 'MODIFIER_BUILDING_YIELD_CHANGE'      , null                              );
INSERT INTO ModifierArguments 
	(ModifierId                              , Name           , Value)
	VALUES 
	('WARRIOR_MONKS_SHRINE_PRODUCTION'          , 'ModifierId'   , 'WARRIOR_MONKS_SHRINE_PRODUCTION_MODIFIER'),--<
	('WARRIOR_MONKS_TEMPLE_PRODUCTION'          , 'ModifierId'   , 'WARRIOR_MONKS_TEMPLE_PRODUCTION_MODIFIER'),
	('WARRIOR_MONKS_SHRINE_PRODUCTION_MODIFIER' , 'BuildingType' , 'BUILDING_SHRINE'                      ),--<
	('WARRIOR_MONKS_SHRINE_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_FAITH'                     ),
	('WARRIOR_MONKS_SHRINE_PRODUCTION_MODIFIER' , 'Amount'       , '1'                                    ),
	('WARRIOR_MONKS_TEMPLE_PRODUCTION_MODIFIER' , 'BuildingType' , 'BUILDING_TEMPLE'                      ),--<
	('WARRIOR_MONKS_TEMPLE_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_FAITH'                     ),
	('WARRIOR_MONKS_TEMPLE_PRODUCTION_MODIFIER' , 'Amount'       , '1'                                    );
INSERT INTO BeliefModifiers 
	(BeliefType          , ModifierId)
	VALUES 
	('BELIEF_WARRIOR_MONKS' , 'WARRIOR_MONKS_TEMPLE_PRODUCTION'),
	('BELIEF_WARRIOR_MONKS' , 'WARRIOR_MONKS_SHRINE_PRODUCTION');
--3级建筑
INSERT INTO Modifiers 
	(ModifierId                              , ModifierType                          , SubjectRequirementSetId)
	VALUES 
	('WARRIOR_MONKS_TIER3_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('WARRIOR_MONKS_TIER3_PRODUCTION_MODIFIER' , 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE'      , 'BUILDING_IS_TIER3_HOLY_SITE'     );
INSERT INTO ModifierArguments 
	(ModifierId                              , Name           , Value)
	VALUES 
	('WARRIOR_MONKS_TIER3_PRODUCTION'          , 'ModifierId'   , 'WARRIOR_MONKS_TIER3_PRODUCTION_MODIFIER'),
	('WARRIOR_MONKS_TIER3_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_FAITH'                     ),
	('WARRIOR_MONKS_TIER3_PRODUCTION_MODIFIER' , 'Amount'       , '1'                                    );
INSERT INTO BeliefModifiers 
	(BeliefType          , ModifierId)
	VALUES 
	('BELIEF_WARRIOR_MONKS' , 'WARRIOR_MONKS_TIER3_PRODUCTION');

--朝鲜 农场相邻书院+1金币
--条件
INSERT INTO Requirements (RequirementId , RequirementType )
	VALUES ('REQUIRES_PLOT_ADJACENT_TO_DISTRICT_SEOWON' , 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments(RequirementId, Name, Value)
	VALUES ('REQUIRES_PLOT_ADJACENT_TO_DISTRICT_SEOWON' , 'DistrictType' ,'DISTRICT_SEOWON');

INSERT INTO RequirementSets (RequirementSetId , RequirementSetType )
	VALUES ('PLOT_ADJACENT_TO_FARM_REQUIREMENTS_CHAOXIAN' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId )
	VALUES ('PLOT_ADJACENT_TO_FARM_REQUIREMENTS_CHAOXIAN' , 'REQUIRES_PLOT_HAS_FARM');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId )
	VALUES ('PLOT_ADJACENT_TO_FARM_REQUIREMENTS_CHAOXIAN' , 'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_SEOWON');


INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES ('TRAIT_FARM_FOOD_DISTRICT_SEOWON_CHAOXIAN' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD','PLOT_ADJACENT_TO_FARM_REQUIREMENTS_CHAOXIAN' );
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_FARM_FOOD_DISTRICT_SEOWON_CHAOXIAN' , 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
	VALUES ('TRAIT_FARM_FOOD_DISTRICT_SEOWON_CHAOXIAN' , 'Amount','1');
--实现
INSERT INTO TraitModifiers (TraitType , ModifierId )
	VALUES ('TRAIT_CIVILIZATION_THREE_KINGDOMS' , 'TRAIT_FARM_FOOD_DISTRICT_SEOWON_CHAOXIAN');

--朝鲜书院不需要维护费
UPDATE Districts SET Maintenance='0' WHERE DistrictType="DISTRICT_SEOWON";

--克里 商路加成需要政治哲学
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_PDIGUOCHUQI_KELI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_PDIGUOCHUQI_KELI', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_PDIGUOCHUQI_KELI', 'REQUIRES_PLAYER_HAS_PDIGUOCHUQI_KELI');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_PDIGUOCHUQI_KELI', 'REQUIREMENTSET_TEST_ALL');
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_PDIGUOCHUQI_KELI' WHERE ModifierId='TRAIT_TRADE_FOOD_FROM_CAMPS';
--UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_PDIGUOCHUQI_KELI' WHERE ModifierId='TRAIT_TRADE_GOLD_FROM_CAMPS';
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_PDIGUOCHUQI_KELI' WHERE ModifierId='TRAIT_TRADE_FOOD_FROM_PASTURES';
--UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_PDIGUOCHUQI_KELI' WHERE ModifierId='TRAIT_TRADE_GOLD_FROM_PASTURES';

--挪威 有港口+1锤2金
--有港口
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_NUOWEI_HAS_GANGKOU', 'REQUIREMENT_CITY_HAS_DISTRICT');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_NUOWEI_HAS_GANGKOU', 'DistrictType', 'DISTRICT_COTHON');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('NUOWEI_HAS_GANGKOU', 'REQUIRES_NUOWEI_HAS_GANGKOU');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('NUOWEI_HAS_GANGKOU', 'REQUIREMENTSET_TEST_ALL');
--有灯塔
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_NUOWEI_HAS_DENGTA', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_NUOWEI_HAS_DENGTA', 'BuildingType', 'BUILDING_LIGHTHOUSE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('NUOWEI_HAS_DENGTA', 'REQUIRES_NUOWEI_HAS_DENGTA');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('NUOWEI_HAS_DENGTA', 'REQUIREMENTSET_TEST_ALL');
--
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('NUOWEI_GANGKOU_JIACHUI' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' , 'NUOWEI_HAS_GANGKOU');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_GANGKOU_JIACHUI' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_GANGKOU_JIACHUI' , 'Amount' , '1');

INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('NUOWEI_GANGKOU_JIAQIAN' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' , 'NUOWEI_HAS_GANGKOU');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_GANGKOU_JIAQIAN' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_GANGKOU_JIAQIAN' , 'Amount' , '3');
--
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('NUOWEI_DENGTA_JIACHUI' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' , 'NUOWEI_HAS_DENGTA');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_DENGTA_JIACHUI' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_DENGTA_JIACHUI' , 'Amount' , '1');

INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('NUOWEI_DENGTA_JIAQIAN' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' , 'NUOWEI_HAS_DENGTA');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_DENGTA_JIAQIAN' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('NUOWEI_DENGTA_JIAQIAN' , 'Amount' , '3');

INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION', 'NUOWEI_GANGKOU_JIACHUI');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION', 'NUOWEI_GANGKOU_JIAQIAN');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION', 'NUOWEI_DENGTA_JIACHUI');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION', 'NUOWEI_DENGTA_JIAQIAN');


--商英 海军统帅+2-》+1商路容量，防御战术市政+1商路容量
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ELIZABETH_TRADE_ROUTES_MODIFIER'and Name='Amount';
--需要海军传统
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_HAIJUNCHUANTONG_SHANGYING', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_HAIJUNCHUANTONG_SHANGYING', 'CivicType', 'CIVIC_DEFENSIVE_TACTICS');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_HAIJUNCHUANTONG_SHANGYING', 'REQUIRES_PLAYER_HAS_HAIJUNCHUANTONG_SHANGYING');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_HAIJUNCHUANTONG_SHANGYING', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO Modifiers (ModifierId , ModifierType,OwnerRequirementSetId)
    VALUES ('TRAIT_JOAO_TRADE_ROUTE_SHANGYING_ADDONE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY','PLAYER_HAS_HAIJUNCHUANTONG_SHANGYING');	

INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("TRAIT_JOAO_TRADE_ROUTE_SHANGYING_ADDONE","Amount","1");

INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_ELIZABETH","TRAIT_JOAO_TRADE_ROUTE_SHANGYING_ADDONE");

--外交区 领事馆 越南 城池也算作军营
/*INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_CITY_HAS_DISTRICT_THANH_TEAMPVP', 'REQUIREMENT_CITY_HAS_DISTRICT');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_CITY_HAS_DISTRICT_THANH_TEAMPVP', 'DistrictType', 'DISTRICT_THANH');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('CITY_HAS_CONSULATE_OR_ENCAMPMENT', 'REQUIRES_CITY_HAS_DISTRICT_THANH_TEAMPVP');*/

--议会 商路议会 +4-》+2
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='INCREASES_TRADE_TO_GOLD'and Name='Amount';

--议会 禁商路议会 -》减1容商路容量
--减1容商路容量
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('APPLY_TARGET_FREE_TRADE_ROUTE_JIAN_TEAMPVP' , 'MODIFIER_CONGRESS_ATTACH_MODIFIER_TO_PLAYERTYPE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('APPLY_TARGET_FREE_TRADE_ROUTE_JIAN_TEAMPVP' , 'ModifierId' , 'APPLY_TARGET_FREE_TRADE_ROUTE_JIAN_TEAMPVP_Modifiers');

INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('APPLY_TARGET_FREE_TRADE_ROUTE_JIAN_TEAMPVP_Modifiers', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("APPLY_TARGET_FREE_TRADE_ROUTE_JIAN_TEAMPVP_Modifiers","Amount","-1");
--通往其城市的贸易路线，发起者-2金币
/*INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP' , 'MODIFIER_CONGRESS_ATTACH_MODIFIER_TO_PLAYERTYPE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP' , 'ModifierId' , 'APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP_Modifiers');

INSERT INTO Modifiers (ModifierId , ModifierType)
    VALUES ('APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP_Modifiers', 'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS');
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP_Modifiers","YieldType","YIELD_GOLD");	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP_Modifiers","Amount","-2");*/
--实现
UPDATE ResolutionEffects SET ModifierId='APPLY_TARGET_FREE_TRADE_ROUTE_JIAN_TEAMPVP' where ResolutionEffectId="25";
/*INSERT INTO ResolutionEffects (ResolutionEffectId , ResolutionType,WhichEffect,ModifierId)
    VALUES ('26', 'WC_RES_TRADE_TREATY','2',"APPLY_INCREASES_TRADE_TO_GOLD_TO_PLAYER_JIAN_TEAMPVP");
*/
--测试
--UPDATE Resolutions SET EarliestEra='ERA_FUTURE' WHERE ResolutionType!='WC_RES_TRADE_TREATY';


--外交区建筑 
--领事馆 外交办
UPDATE Buildings SET Cost=120 WHERE BuildingType='BUILDING_CONSULATE';
UPDATE Buildings SET Cost=250 WHERE BuildingType='BUILDING_CHANCERY';

--格鲁吉亚 击杀+信仰
UPDATE ModifierArguments SET Value='70' WHERE ModifierId='TRAIT_LEADER_FAITH_KILLS'and Name='PercentDefeatedStrength';

--迦太基 狄多
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='COTHON_HEALFRIENDLY'and Name='Amount';

--中国 朝代更替10-》8
UPDATE ModifierArguments SET Value='8' WHERE ModifierId='TRAIT_CIVIC_BOOST'and Name='Amount';
UPDATE ModifierArguments SET Value='8' WHERE ModifierId='TRAIT_TECHNOLOGY_BOOST'and Name='Amount';

--丰稷女神
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'LOC_BELIEF_GODDESS_OF_THE_FENGJI_NAME', 'LOC_BELIEF_GODDESS_OF_THE_FENGJI_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_FOOD');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_PRODUCTION');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_GOLD1');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_GOLD2');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_GOLD3');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_GOLD4');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_PRODUCTION1');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_PRODUCTION2');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_PRODUCTION3');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_FENGJI', 'GODDESS_OF_THE_FENGJI_PRODUCTION4');
--条件 染料
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_RANLIAO_IN_PLOT_TEAMPVP', 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_RANLIAO_IN_PLOT_TEAMPVP', 'ResourceType', 'RESOURCE_DYES');
--条件 烟草
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_YANCAO_IN_PLOT_TEAMPVP', 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_YANCAO_IN_PLOT_TEAMPVP', 'ResourceType', 'RESOURCE_TOBACCO');
--条件 熏香
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_XUNXIANG_IN_PLOT_TEAMPVP', 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_XUNXIANG_IN_PLOT_TEAMPVP', 'ResourceType', 'RESOURCE_INCENSE');
--条件 珍珠
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_ZHENGZHU_IN_PLOT_TEAMPVP', 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_ZHENGZHU_IN_PLOT_TEAMPVP', 'ResourceType', 'RESOURCE_PEARLS');
--条件 有改良
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_ANY_IMPROVEMENT_IN_PLOT_FENGJI_TEAMPVP', 'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');
--有资源判定
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_REQUIREMENTS', 'REQUIRES_RANLIAO_IN_PLOT_TEAMPVP');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_REQUIREMENTS', 'REQUIRES_YANCAO_IN_PLOT_TEAMPVP');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_REQUIREMENTS', 'REQUIRES_XUNXIANG_IN_PLOT_TEAMPVP');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_REQUIREMENTS', 'REQUIRES_ZHENGZHU_IN_PLOT_TEAMPVP');	
--食物加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_FOOD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_FOOD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_FENGJI_REQUIREMENTS');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_FOOD', 'ModifierId','GODDESS_OF_THE_FENGJI_FOOD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_FOOD_MODIFIER', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_FOOD_MODIFIER', 'Amount', 1);

--有资源判定
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_2_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_2_REQUIREMENTS', 'REQUIRES_RANLIAO_IN_PLOT_TEAMPVP');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_2_REQUIREMENTS', 'REQUIRES_YANCAO_IN_PLOT_TEAMPVP');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_2_REQUIREMENTS', 'REQUIRES_XUNXIANG_IN_PLOT_TEAMPVP');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_FENGJI_2_REQUIREMENTS', 'REQUIRES_ZHENGZHU_IN_PLOT_TEAMPVP');	
--生产力加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_FENGJI_2_REQUIREMENTS');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION', 'ModifierId','GODDESS_OF_THE_FENGJI_PRODUCTION_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION_MODIFIER', 'Amount', 0);
	
--REQUIRES_RANLIAO_IN_PLOT_TEAMPVP
--有资源、改良判定
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS1', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS1', 'REQUIRES_RANLIAO_IN_PLOT_TEAMPVP');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS1', 'REQUIRES_ANY_IMPROVEMENT_IN_PLOT_FENGJI_TEAMPVP');
--食物加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_GOLD1', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_GOLD1_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS1');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_GOLD1', 'ModifierId','GODDESS_OF_THE_FENGJI_GOLD1_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_GOLD1_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_GOLD1_MODIFIER', 'Amount', 2);

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION1', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION1_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS1');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION1', 'ModifierId','GODDESS_OF_THE_FENGJI_PRODUCTION1_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION1_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION1_MODIFIER', 'Amount', 1);
--REQUIRES_YANCAO_IN_PLOT_TEAMPVP
--有资源、改良判定
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS2', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS2', 'REQUIRES_YANCAO_IN_PLOT_TEAMPVP');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS2', 'REQUIRES_ANY_IMPROVEMENT_IN_PLOT_FENGJI_TEAMPVP');
--食物加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD2', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD2_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS2');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD2', 'ModifierId','GODDESS_OF_THE_FENGJI_GOLD2_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD2_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD2_MODIFIER', 'Amount', 2);

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION2', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION2_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS2');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION2', 'ModifierId','GODDESS_OF_THE_FENGJI_PRODUCTION2_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION2_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION2_MODIFIER', 'Amount', 1);
--REQUIRES_XUNXIANG_IN_PLOT_TEAMPVP
--有资源、改良判定
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS3', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS3', 'REQUIRES_XUNXIANG_IN_PLOT_TEAMPVP');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS3', 'REQUIRES_ANY_IMPROVEMENT_IN_PLOT_FENGJI_TEAMPVP');
--食物加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD3', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD3_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS3');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD3', 'ModifierId','GODDESS_OF_THE_FENGJI_GOLD3_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD3_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD3_MODIFIER', 'Amount', 2);

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION3', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION3_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS3');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION3', 'ModifierId','GODDESS_OF_THE_FENGJI_PRODUCTION3_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION3_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION3_MODIFIER', 'Amount', 1);
--REQUIRES_ZHENGZHU_IN_PLOT_TEAMPVP
--有资源、改良判定
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS4', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS4', 'REQUIRES_ZHENGZHU_IN_PLOT_TEAMPVP');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
VALUES ('PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS4', 'REQUIRES_ANY_IMPROVEMENT_IN_PLOT_FENGJI_TEAMPVP');
--食物加成
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD4','MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD4_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS4');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD4', 'ModifierId','GODDESS_OF_THE_FENGJI_GOLD4_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD4_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
VALUES ('GODDESS_OF_THE_FENGJI_GOLD4_MODIFIER', 'Amount', 2);

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION4', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION4_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_ZIYUAN_GAILIANG_FENGJI_REQUIREMENTS4');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION4', 'ModifierId','GODDESS_OF_THE_FENGJI_PRODUCTION4_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION4_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_FENGJI_PRODUCTION4_MODIFIER', 'Amount', 1);
--祭祀建筑减锤
--拜火神庙
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_DAR_E_MEHR";
--宝塔
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_PAGODA";
--大教堂
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_CATHEDRAL";
--佛寺
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_WAT";
--礼拜堂
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_MEETING_HOUSE";
--清真寺
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_MOSQUE";
--窣堵波
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_STUPA";
UPDATE Building_YieldChanges SET YieldChange="1" WHERE BuildingType='BUILDING_STUPA' and YieldType="YIELD_FAITH";
--谒师所
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_GURDWARA";
--犹太教堂
UPDATE Buildings SET Cost="135" WHERE BuildingType="BUILDING_SYNAGOGUE";


--造船厂不翻倍
--造船厂
DELETE FROM Building_YieldDistrictCopies WHERE BuildingType='BUILDING_SHIPYARD' AND OldYieldType='YIELD_GOLD' AND NewYieldType='YIELD_PRODUCTION';
INSERT INTO Building_YieldChanges (BuildingType, YieldType,YieldChange)
VALUES
    ('BUILDING_SHIPYARD','YIELD_PRODUCTION','1');
--条件
INSERT INTO Requirements (RequirementId, RequirementType)
VALUES
    ('REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'		, 	'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name,Value)
VALUES
    ('REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP',     'DistrictType','DISTRICT_HARBOR');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY1'		, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY3'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY4'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY5'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY6'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY7'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY8'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY9'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY10'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY11'	, 	'REQUIREMENTSET_TEST_ALL'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY12'	, 	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY1'		, 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY1'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY2'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY3'	, 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY3'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY4', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY4'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY5', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY5'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY6', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY6'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY7', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY7'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY8', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY8'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY9', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY9'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY10', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY10'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY11', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY11'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY12', 	'REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY12');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY1'		, 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY3'	, 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY4', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY5', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY6', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY7', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY8', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY9', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY10', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY11', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP'),
    ('ZaoChuanChang_HAS_HIGH_ADJACENCY12', 	'REQUIRES_CITY_HAS_ZAOCHUANCHANG_TEAMPVP');

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY1'		, 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY3'	, 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY4', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY5', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY6', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY7', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY8', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY9', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY10', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY11', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY12', 	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT');

INSERT INTO RequirementArguments (RequirementId, Name,Value)
VALUES
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY1',     'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY3', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY4', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY5', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY6', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY7', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY8', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY9', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY10', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY11', 	'DistrictType','DISTRICT_HARBOR'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY12', 	'DistrictType','DISTRICT_HARBOR');

INSERT INTO RequirementArguments (RequirementId, Name,Value)
VALUES
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY1'		, 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY3'	, 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY4', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY5', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY6', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY7', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY8', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY9', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY10', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY11', 	'YieldType','YIELD_GOLD'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY12', 	'YieldType','YIELD_GOLD');

INSERT INTO RequirementArguments (RequirementId, Name,Value)
VALUES
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY1'		, 	'Amount','1'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY2', 	'Amount','2'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY3'	, 	'Amount','3'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY4', 	'Amount','4'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY5', 	'Amount','5'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY6', 	'Amount','6'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY7', 	'Amount','7'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY8', 	'Amount','8'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY9', 	'Amount','9'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY10', 	'Amount','10'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY11', 	'Amount','11'),
    ('REQUIRES_ZaoChuanChang_HAS_HIGH_ADJACENCY12', 	'Amount','12');

INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
VALUES
    ('ZaoChuanChang_MODIFIER_NEW1', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY1'),
    ('ZaoChuanChang_MODIFIER_NEW2', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY2'),
    ('ZaoChuanChang_MODIFIER_NEW3', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY3'),
    ('ZaoChuanChang_MODIFIER_NEW4', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY4'),
    ('ZaoChuanChang_MODIFIER_NEW5', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY5'),
    ('ZaoChuanChang_MODIFIER_NEW6', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY6'),
    ('ZaoChuanChang_MODIFIER_NEW7', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY7'),
    ('ZaoChuanChang_MODIFIER_NEW8', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY8'),
    ('ZaoChuanChang_MODIFIER_NEW9', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY9'),
    ('ZaoChuanChang_MODIFIER_NEW10', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY10'),
    ('ZaoChuanChang_MODIFIER_NEW11', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY11'),
    ('ZaoChuanChang_MODIFIER_NEW12', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 'ZaoChuanChang_HAS_HIGH_ADJACENCY12');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
VALUES
    ('ZaoChuanChang_MODIFIER_NEW1', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW2', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW3', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW4', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW5', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW6', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW7', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW8', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW9', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW10', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW11', 'YieldType', 'YIELD_PRODUCTION'),
    ('ZaoChuanChang_MODIFIER_NEW12', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
VALUES
    ('ZaoChuanChang_MODIFIER_NEW1', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW2', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW3', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW4', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW5', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW6', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW7', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW8', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW9', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW10', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW11', 'Amount', '1'),
    ('ZaoChuanChang_MODIFIER_NEW12', 'Amount', '1');

INSERT INTO BuildingModifiers (BuildingType, ModifierId)
VALUES
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW1'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW2'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW3'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW4'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW5'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW6'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW7'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW8'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW9'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW10'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW11'),
    ('BUILDING_SHIPYARD', 'ZaoChuanChang_MODIFIER_NEW12');

 --保护区 地基加成
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES
    ('DISTRICT_PRESERVE', 'BAOHUQU_FOOD'),
    ('DISTRICT_PRESERVE', 'BAOHUQU_PRODUCTION');
--
INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
    ('BAOHUQU_FOOD', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
VALUES
    ('BAOHUQU_FOOD', 'Amount', '1'),
    ('BAOHUQU_FOOD', 'YieldType', 'YIELD_FOOD');
--
INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
    ('BAOHUQU_PRODUCTION', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
VALUES
    ('BAOHUQU_PRODUCTION', 'Amount', '1'),
    ('BAOHUQU_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION');


--阿拉伯大学减价
UPDATE Buildings SET Cost=200 WHERE BuildingType='BUILDING_MADRASA';


--马其顿
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_TO_WORLDS_END', 'MAQIDUN_DAJUN_DIANSHU_1');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
VALUES
    ('MAQIDUN_DAJUN_DIANSHU_1', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT','PLAYER_HAS_POLITICAL_PHILOSOPHY_GYB_MAQIDUN');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
VALUES
    ('MAQIDUN_DAJUN_DIANSHU_1', 'Amount', '35'),
    ('MAQIDUN_DAJUN_DIANSHU_1', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL');

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_TO_WORLDS_END', 'MAQIDUN_DAJUN_DIANSHU_2');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
VALUES
    ('MAQIDUN_DAJUN_DIANSHU_2', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT','PLAYER_HAS_POLITICAL_PHILOSOPHY_MZZY_MAQIDUN');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
VALUES
    ('MAQIDUN_DAJUN_DIANSHU_2', 'Amount', '15'),
    ('MAQIDUN_DAJUN_DIANSHU_2', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL');


--需要 雇佣兵文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_GYB_MAQIDUN', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_GYB_MAQIDUN', 'CivicType', 'CIVIC_MERCENARIES');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_GYB_MAQIDUN', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_GYB_MAQIDUN');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_GYB_MAQIDUN', 'REQUIREMENTSET_TEST_ALL');


--需要 民族主义文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_MZZY_MAQIDUN', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_MZZY_MAQIDUN', 'CivicType', 'CIVIC_NATIONALISM');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_MZZY_MAQIDUN', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_MZZY_MAQIDUN');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_MZZY_MAQIDUN', 'REQUIREMENTSET_TEST_ALL');


--新埃及 拉美西斯二世 纪念碑+35%
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_RAMSES' , 'LAER_JIANBEI_BOOST_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('LAER_JIANBEI_BOOST_TEAMPVP' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('LAER_JIANBEI_BOOST_TEAMPVP'    , 'BuildingType' , 'BUILDING_MONUMENT'),
	('LAER_JIANBEI_BOOST_TEAMPVP'    , 'Amount'       , '35');

--武阿拉伯 军营建筑加信仰  BUILDING_STABLE  BUILDING_ARMORY BUILDING_MILITARY_ACADEMY
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_SALADIN_ALT' , 'TRAIT_WUALABO_JUNYING_XINYANG_1_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('TRAIT_WUALABO_JUNYING_XINYANG_1_TEAMPVP' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('TRAIT_WUALABO_JUNYING_XINYANG_1_TEAMPVP'    , 'BuildingType' , 'BUILDING_BARRACKS'),
	('TRAIT_WUALABO_JUNYING_XINYANG_1_TEAMPVP'    , 'YieldType' , 'YIELD_FAITH'),
	('TRAIT_WUALABO_JUNYING_XINYANG_1_TEAMPVP'    , 'Amount'       , '1');

INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_SALADIN_ALT' , 'TRAIT_WUALABO_JUNYING_XINYANG_2_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('TRAIT_WUALABO_JUNYING_XINYANG_2_TEAMPVP' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('TRAIT_WUALABO_JUNYING_XINYANG_2_TEAMPVP'    , 'BuildingType' , 'BUILDING_STABLE'),
	('TRAIT_WUALABO_JUNYING_XINYANG_2_TEAMPVP'    , 'YieldType' , 'YIELD_FAITH'),
	('TRAIT_WUALABO_JUNYING_XINYANG_2_TEAMPVP'    , 'Amount'       , '1');

INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_SALADIN_ALT' , 'TRAIT_WUALABO_JUNYING_XINYANG_3_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('TRAIT_WUALABO_JUNYING_XINYANG_3_TEAMPVP' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('TRAIT_WUALABO_JUNYING_XINYANG_3_TEAMPVP'    , 'BuildingType' , 'BUILDING_ARMORY'),
	('TRAIT_WUALABO_JUNYING_XINYANG_3_TEAMPVP'    , 'YieldType' , 'YIELD_FAITH'),
	('TRAIT_WUALABO_JUNYING_XINYANG_3_TEAMPVP'    , 'Amount'       , '1');

INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_SALADIN_ALT' , 'TRAIT_WUALABO_JUNYING_XINYANG_4_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('TRAIT_WUALABO_JUNYING_XINYANG_4_TEAMPVP' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('TRAIT_WUALABO_JUNYING_XINYANG_4_TEAMPVP'    , 'BuildingType' , 'BUILDING_MILITARY_ACADEMY'),
	('TRAIT_WUALABO_JUNYING_XINYANG_4_TEAMPVP'    , 'YieldType' , 'YIELD_FAITH'),
	('TRAIT_WUALABO_JUNYING_XINYANG_4_TEAMPVP'    , 'Amount'       , '1');

--波兰 UD减价
UPDATE Buildings SET Cost="100" WHERE BuildingType="BUILDING_SUKIENNICE";

--新美国 文美
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_ANTIQUES_AND_PARKS' , 'WENMEI_YULINMEILI_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('WENMEI_YULINMEILI_TEAMPVP' , 'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('WENMEI_YULINMEILI_TEAMPVP'    , 'FeatureType' , 'FEATURE_JUNGLE'),
	('WENMEI_YULINMEILI_TEAMPVP'    , 'Amount' , '1');

--巴比伦 主力军团
UPDATE Units SET Combat=14 WHERE UnitType='UNIT_BABYLONIAN_SABUM_KIBITTUM';


--新波斯 打满血 行政解锁+3-》+4
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_NADER_SHAH' , 'NADER_SHAH_COMBAT_ABILITY_TEAMPVP' );
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES
	('NADER_SHAH_COMBAT_ABILITY_TEAMPVP' , 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('NADER_SHAH_COMBAT_ABILITY_TEAMPVP' , 'AbilityType' , 'ABILITY_NADER_SHAH_COMBAT_TEAMP_PVP');
--能力
INSERT INTO Types (Type, Kind)
	VALUES ('ABILITY_NADER_SHAH_COMBAT_TEAMP_PVP', 'KIND_ABILITY');
INSERT INTO TypeTags (Type, Tag)
	VALUES ('ABILITY_NADER_SHAH_COMBAT_TEAMP_PVP', 'CLASS_ALL_COMBAT_UNITS');
INSERT INTO UnitAbilities (UnitAbilityType, Name ,Description ,Inactive)
	VALUES ('ABILITY_NADER_SHAH_COMBAT_TEAMP_PVP', 'LOC_TRAIT_LEADER_NADER_SHAH_TEAMPVP_NAME','LOC_ABILITY_NADER_SHAH_COMBAT_TEAMPVP_DESCRIPTION',1);
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	VALUES ('ABILITY_NADER_SHAH_COMBAT_TEAMP_PVP', 'NADER_SHAH_COMBAT_BUFF_TEAM_PVP');
--要求行政部门
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_NADER_SHAH_COMBAT_BUFF_TEAM_PVP', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_NADER_SHAH_COMBAT_BUFF_TEAM_PVP', 'CivicType', 'CIVIC_FEUDALISM');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('RequirementSets_NADER_SHAH_COMBAT_BUFF_TEAM_PVP', 'REQUIRES_NADER_SHAH_COMBAT_BUFF_TEAM_PVP');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('RequirementSets_NADER_SHAH_COMBAT_BUFF_TEAM_PVP', 'REQUIREMENTSET_TEST_ALL');
--
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId,OwnerRequirementSetId)
	VALUES
	('NADER_SHAH_COMBAT_BUFF_TEAM_PVP' , 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',"OPPONENT_IS_FULL_HEALTH_REQUIREMENTS","RequirementSets_NADER_SHAH_COMBAT_BUFF_TEAM_PVP");
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('NADER_SHAH_COMBAT_BUFF_TEAM_PVP' , 'Amount' , '1');
INSERT INTO ModifierStrings (ModifierId, Context,Text)
	VALUES 
	('NADER_SHAH_COMBAT_BUFF_TEAM_PVP','Preview','LOC_ABILITY_NADER_SHAH_COMBAT_TEAMPVP_DESCRIPTION');
--塔马利 开局砌砖ULK
INSERT INTO Modifiers (ModifierId , ModifierType ,RunOnce ,Permanent)
	VALUES
	('TRAIT_FREE_TECH_BOOST_WRITING_TAMALI_TEAMP_PVP' , 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',1,1);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('TRAIT_FREE_TECH_BOOST_WRITING_TAMALI_TEAMP_PVP' , 'TechType' , 'TECH_MASONRY');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_RELIGION_CITY_STATES' , 'TRAIT_FREE_TECH_BOOST_WRITING_TAMALI_TEAMP_PVP' );



--#丰灌女神：平原、草原的种植园+1食物、+1生产力、+1金币 
--条件 要求平原
/*INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_Fengguan_Goddess_TEAM_PVP_PINGYUAN', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_Fengguan_Goddess_TEAM_PVP_PINGYUAN', 'TerrainType', 'TERRAIN_PLAINS');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('RequirementSets_Fengguan_Goddess_TEAM_PVP_PINGYUAN', 'REQUIRES_Fengguan_Goddess_TEAM_PVP_PINGYUAN');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('RequirementSets_Fengguan_Goddess_TEAM_PVP_PINGYUAN', 'REQUIRES_PLOT_HAS_PLANTATION');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('RequirementSets_Fengguan_Goddess_TEAM_PVP_PINGYUAN', 'REQUIREMENTSET_TEST_ALL');
--条件 要求草原
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_Fengguan_Goddess_TEAM_PVP_CAOYUAN', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_Fengguan_Goddess_TEAM_PVP_CAOYUAN', 'TerrainType', 'TERRAIN_GRASS');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('RequirementSets_Fengguan_Goddess_TEAM_PVP_CAOYUAN', 'REQUIRES_Fengguan_Goddess_TEAM_PVP_CAOYUAN');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('RequirementSets_Fengguan_Goddess_TEAM_PVP_CAOYUAN', 'REQUIRES_PLOT_HAS_PLANTATION');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('RequirementSets_Fengguan_Goddess_TEAM_PVP_CAOYUAN', 'REQUIREMENTSET_TEST_ALL');
--
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_Fengguan_Goddess', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_Fengguan_Goddess', 'LOC_BELIEF_RELIGIOUS_Fengguan_Goddess_NAME', 'LOC_BELIEF_RELIGIOUS_Fengguan_Goddess_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Fengguan_Goddess', 'BELIEF_Fengguan_Goddess_PINGYUAN_Food');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Fengguan_Goddess', 'BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Fengguan_Goddess', 'BELIEF_Fengguan_Goddess_PINGYUAN_GOLD');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Fengguan_Goddess', 'BELIEF_Fengguan_Goddess_CAOYUAN_Food');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Fengguan_Goddess', 'BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_Fengguan_Goddess', 'BELIEF_Fengguan_Goddess_CAOYUAN_GOLD');
--平原食物
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_Food', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_Food', 'ModifierId','BELIEF_Fengguan_Goddess_PINGYUAN_Food_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_Food_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','RequirementSets_Fengguan_Goddess_TEAM_PVP_PINGYUAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_Food_MODIFIER', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_Food_MODIFIER', 'Amount','1');
--平原生产力
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION', 'ModifierId','BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','RequirementSets_Fengguan_Goddess_TEAM_PVP_PINGYUAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_PRODUCTION_MODIFIER', 'Amount','1');
--平原金币
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_GOLD', 'ModifierId','BELIEF_Fengguan_Goddess_PINGYUAN_GOLD_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','RequirementSets_Fengguan_Goddess_TEAM_PVP_PINGYUAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_GOLD_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_PINGYUAN_GOLD_MODIFIER', 'Amount','1');
--草原食物
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_Food', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_Food', 'ModifierId','BELIEF_Fengguan_Goddess_CAOYUAN_Food_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_Food_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','RequirementSets_Fengguan_Goddess_TEAM_PVP_CAOYUAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_Food_MODIFIER', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_Food_MODIFIER', 'Amount','1');
--草原生产力
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION', 'ModifierId','BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','RequirementSets_Fengguan_Goddess_TEAM_PVP_CAOYUAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_PRODUCTION_MODIFIER', 'Amount','1');
--草原金币
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_GOLD', 'ModifierId','BELIEF_Fengguan_Goddess_CAOYUAN_GOLD_MODIFIER');

INSERT INTO Modifiers(ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','RequirementSets_Fengguan_Goddess_TEAM_PVP_CAOYUAN');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_GOLD_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('BELIEF_Fengguan_Goddess_CAOYUAN_GOLD_MODIFIER', 'Amount','1');*/