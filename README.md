# FreedomBasic
Freedom BASIC: a Liberty BASIC 4.5.1-compatible interpreter and IDE for Windows and Linux. Downloads and community.

Free to try for one year: full features, including .exe creation. After that: programs up to 1800 lines and no .exe creation, unless you have a license (not on sale yet).

Build 698 (32-bit and 64-bit)

IDE
New: welcome screen at startup, with animated wings and the buttons New, Open, Recent and Help. Tick "Don't show this again" to hide it.
New: Recent files (last 8), in the welcome screen and in the File menu.
New: Replace and Replace All (\n = new line, \t = tab in "Replace with"), with Skip, "Skip text in quotes" and automatic skipping of comments.
New: Auto-indent code (Edit menu, Ctrl+I).

Language
New: CHAIN starts the target program.
New: TRACE accepted. SOUND accepts the optional volume, panning and waveform arguments (ignored).
New: _ARRAYCOUNT, _ARRAYJOIN, _ARRAYSPLIT, _STRJOIN, _STRSPLIT.
New: tooltips: #ctl "tooltip text", toolbar buttons (addbutton), tabs (tabtooltip n text).
New: CURSOR shows hourglass / arrow / crosshair on the program window.
New: LISTVIEW with grid, pinned row numbers, scrolling, addrow; accepts both forms (array + label, and x,y,w,h).
New: capturemouse for graphicbox (Freedom only).
Fix: a SELECT CASE with labels inside its cases can now be reached from event handlers ("Undefined label").
Fix: user-defined function or sub named like a QB keyword (e.g. function paint) no longer crashes.
Fix: deep recursion (e.g. flood fill) no longer ends with "Out of stack space": 256 MB stack, lighter function calls.
Fix: GOSUB inside SELECT CASE and inside DO loops returns to the right place.
Fix: type-suffix arrays (a&(i), g~&(i)) work; KEY can be a variable or array name.
Fix: float division by zero gives infinity in all QB64-style programs.
Fix: LINE with alpha is much faster (only its bounding box is read and written).
Fix: classic SCREEN mode stretches with black bars; SCREEN programs end with "Hit any key to close window".
Fix: graphics are shown before INPUT; default graphics window title is "Freedom Basic".
Fix: Greek text in graphics with the default font now works on non-Greek Windows locales.
Fix: runtime error log now includes build, run time, scope and the names of arrays and types.
Fix: a heap overflow in the tooltip code.

Help
New: bilingual (English/Greek) help with tested examples: freedombasic_help.zip. New entries include DRAWLINE, DRAWOVAL, SETPIXEL, TABCONTROL, LISTVIEW, RESTORE, SCAN, DUMP, CURSOR, DRIVES$, INPUTTO$, RESUME, NOMENU, TRACE and the array extensions.

Freedom Designer 1.61
New: right-click menu on controls: properties, "Click opens a form...", disable / enable / show / hide / set focus (in a handler), copy, duplicate, paste, delete.
New: double-click on a control jumps to its code.
New: ListView columns and rows, window options (title, type, handle, colors), tooltips everywhere, one statement per line.

SHA-256:
FreedomBasic64.exe SHA-256: …
FreedomBasic32.exe SHA-256: …
FreedomBasic_Linux_b698.tar.gz SHA-256: …
FreedomDesigner.1.61_LB.zip SHA-256: …
freedombasic_help.zip SHA-256: …
