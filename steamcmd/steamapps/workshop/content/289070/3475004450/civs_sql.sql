--PRAGMA foreign_keys = OFF; 
--无水
UPDATE GlobalParameters SET Value='3' WHERE  Name='CITY_POPULATION_NO_WATER';	
-- 渔船+1锤
UPDATE Improvement_YieldChanges SET YieldChange=1 WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS' AND YieldType='YIELD_PRODUCTION';
-- 渔船+0粮
--UPDATE Improvement_YieldChanges SET YieldChange=1 WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS' AND YieldType='YIELD_FOOD';

--INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType, YieldChange)
	--VALUES ('IMPROVEMENT_FISHING_BOATS' , 'YIELD_PRODUCTION', '1');
	
--礁石+0生产力
--UPDATE Feature_YieldChanges SET YieldChange=0 WHERE FeatureType='FEATURE_REEF' AND YieldType='YIELD_PRODUCTION';
--冰
--UPDATE GlobalParameters SET Value =0 WHERE Name='ICE_TILES_PERCENT';
--沿海住房+1
UPDATE GlobalParameters SET Value='4' WHERE  Name='CITY_POPULATION_COAST';
--移除海油
--DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_OIL" and TerrainType="TERRAIN_COAST";
--移除茶叶与草原
--DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_TEA" and TerrainType="TERRAIN_GRASS";
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_TEA" and TerrainType="TERRAIN_GRASS_HILLS";
INSERT INTO Resource_YieldChanges (ResourceType , YieldType ,YieldChange )
	VALUES ('RESOURCE_TEA' , 'YIELD_PRODUCTION' , '1');
--移除大理石与草原
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_MARBLE" and TerrainType="TERRAIN_GRASS";
--咖啡取消关联草原、烟草取消关联草原平原
--咖啡
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_COFFEE" and TerrainType="TERRAIN_GRASS";
--盐
INSERT INTO Resource_YieldChanges (ResourceType , YieldType ,YieldChange )
	VALUES ('RESOURCE_SALT' , 'YIELD_PRODUCTION' , '1');
--烟草
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_TOBACCO" and TerrainType="TERRAIN_GRASS";
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_TOBACCO" and TerrainType="TERRAIN_PLAINS";
--移除柑橘关联平原
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_CITRUS" and TerrainType="TERRAIN_PLAINS";
INSERT INTO Resource_YieldChanges (ResourceType , YieldType ,YieldChange )
	VALUES ('RESOURCE_CITRUS' , 'YIELD_PRODUCTION' , '1');
UPDATE Resource_YieldChanges SET YieldChange="1" WHERE ResourceType="RESOURCE_CITRUS" and YieldType="YIELD_FOOD";
--移除蜂蜜关联草原
DELETE FROM Resource_ValidTerrains Where ResourceType="RESOURCE_HONEY" and TerrainType="TERRAIN_GRASS";
--水银关联草原
INSERT INTO Resource_ValidTerrains (ResourceType, TerrainType)
	VALUES ('RESOURCE_MERCURY', 'TERRAIN_GRASS');
--熏香关联草原
INSERT INTO Resource_ValidTerrains (ResourceType, TerrainType)
	VALUES ('RESOURCE_INCENSE', 'TERRAIN_GRASS');
	
-- 专家加强
--UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_CULTURE' 		AND DistrictType="DISTRICT_ACROPOLIS";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_SCIENCE' 		AND DistrictType="DISTRICT_CAMPUS";
--商业中心
UPDATE District_CitizenYieldChanges SET YieldChange=6 WHERE YieldType='YIELD_GOLD' 			AND DistrictType="DISTRICT_SUGUBA";
UPDATE District_CitizenYieldChanges SET YieldChange=6 WHERE YieldType='YIELD_GOLD' 			AND DistrictType="DISTRICT_COMMERCIAL_HUB";
--圣地
UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_FAITH' 		AND DistrictType="DISTRICT_HOLY_SITE";
UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_FAITH' 		AND DistrictType="DISTRICT_LAVRA";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_SCIENCE' 		AND DistrictType="DISTRICT_SEOWON";
--UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_CULTURE' 		AND DistrictType="DISTRICT_THEATER";
--工业区
UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_INDUSTRIAL_ZONE";
UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_HANSA";
UPDATE District_CitizenYieldChanges SET YieldChange=3 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_OPPIDUM";
--港口
UPDATE District_CitizenYieldChanges SET YieldChange=4 WHERE YieldType='YIELD_GOLD' 	AND DistrictType="DISTRICT_HARBOR";
UPDATE District_CitizenYieldChanges SET YieldChange=4 WHERE YieldType='YIELD_GOLD' 	AND DistrictType="DISTRICT_ROYAL_NAVY_DOCKYARD";
UPDATE District_CitizenYieldChanges SET YieldChange=4 WHERE YieldType='YIELD_GOLD' 	AND DistrictType="DISTRICT_COTHON";
--军营
UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_IKANDA";
UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_ENCAMPMENT";
UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_THANH";
--解锁城市防御 城墙
UPDATE ModifierArguments SET Value='130' WHERE ModifierId='STEEL_UNLOCK_URBAN_DEFENSES' and Name='DefenseValue';
UPDATE Buildings SET Cost=80,OuterDefenseHitPoints=50,OuterDefenseStrength=0 WHERE BuildingType='BUILDING_WALLS';
UPDATE Buildings SET Cost=130,OuterDefenseHitPoints=40,OuterDefenseStrength=2 WHERE BuildingType='BUILDING_CASTLE';
UPDATE Buildings SET Cost=170,OuterDefenseHitPoints=40,OuterDefenseStrength=2 WHERE BuildingType='BUILDING_STAR_FORT';
--城市防御远程
UPDATE GlobalParameters SET Value='40' WHERE  Name='COMBAT_DEFENSE_DAMAGE_PERCENT_RANGED';


