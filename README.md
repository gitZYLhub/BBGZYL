# BBGZYL workspace

This repository is the working area for ZYL Lightweight Balance Mod.

Tracked content:

- `ZYL_LightweightBalance/`: the playable mod being developed.
- `referencemods/`: lightweight notes and selected reference captures.
- `BetterBalancedGame/`: tracked as a Git submodule that points to the upstream BBG repository.

Ignored local content:

- `steamcmd/` and Steam workshop downloads.
- large runtime/cache folders.
- temporary web-search captures in the workspace root.

After cloning on another machine, run:

```powershell
git submodule update --init --recursive
```

Steam Workshop reference mods can be restored from the notes in
`referencemods/local-workshop-mods.md`.
