setupPlanitWorkSpace()
{
    createVirtualDesktop()

    Run cmd /c wsl
    Sleep 500
    Send, cd ~/projects/planit && code .{Enter}
    Sleep, 5000 ;;wait for vscode to launch
    Send, #{Up}
    Send, ^~ ;;open terminal
    Sleep, 500
    Send, docker-compose up db{Enter}
    Sleep, 500
    Send, ^+~ ;;open terminal
    Sleep, 500
    Send, cd web && npm run start{Enter}
    Sleep, 500
    Send, ^+~ ;;open terminal
    Sleep, 500
    Send, cd backend && npm run start{Enter}
    Sleep, 500

    ;; Get the window handle of the Chrome window
    WinWaitActive, ahk_exe chrome.exe
    WinGet, chrome_win_id, ID

    ;; Move the Chrome window to the left screen and maximize it
    SysGet, monitor_count, MonitorCount
    if (monitor_count > 2) {
        ;; Move Chrome window to the left screen
        SysGet, monitor_width, MonitorWorkArea, 2
        WinMove, ahk_id %chrome_win_id%,, %monitor_width%, 0, %monitor_width%, A_ScreenHeight
        
        ;; Open ChatGPT window in the third display
        WinWait, ahk_exe chrome.exe
        WinActivate, ahk_exe chrome.exe
        Send, ^n ;; open a new window
        WinWait, ahk_exe chrome.exe, New Tab
        WinActivate, ahk_exe chrome.exe, New Tab
        Send, https://chat.openai.com{Enter}
        WinWait, ahk_exe chrome.exe, Chat with GPT- - Google Chrome
        WinGet, chatgpt_win_id, ID, ahk_exe chrome.exe, Chat with GPT- - Google Chrome
        SysGet, monitor_width, MonitorWorkArea, 3
        WinMove, ahk_id %chatgpt_win_id%,, %monitor_width%, 0, %monitor_width%, A_ScreenHeight
    }
    else if (monitor_count > 1) {
        SysGet, monitor_width, MonitorWorkArea, 1
        WinMove, ahk_id %chrome_win_id%,, 0, 0, %monitor_width%, A_ScreenHeight
    }
    WinMaximize, ahk_id %chrome_win_id%

    return
}