--谒见厅+2食物
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_TALL' , 'GOV_TALL_FOOD_BUFF');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('GOV_TALL_FOOD_BUFF' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' , 'CITY_HAS_GOVERNOR_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GOV_TALL_FOOD_BUFF' , 'YieldType' , 'YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GOV_TALL_FOOD_BUFF' , 'Amount' , '2');
--谒见厅+8%发展速度
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES ('BUILDING_GOV_TALL' , 'GOV_TALL_CITY_GROWTH_BUFF');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('GOV_TALL_CITY_GROWTH_BUFF' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH' , 'CITY_HAS_GOVERNOR_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GOV_TALL_CITY_GROWTH_BUFF' , 'Amount' , '7');
--军阀造兵+15%产能
--DELETE FROM BuildingModifiers WHERE ModifierId='GOV_PRODUCTION_BOOST_FROM_CAPTURE';
--DELETE FROM ModifierArguments WHERE ModifierId='GOV_PRODUCTION_BOOST_FROM_CAPTURE';
--DELETE FROM Modifiers WHERE ModifierId='GOV_PRODUCTION_BOOST_FROM_CAPTURE';
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES 
	('BUILDING_GOV_CONQUEST' , 'GOV_CONQUEST_PRODUCTION_BONUS'),
	('BUILDING_GOV_CONQUEST' , 'GOV_CONQUEST_REDUCED_MAINTENANCE');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES 
	('GOV_CONQUEST_PRODUCTION_BONUS'    , 'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION');
	--('GOV_CONQUEST_REDUCED_MAINTENANCE' , 'MODIFIER_PLAYER_ADJUST_UNIT_MAINTENANCE_DISCOUNT'       );
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES 
	('GOV_CONQUEST_PRODUCTION_BONUS'    , 'Amount'   , '0'             ),
	('GOV_CONQUEST_PRODUCTION_BONUS'    , 'StartEra' , 'ERA_ANCIENT'    ),
	('GOV_CONQUEST_PRODUCTION_BONUS'    , 'EndEra'   , 'ERA_INFORMATION');
	
--同盟--
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='ALLIANCE_ADJUST_COMBAT_STRENGTH' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ALLIANCE_ADD_CULTURE_TO_ORIGIN_TRADE_ROUTE' AND Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='ALLIANCE_ADJUST_RELIGIOUS_COMBAT_STRENGTH' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ALLIANCE_ADD_SCIENCE_TO_ORIGIN_TRADE_ROUTE' AND Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE' AND Name='Amount';

--铝
--UPDATE Resource_Consumption SET ImprovedExtractionRate='4' Where ResourceType="RESOURCE_ALUMINUM";
--油
--UPDATE Resource_Consumption SET ImprovedExtractionRate='6' Where ResourceType="RESOURCE_OIL";
--铝 
UPDATE Resources SET Frequency='13' Where ResourceType="RESOURCE_ALUMINUM";	
--油
UPDATE Resources SET Frequency='21' Where ResourceType="RESOURCE_OIL";
--硝石
UPDATE Resources SET Frequency='16' Where ResourceType="RESOURCE_NITER";
--煤
UPDATE Resources SET Frequency='16' Where ResourceType="RESOURCE_COAL";	

--资源关联
INSERT INTO Resource_ValidTerrains (ResourceType, TerrainType)
	VALUES ('RESOURCE_OIL', 'TERRAIN_GRASS');
INSERT INTO Resource_ValidTerrains (ResourceType, TerrainType)
	VALUES ('RESOURCE_OIL', 'TERRAIN_PLAINS');	
INSERT INTO Resource_ValidTerrains (ResourceType, TerrainType)
	VALUES ('RESOURCE_ALUMINUM', 'TERRAIN_GRASS');	

-- 海油开发
UPDATE Improvements SET PrereqTech='TECH_REFINING' WHERE ImprovementType='IMPROVEMENT_OFFSHORE_OIL_RIG';
	/*
-- +2 oil from mil acadamies
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES
	('BUILDING_MILITARY_ACADEMY', 'OIL_FROM_MIL_ACAD_BBG');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('OIL_FROM_MIL_ACAD_BBG', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'PLAYER_CAN_SEE_OIL_CPLMOD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('OIL_FROM_MIL_ACAD_BBG', 'ResourceType', 'RESOURCE_OIL'),
	('OIL_FROM_MIL_ACAD_BBG', 'Amount', '2');
-- +2 alum from airports
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES
	('BUILDING_AIRPORT', 'ALUM_FROM_AIRPORT_BBG');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ALUM_FROM_AIRPORT_BBG', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'PLAYER_CAN_SEE_ALUMINUM_CPLMOD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ALUM_FROM_AIRPORT_BBG', 'ResourceType', 'RESOURCE_ALUMINUM'),
	('ALUM_FROM_AIRPORT_BBG', 'Amount', '2');
	*/

-- 城市守护女神 35%	
UPDATE ModifierArguments SET Value='55' WHERE ModifierId='CITY_PATRON_GODDESS_DISTRICT_PRODUCTION_MODIFIER';

-- 信仰守护
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='DEFENDER_OF_FAITH_COMBAT_BONUS_MODIFIER';
-- 十字军
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='JUST_WAR_COMBAT_BONUS_MODIFIER';

-- 宗教偶像
UPDATE ModifierArguments SET Value=3 WHERE ModifierId='RELIGIOUS_IDOLS_BONUS_MINE_FAITH_MODIFIER' and Name='Amount';
UPDATE ModifierArguments SET Value=3 WHERE ModifierId='RELIGIOUS_IDOLS_LUXURY_MINE_FAITH_MODIFIER' and Name='Amount';
-- 锻造之神
UPDATE ModifierArguments SET Value='15' WHERE ModifierId='GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER' and Name='Amount';
UPDATE ModifierArguments SET Value='ERA_INFORMATION' WHERE ModifierId='GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER' and Name='EndEra';
-- 主神纪念碑
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER' and Name='Amount';
UPDATE ModifierArguments SET Value='ERA_INFORMATION' WHERE ModifierId='MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER' AND Name='EndEra';
--石圈+2信仰+1信仰
 INSERT INTO BeliefModifiers(BeliefType, ModifierId)
	VALUES ('BELIEF_STONE_CIRCLES', 'STONE_CIRCLES_QUARRY_GOLD');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_QUARRY_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD', 'ModifierId','STONE_CIRCLES_QUARRY_GOLD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD_MODIFIER', 'YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD_MODIFIER', 'Amount',1); 

--共享教堂
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='SIMULTANEUM_BUILDING_YIELDS_HIGH_ADJACENCY' and Name='Amount';
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='SIMULTANEUM_BUILDING_YIELDS_HIGH_POP' and Name='Amount';

-- 合唱圣歌
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='CHORAL_MUSIC_SHRINE_CULTURE_MODIFIER' and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='CHORAL_MUSIC_TEMPLE_CULTURE_MODIFIER' and Name='Amount';


--信条
-- Lay Ministry now +2 Culture and +2 Faith per Theater and Holy Site
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='LAY_MINISTRY_CULTURE_DISTRICTS_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='LAY_MINISTRY_FAITH_DISTRICTS_MODIFIER' AND Name='Amount';

UPDATE ModifierArguments SET Value='2' WHERE ModifierId='STEWARDSHIP_GOLD_DISTRICTS_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='STEWARDSHIP_SCIENCE_DISTRICTS_MODIFIER' AND Name='Amount';

--夸文化信仰
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='CROSS_CULTURAL_DIALOGUE_SCIENCE_FOREIGN_FOLLOWER_MODIFIER' AND Name='PerXItems';
--普世教会
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='WORLD_CHURCH_CULTURE_FOREIGN_FOLLOWER_MODIFIER' AND Name='PerXItems';
--朝圣
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='PILGRIMAGE_FAITH_FOREIGN_CITY_MODIFIER' AND Name='Amount';
--教会财产
--UPDATE ModifierArguments SET Value='4' WHERE ModifierId='CHURCH_PROPERTY_GOLD_FOREIGN_CITY_MODIFIER' AND Name='Amount';
--什一税
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='TITHE_GOLD_FOLLOWER_MODIFIER' AND Name='PerXItems';
--禅修
UPDATE RequirementArguments SET Value='2' WHERE RequirementId='REQUIRES_CITY_HAS_2_SPECIALTY_DISTRICTS' AND Name='Amount';

--粮仓
--UPDATE Buildings SET Cost=65  WHERE BuildingType='BUILDING_GRANARY';

--拦洪坝
UPDATE Buildings SET Cost="40",PrereqTech="TECH_ELECTRICITY" WHERE BuildingType="BUILDING_FLOOD_BARRIER";
UPDATE Buildings_XP2 SET CostMultiplierPerTile="0",CostMultiplierPerSeaLevel="0" WHERE BuildingType="BUILDING_FLOOD_BARRIER";

--大学
--UPDATE Building_YieldChanges SET YieldChange=5 WHERE BuildingType='BUILDING_UNIVERSITY';
--UPDATE Building_YieldChanges SET YieldChange=5 WHERE BuildingType='BUILDING_MADRASA';

--兵营建筑+1产能
UPDATE Building_YieldChanges SET YieldChange="2" WHERE BuildingType='BUILDING_ORDU' and YieldType="YIELD_PRODUCTION";
UPDATE Building_YieldChanges SET YieldChange="2" WHERE BuildingType='BUILDING_BASILIKOI_PAIDES';
UPDATE Building_YieldChanges SET YieldChange="2" WHERE BuildingType='BUILDING_BARRACKS';
UPDATE Building_YieldChanges SET YieldChange="3" WHERE BuildingType='BUILDING_ARMORY';
UPDATE Building_YieldChanges SET YieldChange="4" WHERE BuildingType='BUILDING_MILITARY_ACADEMY';
UPDATE Building_YieldChanges SET YieldChange="2" WHERE BuildingType='BUILDING_STABLE';

--工业区建筑

UPDATE Building_YieldChanges SET YieldChange="4"  WHERE BuildingType='BUILDING_WORKSHOP';

--商业区建筑
--银行
UPDATE Building_YieldChanges SET YieldChange=7 WHERE BuildingType="BUILDING_BANK" and YieldType="YIELD_GOLD";
UPDATE Buildings SET Cost=250 WHERE BuildingType='BUILDING_BANK';
--证卷交易所
UPDATE Building_YieldChanges SET YieldChange=6 WHERE BuildingType="BUILDING_STOCK_EXCHANGE" and YieldType="YIELD_GOLD";

--剧院广场建筑
--博物馆
UPDATE Building_YieldChanges SET YieldChange=3 WHERE BuildingType="BUILDING_MUSEUM_ART" and YieldType="YIELD_CULTURE";
UPDATE Building_YieldChanges SET YieldChange=3 WHERE BuildingType="BUILDING_MUSEUM_ARTIFACT" and YieldType="YIELD_CULTURE";
--广播中心
UPDATE Building_YieldChanges SET YieldChange=3 WHERE BuildingType="BUILDING_BROADCAST_CENTER" and YieldType="YIELD_CULTURE";
UPDATE Building_YieldChanges SET YieldChange=3 WHERE BuildingType="BUILDING_FILM_STUDIO" and YieldType="YIELD_CULTURE";

--拦洪坝
UPDATE Buildings SET Cost="40",PrereqTech="TECH_ELECTRICITY" WHERE BuildingType="BUILDING_FLOOD_BARRIER";

--竞技场辐射
UPDATE Buildings SET Cost="150" WHERE BuildingType="BUILDING_ARENA";
--UPDATE Buildings SET RegionalRange="6",Description="LOC_BUILDING_ZOO_DESCRIPTION2",Entertainment="1" WHERE BuildingType="BUILDING_ARENA";
--DELETE FROM Building_YieldChanges  WHERE BuildingType='BUILDING_ARENA' and YieldType="YIELD_CULTURE";
UPDATE Building_YieldChanges SET YieldChange="2" WHERE BuildingType='BUILDING_ARENA' and YieldType="YIELD_CULTURE";


--武僧
UPDATE Units SET Cost=100,Combat=36,BaseMoves=3 WHERE UnitType='UNIT_WARRIOR_MONK'; 
--远古-30%产能
--侦察兵系
--高地
UPDATE Units SET Combat=55,Maintenance=2,BaseSightRange=3,BaseMoves=4 WHERE UnitType='UNIT_SCOTTISH_HIGHLANDER';
UPDATE Units SET Combat=25,Maintenance=1,BaseSightRange=3 WHERE UnitType='UNIT_SKIRMISHER';
--游骑兵
UPDATE Units SET Combat=50,Maintenance=2,BaseSightRange=3,BaseMoves=4 WHERE UnitType='UNIT_RANGER';
--特种部队
UPDATE Units SET Combat=70,Maintenance=4,BaseSightRange=3,BaseMoves=5 WHERE UnitType='UNIT_SPEC_OPS';

--弓箭
UPDATE Units SET Cost=60 WHERE UnitType='UNIT_ARCHER';
--66
--UPDATE Units SET Cost=24 WHERE UnitType='UNIT_SLINGER';
--棒子
--UPDATE Units SET MandatoryObsoleteTech="TECH_SCIENTIFIC_THEORY" WHERE UnitType='UNIT_WARRIOR';
--猴子
--UPDATE Units SET Cost=21 WHERE UnitType='UNIT_SCOUT';
--克里猴子
--UPDATE Units SET Cost=30 WHERE UnitType='UNIT_CREE_OKIHTCITAW';
--枪兵
UPDATE Units SET Cost=60,Maintenance=0,MandatoryObsoleteTech="TECH_MILITARY_TACTICS" WHERE UnitType='UNIT_SPEARMAN';
--希腊矛
UPDATE Units SET MandatoryObsoleteTech="TECH_MILITARY_TACTICS" WHERE UnitType='UNIT_GREEK_HOPLITE';
--战车
--UPDATE Units SET Cost=45 WHERE UnitType='UNIT_HEAVY_CHARIOT';
UPDATE Units SET MandatoryObsoleteTech="TECH_MILITARY_SCIENCE" WHERE UnitType="UNIT_HEAVY_CHARIOT";
--StrategicResource="RESOURCE_IRON"
--INSERT INTO Units_XP2 (ResourceMaintenanceAmount,ResourceCost,ResourceMaintenanceType,UnitType)
--	VALUES ('0','20','RESOURCE_IRON','UNIT_HEAVY_CHARIOT');
--INSERT SET ResourceMaintenanceAmount=0 , ResourceCost=20 , ResourceMaintenanceType="RESOURCE_IRON" WHERE UnitType='UNIT_HEAVY_CHARIOT';
--桨帆船
--UPDATE Units SET Cost=45 WHERE UnitType='UNIT_GALLEY';
--四段帆船
--UPDATE Units SET Cost=96 WHERE UnitType='UNIT_QUADRIREME';




--古典中世纪-20%产能
--攻城塔
UPDATE Units SET BaseMoves=3,Cost=80 WHERE UnitType='UNIT_SIEGE_TOWER';
--攻城锤
UPDATE Units SET BaseMoves=3,Cost=50 WHERE UnitType='UNIT_BATTERING_RAM';
--骑手
--UPDATE Units SET Cost=64,BaseMoves=4 WHERE UnitType='UNIT_HORSEMAN';
--铁剑
UPDATE Units SET Combat=36,MandatoryObsoleteTech="TECH_SCIENTIFIC_THEORY" WHERE UnitType='UNIT_SWORDSMAN';
--石弩
UPDATE Units SET Cost=90,Combat=20,BaseMoves=3 WHERE UnitType='UNIT_CATAPULT';
--长矛兵
UPDATE Units SET Combat=43,Cost=160,Maintenance=1,MandatoryObsoleteTech="TECH_BANKING" WHERE UnitType='UNIT_PIKEMAN';
--弩手
UPDATE Units SET Combat=32,RangedCombat=42 WHERE UnitType='UNIT_CROSSBOWMAN';
--散兵
--UPDATE Units SET Cost=120 WHERE UnitType='UNIT_SKIRMISHER';
--军事工程师
UPDATE Routes_XP2 SET BuildWithUnitChargeCost='0' WHERE RouteType='ROUTE_ANCIENT_ROAD';
UPDATE Routes_XP2 SET BuildWithUnitChargeCost='0' WHERE RouteType='ROUTE_MEDIEVAL_ROAD';
UPDATE Routes_XP2 SET BuildWithUnitChargeCost='0' WHERE RouteType='ROUTE_INDUSTRIAL_ROAD';
UPDATE Routes_XP2 SET BuildWithUnitChargeCost='0' WHERE RouteType='ROUTE_MODERN_ROAD';
UPDATE Units SET BaseMoves=4,Cost=150 WHERE UnitType='UNIT_MILITARY_ENGINEER';
--追猎者
UPDATE Units SET Cost=190,BaseMoves=6 WHERE UnitType='UNIT_COURSER';
--马镫
UPDATE Units SET Cost=210 WHERE UnitType='UNIT_KNIGHT';

--文艺复兴工业-10%产能
--火枪手
UPDATE Units SET BaseMoves=3,Combat=55 WHERE UnitType='UNIT_MUSKETMAN';
--硝石炮
UPDATE Units SET BaseMoves=3,Cost=210,Combat=40 WHERE UnitType='UNIT_BOMBARD';
--枪刺
UPDATE Units SET Cost=220,Maintenance=2,MandatoryObsoleteTech="TECH_CHEMISTRY" WHERE UnitType='UNIT_PIKE_AND_SHOT';
UPDATE Units SET PrereqTech='TECH_BANKING' WHERE UnitType='UNIT_PIKE_AND_SHOT';
--野战炮
--UPDATE Units SET Cost=267,Combat=50,RangedCombat=59 WHERE UnitType='UNIT_FIELD_CANNON';
--胸甲骑兵
--UPDATE Units SET Cost=297,Combat=64 WHERE UnitType='UNIT_CUIRASSIER';
UPDATE Units SET PrereqTech='TECH_MILITARY_SCIENCE' WHERE UnitType='UNIT_CUIRASSIER';
--近代骑兵
UPDATE Units SET Cost=320,Combat=61,BaseMoves=6 WHERE UnitType='UNIT_CAVALRY';
--轻快
--UPDATE Units SET Cost=216 WHERE UnitType='UNIT_CARAVEL';
--护卫舰
--UPDATE Units SET Cost=252 WHERE UnitType='UNIT_FRIGATE';

--现代以后
--坦克
UPDATE Units SET BaseMoves=5,Combat=81 WHERE UnitType='UNIT_TANK';
--现代坦克
UPDATE Units SET BaseMoves=5,Combat=95,PrereqTech='TECH_NANOTECHNOLOGY',Cost=660 WHERE UnitType='UNIT_MODERN_ARMOR';
--反坦克
UPDATE Units SET Cost=340,Maintenance=3,Combat=73,BaseMoves=3 WHERE UnitType='UNIT_AT_CREW';
--现代反坦克
UPDATE Units SET Cost=495,Maintenance=4,Combat=87,BaseMoves=3 WHERE UnitType='UNIT_MODERN_AT';
UPDATE Units SET PrereqTech='TECH_SATELLITES' WHERE UnitType='UNIT_MODERN_AT';
--步兵
UPDATE Units SET Cost=400,BaseMoves=3 WHERE UnitType='UNIT_INFANTRY';
--机关枪队
UPDATE Units SET Combat=70,RangedCombat=81 WHERE UnitType='UNIT_MACHINE_GUN';
--机械化步兵
UPDATE Units SET Cost=600,Combat=87,BaseMoves=3,Maintenance=6,PrereqTech='TECH_ROCKETRY' WHERE UnitType='UNIT_MECHANIZED_INFANTRY';
UPDATE Units SET StrategicResource="RESOURCE_NITER" WHERE UnitType="UNIT_INFANTRY";
UPDATE Units SET StrategicResource="RESOURCE_NITER" WHERE UnitType="UNIT_MECHANIZED_INFANTRY";
UPDATE Units_XP2 SET ResourceMaintenanceAmount=0 , ResourceCost=20 , ResourceMaintenanceType="RESOURCE_NITER" WHERE UnitType='UNIT_INFANTRY';
UPDATE Units_XP2 SET ResourceMaintenanceAmount=0 , ResourceCost=20 , ResourceMaintenanceType="RESOURCE_NITER" WHERE UnitType='UNIT_MECHANIZED_INFANTRY';
--直升机
UPDATE Units SET BaseMoves=5,Combat=86,Cost=540 WHERE UnitType='UNIT_HELICOPTER';
UPDATE Units SET StrategicResource="RESOURCE_OIL" WHERE UnitType="UNIT_HELICOPTER";
UPDATE Units_XP2 SET ResourceMaintenanceAmount=1 , ResourceCost=1 , ResourceMaintenanceType="RESOURCE_OIL" WHERE UnitType='UNIT_HELICOPTER';
--航空母舰
UPDATE Units SET Cost=400 WHERE UnitType='UNIT_AIRCRAFT_CARRIER';

--防空炮
UPDATE Units SET Cost=400,BaseMoves=2 WHERE UnitType='UNIT_ANTIAIR_GUN';
UPDATE Units SET AntiAirCombat=92 WHERE UnitType='UNIT_ANTIAIR_GUN';
UPDATE Units SET PrereqTech='TECH_REPLACEABLE_PARTS' WHERE UnitType='UNIT_ANTIAIR_GUN';
--防空车
UPDATE Units SET Cost=520,BaseMoves=3 WHERE UnitType='UNIT_MOBILE_SAM';
UPDATE Units SET AntiAirCombat=105 WHERE UnitType='UNIT_MOBILE_SAM';
--大炮--
UPDATE Units SET BaseMoves=3,Cost=320,Combat=60,Bombard=75  WHERE UnitType='UNIT_ARTILLERY';
--火箭炮--
UPDATE Units SET BaseMoves=3,Cost=510,Combat=75,Bombard=90  WHERE UnitType='UNIT_ROCKET_ARTILLERY';
--双翼机
UPDATE Units SET Combat=85,RangedCombat=85 WHERE UnitType='UNIT_BIPLANE';
--战斗机
UPDATE Units SET Combat=95,RangedCombat=95 WHERE UnitType='UNIT_FIGHTER';
--P51
UPDATE Units SET Combat=95,RangedCombat=95 WHERE UnitType='UNIT_AMERICAN_P51';
--轰炸机
UPDATE Units SET Combat=80,Bombard=105,Range=7  WHERE UnitType='UNIT_BOMBER';
--隐形战斗
UPDATE Units SET Combat=105,RangedCombat=105 WHERE UnitType='UNIT_JET_FIGHTER';
--隐形轰炸机
UPDATE Units SET Bombard=115,Combat=85,Range=8  WHERE UnitType='UNIT_JET_BOMBER'; 
--移除优先目标
UPDATE UnitCommands SET VisibleInUI=0 WHERE CommandType='UNITCOMMAND_PRIORITY_TARGET';
--UPDATE WMDs SET Cost= 1600 Where WeaponType="WMD_NUCLEAR_DEVICE";
--UPDATE WMDs SET Cost= 2000 Where WeaponType="WMD_THERMONUCLEAR_DEVICE";

--教育家
UPDATE ModifierArguments SET Value='0.6' WHERE ModifierId='CONNOISSEUR_CULTURE_CITIZEN' AND Name='Amount';
UPDATE ModifierArguments SET Value='0.8' WHERE ModifierId='RESEARCHER_SCIENCE_CITIZEN' AND Name='Amount';

--护卫舰+硝石
--UPDATE Units_XP2 SET ResourceCost="30" WHERE UnitType="UNIT_FRIGATE";
--戎克船
UPDATE Units SET StrategicResource="RESOURCE_NITER" WHERE UnitType="UNIT_INDONESIAN_JONG";
INSERT INTO Units_XP2 (UnitType,ResourceCost)
	VALUES ('UNIT_INDONESIAN_JONG','20');
--米舰
UPDATE Units SET Combat=63,RangedCombat=73,AntiAirCombat=85 WHERE UnitType='UNIT_BRAZILIAN_MINAS_GERAES';
--战舰
UPDATE Units SET AntiAirCombat=90 WHERE UnitType='UNIT_BATTLESHIP';
--驱逐舰
UPDATE Units SET AntiAirCombat=95 WHERE UnitType='UNIT_DESTROYER';
--导弹巡洋舰
UPDATE Units SET AntiAirCombat=105 WHERE UnitType='UNIT_MISSILE_CRUISER';
--时代进程
--UPDATE Eras_XP1 SET GameEraMinimumTurns='38' WHERE  EraType='ERA_CLASSICAL';
--UPDATE Eras_XP1 SET GameEraMaximumTurns='38' WHERE  EraType='ERA_CLASSICAL';
--UPDATE Eras_XP1 SET GameEraMinimumTurns='38' WHERE  EraType='ERA_MEDIEVAL';
--UPDATE Eras_XP1 SET GameEraMaximumTurns='38' WHERE  EraType='ERA_MEDIEVAL';
UPDATE Eras_XP1 SET GameEraMinimumTurns='30' WHERE  EraType='ERA_RENAISSANCE';--文艺复兴
--UPDATE Eras_XP1 SET GameEraMaximumTurns='38' WHERE  EraType='ERA_RENAISSANCE';
UPDATE Eras_XP1 SET GameEraMinimumTurns='30' WHERE  EraType='ERA_INDUSTRIAL';
--UPDATE Eras_XP1 SET GameEraMaximumTurns='38' WHERE  EraType='ERA_INDUSTRIAL';
UPDATE Eras_XP1 SET GameEraMinimumTurns='30' WHERE  EraType='ERA_MODERN';
--UPDATE Eras_XP1 SET GameEraMaximumTurns='38' WHERE  EraType='ERA_MODERN';
UPDATE Eras_XP1 SET GameEraMinimumTurns='30' WHERE  EraType='ERA_ATOMIC';
--UPDATE Eras_XP1 SET GameEraMaximumTurns='38' WHERE  EraType='ERA_ATOMIC';

--灾害系统
--陆地改良摧毁
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_FLOOD_MAJOR'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_FLOOD_1000_YEAR'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_KILIMANJARO_CATASTROPHIC'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_VESUVIUS_MEGACOLOSSAL'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_VOLCANO_CATASTROPHIC'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_VOLCANO_MEGACOLOSSAL'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_SIGNIFICANT'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_CRIPPLING'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_DUST_STORM_GRADIENT'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_DUST_STORM_HABOOB'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_TORNADO_FAMILY'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_TORNADO_OUTBREAK'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_HURRICANE_CAT_4'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_HURRICANE_CAT_5'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_TORNADO_FAMILY'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_JUNGLE_FIRE'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_FOREST_FIRE'and DamageType="IMPROVEMENT_DESTROYED";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE DamageType="IMPROVEMENT_DESTROYED";
--死亡平民单位
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_FLOOD_MAJOR'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_FLOOD_1000_YEAR'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_KILIMANJARO_CATASTROPHIC'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_VESUVIUS_MEGACOLOSSAL'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_VOLCANO_CATASTROPHIC'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_VOLCANO_MEGACOLOSSAL'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_CRIPPLING'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_DUST_STORM_HABOOB'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_TORNADO_OUTBREAK'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_HURRICANE_CAT_5'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_NUCLEAR_ACCIDENT_MAJOR'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_NUCLEAR_ACCIDENT_CATASTROPHIC'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_FOREST_FIRE'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_JUNGLE_FIRE'and DamageType="UNIT_KILLED_CIVILIAN";
UPDATE RandomEvent_Damages SET Percentage='0' WHERE DamageType="UNIT_KILLED_CIVILIAN";

--暴风雪
--UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_SIGNIFICANT'and DamageType="DISTRICT_PILLAGED";
--UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_SIGNIFICANT'and DamageType="BUILDING_PILLAGED";
--UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_CRIPPLING'and DamageType="DISTRICT_PILLAGED";
--UPDATE RandomEvent_Damages SET Percentage='0' WHERE RandomEventType='RANDOM_EVENT_BLIZZARD_CRIPPLING'and DamageType="POPULATION_LOSS";

--灾害生产力
--UPDATE RandomEvent_Yields SET Amount='0' WHERE RandomEventType='RANDOM_EVENT_JUNGLE_FIRE_TRIGGERED'and YieldType="YIELD_PRODUCTION";
--UPDATE RandomEvent_Yields SET Amount='0' WHERE RandomEventType='RANDOM_EVENT_FOREST_FIRE_TRIGGERED'and YieldType="YIELD_PRODUCTION";
--干旱
UPDATE RandomEvents SET Duration='3' WHERE RandomEventType='RANDOM_EVENT_DROUGHT_MAJOR';
UPDATE RandomEvents SET Duration='3' WHERE RandomEventType='RANDOM_EVENT_DROUGHT_EXTREME';
--灾害压力
--UPDATE GlobalParameters SET Value='50' WHERE Name='RANDOM_EVENT_FIRST_TIME_OCCURRENCE_BOOST';		
--地热相邻学院
--UPDATE Adjacency_YieldChanges SET YieldChange='1' WHERE ID='Geothermal_Science';
--山火
update RandomEvent_Yields set Amount = 0 where FeatureType = 'FEATURE_BURNT_JUNGLE' and RandomEventType = 'RANDOM_EVENT_JUNGLE_FIRE';
update RandomEvent_Yields set YieldType = 'YIELD_FOOD' where FeatureType = 'FEATURE_JUNGLE' and RandomEventType = 'RANDOM_EVENT_JUNGLE_FIRE';
update RandomEvent_Yields set Amount = 0 where FeatureType = 'FEATURE_BURNT_FOREST' and RandomEventType = 'RANDOM_EVENT_FOREST_FIRE';
update RandomEvent_Yields set YieldType = 'YIELD_FOOD' where FeatureType = 'FEATURE_FOREST' and RandomEventType = 'RANDOM_EVENT_FOREST_FIRE';
/*
--学院相邻
INSERT INTO District_Adjacencies (DistrictType , YieldChangeId)
    VALUES ('DISTRICT_CAMPUS' , 'Mountains_Science21' );
INSERT INTO District_Adjacencies (DistrictType , YieldChangeId)
    VALUES ('DISTRICT_CAMPUS' , 'Mountains_Science22' );
INSERT INTO District_Adjacencies (DistrictType , YieldChangeId)
    VALUES ('DISTRICT_CAMPUS' , 'Mountains_Science23' );
INSERT INTO District_Adjacencies (DistrictType , YieldChangeId)
    VALUES ('DISTRICT_CAMPUS' , 'Mountains_Science24' );
INSERT INTO District_Adjacencies (DistrictType , YieldChangeId)
    VALUES ('DISTRICT_CAMPUS' , 'Mountains_Science25' );

--1山2山+1科研 3山4山+2科研
INSERT INTO Adjacency_YieldChanges (ID , Description, YieldType, YieldChange,TilesRequired ,AdjacentTerrain )
    VALUES ('Mountains_Science21' , 'LOC_DISTRICT_MOUNTAINS_SCIENCE21', 'YIELD_SCIENCE', '-1', '2', 'TERRAIN_GRASS_MOUNTAIN' );
INSERT INTO Adjacency_YieldChanges (ID , Description, YieldType, YieldChange,TilesRequired ,AdjacentTerrain )
    VALUES ('Mountains_Science22' , 'LOC_DISTRICT_MOUNTAINS_SCIENCE22', 'YIELD_SCIENCE', '-1', '2', 'TERRAIN_PLAINS_MOUNTAIN' );
INSERT INTO Adjacency_YieldChanges (ID , Description, YieldType, YieldChange,TilesRequired ,AdjacentTerrain )
    VALUES ('Mountains_Science23' , 'LOC_DISTRICT_MOUNTAINS_SCIENCE23', 'YIELD_SCIENCE', '-1', '2', 'TERRAIN_DESERT_MOUNTAIN' );
INSERT INTO Adjacency_YieldChanges (ID , Description, YieldType, YieldChange,TilesRequired ,AdjacentTerrain )
    VALUES ('Mountains_Science24' , 'LOC_DISTRICT_MOUNTAINS_SCIENCE24', 'YIELD_SCIENCE', '-1', '2', 'TERRAIN_TUNDRA_MOUNTAIN' );
INSERT INTO Adjacency_YieldChanges (ID , Description, YieldType, YieldChange,TilesRequired ,AdjacentTerrain )
    VALUES ('Mountains_Science25' , 'LOC_DISTRICT_MOUNTAINS_SCIENCE25', 'YIELD_SCIENCE', '-1', '2', 'TERRAIN_SNOW_MOUNTAIN' );
*/

-- 太阳神

INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'LOC_BELIEF_GOD_OF_THE_SUN_NAME', 'LOC_BELIEF_GOD_OF_THE_SUN_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'GOD_OF_THE_SUN_BONUS_FARM_FOOD');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'GOD_OF_THE_SUN_BONUS_FARM_GOLD');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'GOD_OF_THE_SUN_BONUS_FARM_GOLD2');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'GOD_OF_THE_SUN_BONUS_FARM_GOLD3');
	
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BONUS_FARM_REQUIREMENTS');

INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIRES_RICE_IN_PLOT');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIRES_WHEAT_IN_PLOT');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIRES_MAIZE_IN_PLOT');	
--改良后金1
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS2', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS2', 'REQUIRES_PLOT_HAS_FARM');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS2', 'REQUIRES_RICE_IN_PLOT');
--改良后金2
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS3', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS3', 'REQUIRES_PLOT_HAS_FARM');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS3', 'REQUIRES_WHEAT_IN_PLOT');
--改良后金3
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS4', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS4', 'REQUIRES_PLOT_HAS_FARM');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS4', 'REQUIRES_MAIZE_IN_PLOT');
--
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD', 'ModifierId','GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER', 'Amount', 1);
--太阳神金币
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BONUS_FARM_REQUIREMENTS2');
--
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD2', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER2', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BONUS_FARM_REQUIREMENTS3');
--
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD3', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER3', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BONUS_FARM_REQUIREMENTS4');
--
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD', 'ModifierId','GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD2', 'ModifierId','GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER2');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD3', 'ModifierId','GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER3');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER', 'Amount', 2);
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER2', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER2', 'Amount', 2);
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER3', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_GOLD_MODIFIER3', 'Amount', 2);
 -- 月亮女神
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'LOC_BELIEF_GODDESS_OF_THE_MOON_NAME', 'LOC_BELIEF_GODDESS_OF_THE_MOON_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'GODDESS_OF_THE_MOON_LUXURY_SCIENCE');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS');		
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');	
 INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
 	VALUES ('PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_LUXURY');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_FISHINGBOATS');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE', 'ModifierId','GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER', 'YieldType','YIELD_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER', 'Amount', 0);
	
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'GODDESS_OF_THE_MOON_LUXURY_SCIENCE1');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE1', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER2', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_FISHINGBOATS_REQUIREMENTS');			
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE1', 'ModifierId','GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER2');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER2', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER2', 'Amount', 2); 
	
