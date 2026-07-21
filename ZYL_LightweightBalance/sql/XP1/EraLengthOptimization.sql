------------------------------------------------------------------------------
-- FILE:    XP1/EraLengthOptimization.sql
-- PURPOSE: Optional world-era duration ranges for Rise and Fall rules.
------------------------------------------------------------------------------

-- Values are expressed at Standard speed. Civilization VI scales them with
-- game speed, so Online speed uses half of each value.
UPDATE Eras_XP1
SET GameEraMinimumTurns = CASE EraType
		WHEN 'ERA_ANCIENT' THEN 30
		WHEN 'ERA_CLASSICAL' THEN 50
		WHEN 'ERA_MEDIEVAL' THEN 40
		ELSE 30
	END,
	GameEraMaximumTurns = CASE EraType
		WHEN 'ERA_ANCIENT' THEN 50
		ELSE 60
	END
WHERE EraType IN (
	'ERA_ANCIENT',
	'ERA_CLASSICAL',
	'ERA_MEDIEVAL',
	'ERA_RENAISSANCE',
	'ERA_INDUSTRIAL',
	'ERA_MODERN',
	'ERA_ATOMIC',
	'ERA_INFORMATION'
);
