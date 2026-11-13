' Freedom Basic - welcome.bas  v1.1
' Runs at IDE start in its own process. Edit freely - delete the file to disable.
' From the IDE: ENVIRON$("FB_VERSION"), ENVIRON$("FB_LICENSE"), ENVIRON$("FB_DATADIR")
' To the IDE: writes welcome_cmd.txt in FB_DATADIR  ("new" / "open" / "help" / "file <path>")
nomainwin
ver$ = environ$("FB_VERSION")
lic$ = environ$("FB_LICENSE")
dd$ = environ$("FB_DATADIR")
if ver$ = "" then ver$ = "Freedom Basic"
dim rec$(20)
nrec = 0
if dd$ <> "" then
    if 1 = 1 then   ' the IDE creates recent.txt (may be empty) before it starts this program
        open dd$ + "recent.txt" for input as #5
        while eof(#5) = 0 and nrec < 8
            line input #5, ln$
            ln$ = trim$(ln$)
            if ln$ <> "" then
                nrec = nrec + 1
                rec$(nrec) = ln$
            end if
        wend
        close #5
    end if
end if
dim recShow$(20)
for i = 1 to nrec
    p = 0
    for j = len(rec$(i)) to 1 step -1
        if mid$(rec$(i), j, 1) = "\" or mid$(rec$(i), j, 1) = "/" then
            p = j
            exit for
        end if
    next j
    recShow$(i) = mid$(rec$(i), p + 1)
next i
WindowWidth = 520
WindowHeight = 380
UpperLeftX = int((DisplayWidth - WindowWidth) / 2)
UpperLeftY = int((DisplayHeight - WindowHeight) / 2)
BackgroundColor$ = "white"
graphicbox #w.g, 10, 10, 150, 120
statictext #w.t, "Καλώς ήλθατε στον κόσμο του Freedom Basic", 175, 20, 330, 22
statictext #w.e, "Welcome to the world of Freedom Basic", 175, 46, 330, 20
statictext #w.v, ver$, 175, 80, 330, 20
statictext #w.l, lic$, 175, 104, 330, 20
button #w.new, "New", [bNew], UL, 20, 145, 110, 28
button #w.opn, "Open...", [bOpen], UL, 140, 145, 110, 28
button #w.hlp, "Help", [bHelp], UL, 260, 145, 110, 28
statictext #w.rt, "Recent files (double-click to open):", 20, 185, 300, 18
listbox #w.rl, recShow$(, [rSel], 20, 205, 475, 90
checkbox #w.c, "Don't show this again", [chk], [chk], 20, 310, 200, 22
button #w.ok, "Close", [quit], UL, 395, 305, 100, 28
open "Freedom Basic" for window_nf as #w
#w.t "!font arial 12 bold"
#w "trapclose [quit]"
#w.g "down"
tick = 0
lastClick = 0
timer 70, [anim]
wait

[anim]
    tick = tick + 1
    gosub [drawLogo]
    wait

[drawLogo]
    ' background: orange-to-pink gradient (3 bands) with rounded look
    #w.g "fill 255 150 60"
    #w.g "backcolor 235 90 80"
    #w.g "color 235 90 80"
    #w.g "place 0 60"
    #w.g "boxfilled 150 120"
    #w.g "backcolor 215 55 110"
    #w.g "color 215 55 110"
    #w.g "place 0 95"
    #w.g "boxfilled 150 120"
    ' wing flap
    ang = sin(tick * 0.25) * 0.55
    cx = 75
    cy = 62 + int(sin(tick * 0.25 + 1.5) * 4)
    #w.g "backcolor white"
    #w.g "color white"
    for side = -1 to 1 step 2
        pts$ = ""
        ' upper edge: body -> wing tip (curved), lifted by the flap angle (tip moves most)
        for k = 0 to 10
            u = k / 10
            wx = cx + side * (4 + 62 * u)
            wy = cy - 2 - 26 * sin(3.14159 * u * 0.85) * (1 - 0.35 * u) - ang * 52 * u * u
            pts$ = pts$ + str$(int(wx)) + " " + str$(int(wy)) + " "
        next k
        ' lower edge: tip -> body (feathery, shorter)
        for k = 10 to 0 step -1
            u = k / 10
            wx = cx + side * (4 + 58 * u)
            wy = cy + 14 - 8 * u - 10 * sin(3.14159 * u) * 0.5 - ang * 40 * u * u
            pts$ = pts$ + str$(int(wx)) + " " + str$(int(wy)) + " "
        next k
        #w.g "polyfilled " + pts$
    next side
    #w.g "place 75 " + str$(cy + 38)
    #w.g "circlefilled 4"
    #w.g "flush"
    return

[bNew]
    cmd$ = "new"
    goto [send]

[bOpen]
    cmd$ = "open"
    goto [send]

[bHelp]
    cmd$ = "help"
    goto [send]

[rSel]
    #w.rl "selectionindex? si"
    if si < 1 or si > nrec then wait
    if time$("ms") - lastClick < 600 and lastSel = si then
        cmd$ = "file " + rec$(si)
        goto [send]
    end if
    lastClick = time$("ms")
    lastSel = si
    wait

[send]
    if dd$ <> "" then
        open dd$ + "welcome_cmd.txt" for output as #8
        print #8, cmd$
        close #8
    end if
    goto [quit]

[chk]
    wait

[quit]
    timer 0
    #w.c "value? v$"
    if v$ = "set" and dd$ <> "" then
        open dd$ + "welcome_off.txt" for output as #9
        print #9, "off"
        close #9
    end if
    close #w
    end
