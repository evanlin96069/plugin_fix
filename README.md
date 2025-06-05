# plugin_fix

Source Engine plugin that fixes `plugin_load`.

https://github.com/ValveSoftware/Source-1-Games/issues/6997

## Installation

1. Create the `addons` folder in the game directory.
  - Half-Life 2: `$STEAM\steamapps\common\Half-Life 2\hl2`
  - Portal: `$STEAM\steamapps\common\Portal\portal`
2. Copy the `addons\plugin_fix.vdf` into the `addons` folder in the game directory.
3. Copy the plugin `plugin_fix.dll` into the `addons` folder in the game directory.

## Build

### Prerequisites

* [ika](https://github.com/evanlin96069/ika) compiler
* 32-bit MinGW toolchain

```sh
make
```

The plugin `plugin_fix.dll` will be placed in the `build` folder.

Linux build not supported.
