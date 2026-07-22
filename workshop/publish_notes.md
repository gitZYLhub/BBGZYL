# 创意工坊发布配置

- 标题：`ZYL Lightweight Balance Mod`
- 游戏：Sid Meier's Civilization VI（App ID `289070`）
- 版本：`0.7.2`
- 首次可见性：仅自己可见
- 建议标签：Gameplay、Rulesets、Maps、Multiplayer、Chinese、English
- 上传目录：`D:\Civilization\Civ6mods\BBGZYL\ZYL_LightweightBalance`
- 简介文件：`workshop/description.bbcode`
- 更新说明：`workshop/changenote.txt`
- 预览图：`workshop/preview.jpg`（768×768，低于 Steam 的 1 MB 限制）

## 上传前检查

- 在仓库根目录运行：`powershell -ExecutionPolicy Bypass -File workshop/validate_metadata.ps1`。
- 检查必须通过，确保 `.modinfo` 的 `Name`、`Description` 和 `Teaser` 都是纯 ASCII 常量，不含中文或 `LOC_` 本地化键。
- Firaxis Workshop Uploader 的最终确认页必须显示标题 `ZYL Lightweight Balance Mod`，不能显示 `LOC_ZYL_LBM_NAME` 或目录名 `ZYL_LightweightBalance`。
- 旧上传器每次都会重新提交英文标题和描述；若最终确认页不正确，应取消上传，不要依靠上传后在网页中临时修正。

每次上传后都应在创意工坊页面核对标题和简介；首次发布确认无误后，再将可见性改为公开。
