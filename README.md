# Bitmarker Design for Nanowire Alignment
This repository contains the bitmarker design documentation and relevant tooling.

## Documentation
A PDF describing the design is available [here](https://github.com/PvdBerg1998/BitmarkerLove/blob/master/Doc/bitmarker_doc.pdf).

## Design Files
The KLayout design files are available [here](https://github.com/PvdBerg1998/BitmarkerLove/blob/master/KLayout/).

## Bitmarker Decoder GUI
This tool is written to assist in decoding the bitmarkers on my nanowire deposition substrate. It uses the Love2D framework, hence the name.

### Controls
- R = Reset to $(0, 0)$.
- 3 = Set 3x3 bitmarker mode.
- 4 = Set 4x4 bitmarker mode.
- Q or Esc = Quit.

### Releases

The latest version can be executed using Love2D, and consists of a single Lua file, available [here](https://github.com/PvdBerg1998/BitmarkerLove/main.lua).

Prebuilt Windows packages are available [here](https://github.com/PvdBerg1998/BitmarkerLove/releases).

The GUI also be ran on Android using [this app](https://play.google.com/store/apps/details?id=org.love2d.android&hl=en&gl=US), though mode switching controls is impossible without an external keyboard. The default mode is 4x4.

## Bitmarker Image Alignment Macro
A macro for KLayout to aid in (SEM) image alignment on top of the design files is available [here](https://github.com/PvdBerg1998/BitmarkerLove/bitmarker_align.lym).

### Importing into KLayout
Import the macro using the KLayout macro editor (`Macros/Macro Development`). Go to the Python tab and press the import button in the top left (white square with left facing arrow). The macro loads on startup by default, this can be changed using the `Edit properties of macro` button. After importing, it does not load immediately. To do this, press the green `Run current script` button or restart KLayout.

### Toolbar Icon
The macro adds a button to the toolbar of KLayout. If you wish to add an icon to this button, you have to save [this image](https://github.com/PvdBerg1998/BitmarkerLove/icon.png) and correctly set its path inside the macro editor. The line that should be changed is:

    182     a.icon = r"/home/pim/.klayout/icon.png"

Without changing this line, the macro will also function, but the button will be blank.