--黑暗卡科研40文化0 修行制度
UPDATE ModifierArguments SET Value='-10' WHERE ModifierId='MONASTICISM_CULTURE_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='12' WHERE ModifierId='MONASTICISM_HOLYSITE_SCIENCE' AND Name='Amount';

--政策黑暗商路卡 额外+2金币1科1文

INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_GOLD','MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');
INSERT INTO PolicyModifiers (PolicyType,ModifierId)
	VALUES ('POLICY_ISOLATIONISM','ISOLATIONISM_DOMESTIC_TRADE_ROUTE_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_GOLD', 'YieldType', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_GOLD', 'Amount', '2');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_GOLD', 'Intercontinental', 'false');
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_CULTURE','MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');	
INSERT INTO PolicyModifiers (PolicyType,ModifierId)
	VALUES ('POLICY_ISOLATIONISM','ISOLATIONISM_DOMESTIC_TRADE_ROUTE_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_CULTURE', 'YieldType', 'YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_CULTURE', 'Amount', '1');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_CULTURE', 'Intercontinental', 'false');
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_SCIENCE','MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');		
INSERT INTO PolicyModifiers (PolicyType,ModifierId)
	VALUES ('POLICY_ISOLATIONISM','ISOLATIONISM_DOMESTIC_TRADE_ROUTE_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_SCIENCE', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_SCIENCE', 'Amount', '2');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('ISOLATIONISM_DOMESTIC_TRADE_ROUTE_SCIENCE', 'Intercontinental', 'false');	

	
--黄金时代
/*
--自由探索港口商业+科研
INSERT INTO Types (Type,Kind) 
	VALUES ('MODIFIER_PLAYER_CITIE_ATTACH_MODIFIER', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType,EffectType)
	VALUES ('MODIFIER_PLAYER_CITIE_ATTACH_MODIFIER', 'COLLECTION_PLAYER_CAPITAL_CITY', 'EFFECT_ATTACH_MODIFIER');
DELETE FROM	CommemorationModifiers WHERE CommemorationType="COMMEMORATION_SCIENTIFIC" and ModifierId="COMMEMORATION_SCIENTIFIC_GA_HARBOR";
DELETE FROM	CommemorationModifiers WHERE CommemorationType="COMMEMORATION_SCIENTIFIC" and ModifierId="COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB";
INSERT INTO CommemorationModifiers (CommemorationType, ModifierId)
	VALUES ('COMMEMORATION_SCIENTIFIC', 'COMMEMORATION_SCIENTIFIC_GA_HARBOR_NEW');
INSERT INTO CommemorationModifiers (CommemorationType, ModifierId)
	VALUES ('COMMEMORATION_SCIENTIFIC', 'COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_NEW');
--INSERT INTO CommemorationModifiers (CommemorationType, ModifierId)
	--VALUES ('COMMEMORATION_SCIENTIFIC', 'COMMEMORATION_SCIENTIFIC_GA_ENCAMPMENT_NEW');
INSERT INTO Modifiers (ModifierId, ModifierType,OwnerRequirementSetId)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_HARBOR_NEW', 'MODIFIER_PLAYER_CITIE_ATTACH_MODIFIER', 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_HARBOR_MODIFIER_NEW', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'DISTRICT_IS_HARBOR');
INSERT INTO Modifiers (ModifierId, ModifierType,OwnerRequirementSetId)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_NEW', 'MODIFIER_PLAYER_CITIE_ATTACH_MODIFIER', 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_MODIFIER_NEW', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'DISTRICT_IS_COMMERCIAL_HUB');
--INSERT INTO Modifiers (ModifierId, ModifierType,OwnerRequirementSetId)
	--VALUES ('COMMEMORATION_SCIENTIFIC_GA_ENCAMPMENT_NEW', 'MODIFIER_PLAYER_CITIE_ATTACH_MODIFIER', 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_ENCAMPMENT_MODIFIER_NEW', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'DISTRICT_IS_ENCAMPMENT');
--港口
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_HARBOR_NEW', 'ModifierId', 'COMMEMORATION_SCIENTIFIC_GA_HARBOR_MODIFIER_NEW');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_HARBOR_MODIFIER_NEW', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_HARBOR_MODIFIER_NEW', 'Amount', '4');
--商业
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_NEW', 'ModifierId', 'COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_MODIFIER_NEW');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_MODIFIER_NEW', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name,Value)
	VALUES ('COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB_MODIFIER_NEW', 'Amount', '4');
	*/
--百花齐放
--文化黄金区域
--金币

INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT' , 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD' , 'YieldType' , 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD' , 'Amount' , '1');
INSERT INTO CommemorationModifiers (CommemorationType, ModifierId)
	VALUES ('COMMEMORATION_CULTURAL', 'COMMEMORATION_CULTURAL_DISTRICTGOLD');
--锤
INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD2' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT' , 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD2' , 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('COMMEMORATION_CULTURAL_DISTRICTGOLD2' , 'Amount' , '1');
INSERT INTO CommemorationModifiers (CommemorationType, ModifierId)
	VALUES ('COMMEMORATION_CULTURAL', 'COMMEMORATION_CULTURAL_DISTRICTGOLD2');
	
--雄伟壮丽
--折扣
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='COMMEMORATION_INFRASTRUCTURE_BUILDER_DISCOUNT_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='-30' WHERE ModifierId='COMMEMORATION_INFRASTRUCTURE_SETTLER_DISCOUNT_MODIFIER' AND Name='Amount';


--商业区不吃港口加成
/*
DELETE FROM Adjacency_YieldChanges  WHERE ID="Harbor_Gold";
DELETE FROM Adjacency_YieldChanges  WHERE ID="RoyalDock_Gold";
DELETE FROM Adjacency_YieldChanges  WHERE ID="Cothon_Gold";

--港口相邻商业区+1金
--港口
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
    VALUES ('DISTRICT_HARBOR', 'Commercial_Hub_Gold_1');
--U型港口
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
    VALUES ('DISTRICT_COTHON', 'Commercial_Hub_Gold_1');
--皇家港口
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
    VALUES ('DISTRICT_ROYAL_NAVY_DOCKYARD', 'Commercial_Hub_Gold_1');
INSERT INTO Adjacency_YieldChanges(ID,Description,YieldType,YieldChange,TilesRequired,AdjacentDistrict)
    VALUES ('Commercial_Hub_Gold_1', 'LOC_DISTRICT_CITY_CENTER_GOLD_1',"YIELD_GOLD","1","1","DISTRICT_COMMERCIAL_HUB");
*/


--政策
--飞机卡移至大众媒体
--update Policies set PrereqCivic="CIVIC_MASS_MEDIA" where PolicyType="POLICY_STRATEGIC_AIR_FORCE";
--步兵卡移至动员
update Policies set PrereqCivic="CIVIC_MOBILIZATION" where PolicyType="POLICY_MILITARY_FIRST";


-- 高棉 
--战象
UPDATE Units SET Combat=35,Cost=150,BaseMoves=3,Bombard=50  WHERE UnitType='UNIT_KHMER_DOMREY';
--圣地相邻河流+1相邻
/*
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_MONASTERIES_KING', 'TRAIT_HOLY_SITE_RIVER_FAITH');
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH', 'MODIFIER_PLAYER_CITIES_RIVER_ADJACENCY');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH','Amount', 1);
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH', 'Description', 'LOC_DISTRICT_RIVER_FAITH');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH', 'YieldType', 'YIELD_FAITH');	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH', 'DistrictType', 'DISTRICT_HOLY_SITE');
	*/
--圣地相邻河流+1科研
--INSERT INTO TraitModifiers (TraitType, ModifierId)
--	VALUES ('TRAIT_LEADER_MONASTERIES_KING', 'TRAIT_HOLY_SITE_RIVER_CULTURE');
--INSERT INTO Modifiers (ModifierId, ModifierType,SubjectRequirementSetId)
--	VALUES ('TRAIT_HOLY_SITE_RIVER_CULTURE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'PLOT_IS_HOLY_SITE_RIVER_FOOD_REQUIREMENTS');
--INSERT INTO ModifierArguments (ModifierId, Name, Value)
--	VALUES ('TRAIT_HOLY_SITE_RIVER_CULTURE','Amount', 1);
--INSERT INTO ModifierArguments (ModifierId, Name, Value)
--	VALUES ('TRAIT_HOLY_SITE_RIVER_CULTURE', 'YieldType', 'YIELD_SCIENCE');	
-- +35%圣地速度
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_MONASTERIES_KING' , 'TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , NULL );
INSERT INTO ModifierArguments (ModifierId , Name , Value, Extra , SecondExtra)
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD' , 'DistrictType' , 'DISTRICT_HOLY_SITE', null , null ),
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD' , 'Amount'       , '0'               , null , null );
--+50%水渠
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_LEADER_MONASTERIES_KING' , 'TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId )
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , NULL );
INSERT INTO ModifierArguments (ModifierId , Name , Value, Extra , SecondExtra)
	VALUES
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2' , 'DistrictType' , 'DISTRICT_AQUEDUCT', null , null ),
	('TRAIT_BOOST_AQUEDUCT_PRODUCTION_CPLMOD2' , 'Amount'       , '40'               , null , null );

	
--俄罗斯
--大屁股
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='TRAIT_INCREASED_TILES' and Name='Amount';
--区域
--UPDATE Districts SET Cost=54 WHERE DistrictType="DISTRICT_LAVRA";
UPDATE District_GreatPersonPoints SET PointsPerTurn=1 WHERE DistrictType='DISTRICT_LAVRA' AND GreatPersonClassType='GREAT_PERSON_CLASS_PROPHET';
--不会增加点数
--UPDATE District_GreatPersonPoints SET PointsPerTurn='0' WHERE DistrictType='DISTRICT_LAVRA' AND GreatPersonClassType='GREAT_PERSON_CLASS_ARTIST';
--UPDATE District_GreatPersonPoints SET PointsPerTurn='0' WHERE DistrictType='DISTRICT_LAVRA' AND GreatPersonClassType='GREAT_PERSON_CLASS_MUSICIAN';
--UPDATE District_GreatPersonPoints SET PointsPerTurn='0' WHERE DistrictType='DISTRICT_LAVRA' AND GreatPersonClassType='GREAT_PERSON_CLASS_WRITER';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_SHRINE_WRITING_POINTS' and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_TEMPLE_ARTIST_POINTS' and Name='Amount';
--哥萨克
UPDATE Units SET Combat=62,COST=340,BaseMoves=5 WHERE UnitType='UNIT_RUSSIAN_COSSACK';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='COSSACK_LOCAL_COMBAT' and Name='Amount';

--俄罗斯母亲平原不加信仰
--UPDATE  Modifiers SubjectRequirementSetId='PLOT_HAS_TUNDRA_HILLS_REQUIREMENTS' WHERE ModifierId = 'TRAIT_INCREASED_TUNDRA_FAITH' and SubjectRequirementSetId = 'PLOT_HAS_TUNDRA_REQUIREMENTS'
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_INCREASED_TUNDRA_HILLS_FAITH' and Name='Amount';

--大地母亲
--UPDATE Modifiers SET SubjectRequirementSetId='REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA' WHERE  ModifierId='TRAIT_INCREASED_TUNDRA_FAITH';
--UPDATE Modifiers SET SubjectRequirementSetId='REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_Hills_2' WHERE  ModifierId='TRAIT_INCREASED_TUNDRA_HILLS_FAITH';

/*	
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_Hills_2' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_Hills_2' , 'PLAYER_HAS_WANGQUAN_ELUOSI');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_RUSSIA_HAS_HOLY_SITE_TUNDRA_Hills_2' , 'REQUIRES_PLOT_HAS_TUNDRA_HILLS');
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('PLAYER_HAS_WANGQUAN_ELUOSI', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('PLAYER_HAS_WANGQUAN_ELUOSI', 'CivicType', 'CIVIC_DIVINE_RIGHT');
	*/

--法国
/*
DELETE FROM TraitModifiers WHERE ModifierId='UNIQUE_LEADER_ADD_VISIBILITY';
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('FLYING_SQUADRON_TRAIT', 'UNIQUE_LEADER_ADD_xxx');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('UNIQUE_LEADER_ADD_xxx', 'MODIFIER_PLAYER_ADD_DIPLO_VISIBILITY' , 'PLAYER_HAS_CASTLES_TECHNOLOGY');		
INSERT INTO ModifierArguments (ModifierId , Name , Value) 
	VALUES ('UNIQUE_LEADER_ADD_xxx' , 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId , Name , Value) 
	VALUES ('UNIQUE_LEADER_ADD_xxx' , 'Source' , 'SOURCE_TRAIT');
INSERT INTO ModifierArguments (ModifierId , Name , Value) 
	VALUES ('UNIQUE_LEADER_ADD_xxx' , 'SourceType' , 'DIPLO_SOURCE_FEMALE_ONLY');*/
--间谍0级
--UPDATE ModifierArguments SET Value='0' WHERE ModifierId='UNIQUE_LEADER_SPIES_START_PROMOTED' AND Name='Amount';

UPDATE Units SET Combat=65,BaseMoves=3 WHERE UnitType='UNIT_FRENCH_GARDE_IMPERIALE';



----加拿大---
--增加冻土,丘陵食物锤+1--	
/*
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_CIVILIZATION_FACES_OF_PEACE' , 'TRAIT_INCREASED_TUNDRA_FOOD');	
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES 	('TRAIT_INCREASED_TUNDRA_FOOD' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_TUNDRA_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name,Value)
	VALUES 	('TRAIT_INCREASED_TUNDRA_FOOD' , 'YieldType', 'YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId , Name,Value)
	VALUES 	('TRAIT_INCREASED_TUNDRA_FOOD' , 'Amount', '1');
	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_CIVILIZATION_FACES_OF_PEACE' , 'TRAIT_INCREASED_TUNDRA_HILLS_FOOD');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES 	('TRAIT_INCREASED_TUNDRA_HILLS_FOOD' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_TUNDRA_HILLS_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name,Value)
	VALUES 	('TRAIT_INCREASED_TUNDRA_HILLS_FOOD' , 'YieldType', 'YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId , Name,Value)
	VALUES 	('TRAIT_INCREASED_TUNDRA_HILLS_FOOD' , 'Amount', '1');		
	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_CIVILIZATION_FACES_OF_PEACE' , 'TRAIT_INCREASED_TUNDRA_HILLS_FOOD1');	
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES 	('TRAIT_INCREASED_TUNDRA_HILLS_FOOD1' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_TUNDRA_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name,Value)
	VALUES 	('TRAIT_INCREASED_TUNDRA_HILLS_FOOD1' , 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId , Name,Value)
	VALUES 	('TRAIT_INCREASED_TUNDRA_HILLS_FOOD1' , 'Amount', '0');
	
---
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_LAST_BEST_WEST' AND ModifierId='TUNDRA_HILLS_MINES_PRODUCTION';	
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_LAST_BEST_WEST' AND ModifierId='TUNDRA_MINES_PRODUCTION';*/
--DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_LAST_BEST_WEST' AND ModifierId='TUNDRA_HILLS_LUMBER_MILLS_PRODUCTION';
UPDATE Units SET StrategicResource="RESOURCE_HORSES" WHERE UnitType="UNIT_CANADA_MOUNTIE";
INSERT INTO Units_XP2 (UnitType,ResourceCost)
	VALUES ('UNIT_CANADA_MOUNTIE','20');
INSERT INTO UnitUpgrades (Unit , UpgradeUnit)
	VALUES 	('UNIT_CANADA_MOUNTIE' , 'UNIT_HELICOPTER');
UPDATE Units SET Combat=64,PrereqCivic="CIVIC_HUMANISM",Cost=330 WHERE UnitType='UNIT_CANADA_MOUNTIE';	



--==================
-- 阿拉伯
--==================
-- Arabia's Worship Building Bonus increased from 10% to 20%
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_CULTURE' AND Name='Multiplier';
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_FAITH' AND Name='Multiplier';
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_SCIENCE' AND Name='Multiplier';
---奴隶骑
UPDATE Units SET Cost=200,Maintenance=4,Combat=52 WHERE UnitType='UNIT_ARABIAN_MAMLUK';				
UPDATE UnitUpgrades SET UpgradeUnit="UNIT_CUIRASSIER" WHERE Unit='UNIT_ARABIAN_MAMLUK' AND UpgradeUnit="UNIT_TANK" ;
---伊斯兰大学
--UPDATE Building_YieldChanges SET YieldChange=5 WHERE BuildingType='BUILDING_MADRASA';
--UPDATE ModifierArguments SET Value='BELIEF_YIELD_PER_CITY' WHERE ModifierId='TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' AND Name='BeliefYieldType';

--马里
UPDATE ModifierArguments SET Value='-15' WHERE ModifierId='TRAIT_LESS_BUILDING_PRODUCTION' AND Name='Amount';
UPDATE ModifierArguments SET Value='-10' WHERE ModifierId='TRAIT_LESS_UNIT_PRODUCTION' AND Name='Amount';

UPDATE ModifierArguments SET Value='0' WHERE ModifierId='SUGUBA_CHEAPER_BUILDING_PURCHASE' AND Name='Amount';
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='SUGUBA_CHEAPER_DISTRICT_PURCHASE' AND Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='SUGUBA_CHEAPER_UNIT_PURCHASE' AND Name='Amount';
/*
INSERT INTO Modifiers("ModifierId","ModifierType")
    VALUES("TRAIT_DESERT_CITY_CENTER_PRODUCTION","MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_PRODUCTION' , 'Description',"LOC_DISTRICT_DESERT_PRODUCTION");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_PRODUCTION' , 'DistrictType',"DISTRICT_CITY_CENTER");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_PRODUCTION' , 'TerrainType',"TERRAIN_DESERT");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_PRODUCTION' , 'YieldType',"YIELD_GOLD");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_PRODUCTION' , 'Amount',"1");
	
INSERT INTO Modifiers("ModifierId","ModifierType")
    VALUES("TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION","MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION' , 'Description',"LOC_DISTRICT_DESERT_PRODUCTION");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION' , 'DistrictType',"DISTRICT_CITY_CENTER");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION' , 'TerrainType',"TERRAIN_DESERT_HILLS");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION' , 'YieldType',"YIELD_PRODUCTION");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
    VALUES ('TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION' , 'Amount',"1");
	
INSERT INTO	TraitModifiers(TraitType,ModifierId)
    VALUES ("TRAIT_CIVILIZATION_MALI_GOLD_DESERT","TRAIT_DESERT_CITY_CENTER_HILL_PRODUCTION");
	
INSERT INTO	TraitModifiers(TraitType,ModifierId)
    VALUES ("TRAIT_CIVILIZATION_MALI_GOLD_DESERT","TRAIT_DESERT_CITY_CENTER_PRODUCTION");
*/

--==================
-- 中国
--==================
-- 虎蹲炮近战+7力
INSERT INTO UnitReplaces (CivUniqueUnitType , ReplacesUnitType)
	VALUES ('UNIT_CHINESE_CROUCHING_TIGER' , 'UNIT_CROSSBOWMAN');
UPDATE Units SET Cost=190 , Combat=34 , RangedCombat=44 , Range=2 WHERE UnitType='UNIT_CHINESE_CROUCHING_TIGER';

INSERT INTO Tags (Tag , Vocabulary)
	VALUES ('CLASS_CROUCHING_TIGER' , 'ABILITY_CLASS');
INSERT INTO TypeTags (Type , Tag)
	VALUES ('UNIT_CHINESE_CROUCHING_TIGER' , 'CLASS_CROUCHING_TIGER');
INSERT INTO Types (Type , Kind)
	VALUES ('ABILITY_TIGER_ADJACENCY_DAMAGE_CPLMOD' , 'KIND_ABILITY');
INSERT INTO TypeTags (Type , Tag)
	VALUES ('ABILITY_TIGER_ADJACENCY_DAMAGE_CPLMOD' , 'CLASS_CROUCHING_TIGER');
INSERT INTO UnitAbilities (UnitAbilityType , Name , Description)
	VALUES ('ABILITY_TIGER_ADJACENCY_DAMAGE_CPLMOD' , 'LOC_ABILITY_TIGER_ADJACENCY_NAME' , 'LOC_ABILITY_TIGER_ADJACENCY_DESCRIPTION');
