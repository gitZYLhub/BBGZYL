# 更新日志

版本：0.4

比较对象：版本 0.3。

## 一、游戏整体数值调整

### 结社

- 结社 2、3、4 级头衔免费化维持版本 0.3 的实现：
  - 选择 2、3、4 级结社头衔时返还 1 个总督点。
  - 1 级结社头衔不返还总督点。

- 结社头衔时代提前：
  - 四个结社的 3 级头衔最早时代改为文艺复兴时代。
  - 四个结社的 4 级头衔最早时代改为工业时代。
  - 覆盖对象：
    - `GOVERNOR_PROMOTION_OWLS_OF_MINERVA_3`
    - `GOVERNOR_PROMOTION_HERMETIC_ORDER_3`
    - `GOVERNOR_PROMOTION_VOIDSINGERS_3`
    - `GOVERNOR_PROMOTION_SANGUINE_PACT_3`
    - `GOVERNOR_PROMOTION_OWLS_OF_MINERVA_4`
    - `GOVERNOR_PROMOTION_HERMETIC_ORDER_4`
    - `GOVERNOR_PROMOTION_VOIDSINGERS_4`
    - `GOVERNOR_PROMOTION_SANGUINE_PACT_4`

- 镀金宝库：
  - 取消科技前置。
  - 取消金币购买前置字段。
  - 仍依赖弥涅耳瓦夜鹰 2 级头衔解锁。
  - 本版本没有修改镀金宝库成本、产出、伟人点或文化镜像机制。

- 炼金协会：
  - 取消科技前置。
  - 取消金币购买前置字段。
  - 仍依赖黄金黎明/赫尔墨斯教团 2 级头衔解锁。
  - 本版本没有修改炼金协会成本、产出或伟人点。

- 地脉：
  - 地脉资源本身新增产出：
    - +1 科技。
    - +2 生产力。
  - 地脉出现频率改为 `10`。
  - 地脉有效生成地形删除以下地形，照搬 Team PVP Balanced mod 结社 3.93 的写法：
    - `TERRAIN_TUNDRA`
    - `TERRAIN_SNOW`
    - `TERRAIN_TUNDRA_HILLS`
    - `TERRAIN_SNOW_HILLS`
    - `TERRAIN_DESERT_HILLS`
    - `TERRAIN_DESERT`
    - `TERRAIN_GRASS_HILLS`
    - `TERRAIN_PLAINS_HILLS`
  - 书院 `DISTRICT_SEOWON` 现在可以从地脉获得科技相邻加成 `LeyLine_Science`，对齐普通学院的地脉相邻机制。

- 伟人给地脉的产出：
  - 海军统帅给地脉的产出类型由科技改为食物。
  - 大将军给地脉的产出类型由科技改为生产力。
  - 大商人给地脉的金币数值改为 +2。

### 暂缓项

- “结社发现条件不改，但发现概率大幅提升”本版暂缓。
- 原因：
  - Team PVP Balanced mod 结社 3.93 只明确展示了 `DiscoverAtCityStateBaseChance` 的写法。
  - TeamPVP 的方案会把四个结社都改成城邦相关发现概率，这会改变发现条件，不符合本模组当前设计。
  - 本机没有文明 6 原版数据库，无法可靠确认村庄、自然奇观、蛮族营寨等原版发现来源对应的准确列名。
- 当前处理：
  - 不写入任何发现概率 SQL，避免因猜字段名导致进游戏数据库报错。
  - 已记录到 `docs/work_log.md`，等拿到原版数据库或实机日志后再实现。

## 二、游戏内容补充

- 本版本没有新增万神殿、建筑、单位或文明内容。

## 三、文明平衡性调整

- 本版本暂无文明平衡性调整。
