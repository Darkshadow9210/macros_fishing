

b:: {
    
    Loop {
        ; Step 1: Cast the fishing line
        Click "Right"
        Sleep 2000 ; Wait 2 seconds for the cast animation to finish
        
        ; Step 2: Get your game window dimensions
        WinGetClientPos(,, &Width, &Height, "A")
        
        ; Step 3: Wait for the mod icon to appear on screen
        BiteDetected := false
        Loop {
            ; Scans the screen for your mod icon. 
            ; '*20' allows for minor color shifts caused by UI transparency or scaling.
            if ImageSearch(&FoundX, &FoundY, 0, 0, Width, Height, "*20 fish_sign.png") {
                BiteDetected := true
                break ; Icon found! Break out of the scanning loop
            }
            
            Sleep Random(100, 110) ; Checks 10 times per second to keep CPU usage low
            
            ; Safety timeout: If no fish bites within 45 seconds, break and recast
            if (A_Index > 450) {
                break
            }
        }
        
        ; Step 4: Reel in the catch
        if (BiteDetected) {
            Click "Right" ; Reels in the fish
            Sleep Random(900, 1000)    
        }

        send "{2 down}"
        sleep Random(90, 110)
        send "{2 up}"
        Click "Right"
        sleep Random(90, 110)
        send "{1 down}"
        sleep Random(90, 110)
        send "{1 up}"
    }


            
}

; Press Escape to instantly turn off the script
Esc:: {
    ExitApp
}