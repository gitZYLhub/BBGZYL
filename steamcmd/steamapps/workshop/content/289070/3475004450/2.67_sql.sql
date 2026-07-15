--神社、寺庙7折
UPDATE Buildings SET Cost=65,Maintenance=1  WHERE BuildingType='BUILDING_SHRINE';
UPDATE Buildings SET Cost=105,Maintenance=1  WHERE BuildingType='BUILDING_TEMPLE';
--单独减少
--UPDATE Buildings SET Cost=105,Maintenance=1  WHERE BuildingType='BUILDING_STAVE_CHURCH';
UPDATE Buildings SET Cost=105,Maintenance=1  WHERE BuildingType='BUILDING_PRASAT';


--马里外商
--UPDATE ModifierArguments SET Value='TERRAIN_DESERT_HILLS' WHERE ModifierId='TRADE_ROUTE_GOLD_DESERT_ORIGIN' AND Name='TerrainType';
--MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL
--宗教移民 不加边境
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='RELIGIOUS_SETTLEMENTS_CULTUREBORDER' AND Name='Amount';


--苏格兰
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_SCIENCE_HAPPY' AND Name='Amount';
UPDATE ModifierArguments SET Value='6' WHERE ModifierId='TRAIT_SCIENCE_ECSTATIC' AND Name='Amount';
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='TRAIT_PRODUCTION_HAPPY' AND Name='Amount';
UPDATE ModifierArguments SET Value='8' WHERE ModifierId='TRAIT_PRODUCTION_ECSTATIC' AND Name='Amount';

--巴西
UPDATE StartBiasTerrains SET Tier='1' WHERE CivilizationType='CIVILIZATION_BRAZIL' AND TerrainType='FEATURE_JUNGLE';


--荷兰
UPDATE Improvements SET ValidAdjacentTerrainAmount=1 WHERE ImprovementType='IMPROVEMENT_POLDER';
UPDATE Improvements SET PrereqCivic='CIVIC_STATE_WORKFORCE' WHERE ImprovementType='IMPROVEMENT_POLDER';

--玛雅
--UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_MAYA_FARMS_PRODUCTION' AND Name='Amount';

--马里
--马里外商+1信仰
--INSERT INTO LeaderTraits (LeaderType , TraitType)
-- VALUES ("LEADER_MANSA_MUSA" , "TRAIT_LEADER_MEDITERRANEAN_2");
INSERT INTO TraitModifiers (TraitType , ModifierId)
 VALUES ("TRAIT_LEADER_SAHEL_MERCHANTS" , "TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD_2");
INSERT INTO Modifiers (ModifierId , ModifierType)
 VALUES ("TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD_2" , "MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL"); 
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
 VALUES ("TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD_2" , "YieldType" ,"YIELD_FAITH");
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
 VALUES ("TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD_2" , "Amount" ,"1");
INSERT INTO ModifierArguments (ModifierId , Name ,Value)
 VALUES ("TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD_2" , "Intercontinental" ,"false");
 
--马里平沙外商不加金
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRADE_ROUTE_GOLD_DESERT_ORIGIN' and Name='Amount';

--马里商业区相邻圣地
UPDATE Adjacency_YieldChanges SET YieldChange='1' WHERE ID="Holy_Site_Gold" and AdjacentDistrict="DISTRICT_HOLY_SITE" and YieldType="YIELD_GOLD" and YieldChange="2";
UPDATE Adjacency_YieldChanges SET YieldChange='1' WHERE ID="Lavra_Gold" and AdjacentDistrict="DISTRICT_LAVRA" and YieldType="YIELD_GOLD" and YieldChange="2";

--马里丘陵相邻不再提供信仰
--UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_DESERT_HILLS_CITY_CENTER_FAITH' AND Name='Amount';


--狩猎 GODDESS_OF_THE_HUNT_CAMP_PRODUCTION_MODIFIER GODDESS_OF_THE_HUNT_CAMP_FOOD_MODIFIER
UPDATE ModifierArguments SET Value='YIELD_GOLD' WHERE ModifierId='GODDESS_OF_THE_HUNT_CAMP_PRODUCTION_MODIFIER' AND Name='YieldType';

--法国
--城堡移至行政
UPDATE Improvements SET PrereqCivic='CIVIC_FEUDALISM' WHERE ImprovementType='IMPROVEMENT_CHATEAU';
--城堡加基础产出
--文
UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_CHATEAU' and YieldType="YIELD_CULTURE";
INSERT INTO Adjacency_YieldChanges (ID,Description,YieldType,YieldChange,TilesRequired,AdjacentRiver,PrereqCivic)
	VALUES ('Chateau_River_CULTURE_TEAMPVP','Placeholder','YIELD_CULTURE',"1","1",1,"CIVIC_HUMANISM");
INSERT INTO Improvement_Adjacencies (ImprovementType,YieldChangeId)
	VALUES ('IMPROVEMENT_CHATEAU','Chateau_River_CULTURE_TEAMPVP');
--INSERT INTO Improvement_BonusYieldChanges (Id,ImprovementType,YieldType,BonusYieldChange,PrereqCivic)
--	VALUES ('IMPROVEMENT_CHATEAU_CULTURE1','IMPROVEMENT_CHATEAU','YIELD_CULTURE',"1","CIVIC_HUMANISM");
--锤
INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType,YieldChange)
 VALUES ("IMPROVEMENT_CHATEAU" , "YIELD_PRODUCTION" , "2");
--金
UPDATE Improvement_YieldChanges SET YieldChange='0' WHERE ImprovementType='IMPROVEMENT_CHATEAU' and YieldType="YIELD_GOLD";
UPDATE Adjacency_YieldChanges SET YieldChange=3 WHERE ID='Chateau_River';
--INSERT INTO Improvement_YieldChanges (ImprovementType , YieldType,YieldChange)
-- VALUES ("IMPROVEMENT_CHATEAU" , "YIELD_GOLD" , "1");

--间谍容量
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='UNIQUE_LEADER_ADD_SPY_CAPACITY' AND Name='Amount';
--间谍
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='UNIQUE_LEADER_ADD_SPY_UNIT' AND Name='Amount';
--能见度
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='UNIQUE_LEADER_ADD_VISIBILITY' AND Name='Amount';



--奥斯曼
UPDATE BuildingReplaces SET ReplacesBuildingType='BUILDING_MARKET' WHERE CivUniqueBuildingType='BUILDING_GRAND_BAZAAR';
UPDATE Buildings SET Cost="60",PrereqTech="TECH_CURRENCY" WHERE BuildingType='BUILDING_GRAND_BAZAAR';
UPDATE Building_YieldChanges SET YieldChange="3" WHERE BuildingType='BUILDING_GRAND_BAZAAR';
DELETE FROM BuildingPrereqs WHERE Building="BUILDING_GRAND_BAZAAR";
INSERT INTO BuildingModifiers (BuildingType , ModifierId)
	VALUES 	('BUILDING_GRAND_BAZAAR' , 'MARKET_TRADE_ROUTE_CAPACITY');	
UPDATE ModifierArguments SET Value='4' WHERE ModifierId='HEAD_FALCONER_ADJUST_CITY_COMBAT_BONUS' AND Name='Amount';

--私掠船
UPDATE Units SET PrereqCivic='CIVIC_EXPLORATION' WHERE UnitType='UNIT_PRIVATEER';
--海猎犬
UPDATE Units SET PrereqCivic='CIVIC_EXPLORATION' WHERE UnitType='UNIT_ENGLISH_SEADOG';