INSERT INTO UnitAbilityModifiers (UnitAbilityType , ModifierId)
	VALUES ('ABILITY_TIGER_ADJACENCY_DAMAGE_CPLMOD' , 'TIGER_ADJACENCY_DAMAGE');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('TIGER_ADJACENCY_DAMAGE' , 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH' , 'TIGER_ADJACENCY_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TIGER_ADJACENCY_DAMAGE', 'Amount' , '3'); 
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('TIGER_ADJACENCY_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('TIGER_ADJACENCY_REQUIREMENTS' , 'PLAYER_IS_ATTACKER_REQUIREMENTS');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('TIGER_ADJACENCY_REQUIREMENTS' , 'ADJACENT_UNIT_REQUIREMENT');
INSERT INTO ModifierStrings (ModifierId , Context , Text)
    VALUES ('TIGER_ADJACENCY_DAMAGE' , 'Preview' , 'LOC_ABILITY_TIGER_ADJACENCY_DESCRIPTION');
	

UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='GreatWall_Culture';

--INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
--    VALUES ('IMPROVEMENT_GREAT_WALL' , 'YIELD_FOOD' , '1');
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqTech)
	VALUES ('IMPROVEMENT_STEPWELL_china' , 'IMPROVEMENT_GREAT_WALL' , 'YIELD_CULTURE' , '1' , 'TECH_CASTLES');
UPDATE ModifierArguments SET Value='17' Where ModifierId="TRAIT_BUILDER_WONDER_PERCENT" and Name="Amount";


--埃及
--埃及20/35 100锤
UPDATE Units SET Cost=98 WHERE UnitType='UNIT_EGYPTIAN_CHARIOT_ARCHER';
UPDATE ModifierArguments SET Value='23' Where ModifierId="TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT" and Name="Amount";
UPDATE ModifierArguments SET Value='23' Where ModifierId="TRAIT_RIVER_FASTER_BUILDTIME_WONDER" and Name="Amount";

--UPDATE Units SET StrategicResource="RESOURCE_HORSES" WHERE UnitType="UNIT_EGYPTIAN_CHARIOT_ARCHER";
--INSERT INTO Units_XP2 (UnitType,ResourceCost)
--	VALUES ('UNIT_EGYPTIAN_CHARIOT_ARCHER','10');


-- 马普切
--黄金时代减忠诚度
UPDATE ModifierArguments SET Value='-5' WHERE ModifierId='TRAIT_DIMINISH_LOYALTY_IN_ENEMY_CITY' and Name="AdditionalGoldenAge";
UPDATE ModifierArguments SET Value='-15' WHERE ModifierId='TRAIT_DIMINISH_LOYALTY_IN_ENEMY_CITY' and Name="Amount";
--黄金时代+3力
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_TOQUI_COMBAT_BONUS_VS_GOLDEN_AGE_CIV';
--马普切UU
UPDATE Units SET Combat=56,BaseMoves=4,COST=230 WHERE UnitType='UNIT_MAPUCHE_MALON_RAIDER';
--追猎升级马普切
UPDATE UnitUpgrades SET UpgradeUnit="UNIT_CUIRASSIER" WHERE Unit='UNIT_ARABIAN_MAMLUK' AND UpgradeUnit="UNIT_TANK";

INSERT INTO UnitReplaces (CivUniqueUnitType , ReplacesUnitType)
VALUES ('UNIT_MAPUCHE_MALON_RAIDER' , 'UNIT_COURSER');
	
--范围+3力->+1
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='MALON_RAIDER_TERRITORY_COMBAT_BONUS' and Name="Amount";


--距离
--UPDATE RequirementArguments SET Value='4' WHERE RequirementId='NEAR_FRIENDLY_TERRITORY' and Name='MaxRange';
--木人最小2,50%
UPDATE Improvements SET MinimumAppeal="2",YieldFromAppealPercent="25" WHERE ImprovementType='IMPROVEMENT_CHEMAMULL';
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType, YieldChange)
	VALUES ('IMPROVEMENT_CHEMAMULL' , 'YIELD_CULTURE', '1');

--马普切总督就职经验50%
UPDATE ModifierArguments SET Value='75' WHERE ModifierId='TOQUI_UNIT_XP_FROM_GOVERNOR_MODIFIER' AND Name='Amount';
--UPDATE RequirementArguments SET Value='1' WHERE RequirementId='NEAR_FRIENDLY_TERRITORY' and Name='MaxRange';
--UPDATE Improvements SET MinimumAppeal="2",YieldFromAppealPercent="50" WHERE ImprovementType='IMPROVEMENT_CHEMAMULL';
--INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
--	VALUES ('IMPROVEMENT_CHEMAMULL' , 'TERRAIN_GRASS_HILLS');
--INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
--	VALUES ('IMPROVEMENT_CHEMAMULL' , 'TERRAIN_PLAINS_HILLS');
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType, YieldChange)
	VALUES ('IMPROVEMENT_CHEMAMULL' , 'YIELD_FOOD', '0');
--INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType, YieldChange)
--	VALUES ('IMPROVEMENT_CHEMAMULL' , 'YIELD_PRODUCTION', '1');
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_CHEMAMULL-01' , 'IMPROVEMENT_CHEMAMULL' , 'YIELD_FOOD' , '1' , 'CIVIC_CIVIL_SERVICE');
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_CHEMAMULL-02' , 'IMPROVEMENT_CHEMAMULL' , 'YIELD_PRODUCTION' , '1' , 'CIVIC_MERCANTILISM');
UPDATE Improvements SET SameAdjacentValid=0 WHERE ImprovementType='IMPROVEMENT_CHEMAMULL';

--波斯
--波斯uu不再消耗铁,产能变60锤,移动+1,依旧是25/30力
UPDATE Units SET Cost=85,Combat=34,RangedCombat=26 WHERE UnitType='UNIT_PERSIAN_IMMORTAL';
UPDATE Units_XP2 SET ResourceCost=20 WHERE UnitType='UNIT_PERSIAN_IMMORTAL';
--中世纪集市商路+1
INSERT INTO Requirements (RequirementId , RequirementType)
    VALUES ('REQUIRES_PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES' , 'CivicType' , 'CIVIC_MEDIEVAL_FAIRES');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES' , 'REQUIRES_PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES');		

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
    VALUES ('TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE2' , 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY','PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES');	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE2","Amount","0");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_FALL_BABYLON","TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE2");
--行政部门商路+1
INSERT INTO Requirements (RequirementId , RequirementType)
    VALUES ('REQUIRES_PLAYER_HAS_LISHIJILU_JIUBOSI' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_PLAYER_HAS_LISHIJILU_JIUBOSI' , 'CivicType' , 'CIVIC_RECORDED_HISTORY');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_LISHIJILU_JIUBOSI' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_LISHIJILU_JIUBOSI' , 'REQUIRES_PLAYER_HAS_LISHIJILU_JIUBOSI');		

INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
    VALUES ('TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE3' , 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY','PLAYER_HAS_LISHIJILU_JIUBOSI');	
INSERT INTO ModifierArguments(ModifierId,Name,Value)	
	VALUES("TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE3","Amount","1");
INSERT INTO TraitModifiers(TraitType,ModifierId)
    VALUES("TRAIT_LEADER_FALL_BABYLON","TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE3");
--+1锤1文，2金 2-0 -》 3-0-1-2 -》 3-1-1-3  (5)
--            1-1 -》 2-1-1-2 -》 2-2-1-3  (5)
--Improvement
UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_PAIRIDAEZA' and YieldType='YIELD_GOLD';
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_PAIRIDAEZA' , 'YIELD_PRODUCTION' , '0');
INSERT INTO Improvement_BonusYieldChanges(Id,ImprovementType,YieldType,BonusYieldChange,PrereqCivic)
    VALUES ('Courtyard_Gold_Coin','IMPROVEMENT_PAIRIDAEZA','YIELD_GOLD','2','CIVIC_CIVIL_SERVICE');
--INSERT INTO Improvement_BonusYieldChanges(Id,ImprovementType,YieldType,BonusYieldChange,PrereqCivic)
--    VALUES ('Courtyard_Food','IMPROVEMENT_PAIRIDAEZA','YIELD_PRODUCTION','1','CIVIC_CIVIL_SERVICE');
--DELETE FROM Improvement_ValidTerrains WHERE ImprovementType="IMPROVEMENT_PAIRIDAEZA" and TerrainType="TERRAIN_GRASS_HILLS";
--DELETE FROM Improvement_ValidTerrains WHERE ImprovementType="IMPROVEMENT_PAIRIDAEZA" and TerrainType="TERRAIN_PLAINS_HILLS";
--DELETE FROM Improvement_ValidTerrains WHERE ImprovementType="IMPROVEMENT_PAIRIDAEZA" and TerrainType="TERRAIN_DESERT_HILLS";
-- 蒙古
--贸易战不再加外交
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GENGHIS_KHAN_CAVALRY_BONUS' and Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_TRADING_POST_DIPLO_VISIBILITY' and Name='Amount';
UPDATE Buildings SET Cost=100 WHERE BuildingType='BUILDING_ORDU';
--UU减锤
UPDATE Units SET Cost=160,Combat=32,RangedCombat=42 WHERE UnitType='UNIT_MONGOLIAN_KESHIG';
--UPDATE Buildings SET Cost=100 WHERE BuildingType='BUILDING_ORDU';

--罗马
--UU37力
UPDATE Units SET Combat=38,Cost=100 WHERE UnitType='UNIT_ROMAN_LEGION';
--UPDATE Units_XP2 SET ResourceCost=20 WHERE UnitType='UNIT_ROMAN_LEGION';
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod' , 'PLAYER_HAS_TECH_POTTERY_XXXmod');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_XXXmod' , 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_POTTERY_XXXmod' , 'TechnologyType' , 'TECH_WRITING');
--需要帝国初期文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_LUOMA', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_LUOMA', 'CivicType', 'CIVIC_EARLY_EMPIRE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_LUOMA', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_LUOMA');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_LUOMA', 'REQUIREMENTSET_TEST_ALL');
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_LUOMA' WHERE ModifierId='TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';

  
--马其顿
--
UPDATE Buildings SET Cost=80 WHERE BuildingType="BUILDING_BASILIKOI_PAIDES";
--UPDATE ModifierArguments SET Value='2' WHERE ModifierId='HETAIROI_GREAT_GENERAL_COMBAT_BONUS' and Name='Amount';
UPDATE Units SET Cost=80,Combat=36 WHERE UnitType='UNIT_MACEDONIAN_HETAIROI';
UPDATE Units SET Cost=90,Combat=38 WHERE UnitType='UNIT_MACEDONIAN_HYPASPIST';
--迟钝护卫 铁
--迟钝护卫 对市中心伤害
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='HYPASPIST_SIEGE_BONUS' AND Name='Amount';
UPDATE Units_XP2 SET ResourceCost=10 WHERE UnitType="UNIT_MACEDONIAN_HYPASPIST";
--马其顿BUG修复
DELETE FROM UnitAbilityModifiers WHERE ModifierId='HETAIROI_GREAT_GENERAL_COMBAT_BONUS';
DELETE FROM Modifiers WHERE ModifierId='HETAIROI_GREAT_GENERAL_COMBAT_BONUS';
DELETE FROM ModifierArguments WHERE ModifierId='HETAIROI_GREAT_GENERAL_COMBAT_BONUS';
DELETE FROM ModifierStrings WHERE ModifierId='HETAIROI_GREAT_GENERAL_COMBAT_BONUS';

INSERT INTO UnitAbilityModifiers (UnitAbilityType , ModifierId)
	VALUES ('ABILITY_HETAIROI' , 'HETAIROI_NEIGHBOR_COMBAT');
INSERT INTO Modifiers (ModifierId , ModifierType,SubjectRequirementSetId)
	VALUES ('HETAIROI_NEIGHBOR_COMBAT' , 'MODIFIER_SINGLE_UNIT_ATTACH_MODIFIER','HETAIROI_PLOT_IS_HETAIROI_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('HETAIROI_NEIGHBOR_COMBAT_MODIFIER' , 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');
INSERT INTO ModifierArguments (ModifierId , Name , Value) 
	VALUES ('HETAIROI_NEIGHBOR_COMBAT' , 'ModifierId' , 'HETAIROI_NEIGHBOR_COMBAT_MODIFIER');
INSERT INTO ModifierArguments (ModifierId , Name , Value) 
	VALUES ('HETAIROI_NEIGHBOR_COMBAT_MODIFIER' , 'Amount' , '2');

INSERT INTO ModifierStrings (ModifierId , Context , Text) 
	VALUES ('HETAIROI_NEIGHBOR_COMBAT_MODIFIER' , 'Preview' , 'LOC_HETAIROI_GREAT_GENERAL_COMBAT_BONUS_DESCRIPTION');

INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('HETAIROI_PLOT_IS_HETAIROI_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('HETAIROI_PLOT_IS_HETAIROI_REQUIREMENTS' , 'REQUIRES_UNIT_NEXT_TO_HETAIROI');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_UNIT_NEXT_TO_HETAIROI' , 'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value) 
	VALUES ('REQUIRES_UNIT_NEXT_TO_HETAIROI' , 'UnitType' , 'UNIT_GREAT_GENERAL');
INSERT INTO RequirementArguments (RequirementId , Name , Value) 
	VALUES ('REQUIRES_UNIT_NEXT_TO_HETAIROI' , 'IncludeCenter' , 'true');

--西班牙 对宗教下调+3
--UPDATE ModifierArguments SET Value='3' WHERE ModifierId='COMBAT_BONUS_OTHER_RELIGION_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='PHILIP_II_COMBAT_BONUS_OTHER_RELIGION' AND Name='Amount';
--波兰
--遗物信仰、文化
--信仰
Delete FROM TraitModifiers WHERE TraitType="TRAIT_LEADER_LITHUANIAN_UNION" and ModifierId="TRAIT_LITHUANIANUNION_FAITH_RELIC";
--UPDATE ModifierArguments SET Value='40' WHERE ModifierId='TRAIT_LITHUANIANUNION_FAITH_RELIC' AND Name='YieldChange';
--文化
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_LITHUANIANUNION_CULTURE_RELIC' AND Name='YieldChange';
--纺织工坊
UPDATE Building_YieldChanges SET YieldChange=5 WHERE BuildingType='BUILDING_SUKIENNICE';
--波兰鸟骑兵移至人文
UPDATE Units SET Combat=64,PrereqCivic='CIVIC_HUMANISM' WHERE UnitType='UNIT_POLISH_HUSSAR';
--波兰的创立或者完善一个宗教时获得遗物、
--Grants Relic Upon Founding Religion
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , RunOnce , Permanent)
	VALUES ('TRAIT_LITHUANIANUNION_FOUND_RELIGION_RELIC_CPLMOD' , 'MODIFIER_PLAYER_GRANT_RELIC' , 'PLAYER_FOUNDED_RELIGION_RELIC_CPLMOD' , 1 , 1);	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_LITHUANIANUNION_FOUND_RELIGION_RELIC_CPLMOD' , 'Amount' , '1');	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_LITHUANIAN_UNION' , 'TRAIT_LITHUANIANUNION_FOUND_RELIGION_RELIC_CPLMOD');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_FOUNDED_RELIGION_RELIC_CPLMOD' , 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_FOUNDED_RELIGION_RELIC_CPLMOD' , 'REQUIRES_PLAYER_HAS_FOUNDED_A_RELIGION');
--Grants Relic Upon completing Religion
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId , RunOnce , Permanent)
	VALUES ('TRAIT_LITHUANIANUNION_COMPLETE_RELIGION_RELIC_CPLMOD' , 'MODIFIER_PLAYER_GRANT_RELIC' , 'REQUIRES_PLAYER_COMPLETED_RELIGION_RELIC_CPLMOD' , 1 , 1);
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_LITHUANIANUNION_COMPLETE_RELIGION_RELIC_CPLMOD' , 'Amount' , '1');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_LITHUANIAN_UNION' , 'TRAIT_LITHUANIANUNION_COMPLETE_RELIGION_RELIC_CPLMOD');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIRES_PLAYER_COMPLETED_RELIGION_RELIC_CPLMOD' , 'REQUIREMENTSET_TEST_ALL');
--Checks Requirement Set for each belief type
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_PLAYER_COMPLETED_RELIGION_RELIC_CPLMOD' , 'RELIGION_HAS_FOUNDER_BELIEF_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_PLAYER_COMPLETED_RELIGION_RELIC_CPLMOD' , 'RELIGION_HAS_WORSHIP_BELIEF_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIRES_PLAYER_COMPLETED_RELIGION_RELIC_CPLMOD' , 'RELIGION_HAS_ENHANCER_BELIEF_CPLMOD');
--Creates Belief Requirement Sets
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIREMENTSET_TEST_ANY');
--Attaches Requirement Sets
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_CPLMOD' , 'REQUIREMENT_REQUIREMENTSET_IS_MET');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_CPLMOD' , 'REQUIREMENT_REQUIREMENTSET_IS_MET');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_CPLMOD' , 'REQUIREMENT_REQUIREMENTSET_IS_MET');
--RequirementSet For FOUNDER Belief
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_CHURCH_PROPERTY_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_LAY_MINISTRY_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_PAPAL_PRIMACY_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_PILGRIMAGE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_STEWARDSHIP_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_TITHE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_WORLD_CHURCH_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_CROSS_CULTURAL_DIALOGUE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_RELIGIOUS_UNITY_CPLMOD');
--RequirementSet For WORSHIP Belief
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_CATHEDRAL_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_GURDWARA_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_MEETING_HOUSE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_MOSQUE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_PAGODA_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_SYNAGOGUE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_WAT_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_STUPA_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_DAR_E_MEHR_CPLMOD');
--RequirementSet For ENHANCER Belief
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_DEFENDER_OF_FAITH_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_HOLY_ORDER_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_ITINERANT_PREACHERS_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_JUST_WAR_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_MISSIONARY_ZEAL_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_MONASTIC_ISOLATION_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_SCRIPTURE_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_BURIAL_GROUNDS_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD' , 'REQUIRES_BELIEF_RELIGIOUS_COLONIZATION_CPLMOD');
--Checks for FOUNDER Belief
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_CHURCH_PROPERTY_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_LAY_MINISTRY_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_PAPAL_PRIMACY_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_PILGRIMAGE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_STEWARDSHIP_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_TITHE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_WORLD_CHURCH_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_CROSS_CULTURAL_DIALOGUE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_RELIGIOUS_UNITY_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
--Checks for WORSHIP Belief
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_CATHEDRAL_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_GURDWARA_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_MEETING_HOUSE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_MOSQUE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_PAGODA_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_SYNAGOGUE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_WAT_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_STUPA_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_DAR_E_MEHR_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
--Checks for ENHANCER Belief
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_DEFENDER_OF_FAITH_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_HOLY_ORDER_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_ITINERANT_PREACHERS_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_JUST_WAR_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_MISSIONARY_ZEAL_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_MONASTIC_ISOLATION_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_SCRIPTURE_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_BURIAL_GROUNDS_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIRES_BELIEF_RELIGIOUS_COLONIZATION_CPLMOD' , 'REQUIREMENT_PLAYER_FOUNDED_RELIGION_WITH_BELIEF');
--RequirementArguments
--Checks RequirementSets
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('RELIGION_HAS_FOUNDER_BELIEF_CPLMOD' , 'RequirementSetId' , 'RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('RELIGION_HAS_WORSHIP_BELIEF_CPLMOD' , 'RequirementSetId' , 'RELIGION_HAS_WORSHIP_BELIEF_REQUIREMENTS_CPLMOD');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('RELIGION_HAS_ENHANCER_BELIEF_CPLMOD' , 'RequirementSetId' , 'RELIGION_HAS_ENHANCER_BELIEF_REQUIREMENTS_CPLMOD');
--FOUNDER	
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_CHURCH_PROPERTY_CPLMOD' , 'BeliefType' , 'BELIEF_CHURCH_PROPERTY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_LAY_MINISTRY_CPLMOD' , 'BeliefType' , 'BELIEF_LAY_MINISTRY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_PAPAL_PRIMACY_CPLMOD' , 'BeliefType' , 'BELIEF_PAPAL_PRIMACY');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_PILGRIMAGE_CPLMOD' , 'BeliefType' , 'BELIEF_PILGRIMAGE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_STEWARDSHIP_CPLMOD' , 'BeliefType' , 'BELIEF_STEWARDSHIP');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_TITHE_CPLMOD' , 'BeliefType' , 'BELIEF_TITHE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_WORLD_CHURCH_CPLMOD' , 'BeliefType' , 'BELIEF_WORLD_CHURCH');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_CROSS_CULTURAL_DIALOGUE_CPLMOD' , 'BeliefType' , 'BELIEF_CROSS_CULTURAL_DIALOGUE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES('REQUIRES_BELIEF_RELIGIOUS_UNITY_CPLMOD' , 'BeliefType' , 'BELIEF_RELIGIOUS_UNITY');
--WORSHIP	
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_CATHEDRAL_CPLMOD' , 'BeliefType' , 'BELIEF_CATHEDRAL');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_GURDWARA_CPLMOD' , 'BeliefType' , 'BELIEF_GURDWARA');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_MEETING_HOUSE_CPLMOD' , 'BeliefType' , 'BELIEF_MEETING_HOUSE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_MOSQUE_CPLMOD' , 'BeliefType' , 'BELIEF_MOSQUE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_PAGODA_CPLMOD' , 'BeliefType' , 'BELIEF_PAGODA');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_SYNAGOGUE_CPLMOD' , 'BeliefType' , 'BELIEF_SYNAGOGUE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_WAT_CPLMOD' , 'BeliefType' , 'BELIEF_WAT');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_STUPA_CPLMOD' , 'BeliefType' , 'BELIEF_STUPA');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_DAR_E_MEHR_CPLMOD' , 'BeliefType' , 'BELIEF_DAR_E_MEHR');
--ENHANCER
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_DEFENDER_OF_FAITH_CPLMOD' , 'BeliefType' , 'BELIEF_DEFENDER_OF_FAITH');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_HOLY_ORDER_CPLMOD' , 'BeliefType' , 'BELIEF_HOLY_ORDER');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_ITINERANT_PREACHERS_CPLMOD' , 'BeliefType' , 'BELIEF_ITINERANT_PREACHERS');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_JUST_WAR_CPLMOD' , 'BeliefType' , 'BELIEF_JUST_WAR');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_MISSIONARY_ZEAL_CPLMOD' , 'BeliefType' , 'BELIEF_MISSIONARY_ZEAL');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_MONASTIC_ISOLATION_CPLMOD' , 'BeliefType' , 'BELIEF_MONASTIC_ISOLATION');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_SCRIPTURE_CPLMOD' , 'BeliefType' , 'BELIEF_SCRIPTURE');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_BURIAL_GROUNDS_CPLMOD' , 'BeliefType' , 'BELIEF_BURIAL_GROUNDS');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIRES_BELIEF_RELIGIOUS_COLONIZATION_CPLMOD' , 'BeliefType' , 'BELIEF_RELIGIOUS_COLONIZATION');

	
--玛雅
UPDATE Units SET Cost=60 WHERE UnitType='UNIT_MAYAN_HULCHE';
UPDATE ModifierArguments SET Value=2 WHERE ModifierId='HULCHE_BONUS_VS_WOUNDED_UNITS'and Name="Amount";
UPDATE ModifierArguments SET Value=2 WHERE ModifierId='MUTAL_NEAR_CAPITAL_COMBAT'and Name="Amount";
--UPDATE Districts SET Cost=54 WHERE DistrictType="DISTRICT_OBSERVATORY";
--UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='Plantation_Science';
--哥伦比亚
UPDATE ModifierArguments SET Value=1 WHERE ModifierId='LLANERO_ADJACENCY_STRENGTH'and Name="Amount";
--总指挥
UPDATE ModifierArguments SET Value=2 WHERE ModifierId='COMANDANTE_AOE_STRENGTH'and Name="Amount";
--牛仔骑
UPDATE Units SET Cost=310,Combat=61,BaseMoves=6 WHERE UnitType='UNIT_COLOMBIAN_LLANERO';
--爱国军额外移动
UPDATE ModifierArguments SET Value=0 WHERE ModifierId='EJERCITO_PATRIOTA_EXTRA_MOVEMENT' and Name="Amount";

INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_JOSE_DE_SUCRE' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_PAULA_SANTANDER' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_ANTONIO_PAEZ' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_URDANETA' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MARINO' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MACGREGOR' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_PIAR' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_NARINO' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MONTILLA' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType , ModifierId)
	VALUES ('GREAT_PERSON_INDIVIDUAL_COMMANDANTE_RIBAS' , 'GREATPERSON_COMANDANTE_MOVEMENT_AOE_LAND');
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_JOSE_DE_SUCRE';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_PAULA_SANTANDER';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_ANTONIO_PAEZ';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_URDANETA';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MARINO';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MACGREGOR';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_PIAR';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_NARINO';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_MONTILLA';
--UPDATE GreatPersonIndividuals SET ActionCharges="2" WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_COMMANDANTE_RIBAS';

--毛利
--UPDATE ModifierArguments SET Value='0' WHERE ModifierId='SCIENCE_PRESETTLEMENT' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='CULTURE_PRESETTLEMENT' AND Name='Amount';
--渔船不加食物
--UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_MAORI_FISHING_BOAT_FOOD' AND Name='Amount';
--渔船加食物需要港口
/*
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli' , 'PLAYER_HAS_TECH_POTTERY_XXXmod_maoli');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_XXXmod_maoli' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_POTTERY_XXXmod_maoli' , 'CivicType' , 'CIVIC_EARLY_EMPIRE');
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli' WHERE ModifierId='TRAIT_MAORI_FISHING_BOAT_FOOD';
*/
UPDATE ModifierArguments SET Value="YIELD_GOLD" WHERE ModifierId='TRAIT_MAORI_FISHING_BOAT_FOOD' AND Name='YieldType';
--森林树林加锤需要铸铜
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli2' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli2' , 'PLAYER_HAS_TECH_POTTERY_XXXmod_maoli2');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('PLAYER_HAS_TECH_POTTERY_XXXmod_maoli2' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('PLAYER_HAS_TECH_POTTERY_XXXmod_maoli2' , 'CivicType' , 'CIVIC_FOREIGN_TRADE');
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli2' WHERE ModifierId='TRAIT_MAORI_PRODUCTION_RAINFOREST';
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli2' WHERE ModifierId='TRAIT_MAORI_PRODUCTION_WOODS';

--送猴子
--UPDATE ModifierArguments SET Value='UNIT_SCOUT' WHERE ModifierId='BUILDER_PRESETTLEMENT' AND Name='UnitType';



--20200529特殊改动
--瑞典
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='CAROLEAN_UNUSED_MOVEMENT_COMBAT'and Name="Amount";	
UPDATE Units SET Maintenance=2 WHERE UnitType='UNIT_SWEDEN_CAROLEAN';

UPDATE ModifierArguments SET Value="20" WHERE ModifierId="TRAIT_GREATPERSON_FAVOR_MODIFIER" and Name="Amount";	
		
--瑞典女王图书馆
UPDATE Building_GreatPersonPoints SET PointsPerTurn="2" WHERE BuildingType="BUILDING_QUEENS_BIBLIOTHEQUE" and GreatPersonClassType="GREAT_PERSON_CLASS_WRITER";
UPDATE Building_GreatPersonPoints SET PointsPerTurn="3" WHERE BuildingType="BUILDING_QUEENS_BIBLIOTHEQUE" and GreatPersonClassType="GREAT_PERSON_CLASS_ARTIST";
UPDATE Building_GreatPersonPoints SET PointsPerTurn="3" WHERE BuildingType="BUILDING_QUEENS_BIBLIOTHEQUE" and GreatPersonClassType="GREAT_PERSON_CLASS_MUSICIAN";

UPDATE Buildings SET GovernmentTierRequirement="Tier1",Cost="35" WHERE BuildingType="BUILDING_QUEENS_BIBLIOTHEQUE";
UPDATE ModifierArguments SET Value="0" WHERE ModifierId="QUEENS_BIBLIOTHEQUE_GRANT_GOVERNOR_POINTS" and Name="Delta";	
--删除可以升级至3级市政
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_GOV_MILITARY' and PrereqBuilding="BUILDING_QUEENS_BIBLIOTHEQUE";
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_GOV_CULTURE' and PrereqBuilding="BUILDING_QUEENS_BIBLIOTHEQUE";
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_GOV_SCIENCE' and PrereqBuilding="BUILDING_QUEENS_BIBLIOTHEQUE";
--删除需要1级市政，女王图书馆可以升级至2级市政
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' and PrereqBuilding="BUILDING_GOV_TALL";
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' and PrereqBuilding="BUILDING_GOV_CONQUEST";
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' and PrereqBuilding="BUILDING_GOV_WIDE";
INSERT INTO BuildingPrereqs (Building , PrereqBuilding)
	VALUES 	('BUILDING_GOV_CITYSTATES' , 'BUILDING_QUEENS_BIBLIOTHEQUE');
INSERT INTO BuildingPrereqs (Building , PrereqBuilding)
	VALUES 	('BUILDING_GOV_SPIES' , 'BUILDING_QUEENS_BIBLIOTHEQUE');
	INSERT INTO BuildingPrereqs (Building , PrereqBuilding)
	VALUES 	('BUILDING_GOV_FAITH' , 'BUILDING_QUEENS_BIBLIOTHEQUE');
--删除女王图书馆与2级市政互斥
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_GOV_CITYSTATES' and MutuallyExclusiveBuilding="BUILDING_QUEENS_BIBLIOTHEQUE";
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_GOV_SPIES' and MutuallyExclusiveBuilding="BUILDING_QUEENS_BIBLIOTHEQUE";
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_GOV_FAITH' and MutuallyExclusiveBuilding="BUILDING_QUEENS_BIBLIOTHEQUE";
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' and MutuallyExclusiveBuilding="BUILDING_GOV_CITYSTATES";
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' and MutuallyExclusiveBuilding="BUILDING_GOV_SPIES";
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' and MutuallyExclusiveBuilding="BUILDING_GOV_FAITH";
--添加女王图书馆与1级市政互斥
/*
INSERT INTO MutuallyExclusiveBuildings (Building , MutuallyExclusiveBuilding)
	VALUES 	('BUILDING_QUEENS_BIBLIOTHEQUE' , 'BUILDING_GOV_TALL');
INSERT INTO MutuallyExclusiveBuildings (Building , MutuallyExclusiveBuilding)
	VALUES 	('BUILDING_QUEENS_BIBLIOTHEQUE' , 'BUILDING_GOV_WIDE');
INSERT INTO MutuallyExclusiveBuildings (Building , MutuallyExclusiveBuilding)
	VALUES 	('BUILDING_QUEENS_BIBLIOTHEQUE' , 'BUILDING_GOV_CONQUEST');	
INSERT INTO MutuallyExclusiveBuildings (Building , MutuallyExclusiveBuilding)
	VALUES 	('BUILDING_GOV_TALL' , 'BUILDING_QUEENS_BIBLIOTHEQUE');
INSERT INTO MutuallyExclusiveBuildings (Building , MutuallyExclusiveBuilding)
	VALUES 	('BUILDING_GOV_WIDE' , 'BUILDING_QUEENS_BIBLIOTHEQUE');
INSERT INTO MutuallyExclusiveBuildings (Building , MutuallyExclusiveBuilding)
	VALUES 	('BUILDING_GOV_CONQUEST' , 'BUILDING_QUEENS_BIBLIOTHEQUE');	
	*/
--卡洛琳步兵
UPDATE Units SET PrereqTech='TECH_BANKING',MandatoryObsoleteTech="TECH_CHEMISTRY" WHERE UnitType='UNIT_SWEDEN_CAROLEAN';

--诺贝尔奖+工厂大学建造速度 额外+1伟人点
--UPDATE ModifierArguments SET Value="2" WHERE Name="Amount" and ModifierId="TRAIT_GREAT_SCIENTIST_UNIVERSITY_MODIFIER";
--UPDATE ModifierArguments SET Value="2" WHERE Name="Amount" and ModifierId="TRAIT_GREAT_ENGINEER_FACTORY_MODIFIER";

/*INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES
	('TRAIT_CIVILIZATION_NOBEL_PRIZE' , 'NOBEL_PRIZE_UNIVERISTY_BOOST' ),
	('TRAIT_CIVILIZATION_NOBEL_PRIZE' , 'NOBEL_PRIZE_FACTORY_BOOST' );
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES
	('NOBEL_PRIZE_UNIVERISTY_BOOST' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION' , null),
	('NOBEL_PRIZE_FACTORY_BOOST' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION' , null);
INSERT INTO ModifierArguments (ModifierId , Name , Value , Extra , SecondExtra)
	VALUES 
	('NOBEL_PRIZE_UNIVERISTY_BOOST' , 'BuildingType' , 'BUILDING_UNIVERSITY' , null , null),
	('NOBEL_PRIZE_UNIVERISTY_BOOST' , 'Amount'       , '45'                  , null , null),
	('NOBEL_PRIZE_FACTORY_BOOST'    , 'BuildingType' , 'BUILDING_FACTORY'    , null , null),
	('NOBEL_PRIZE_FACTORY_BOOST'    , 'Amount'       , '45'                  , null , null);
*/


	
	
--苏格兰
UPDATE Improvements SET PrereqCivic='CIVIC_GAMES_RECREATION' WHERE ImprovementType='IMPROVEMENT_GOLF_COURSE';
UPDATE ModifierArguments SET Value="1" WHERE ModifierId="GOLFCOURSE_AMENITY" AND Name="Amount";

--领袖埃丽诺
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='IDENTITY_NEARBY_GREATWORKS' AND Name='Amount';	

--核反应
UPDATE Projects SET Cost="1300" WHERE ProjectType="PROJECT_BUILD_NUCLEAR_DEVICE";
UPDATE Projects SET Cost="1600" WHERE ProjectType="PROJECT_BUILD_THERMONUCLEAR_DEVICE";

--所有文化著作等等+科研
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_LEADER_ELEANOR_LOYALTY' , 'ELEANOR_DOUBLE_SCULPTURE_S1');	
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S1', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S1', 'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S1', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S1', 'YieldChange', '2');
	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_LEADER_ELEANOR_LOYALTY' , 'ELEANOR_DOUBLE_SCULPTURE_S2');
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S2', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S2', 'GreatWorkObjectType', 'GREATWORKOBJECT_RELIGIOUS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S2', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S2', 'YieldChange', '3');	
	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_LEADER_ELEANOR_LOYALTY' , 'ELEANOR_DOUBLE_SCULPTURE_S3');
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S3', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S3', 'GreatWorkObjectType', 'GREATWORKOBJECT_SCULPTURE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S3', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S3', 'YieldChange', '3');	
	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_LEADER_ELEANOR_LOYALTY' , 'ELEANOR_DOUBLE_SCULPTURE_S4');
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S4', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S4', 'GreatWorkObjectType', 'GREATWORKOBJECT_PORTRAIT');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S4', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S4', 'YieldChange', '3');	

INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_LEADER_ELEANOR_LOYALTY' , 'ELEANOR_DOUBLE_SCULPTURE_S5');
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S5', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S5', 'GreatWorkObjectType', 'GREATWORKOBJECT_LANDSCAPE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S5', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S5', 'YieldChange', '3');	
	
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES 	('TRAIT_LEADER_ELEANOR_LOYALTY' , 'ELEANOR_DOUBLE_SCULPTURE_S6');
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S6', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S6', 'GreatWorkObjectType', 'GREATWORKOBJECT_MUSIC');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S6', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('ELEANOR_DOUBLE_SCULPTURE_S6', 'YieldChange', '3');	
/*
INSERT INTO TraitModifiers
	VALUES ('TRAIT_LEADER_CITADEL_CIVILIZATION' , 'AMPHITHEATER_ZAIHAI');
INSERT INTO Modifiers (ModifierId, ModifierType)
    VALUES ('AMPHITHEATER_ZAIHAI' , 'MODIFIER_PLAYER_ADJUST_AVOID_RANDOM_EVENT');	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
    VALUES ('AMPHITHEATER_ZAIHAI' , 'RandomEventType' , 'RANDOM_EVENT_HURRICANE_CAT_4');
INSERT INTO TraitModifiers
	VALUES ('TRAIT_LEADER_CITADEL_CIVILIZATION' , 'AMPHITHEATER_ZAIHAI1');
INSERT INTO Modifiers (ModifierId, ModifierType)
    VALUES ('AMPHITHEATER_ZAIHAI1' , 'MODIFIER_PLAYER_ADJUST_AVOID_RANDOM_EVENT');	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
    VALUES ('AMPHITHEATER_ZAIHAI1' , 'RandomEventType' , 'RANDOM_EVENT_HURRICANE_CAT_5');
*/
--澳大利亚
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_DEFENSIVE_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION_XP2' and Name='Amount';
--UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION' and Name='TurnsActive';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_BREATHTAKING_CAMPUS' and Name='YieldChange';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_BREATHTAKING_THEATER_DISTRICT' and Name='YieldChange';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_BREATHTAKING_HOLY_SITE' and Name='YieldChange';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_BREATHTAKING_COMMERCIAL_HUB' and Name='YieldChange';
--
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_CHARMING_CAMPUS' and Name='RequiredAppeal';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_CHARMING_THEATER_DISTRICT' and Name='RequiredAppeal';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_CHARMING_HOLY_SITE' and Name='RequiredAppeal';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_CHARMING_COMMERCIAL_HUB' and Name='RequiredAppeal';
--
UPDATE Units SET BaseMoves=3 WHERE UnitType='UNIT_DIGGER';
--UPDATE ModifierArguments SET Value='7' WHERE ModifierId='DIGGER_BONUS_ON_COAST' and Name='Amount';

--匈牙利--
-- only 1 envoy from levying city-states units
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='LEVY_MILITARY_TWO_FREE_ENVOYS';
-- no combat bonus for levied units
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='RAVEN_LEVY_COMBAT' AND Name='Amount' AND Value='5';
-- Huszars only +2 combat strength from each alliance instead of 3
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='HUSZAR_ALLIES_COMBAT_BONUS';
-- Black Army only +2 combat strength from adjacent levied units
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='BLACK_ARMY_ADJACENT_LEVY';
-- Only 1 extra movement for levied units
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='RAVEN_LEVY_MOVEMENT';

---黑军
UPDATE Units SET Cost=230,BaseMoves=6 WHERE UnitType='UNIT_HUNGARY_BLACK_ARMY';
--骠骑兵
UPDATE Units SET Combat=68 WHERE UnitType='UNIT_HUNGARY_HUSZAR';

--渡鸦之王征兵折扣10%
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='LEVY_UNITUPGRADEDISCOUNT' AND Name='Amount';


--==================
-- Greece--希腊
--==================
--万能槽移至政治哲学
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY' WHERE ModifierId='TRAIT_WILDCARD_GOVERNMENT_SLOT'; 

--需要帝国初期文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_DGCQ', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_DGCQ', 'CivicType', 'CIVIC_EARLY_EMPIRE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_DGCQ', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_DGCQ');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_DGCQ', 'REQUIREMENTSET_TEST_ALL');

--需要国家劳动力文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY', 'CivicType', 'CIVIC_STATE_WORKFORCE');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY', 'REQUIREMENTSET_TEST_ALL');
	
--需要政治哲学文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_Z', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_Z');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_Z', 'REQUIREMENTSET_TEST_ALL');
	
--需要法典文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_FD_maya', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_FD_maya', 'CivicType', 'CIVIC_CODE_OF_LAWS');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_FD_maya', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_FD_maya');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_FD_maya', 'REQUIREMENTSET_TEST_ALL');

