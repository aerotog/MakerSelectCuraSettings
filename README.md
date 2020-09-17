# MakerSelectCuraSettings
Patches and settings to use Monoprice Maker Select or Wanhao Duplicator i3 USB 3D printers with Ultimaker Cura 4

Cura logs can be found in %APPDATA%\cura\4.x\cura.log

## USB Detection
The file "patch_AutoDetectBaudJob.sh is a small script that will patch the Python script used for detecting the USB baud rate. Explanation on how this is done is in the script. The python file will log which baud rate is being tests and which is found. The Maker Select runs on baud 115200.

Usage:
```bash
> ./patch_AutoDetectBaudJob.sh /path/to/Cura/install/
```

The Gcode used for request and response validation can be tested manually using [Pronterface](https://www.pronterface.com/).