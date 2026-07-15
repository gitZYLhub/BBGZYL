# 工作日志

## 版本 0.4

### 已完成

- 参考 Team PVP Balanced mod 结社 3.93 的写法，完成秘密结社 3 级头衔提前到文艺复兴时代。
- 将秘密结社 4 级头衔提前到工业时代。
- 保留并整理 2、3、4 级结社头衔免费化逻辑。
- 镀金宝库取消科技前置和金币购买前置字段，保留夜鹰 2 级头衔解锁。
- 炼金协会取消科技前置和金币购买前置字段，保留黄金黎明/赫尔墨斯教团 2 级头衔解锁。
- 地脉本身新增 +1 科技、+2 生产力。
- 地脉出现频率和有效地形删除列表照搬 Team PVP Balanced mod 结社 3.93。
- 参考 Team PVP Balanced mod 结社 3.93，补充书院 `DISTRICT_SEOWON` 对 `LeyLine_Science` 的地脉科技相邻。
- 伟人给地脉产出时，海军统帅改给食物，大将军改给生产力，大商人金币数值改为 +2。

### 暂缓

- 结社发现条件不改、但发现概率大幅提升。

### 暂缓原因

- 本机没有文明 6 原版数据库，无法直接确认 `SecretSocieties` 表中各发现来源的准确字段名。
- 参考 mod 中，Team PVP Balanced mod 结社 3.93 只明确使用了 `DiscoverAtCityStateBaseChance`。
- TeamPVP 的实际做法是把四个结社都写到城邦发现概率上，这适合它的联机设计，但会改变本模组想要保留的原版发现条件。
- 为避免猜测 `DiscoverAtNaturalWonderBaseChance`、`DiscoverAtTribalVillageBaseChance`、`DiscoverAtBarbarianCampBaseChance` 等字段导致数据库报错，本版不写入任何发现概率 SQL。

### 后续实现条件

- 拿到文明 6 原版秘密结社模式数据库文件。
- 或者拿到一次启用本模组后的 `Database.log` / `Modding.log`，用日志确认字段名。
- 确认字段后，再分别提高：
  - 弥涅耳瓦夜鹰的原版发现来源概率。
  - 黄金黎明/赫尔墨斯教团的原版发现来源概率。
  - 虚空吟唱者的原版发现来源概率。
  - 血色契约的原版发现来源概率。