-- 祖鲁
--UU
UPDATE Units SET MandatoryObsoleteTech="TECH_BANKING" WHERE UnitType="UNIT_ZULU_IMPI";
--军团军队+0力
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_LAND_CORPS_COMBAT_STRENGTH' and Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_LAND_ARMIES_COMBAT_STRENGTH' and Name='Amount';
--军队文化要求
UPDATE ModifierArguments SET Value='CIVIC_HUMANISM' WHERE ModifierId='TRAIT_LAND_CORPS_EARLY' and Name='CivicType';
UPDATE ModifierArguments SET Value='CIVIC_URBANIZATION' WHERE ModifierId='TRAIT_LAND_ARMIES_EARLY' and Name='CivicType';
--兵营+1文化
/*
INSERT INTO DistrictModifiers (DistrictType , ModifierId)
    VALUES ('DISTRICT_IKANDA' , 'DISTRICT_IKANDA_CULTURAL_YIELD' );
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('DISTRICT_IKANDA_CULTURAL_YIELD', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('DISTRICT_IKANDA_CULTURAL_YIELD' , 'YieldType' , 'YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('DISTRICT_IKANDA_CULTURAL_YIELD' , 'Amount' , '1');
	
--兵营+1科技
INSERT INTO DistrictModifiers (DistrictType , ModifierId)
    VALUES ('DISTRICT_IKANDA' , 'DISTRICT_IKANDA_SCIENCE_YIELD' );
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('DISTRICT_IKANDA_SCIENCE_YIELD', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('DISTRICT_IKANDA_SCIENCE_YIELD' , 'YieldType' , 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
    VALUES ('DISTRICT_IKANDA_SCIENCE_YIELD' , 'Amount' , '1');
	*/
--美国
Update ModifierArguments SET Value='3' Where ModifierId="ROOSEVELT_COMBAT_BONUS_HOME_CONTINENT" and Name="Amount";
Update ModifierArguments SET Value='2' Where ModifierId="ROUGH_RIDER_BONUS_ON_HILLS" and Name="Amount";
Update Units SET Cost=330,PrereqTech='TECH_MILITARY_SCIENCE',Combat=64 Where UnitType="UNIT_AMERICAN_ROUGH_RIDER";
--P51战斗力加成
Update ModifierArguments SET Value="2" Where ModifierId="ANTI_FIGHTER_AIRCRAFT_COMBAT_BONUS" and Name="Amount";
		
--法国
--新增科技判断 【判断军事学】 
--INSERT INTO RequirementArguments(RequirementId,Name,Value)
--VALUES("REQUIRES_TECH_MILITARY_SCIENCE2","TechnologyType","TECH_MILITARY_SCIENCE");
--INSERT INTO Requirements(RequirementId,RequirementType)
--VALUES("REQUIRES_TECH_MILITARY_SCIENCE2","REQUIREMENT_PLAYER_HAS_TECHNOLOGY");

--【科技判断军事学】 【全判断】 【判断军事学】
--INSERT INTO RequirementSetRequirements(RequirementSetId,RequirementId)
--VALUES("PLAYER_HAS_TECH_MILITARY_SCIENCE2","REQUIRES_TECH_MILITARY_SCIENCE2");
--INSERT INTO RequirementSets(RequirementSetId,RequirementSetType)
--VALUES("PLAYER_HAS_TECH_MILITARY_SCIENCE2","REQUIREMENTSET_TEST_ALL");

--将科技判断城堡 替换为 科技判断军事学
--UPDATE Modifiers SET SubjectRequirementSetId="PLAYER_HAS_TECH_MILITARY_SCIENCE2" WHERE ModifierId="UNIQUE_LEADER_ADD_SPY_CAPACITY" AND ModifierType="MODIFIER_PLAYER_GRANT_SPY";
--UPDATE RequirementSetRequirements SET RequirementId="REQUIRES_TECH_MILITARY_SCIENCE2" WHERE RequirementSetId="PLAYER_HAS_CASTLES_TECHNOLOGY_AND_CAPITAL" AND --RequirementId="REQUIRES_TECHNOLOGY_CASTLES";


--印度 甘地
--梯井
--UPDATE ModifierArguments SET Value='YIELD_SCIENCE' WHERE Name='YieldType' AND ModifierId='STEPWELL_HOLYSITEADJACENCY_FAITH';
UPDATE ModifierArguments SET Value='3' WHERE Name='Amount' AND ModifierId='STEPWELL_HOLYSITEADJACENCY_FAITH';
UPDATE ModifierArguments SET Value='1' WHERE Name='Amount' AND ModifierId='STEPWELL_FARMADJACENCY_FOOD';
 
UPDATE Improvement_YieldChanges SET YieldChange="0" where ImprovementType="IMPROVEMENT_STEPWELL" and YieldType="YIELD_FAITH";
--UPDATE Improvement_YieldChanges SET YieldChange="0" where ImprovementType="IMPROVEMENT_STEPWELL" and YieldType="YIELD_FOOD";

INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_STEPWELL' , 'YIELD_PRODUCTION' , '0');

--INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
--	VALUES ('IMPROVEMENT_STEPWELL_01' , 'IMPROVEMENT_STEPWELL' , 'YIELD_PRODUCTION' , '1' , 'CIVIC_DIVINE_RIGHT');
--INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
--	VALUES ('IMPROVEMENT_STEPWELL_02' , 'IMPROVEMENT_STEPWELL' , 'YIELD_FAITH' , '1' , 'CIVIC_REFORMED_CHURCH');
--INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
--	VALUES ('IMPROVEMENT_STEPWELL_03' , 'IMPROVEMENT_STEPWELL' , 'YIELD_FAITH' , '1' , 'CIVIC_THEOLOGY');

--丘陵
--INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
--	VALUES ('IMPROVEMENT_STEPWELL' , 'TERRAIN_GRASS_HILLS');
--INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
--	VALUES ('IMPROVEMENT_STEPWELL' , 'TERRAIN_PLAINS_HILLS');	

--DELETE FROM Improvement_BonusYieldChanges WHERE Id='20' and ImprovementType="IMPROVEMENT_STEPWELL" and YieldType="YIELD_FOOD";
--工人+1移动	

INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_SATYAGRAHA' , 'GANDHI_FAST_BUILDERS');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('GANDHI_FAST_BUILDERS' , 'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT' , 'UNIT_IS_BUILDER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GANDHI_FAST_BUILDERS' , 'Amount' , '1');
--开拓者+1移动
--INSERT INTO TraitModifiers (TraitType , ModifierId)
--	VALUES ('TRAIT_LEADER_SATYAGRAHA' , 'GANDHI_FAST_SETTLERS');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId)
	VALUES ('GANDHI_FAST_SETTLERS' , 'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT' , 'UNIT_IS_SETTLER');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('GANDHI_FAST_SETTLERS' , 'Amount' , '1');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('UNIT_IS_SETTLER' , 'REQUIREMENT_UNIT_IS_SETTLER');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('UNIT_IS_SETTLER' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIREMENT_UNIT_IS_SETTLER' , 'REQUIREMENT_UNIT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIREMENT_UNIT_IS_SETTLER' , 'UnitType' , 'UNIT_SETTLER');
	
-- 黑印度
UPDATE ModifierArguments SET Value='0' WHERE Name='Amount' AND ModifierId='TRAIT_TERRITORIAL_WAR_MOVEMENT';
UPDATE ModifierArguments SET Value='0' WHERE Name='Amount' AND ModifierId='TRAIT_TERRITORIAL_WAR_COMBAT';
---------政事论
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_ARTHASHASTRA' , 'TRAIT_EXPANSION_COMBAT_BONUS_CPLMOD');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_ARTHASHASTRA' , 'TRAIT_EXPANSION_MOVEMENT_BONUS_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('TRAIT_EXPANSION_COMBAT_BONUS_CPLMOD' , 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('TRAIT_EXPANSION_MOVEMENT_BONUS_CPLMOD' , 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER');
INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId, SubjectRequirementSetId)
	VALUES ('EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD' , 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH' , 'REQUIREMENTSET_LAND_MILITARY_CPLMOD', 'PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId, SubjectRequirementSetId)
	VALUES ('EXPANSION_MOVEMENT_BONUS_MODIFIER_CPLMOD' , 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT' , 'REQUIREMENTSET_LAND_MILITARY_CPLMOD', 'PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD');

INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIREMENTS_LAND_MILITARY_CPLMOD' , 'UnitFormationClass' , 'FORMATION_CLASS_LAND_COMBAT');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_EXPANSION_COMBAT_BONUS_CPLMOD' , 'ModifierId', 'EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_EXPANSION_MOVEMENT_BONUS_CPLMOD' , 'ModifierId', 'EXPANSION_MOVEMENT_BONUS_MODIFIER_CPLMOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD' , 'Amount' , '1');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('EXPANSION_MOVEMENT_BONUS_MODIFIER_CPLMOD' , 'Amount' , '1');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIREMENTSET_LAND_MILITARY_CPLMOD' , 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD' , 'CHANDRAGUPTA_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIREMENTSET_LAND_MILITARY_CPLMOD' , 'REQUIREMENTS_LAND_MILITARY_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIREMENTSET_LAND_MILITARY_CPLMOD' , 'REQUIRES_UNIT_IS_RELIGIOUS_ALL');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('CHANDRAGUPTA_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD' , 'REQUIREMENT_UNIT_IN_OWNER_TERRITORY');	
INSERT INTO Requirements (RequirementId , RequirementType , Inverse)
	VALUES ('CHANDRAGUPTA_FOREIGN_TERRITORY_REQUIREMENTS_CPLMOD' , 'REQUIREMENT_UNIT_IN_OWNER_TERRITORY' , 1);
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIREMENTS_LAND_MILITARY_CPLMOD', 'REQUIREMENT_UNIT_FORMATION_CLASS_MATCHES');
INSERT INTO ModifierStrings (ModifierId, Context, Text)
	VALUES ('EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD' , 'Preview' , 'LOC_EXPANSION_COMBAT_BONUS_MODIFIER_WUYINDU_DESCRIPTION');	

-- 格鲁吉亚 塔玛丽
UPDATE Units SET Combat=48,Cost=170  WHERE UnitType='UNIT_GEORGIAN_KHEVSURETI';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='KHEVSURETI_HILLS_BUFF' AND Name='Amount';
--代替剑客
--INSERT INTO UnitReplaces (CivUniqueUnitType , ReplacesUnitType)
--	VALUES ('UNIT_GEORGIAN_KHEVSURETI', 'UNIT_SWORDSMAN');
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_TSIKHE';
UPDATE BuildingReplaces SET ReplacesBuildingType='BUILDING_WALLS' WHERE CivUniqueBuildingType='BUILDING_TSIKHE';
UPDATE Buildings SET Cost=35 , PrereqTech='TECH_MASONRY' , OuterDefenseHitPoints=60,OuterDefenseStrength=2 WHERE BuildingType='BUILDING_TSIKHE';
--城墙1文化 3信仰
--INSERT INTO Building_YieldChanges (BuildingType,YieldType,YieldChange)
--     VALUES                       ("BUILDING_TSIKHE","YIELD_CULTURE","1");	
UPDATE Building_YieldChanges SET YieldChange='3' WHERE BuildingType='BUILDING_TSIKHE' and YieldType="YIELD_FAITH";
--移除原有特性
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_RELIGION_CITY_STATES' and ModifierId='TRAIT_PROTECTORATE_WAR_FAITH';
	 
--苏美尔 闪闪
UPDATE Units SET Combat=30,Cost=65,MandatoryObsoleteTech="TECH_MILITARY_SCIENCE",PrereqTech="TECH_THE_WHEEL" WHERE UnitType='UNIT_SUMERIAN_WAR_CART';
--INSERT INTO Units_XP2 (ResourceMaintenanceAmount,ResourceCost,ResourceMaintenanceType,UnitType)
--	VALUES ('0','20','RESOURCE_IRON','UNIT_SUMERIAN_WAR_CART');
--移除掠夺 
DELETE FROM TraitModifiers WHERE TraitType="TRAIT_LEADER_ADVENTURES_ENKIDU" and ModifierId="TRAIT_ADJUST_JOINTWAR_PLUNDER";
--经验范围
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_ADJUST_JOINTWAR_EXPERIENCE' AND Name='Amount';

-- 斯基泰
UPDATE Units SET Cost=75,PrereqTech='TECH_HORSEBACK_RIDING',Combat=15,RangedCombat=25,BaseMoves=3 WHERE UnitType='UNIT_SCYTHIAN_HORSE_ARCHER';
--UPDATE UnitUpgrades SET UpgradeUnit='UNIT_CROSSBOWMAN' WHERE Unit='UNIT_SCYTHIAN_HORSE_ARCHER';

UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_KURGAN' and YieldType='YIELD_GOLD';
UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_KURGAN' and YieldType='YIELD_FAITH';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TOMYRIS_BONUS_VS_WOUNDED_UNITS' and Name='Amount';	
UPDATE ModifierArguments SET Value='15' WHERE ModifierId='TOMYRIS_HEAL_AFTER_DEFEATING_UNIT' and Name='Amount';
--坟镦	
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('K204' , 'IMPROVEMENT_KURGAN' , 'YIELD_GOLD' , '1' , 'CIVIC_FEUDALISM');
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('K203' , 'IMPROVEMENT_KURGAN' , 'YIELD_FAITH' , '1' , 'CIVIC_FEUDALISM');
	-- Adjacent Pastures now give +1 production in addition to faith
/*INSERT INTO Improvement_Adjacencies (ImprovementType , YieldChangeId)
	VALUES ('IMPROVEMENT_KURGAN' , 'KURGAN_PASTURE_PRODUCTION');
INSERT INTO Adjacency_YieldChanges (ID , Description , YieldType , YieldChange , TilesRequired , AdjacentImprovement)
	VALUES ('KURGAN_PASTURE_PRODUCTION' , 'Placeholder' , 'YIELD_PRODUCTION' , 1 , 1 , 'IMPROVEMENT_PASTURE');
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_KURGAN' , 'YIELD_FOOD' , 0);
*/INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType , YieldChange)
	VALUES ('IMPROVEMENT_KURGAN' , 'YIELD_PRODUCTION' , 1);
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_KURGAN_1' , 'IMPROVEMENT_KURGAN' , 'YIELD_PRODUCTION' , '1' , 'CIVIC_NATIONALISM');
/*INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_KURGAN_2' , 'IMPROVEMENT_KURGAN' , 'YIELD_GOLD' , '1' , 'CIVIC_NATIONALISM');	
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('IMPROVEMENT_KURGAN_3' , 'IMPROVEMENT_KURGAN' , 'YIELD_FOOD' , '0' , 'CIVIC_DIVINE_RIGHT');	
*/INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
	VALUES ('IMPROVEMENT_KURGAN' , 'TERRAIN_GRASS_HILLS');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
	VALUES ('IMPROVEMENT_KURGAN' , 'TERRAIN_PLAINS_HILLS');	
--信仰买骑兵
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_EXTRASAKAHORSEARCHER' and NAME='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_EXTRALIGHTCAVALRY' and NAME='Amount';
--DELETE FROM CivilizationTraits WHERE CivilizationType='CIVILIZATION_SCYTHIA' and TraitType='TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY';
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'SCYTHIA_FAITH_PURCHASE_LCAVALRY_CPLMOD');
--INSERT INTO TraitModifiers (TraitType , ModifierId)
--	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'SCYTHIA_FAITH_PURCHASE_HCAVALRY_CPLMOD');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'SCYTHIA_FAITH_PURCHASE_RCAVALRY_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_LCAVALRY_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_HCAVALRY_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_RCAVALRY_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_LCAVALRY_CPLMOD' , 'Tag' , 'CLASS_LIGHT_CAVALRY'); 
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_HCAVALRY_CPLMOD' , 'Tag' , 'CLASS_HEAVY_CAVALRY');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_RCAVALRY_CPLMOD' , 'Tag' , 'CLASS_RANGED_CAVALRY'); 	

--砍二
--INSERT INTO Building_YieldChanges (BuildingType , YieldType , YieldChange)
--	VALUES ('BUILDING_TLACHTLI' , 'YIELD_CULTURE' , '1'); 
--UPDATE Building_YieldChanges SET YieldType="YIELD_CULTURE",YieldChange="1" WHERE BuildingType="BUILDING_TLACHTLI" and YieldType="YIELD_FAITH";
--UPDATE Buildings SET RegionalRange="6",Description="LOC_BUILDING_ZOO_DESCRIPTION3",Cost="65",Entertainment="1" WHERE BuildingType="BUILDING_TLACHTLI";
UPDATE Buildings SET Cost="50" WHERE BuildingType="BUILDING_TLACHTLI";
Update Building_GreatPersonPoints SET PointsPerTurn="2" WHERE BuildingType="BUILDING_TLACHTLI" AND GreatPersonClassType="GREAT_PERSON_CLASS_GENERAL";
Update Building_YieldChanges SET YieldChange="3" WHERE BuildingType='BUILDING_TLACHTLI' and YieldType="YIELD_CULTURE";
--
Update Units Set Cost="45",Combat="23"  Where UnitType="UNIT_AZTEC_EAGLE_WARRIOR";
--区域速度
Update ModifierArguments Set Value="20" Where ModifierId="TRAIT_BUILDER_DISTRICT_PERCENT" and Name="Amount";
--强攻
Delete FROM TraitModifiers Where TraitType="TRAIT_LEADER_GIFTS_FOR_TLATOANI" and ModifierId="TRAIT_COMBAT_BONUS_PER_LUXURY";
INSERT INTO Modifiers
	(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES
	('TRAIT_FALLBABYLON_COMBAT_BONUS', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'ATTACKING_REQUIREMENT_SET');
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
	VALUES
	('TRAIT_FALLBABYLON_COMBAT_BONUS', 'Amount', '3');
INSERT INTO ModifierStrings
	(ModifierId, Context, Text)
	VALUES
	('TRAIT_FALLBABYLON_COMBAT_BONUS', 'Preview', 'LOC_TRAIT_FALLBABYLON_COMBAT_BONUS_DESCRIPTION');
INSERT INTO RequirementSets
	(RequirementSetId , RequirementSetType)
	VALUES
	('ATTACKING_REQUIREMENT_SET', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET', 'PLAYER_IS_ATTACKER_REQUIREMENTS');
INSERT INTO TraitModifiers
	(TraitType, ModifierId)
	VALUES
	('TRAIT_LEADER_GIFTS_FOR_TLATOANI', 'TRAIT_FALLBABYLON_COMBAT_BONUS');

--努比亚
-- 努比亚UI可以草原平原修建
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
	VALUES ('IMPROVEMENT_PYRAMID' , 'TERRAIN_PLAINS');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
	VALUES ('IMPROVEMENT_PYRAMID' , 'TERRAIN_GRASS');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
	VALUES ('IMPROVEMENT_PYRAMID' , 'TERRAIN_GRASS_HILLS');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
	VALUES ('IMPROVEMENT_PYRAMID' , 'TERRAIN_PLAINS_HILLS');
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType)
	VALUES ('IMPROVEMENT_PYRAMID' , 'FEATURE_FLOODPLAINS_PLAINS');
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType)
	VALUES ('IMPROVEMENT_PYRAMID' , 'FEATURE_FLOODPLAINS_GRASSLAND');
--
UPDATE Improvements SET SameAdjacentValid=0 WHERE ImprovementType='IMPROVEMENT_PYRAMID';
UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_PYRAMID' and YieldType='YIELD_FOOD';
--
--INSERT INTO Improvement_BonusYieldChanges(Id, ImprovementType, YieldType, BonusYieldChange, PrereqCivic)
--	VALUES ('IMPROVEMENT_PYRAMID_1', 'IMPROVEMENT_PYRAMID', 'YIELD_FOOD', 0, 'CIVIC_CODE_OF_LAWS');
-- 努比亚UI相邻+2
UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID="Pyramid_CityCenterAdjacency";
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID="Pyramid_CampusAdjacency";
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID="Pyramid_CommercialHubAdjacency";
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID="Pyramid_HarborAdjacency";
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID="Pyramid_HolySiteAdjacency";
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID="Pyramid_IndustrialZoneAdjacency";
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID="Pyramid_TheaterAdjacency";
-- 努比亚弓箭手
UPDATE Units SET Combat=15,RangedCombat=23,Cost=60 WHERE UnitType='UNIT_NUBIAN_PITATI';

UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_ANCIENT_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_CLASSICAL_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_MEDIEVAL_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_RENAISSANCE_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_INDUSTRIAL_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_MODERN_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_ATOMIC_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_INFORMATION_RANGED_UNIT_PRODUCTION' and Name='Amount';
--经验
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='TRAIT_RANGED_EXPERIENCE_MODIFIER' and Name='Amount';
--区域速度
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_BASE_DISTRICT_PRODUCTION_MODIFIER' and Name='Amount';
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='TRAIT_PYRAMID_DISTRICT_PRODUCTION_MODIFIER' and Name='Amount';

--朝鲜
UPDATE Adjacency_YieldChanges SET YieldChange=3 WHERE ID='BaseDistrict_Science';
UPDATE Units SET Cost=330,PrereqTech='TECH_METAL_CASTING' WHERE UnitType='UNIT_KOREAN_HWACHA';

--西班牙
-- 传教团移至王权
UPDATE Units SET Cost=240,BaseMoves=3 WHERE UnitType='UNIT_SPANISH_CONQUISTADOR';
--UPDATE Improvements SET PrereqCivic='CIVIC_DIVINE_RIGHT' WHERE ImprovementType='IMPROVEMENT_MISSION';
/*--西班牙内商
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_EL_ESCORIAL', 'TRAIT_DOMESTIC_TRADE_GAIN_P');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_DOMESTIC_TRADE_GAIN_P', 'YieldType' , 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_DOMESTIC_TRADE_GAIN_P', 'Amount' , '1');	
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('TRAIT_DOMESTIC_TRADE_GAIN_P', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');
	
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_EL_ESCORIAL', 'TRAIT_DOMESTIC_TRADE_GAIN_F');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_DOMESTIC_TRADE_GAIN_F', 'YieldType' , 'YIELD_FOOD');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_DOMESTIC_TRADE_GAIN_F', 'Amount' , '2');	
INSERT INTO Modifiers (ModifierId, ModifierType,OwnerRequirementSetId)
	VALUES ('TRAIT_DOMESTIC_TRADE_GAIN_F', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC','PLAYER_HAS_TECH_POTTERY_REQUIREMENTS_XXXmod_maoli');

--西班牙跨大陆内商
UPDATE ModifierArguments SET Value="1" where Name="Amount" and ModifierId="TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD";
UPDATE ModifierArguments SET Value="1" where Name="Amount" and ModifierId="TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION";	
*/
--挪威
UPDATE Units SET Combat=47,COST=180,BaseMoves=3 WHERE UnitType='UNIT_NORWEGIAN_BERSERKER';
UPDATE ModifierArguments SET Value="1" WHERE ModifierId="BERSERKER_FASTER_ENEMY_TERRITORY" AND Name="Amount";
UPDATE ModifierArguments SET Value="-2" WHERE ModifierId="UNIT_WEAK_WHEN_DEFENDING" AND Name="Amount";
UPDATE ModifierArguments SET Value="3" WHERE ModifierId="UNIT_STRONG_WHEN_ATTACKING" AND Name="Amount";
--UPDATE ModifierArguments SET Value='-3' WHERE ModifierId='UNIT_WEAK_WHEN_DEFENDING' AND Name='Amount';
--信仰购买狂战士
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER' , 'BERSERKER_FAITH_PURCHASE_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('BERSERKER_FAITH_PURCHASE_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('BERSERKER_FAITH_PURCHASE_CPLMOD' , 'Tag' , 'CLASS_MELEE_BERSERKER');	

--UPDATE Building_YieldChanges SET YieldChange="6" WHERE BuildingType="BUILDING_STAVE_CHURCH" AND YieldType="YIELD_FAITH";

UPDATE ModifierArguments SET Value="2" WHERE ModifierId="STAVECHURCH_SEARESOURCE_PRODUCTION" AND Name="Amount";


-- 极光之舞 +0.5faith per tundar terrian
--UPDATE ModifierArguments SET Value="0" where ModifierId="DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY" and Name="Amount";
--UPDATE ModifierArguments SET Value="0" where ModifierId="DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY" and Name="Amount";
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY', 'TilesRequired',2);
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY', 'TilesRequired',2);
--沙漠
--UPDATE ModifierArguments SET Value="0" where ModifierId="DESERT_FOLKLORE_FAITHDESERTADJACENCY" and Name="Amount";
--UPDATE ModifierArguments SET Value="0" where ModifierId="DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY" and Name="Amount";
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DESERT_FOLKLORE_FAITHDESERTADJACENCY', 'TilesRequired',2);
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY', 'TilesRequired',2);

--沙漠平原给金
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DESERT_FOLKLORE","DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD");	
INSERT INTO Modifiers(ModifierId,ModifierType,SubjectRequirementSetId)
        VALUES("DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD","MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY","CITY_FOLLOWS_PANTHEON_REQUIREMENTS");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD","DistrictType","DISTRICT_HOLY_SITE");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD","TerrainType","TERRAIN_DESERT");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD","YieldType","YIELD_GOLD");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD","Amount","1");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD","Description","LOC_DISTRICT_DESERT_FAITH");		
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	    VALUES ('DESERT_FOLKLORE_FAITHDESERTADJACENCY_GOLD', 'TilesRequired',2);

--沙漠丘陵给金
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DESERT_FOLKLORE","DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD");	
INSERT INTO Modifiers(ModifierId,ModifierType,SubjectRequirementSetId)
        VALUES("DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD","MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY","CITY_FOLLOWS_PANTHEON_REQUIREMENTS");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD","DistrictType","DISTRICT_HOLY_SITE");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD","TerrainType","TERRAIN_DESERT_HILLS");		
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD","YieldType","YIELD_GOLD");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD","Amount","1");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD","Description","LOC_DISTRICT_DESERT_FAITH");		
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	    VALUES ('DESERT_FOLKLORE_FAITHDESERTHILLSADJACENCY_GOLD', 'TilesRequired',2);
/*
--冻土平原给金
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DANCE_OF_THE_AURORA","DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD");
INSERT INTO Modifiers(ModifierId,ModifierType,SubjectRequirementSetId)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD","MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY","CITY_FOLLOWS_PANTHEON_REQUIREMENTS");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD","DistrictType","DISTRICT_HOLY_SITE");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD","TerrainType","TERRAIN_TUNDRA");		
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD","YieldType","YIELD_GOLD");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD","Amount","1");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD","Description","LOC_DISTRICT_DESERT_FAITH");		
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	    VALUES ('DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY_GOLD', 'TilesRequired',2);

--冻土丘陵给金
INSERT INTO BeliefModifiers(BeliefType,ModifierId)
        VALUES("BELIEF_DANCE_OF_THE_AURORA","DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD");
INSERT INTO Modifiers(ModifierId,ModifierType,SubjectRequirementSetId)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD","MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY","CITY_FOLLOWS_PANTHEON_REQUIREMENTS");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD","DistrictType","DISTRICT_HOLY_SITE");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD","TerrainType","TERRAIN_TUNDRA_HILLS");		
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD","YieldType","YIELD_GOLD");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD","Amount","1");
INSERT INTO ModifierArguments(ModifierId,Name,Value)
        VALUES("DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD","Description","LOC_DISTRICT_DESERT_FAITH");	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	    VALUES ('DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY_GOLD', 'TilesRequired',2);
*/


--神圣	
--INSERT INTO ModifierArguments(ModifierId , Name, Value)
	--VALUES ('SACRED_PATH_FAITHFEATUREADJACENCY', 'TilesRequired',2);
	
-- 牛+1产能,马,羊+食物
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_SHIPHERDER_PATH', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_SHIPHERDER_PATH', 'LOC_BELIEF_SHIPHERDER_PATH_NAME', 'LOC_BELIEF_SHIPHERDER_PATH_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_SHIPHERDER_PATH', 'SHIPHERDER_PATH_PASTURE_FOOD');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_SHIPHERDER_PATH', 'SHIPHERDER_PATH_PASTURE_PRODUCTION');
	
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_SHIPHERDER_PATH', 'SHIPHERDER_PATH_PASTURE_GOLD');
	--
	
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('SHIPHERDER_PATH_PASTURE_FOOD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('SHIPHERDER_PATH_PASTURE_PRODUCTION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
	
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('SHIPHERDER_PATH_PASTURE_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
	
	--
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('SHIPHERDER_PATH_PASTURE_PRODUCTION_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_MUCHANG_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('SHIPHERDER_PATH_PASTURE_FOOD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_MAYANG_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('SHIPHERDER_PATH_PASTURE_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_MAYANG_REQUIREMENTS');
	
--牛 马 羊 牧场
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_MAYANG_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_MAYANG_REQUIREMENTS', 'REQUIRES_PLOT_HAS_PASTURE');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_MAYANG_REQUIREMENTS', 'REQUIRES_PLOT_HAS_MAYANG');
--
/*
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_NOT_NIU_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_NOT_NIU_REQUIREMENTS', 'REQUIRES_PLOT_HAS_PASTURE');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_NOT_NIU_REQUIREMENTS', 'REQUIRES_PLOT_HAS_MAYANG');	
	*/
--
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_MUCHANG_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_MUCHANG_REQUIREMENTS', 'REQUIRES_PLOT_HAS_PASTURE');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_MUCHANG_REQUIREMENTS', 'REQUIRES_PLOT_HAS_MUCHANG');
INSERT INTO RequirementArguments(RequirementId , Name, Value)
	VALUES ('REQUIRES_PLOT_HAS_MUCHANG', 'Tag', 'CLASS_MUCHANG');
INSERT INTO Tags(Tag , Vocabulary)
	VALUES ('CLASS_MUCHANG', 'RESOURCE_CLASS');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_SHEEP', 'CLASS_MUCHANG');		
INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES ('REQUIRES_PLOT_HAS_MUCHANG', 'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');
INSERT INTO RequirementArguments(RequirementId , Name, Value)
	VALUES ('REQUIRES_PLOT_HAS_MAYANG', 'Tag', 'CLASS_MAYANG');
--
INSERT INTO Tags(Tag , Vocabulary)
	VALUES ('CLASS_MAYANG', 'RESOURCE_CLASS');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_HORSES', 'CLASS_MAYANG');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_SHEEP', 'CLASS_MAYANG');		
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_CATTLE', 'CLASS_MAYANG');
--
/*
INSERT INTO Tags(Tag , Vocabulary)
	VALUES ('CLASS_NOT_NIU', 'RESOURCE_CLASS');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_HORSES', 'CLASS_NOT_NIU');	
INSERT INTO TypeTags(Type , Tag)
	VALUES ('RESOURCE_SHEEP', 'CLASS_NOT_NIU');		
	*/
--
INSERT INTO Requirements(RequirementId , RequirementType)
	VALUES ('REQUIRES_PLOT_HAS_MAYANG', 'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_FOOD', 'ModifierId','SHIPHERDER_PATH_PASTURE_FOOD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_FOOD_MODIFIER', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_FOOD_MODIFIER', 'Amount', 1);	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_PRODUCTION', 'ModifierId','SHIPHERDER_PATH_PASTURE_PRODUCTION_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_PRODUCTION_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_PRODUCTION_MODIFIER', 'Amount', -1);
--牧民金币
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_GOLD', 'ModifierId','SHIPHERDER_PATH_PASTURE_GOLD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_GOLD_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('SHIPHERDER_PATH_PASTURE_GOLD_MODIFIER', 'Amount', 1);
	
-- 火山
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='GODDESS_OF_FIRE_FEATURES_FAITH_MODIFIER' AND Name='Amount';

--巨人之矛
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='SPEAR_OF_FIONN_ADJUST_COMBAT_STRENGTH' and Name='Amount';	

--黄金国
UPDATE Feature_AdjacentYields SET YieldChange='1' WHERE FeatureType='FEATURE_PAITITI' and YieldType='YIELD_GOLD';
UPDATE Feature_AdjacentYields SET YieldChange='1' WHERE FeatureType='FEATURE_PAITITI' and YieldType='YIELD_CULTURE';

--张掖丹霞
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GREAT_GENERAL_ZHANGYE' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GREAT_MERCHANT_ZHANGYE' and Name='Amount';	

--白沙漠
UPDATE Feature_YieldChanges SET YieldChange='2' WHERE FeatureType='FEATURE_WHITEDESERT'    AND YieldType='YIELD_CULTURE'   ;
UPDATE Feature_YieldChanges SET YieldChange='2' WHERE FeatureType='FEATURE_WHITEDESERT'    AND YieldType='YIELD_SCIENCE'   ;

	
--总督 
UPDATE Governors SET TransitionStrength="150" WHERE GovernorType="GOVERNOR_THE_RESOURCE_MANAGER";
UPDATE Governors SET TransitionStrength="150" WHERE GovernorType="GOVERNOR_THE_BUILDER";
UPDATE Governors SET TransitionStrength="150" WHERE GovernorType="GOVERNOR_THE_AMBASSADOR";

--伐木工
UPDATE ModifierArguments SET Value="50" WHERE ModifierId="GROUNDBREAKER_BONUS_HARVEST_YIELDS" AND Name="Amount";
--梁
UPDATE ModifierArguments SET Value="45" WHERE ModifierId="ZONING_COMMISSIONER_FASTER_DISTRICT_CONSTRUCTION" AND Name="Amount";
--大主教
--右1 圣地翻倍信仰

INSERT INTO GovernorPromotionModifiers (GovernorPromotionType,ModifierId)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS','CARDINAL_BONUS_HOLY_SITE_ADJACENCY');
INSERT INTO Modifiers (ModifierId,ModifierType,SubjectRequirementSetId)
	VALUES ('CARDINAL_BONUS_HOLY_SITE_ADJACENCY','MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER','DISTRICT_IS_HOLY_SITE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CARDINAL_BONUS_HOLY_SITE_ADJACENCY','YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CARDINAL_BONUS_HOLY_SITE_ADJACENCY','Amount','100');
	
--左1人口+1信仰

DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType="GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR" and ModifierId="CARDINAL_GRAND_INQUISITOR_COMBAT";
INSERT INTO GovernorPromotionModifiers (GovernorPromotionType,ModifierId)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR','CONNOISSEUR_F_CITIZEN');
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('CONNOISSEUR_F_CITIZEN','MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CONNOISSEUR_F_CITIZEN','YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CONNOISSEUR_F_CITIZEN','Amount','1.3');
	
--中2
--25%

INSERT INTO GovernorPromotionModifiers (GovernorPromotionType,ModifierId)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD','CARDINAL_HOLY_SITE_TEAMPVP');
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('CARDINAL_HOLY_SITE_TEAMPVP','MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CARDINAL_HOLY_SITE_TEAMPVP','YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CARDINAL_HOLY_SITE_TEAMPVP','Amount','10');

INSERT INTO GovernorPromotionModifiers (GovernorPromotionType,ModifierId)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD','CARDINAL_HOLY_SITE_2_TEAMPVP');
INSERT INTO Modifiers (ModifierId,ModifierType)
	VALUES ('CARDINAL_HOLY_SITE_2_TEAMPVP','MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CARDINAL_HOLY_SITE_2_TEAMPVP','YieldType','YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId,Name,Value)
	VALUES ('CARDINAL_HOLY_SITE_2_TEAMPVP','Amount','4');

UPDATE ModifierArguments SET Value="55" WHERE ModifierId="CARDINAL_CITADEL_OF_GOD_FAITH_FINISH_BUILDINGS" AND Name="BuildingProductionPercent";

--关联

--加拿大
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_CANADA' AND TerrainType='TERRAIN_TUNDRA';
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_CANADA' AND TerrainType='TERRAIN_TUNDRA_HILLS';
--俄罗斯--
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_RUSSIA' AND TerrainType='TERRAIN_TUNDRA';
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_RUSSIA' AND TerrainType='TERRAIN_TUNDRA_HILLS';
--挪威--海边
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_NORWAY' AND TerrainType='TERRAIN_COAST';
--英国--海边
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_ENGLAND' AND TerrainType='TERRAIN_COAST';
--荷兰
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_NETHERLANDS' AND TerrainType='TERRAIN_COAST';
--澳大利亚
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_AUSTRALIA' AND TerrainType='TERRAIN_COAST';
--腓尼基
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_PHOENICIA' AND TerrainType='TERRAIN_COAST';
--日本
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_JAPAN' AND TerrainType='TERRAIN_COAST';
--印度尼西亚
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_INDONESIA' AND TerrainType='TERRAIN_COAST';

--英国--煤
--INSERT INTO StartBiasResources (CivilizationType,ResourceType,Tier)
--	VALUES ('CIVILIZATION_ENGLAND','RESOURCE_COAL','1');
--迦太基--
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_PHOENICIA' AND TerrainType='TERRAIN_COAST';
--努比亚--关联羊
UPDATE StartBiasResources SET Tier='1' WHERE CivilizationType='CIVILIZATION_NUBIA' AND ResourceType='RESOURCE_CATTLE';
--日本--海边
--INSERT INTO StartBiasTerrains (CivilizationType,TerrainType,Tier)
--	VALUES ('CIVILIZATION_JAPAN','TERRAIN_COAST','1');
--INSERT INTO StartBiasRivers (CivilizationType,Tier)
--	VALUES ('CIVILIZATION_JAPAN',"1");
--德国--河流
--INSERT INTO StartBiasRivers (CivilizationType,Tier)
--	VALUES ('CIVILIZATION_GERMANY',"1");
--斯基泰--牧场
INSERT INTO StartBiasResources (CivilizationType , ResourceType , Tier)
	VALUES
	('CIVILIZATION_SCYTHIA' , 'RESOURCE_SHEEP'  , 1),
	('CIVILIZATION_SCYTHIA' , 'RESOURCE_CATTLE' , 1);
--澳大利亚
UPDATE StartBiasResources SET Tier='1' WHERE CivilizationType='CIVILIZATION_AUSTRALIA' AND ResourceType='RESOURCE_CATTLE';
UPDATE StartBiasResources SET Tier='1' WHERE CivilizationType='CIVILIZATION_AUSTRALIA' AND ResourceType='RESOURCE_HORSES';
UPDATE StartBiasResources SET Tier='1' WHERE CivilizationType='CIVILIZATION_AUSTRALIA' AND ResourceType='RESOURCE_SHEEP';
--加拿大
INSERT INTO StartBiasResources (CivilizationType , ResourceType , Tier)
	VALUES
	('CIVILIZATION_CANADA' , 'RESOURCE_DEER'  , 1);

--玛雅
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_SPICES';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_COFFEE';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_SILK';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_CITRUS';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_COCOA';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_COTTON';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_DYES';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_SUGAR';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_TEA';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_TOBACCO';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_WINE';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_INCENSE';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_OLIVES';
UPDATE StartBiasResources SET Tier=1 WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_BANANAS';
UPDATE StartBiasTerrains  SET Tier=5 WHERE CivilizationType='CIVILIZATION_MAYA' AND TerrainType='TERRAIN_GRASS';
UPDATE StartBiasTerrains  SET Tier=5 WHERE CivilizationType='CIVILIZATION_MAYA' AND TerrainType='TERRAIN_PLAINS';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_GYPSUM';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_JADE';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_MARBLE';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_MERCURY';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_SALT';
DELETE FROM StartBiasResources WHERE CivilizationType='CIVILIZATION_MAYA' AND ResourceType='RESOURCE_IVORY';
--日本
--海岸+2
UPDATE ModifierArguments SET VALUE="2" WHERE  ModifierId="HOJO_TOKIMUNE_COASTAL_COMBAT_BONUS" AND Name="Amount";
UPDATE ModifierArguments SET VALUE="2" WHERE  ModifierId="HOJO_TOKIMUNE_SHALLOW_WATER_COMBAT_BONUS" AND Name="Amount";
--武士 见4月更新
--UPDATE Units SET Cost=200 WHERE UnitType='UNIT_JAPANESE_SAMURAI';
--日本商业区不吃相邻
--INSERT INTO ExcludedAdjacencies (TraitType , YieldChangeId)
 --   VALUES
  --  ('TRAIT_CIVILIZATION_ADJACENT_DISTRICTS' , 'River_Gold');
DELETE FROM TraitModifiers where TraitType="TRAIT_CIVILIZATION_ADJACENT_DISTRICTS" and ModifierId="TRAIT_ADJACENT_DISTRICTS_COMMERCIALHUB_ADJACENCYGOLD";
DELETE FROM TraitModifiers where TraitType="TRAIT_CIVILIZATION_ADJACENT_DISTRICTS" and ModifierId="TRAIT_ADJACENT_DISTRICTS_HARBOR_ADJACENCYGOLD";
DELETE FROM ExcludedAdjacencies where YieldChangeId="District_Gold" and TraitType="TRAIT_CIVILIZATION_ADJACENT_DISTRICTS";
--
UPDATE ModifierArguments SET VALUE="3" WHERE  ModifierId="TRAIT_COMBAT_BONUS_LAND_ON_COAST" AND Name="Amount";
UPDATE ModifierArguments SET VALUE="3" WHERE  ModifierId="TRAIT_COMBAT_BONUS_NAVAL_SHALLOW_WATER" AND Name="Amount";

--男希腊
UPDATE ModifierArguments SET VALUE="4" WHERE  ModifierId="TRAIT_CULTURE_PER_CITY_STATE_TRIBUTARY" AND Name="Amount";

--波斯
--UPDATE ModifierArguments SET VALUE="3" WHERE  ModifierId="TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD" AND Name="Amount";
--宣战加速
UPDATE ModifierArguments SET VALUE="6" WHERE  ModifierId="TRAIT_FALLBABYLON_SURPRISE_MOVEMENT" AND Name="TurnsActive";
UPDATE ModifierArguments SET VALUE="1" WHERE  ModifierId="TRAIT_FALLBABYLON_SURPRISE_MOVEMENT" AND Name="Amount";
--职业道德
--DELETE From BeliefModifiers WHERE ModifierId='WORK_ETHIC_FOLLOWER_PRODUCTION';
DELETE From BeliefModifiers WHERE ModifierId='WORK_ETHIC_ADJACENCY_PRODUCTION_2';

INSERT INTO Modifiers 
	(ModifierId                              , ModifierType                          , SubjectRequirementSetId)
	VALUES 
	('WORK_ETHIC_SHRINE_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_SHRINE'),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION'          , 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER' , 'CITY_FOLLOWS_RELIGION_HAS_TEMPLE'),
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'MODIFIER_BUILDING_YIELD_CHANGE'      , null                              ),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'MODIFIER_BUILDING_YIELD_CHANGE'      , null                              );
INSERT INTO ModifierArguments 
	(ModifierId                              , Name           , Value)
	VALUES 
	('WORK_ETHIC_SHRINE_PRODUCTION'          , 'ModifierId'   , 'WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER'),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION'          , 'ModifierId'   , 'WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER'),
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'BuildingType' , 'BUILDING_SHRINE'                      ),--<
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_PRODUCTION'                     ),
	('WORK_ETHIC_SHRINE_PRODUCTION_MODIFIER' , 'Amount'       , '2'                                    ),
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'BuildingType' , 'BUILDING_TEMPLE'                      ),--<
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'YieldType'    , 'YIELD_PRODUCTION'                     ),
	('WORK_ETHIC_TEMPLE_PRODUCTION_MODIFIER' , 'Amount'       , '3'                                    );
INSERT INTO BeliefModifiers 
	(BeliefType          , ModifierId)
	VALUES 
	('BELIEF_WORK_ETHIC' , 'WORK_ETHIC_TEMPLE_PRODUCTION'),
	('BELIEF_WORK_ETHIC' , 'WORK_ETHIC_SHRINE_PRODUCTION');

--哺育世界
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='FEED_THE_WORLD_SHRINE_FOOD3_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='FEED_THE_WORLD_SHRINE_HOUSING_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='FEED_THE_WORLD_TEMPLE_HOUSING_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='FEED_THE_WORLD_TEMPLE_FOOD3_MODIFIER' AND Name='Amount';
	

--宗教社区
UPDATE ModifierArguments SET Value="1" WHERE ModifierId='RELIGIOUS_COMMUNITY_HOLY_SITE_TRADING_MODIFIER' AND Name='Amount';	
--UPDATE ModifierArguments SET Value="1" WHERE ModifierId='RELIGIOUS_COMMUNITY_TIER3_TRADING_MODIFIER' AND Name='Amount';


--刚果
--奥姆本巴
UPDATE Units SET Cost=100 WHERE UnitType='UNIT_KONGO_SHIELD_BEARER';
UPDATE Units_XP2 SET ResourceCost=10 WHERE UnitType="UNIT_KONGO_SHIELD_BEARER";
--精神实体
UPDATE ModifierArguments SET Value="3" WHERE ModifierId='TRAIT_GREAT_WORK_PRODUCTION_SCULPTURE' AND Name='Amount';
--黑叔叔获得遗物
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_RELIGIOUS_CONVERT', 'TRAIT_LEADER_1122');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId ,  Permanent)
	VALUES ('TRAIT_LEADER_1122' , 'MODIFIER_PLAYER_GRANT_RELIC' , 'TRAIT_LEADER_1133' , 1);	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_LEADER_1122' , 'Amount' , '1');	
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('TRAIT_LEADER_1133' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('TRAIT_LEADER_1133' , 'TRAIT_LEADER_1134');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('TRAIT_LEADER_1134' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('TRAIT_LEADER_1134' , 'CivicType' , 'CIVIC_POLITICAL_PHILOSOPHY');
--雇佣兵
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_RELIGIOUS_CONVERT', 'LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId ,  Permanent)
	VALUES ('LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN' , 'MODIFIER_PLAYER_GRANT_RELIC' , 'LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN_RequirementSets' , 1);	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN' , 'Amount' , '1');	
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN_RequirementSets' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN_RequirementSets' , 'LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN_Requirements');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN_Requirements' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('LEADER_RELIGIOUS_CONVERT_ADDYIWU_GUYONGJUN_Requirements' , 'CivicType' , 'CIVIC_MERCENARIES');
--1
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_NKISI', 'TRAIT_LEADER_1123');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId ,  Permanent)
	VALUES ('TRAIT_LEADER_1123' , 'MODIFIER_PLAYER_GRANT_RELIC' , 'TRAIT_LEADER_1156' , 1);	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_LEADER_1123' , 'Amount' , '1');	
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('TRAIT_LEADER_1156' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('TRAIT_LEADER_1156' , 'TRAIT_LEADER_1157');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('TRAIT_LEADER_1157' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('TRAIT_LEADER_1157' , 'CivicType' , 'CIVIC_DIVINE_RIGHT');
--1 
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_CIVILIZATION_NKISI', 'TRAIT_LEADER_1124');
INSERT INTO Modifiers (ModifierId , ModifierType , SubjectRequirementSetId ,  Permanent)
	VALUES ('TRAIT_LEADER_1124' , 'MODIFIER_PLAYER_GRANT_RELIC' , 'TRAIT_LEADER_1166' , 1);	
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_LEADER_1124' , 'Amount' , '1');	
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('TRAIT_LEADER_1166' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('TRAIT_LEADER_1166' , 'TRAIT_LEADER_1167');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('TRAIT_LEADER_1167' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('TRAIT_LEADER_1167' , 'CivicType' , 'CIVIC_REFORMED_CHURCH');	
	
--毛利游泳加速
--UPDATE Modifiers SET SubjectRequirementSetId="UNIT_IS_SETTLER" WHERE ModifierId="MANA_EMBARKED_EXTRA_MOVEMENT" and ModifierType="MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT"
--and OwnerRequirementSetId="REQUIREMENTS_UNIT_IS_EMBARKED";
--开拓者、工人船上4移动
--UPDATE ModifierArguments SET Value='4' WHERE ModifierId='MANA_EMBARKED_EXTRA_MOVEMENT' AND Name='Amount';

--埃塞俄比亚  100信仰 8科技 6文化 + 11 4= 19 10。 100信仰+19/10
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TRAIT_FAITH_INTO_SCIENCE_HILLS' AND Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_FAITH_INTO_CULTURE_HILLS' AND Name='Amount';
--UPDATE Modifiers SET SubjectRequirementSetId=0 WHERE ModifierId='TRAIT_FAITH_INTO_CULTURE_HILLS';
--UPDATE Modifiers SET SubjectRequirementSetId=0 WHERE ModifierId='TRAIT_FAITH_INTO_SCIENCE_HILLS';
/*
DELETE FROM Modifiers WHERE	ModifierId='TRAIT_FAITH_INTO_SCIENCE_HILLS';
DELETE FROM Modifiers WHERE	ModifierId='TRAIT_FAITH_INTO_CULTURE_HILLS';

INSERT INTO Modifiers (ModifierId , ModifierType   )
	VALUES ('TRAIT_FAITH_INTO_SCIENCE_HILLS' , 'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_MODIFIER_FROM_FAITH');	
INSERT INTO Modifiers (ModifierId , ModifierType   )
	VALUES ('TRAIT_FAITH_INTO_CULTURE_HILLS' , 'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_MODIFIER_FROM_FAITH');	
*/
--丘陵+2力
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='MENELIK_HILLS_COMBAT' AND Name='Amount';

--UI
UPDATE Improvements SET PrereqCivic="CIVIC_MYSTICISM" WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH";

--基础0信仰  （效果+3） 5信仰-》2.5产+效果-》3.2产+虚空效果4产  2-1-5 5*0.08=0.4科技，0.3文化0.7产
UPDATE Improvement_YieldChanges SET  YieldChange = 0 WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH" and YieldType="YIELD_FAITH";

--基础1锤
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType, YieldChange)
	VALUES ('IMPROVEMENT_ROCK_HEWN_CHURCH' , 'YIELD_PRODUCTION', '1');
--归正会+1信仰
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('AS002' , 'IMPROVEMENT_ROCK_HEWN_CHURCH' , 'YIELD_FAITH' , '1' , 'CIVIC_REFORMED_CHURCH');
--神学+1信仰
INSERT INTO Improvement_BonusYieldChanges (Id , ImprovementType , YieldType , BonusYieldChange , PrereqCivic)
	VALUES ('AS001' , 'IMPROVEMENT_ROCK_HEWN_CHURCH' , 'YIELD_FAITH' , '1' , 'CIVIC_THEOLOGY');
--UU
UPDATE Units SET Cost=200,BaseMoves=5 WHERE UnitType='UNIT_ETHIOPIAN_OROMO_CAVALRY'; 

--新老美 美国 进步党
UPDATE RequirementArguments SET Value='2' WHERE RequirementId='REQUIRES_PLOT_BREATHTAKING_APPEAL_ROOSEVELT' AND Name='MinimumAppeal';	
UPDATE ModifierArguments SET Value='YIELD_GOLD' WHERE ModifierId='TRAIT_ANTIQUES_AND_PARKS_CULTURE_FORESTS_OR_WONDERS' AND Name='YieldType';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_ANTIQUES_AND_PARKS_CULTURE_FORESTS_OR_WONDERS' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_ANTIQUES_AND_PARKS_SCIENCE_NATIONAL_WONDERS_OR_MOUNTAINS' AND Name='Amount';

--政治哲学解锁+科技
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE ModifierId='TRAIT_ANTIQUES_AND_PARKS_SCIENCE_NATIONAL_WONDERS_OR_MOUNTAINS';


--ULK尤里卡
--UPDATE Boosts SET BoostClass='BOOST_TRIGGER_KILL_WITH',Unit1Type="UNIT_WARRIOR",NumItems="1" Where TechnologyType='TECH_BRONZE_WORKING';
UPDATE Boosts SET BoostClass='BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE',Unit1Type="UNIT_SPEARMAN",NumItems="2" Where TechnologyType='TECH_MILITARY_TACTICS';
--UPDATE Boosts SET BoostClass='BOOST_TRIGGER_RESEARCH_TECH',BoostingTechType="TECH_HORSEBACK_RIDING" Where CivicType='CIVIC_MILITARY_TRADITION';
UPDATE Boosts SET BoostClass='BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE',Unit1Type="UNIT_QUADRIREME",NumItems="2" Where CivicType='CIVIC_NAVAL_TRADITION';

--宣战不检票
UPDATE GlobalParameters SET Value='0' WHERE Name='FAVOR_GRIEVANCES_MINIMUM';

--沼泽夫人
--DELETE FROM RequirementSetRequirements WHERE RequirementSetId="PLOT_HAS_REEDS_REQUIREMENTS" AND RequirementId="REQUIRES_PLOT_HAS_FLOODPLAINS";

--弓箭庙
--UPDATE Buildings SET Cost=210 WHERE BuildingType='BUILDING_TEMPLE_ARTEMIS';
UPDATE Building_YieldChanges SET YieldChange="2" WHERE BuildingType="BUILDING_TEMPLE_ARTEMIS" and YieldType="YIELD_FOOD";

-- Venetian Arsenal gives 100% production boost to all naval units in all cities instead of an extra naval unit in its city each time you build one
DELETE FROM BuildingModifiers WHERE	BuildingType='BUILDING_VENETIAN_ARSENAL';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ANCIENT_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ANCIENT');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ATOMIC_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ATOMIC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('CLASSICAL_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INDUSTRIAL_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INDUSTRIAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INFORMATION_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INFORMATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MEDIEVAL_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MEDIEVAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MODERN_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MODERN');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('RENAISSANCE_NAVAL_MELEE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_MELEE_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_RENAISSANCE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_MELEE_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_MELEE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_MELEE_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ANCIENT_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ANCIENT');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ATOMIC_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ATOMIC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('CLASSICAL_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INDUSTRIAL_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INDUSTRIAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INFORMATION_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INFORMATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MEDIEVAL_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MEDIEVAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MODERN_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MODERN');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('RENAISSANCE_NAVAL_RANGED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_RANGED_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_RENAISSANCE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_RANGED_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RANGED');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_RANGED_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ANCIENT_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ANCIENT');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ATOMIC_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ATOMIC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('CLASSICAL_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INDUSTRIAL_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INDUSTRIAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INFORMATION_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INFORMATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MEDIEVAL_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MEDIEVAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MODERN_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MODERN');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('RENAISSANCE_NAVAL_RAIDER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_RAIDER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_RENAISSANCE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_RAIDER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_RAIDER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_RAIDER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ANCIENT_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ANCIENT');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ANCIENT_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('ATOMIC_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_ATOMIC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('ATOMIC_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('CLASSICAL_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('CLASSICAL_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INDUSTRIAL_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INDUSTRIAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INDUSTRIAL_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('INFORMATION_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_INFORMATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('INFORMATION_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MEDIEVAL_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MEDIEVAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MEDIEVAL_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('MODERN_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_MODERN');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('MODERN_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, NewOnly, Permanent)
VALUES ('RENAISSANCE_NAVAL_CARRIER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION', 0, 0, 0);
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_CARRIER_PRODUCTION', 'EraType', 'ARGTYPE_IDENTITY', 'ERA_RENAISSANCE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_CARRIER_PRODUCTION', 'UnitPromotionClass', 'ARGTYPE_IDENTITY', 'PROMOTION_CLASS_NAVAL_CARRIER');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES ('RENAISSANCE_NAVAL_CARRIER_PRODUCTION', 'Amount', 'ARGTYPE_IDENTITY', '75');

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ANCIENT_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ATOMIC_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'CLASSICAL_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INDUSTRIAL_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INFORMATION_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MEDIEVAL_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MODERN_NAVAL_MELEE_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'RENAISSANCE_NAVAL_MELEE_PRODUCTION');

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ANCIENT_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ATOMIC_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'CLASSICAL_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INDUSTRIAL_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INFORMATION_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MEDIEVAL_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MODERN_NAVAL_RANGED_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'RENAISSANCE_NAVAL_RANGED_PRODUCTION');

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ANCIENT_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ATOMIC_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'CLASSICAL_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INDUSTRIAL_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INFORMATION_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MEDIEVAL_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MODERN_NAVAL_RAIDER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'RENAISSANCE_NAVAL_RAIDER_PRODUCTION');

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ANCIENT_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'ATOMIC_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'CLASSICAL_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INDUSTRIAL_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'INFORMATION_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MEDIEVAL_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'MODERN_NAVAL_CARRIER_PRODUCTION');
INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
VALUES ('BUILDING_VENETIAN_ARSENAL', 'RENAISSANCE_NAVAL_CARRIER_PRODUCTION');

--刚果黑叔叔遗物需要政治哲学
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE  ModifierId='TRAIT_GREAT_WORK_FOOD_RELIC';
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE  ModifierId='TRAIT_GREAT_WORK_PRODUCTION_RELIC';
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE  ModifierId='TRAIT_GREAT_WORK_GOLD_RELIC';

--巴比伦
--送建筑政治哲学要求
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_DGCQ' WHERE ModifierId='TRAIT_FREE_BUILDING_WHEN_DISTRICT_MADE'; 

--波兰遗物需要宗教
--UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_FOUNDED_RELIGION_RELIC_CPLMOD' WHERE  ModifierId='TRAIT_LITHUANIANUNION_FAITH_RELIC';
--UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_FOUNDED_RELIGION_RELIC_CPLMOD' WHERE  ModifierId='TRAIT_LITHUANIANUNION_CULTURE_RELIC';
--UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_FOUNDED_RELIGION_RELIC_CPLMOD' WHERE  ModifierId='TRAIT_LITHUANIANUNION_GOLD_RELIC';
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE  ModifierId='TRAIT_LITHUANIANUNION_FAITH_RELIC';
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE  ModifierId='TRAIT_LITHUANIANUNION_CULTURE_RELIC';
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_Z' WHERE  ModifierId='TRAIT_LITHUANIANUNION_GOLD_RELIC';


--祠堂 工人加移动
--INSERT INTO BuildingModifiers (BuildingType, ModifierId)
--	VALUES ('BUILDING_GOV_WIDE', 'GANDHI_FAST_BUILDERS');

--忽必烈 黄卡 国家劳动力
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_ZY' WHERE ModifierId='TRAIT_ECONOMIC_GOVERNMENT_SLOT'; 

--玛雅 市中心相邻奢侈加宜居度
UPDATE Modifiers SET OwnerRequirementSetId='PLAYER_HAS_POLITICAL_PHILOSOPHY_FD_maya' WHERE ModifierId='TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY'; 


--女希腊 解锁政治哲学+1力
--赛磨皮来
INSERT INTO Modifiers(ModifierId, ModifierType,OwnerRequirementSetId)
	VALUES('TRAIT_SAIMOPILAI_COMBAT_BONUS_TEAMPVP','MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH','PLAYER_HAS_POLITICAL_PHILOSOPHY_Z');
INSERT INTO ModifierArguments(ModifierId, Name, Value)
	VALUES('TRAIT_SAIMOPILAI_COMBAT_BONUS_TEAMPVP', 'Amount', '1');
INSERT INTO ModifierStrings(ModifierId, Context, Text)
	VALUES('TRAIT_SAIMOPILAI_COMBAT_BONUS_TEAMPVP', 'Preview', 'LOC_TRAIT_SAIMOPILAI_TEAMPVP_COMBAT_BONUS_DESCRIPTION');
INSERT INTO TraitModifiers(TraitType, ModifierId)
	VALUES('CULTURE_KILLS_TRAIT', 'TRAIT_SAIMOPILAI_COMBAT_BONUS_TEAMPVP');

--女希腊 解锁王权+1力
--赛磨皮来
--需要政治哲学文化
INSERT INTO Requirements (RequirementId, RequirementType)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_SAIMOPILAI_WQSS', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
	VALUES ('REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_SAIMOPILAI_WQSS', 'CivicType', 'CIVIC_HUMANISM');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_SAIMOPILAI_WQSS', 'REQUIRES_PLAYER_HAS_POLITICAL_PHILOSOPHY_SAIMOPILAI_WQSS');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLAYER_HAS_POLITICAL_PHILOSOPHY_SAIMOPILAI_WQSS', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO Modifiers(ModifierId, ModifierType,OwnerRequirementSetId)
	VALUES('TRAIT_SAIMOPILAI_COMBAT_BONUS_2_TEAMPVP','MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH','PLAYER_HAS_POLITICAL_PHILOSOPHY_SAIMOPILAI_WQSS');
INSERT INTO ModifierArguments(ModifierId, Name, Value)
	VALUES('TRAIT_SAIMOPILAI_COMBAT_BONUS_2_TEAMPVP', 'Amount', '1');
INSERT INTO ModifierStrings(ModifierId, Context, Text)
	VALUES('TRAIT_SAIMOPILAI_COMBAT_BONUS_2_TEAMPVP', 'Preview', 'LOC_TRAIT_SAIMOPILAI_TEAMPVP_COMBAT_BONUS_2_DESCRIPTION');
INSERT INTO TraitModifiers(TraitType, ModifierId)
	VALUES('CULTURE_KILLS_TRAIT', 'TRAIT_SAIMOPILAI_COMBAT_BONUS_2_TEAMPVP');