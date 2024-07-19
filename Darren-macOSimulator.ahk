#Requires AutoHotkey v2.0

SendMode("Input")

$CapsLock::
{
    ; 判斷 Caps Lock 是否被按住超過 0.4 秒
    CapsError := !KeyWait("CapsLock", "T0.4")
    
    if CapsError {
        ; 長按超過 0.4 秒，切換大寫鎖定
        if GetKeyState("CapsLock", "T") == 0
            SetCapsLockState("On")
        else
            SetCapsLockState("Off")
    }
    else {
        ; 短按，模擬 Shift 鍵單擊(切換語言)
        Send("{RShift Down}")
        Send("{RShift Up}")
        SetCapsLockState("Off")
    }
    Return
}

$+CapsLock::  
{
    ; 定義 Shift + CapsLock 的按下事件
    ; 切換大寫鎖定狀態
    if GetKeyState("CapsLock", "T") == 0
        SetCapsLockState("On")
    else
        SetCapsLockState("Off")
    Return
}


; 以下是新增的快捷鍵設置
!a::Send("^a")  ; 將 Alt+A 設置為全選
!c::Send("^c")  ; 將 Alt+C 設置為複製
!v::Send("^v")  ; 将 Alt+V 设置為貼上
!d::Send("#d")  ; 將 Alt+D 設置為切換到桌面，此處用 Win+D 實現
!f::Send("^f")  ; 將 Alt+F 設置為全域搜尋
!s::Send("^s")  ; 將 Alt+S 設置為保存
!m::WinMinimize("A") ; 按下 Alt + M 缩小当前活动窗口


!x::Send("^x")  ; 將 Alt+X 設置為剪切
!z::Send("^z")  ; 將 Alt+Z 設置為撤銷操作
!y::Send("^Y")  ; 將 Alt+Y 設置為下一步操作
!t::Send("^t")  ; 將 Alt+T 設置為添加新標籤頁
!+t::Send("^+t")  ; 將 Alt+shift+T 設置為開啟剛剛關閉的標籤頁
!n::Send("^n")  ; 將 Alt+N 設置為開新視窗
!+n::Send("^+n")  ; 將 Alt+N 設置為開無痕模式的新視窗

!r::Send("^{F5}")  ; 將 Alt+R 設置為刷新界面
!l::Send("^l")  ; 將 Alt+L 設置為跳到網址列
!i::Send("!{Enter}") ; 將 Alt+I 設置為查看內容

!=::Send("^=")  ; 將 Alt++ 改為ctrl++，放大縮小
!-::Send("^-")  ; 將 Alt+- 改為ctrl+-，放大縮小





; 按下 Alt + 向左键，跳至最左（行首）
~!Left::Send("{Home}")  ; 發送 Home 键

; 按下 Alt + 向右键，跳至最右（行尾）
~!Right::Send("{End}")  ; 發送 End 键


; 按下 Shift + Alt + 向左键，發送 Shift + Home
~+!Left::Send("+{Home}")

; 按下 Shift + Alt + 向左键，發送 Shift + Home
~+!Right::Send("+{End}")


; 按下 Alt + 向上键，跳至最上方
~!Up::Send("^{Home}")
; 按下 Alt + 向下键，跳至最下方
~!Down::Send("^{End}")

;windows shift 上or下 全選到最上or下面
!+Up::Send("^+{Home}")
!+Down::Send("^+{End}")


; Alt + Backspace 模擬macOS，command+delete，向左整排刪除
!Backspace::Send("+{Home}{Del}")





;alt+滑鼠滾輪(原本為ctrl+滾輪)  頁面放大縮小
; 定義 Alt + 滑鼠滾輪向上滾動的快捷鍵
!WheelUp::
{
    ; 按下 Ctrl
    Send("{Ctrl Down}")
    ; 模擬滑鼠滾輪向上滾動
    Send("{WheelUp}")
    ; 釋放 Ctrl
    Send("{Ctrl Up}")
    Return
}

; 定義 Alt + 滑鼠滾輪向下滾動的快捷鍵
!WheelDown::
{
    ; 按下 Ctrl
    Send("{Ctrl Down}")
    ; 模擬滑鼠滾輪向下滾動
    Send("{WheelDown}")
    ; 釋放 Ctrl
    Send("{Ctrl Up}")
    Return
}





;模擬MacOS，打字時shift+,，可以是全形的逗號
; 將左側的 Shift + ',' 改為輸出 '，'
<+SC033::Send("，")

; 將左側的 Ctrl + ',' 改為輸出 '<'
<^SC033::Send("<")



;點網頁的時候，就可以像按住command+滑鼠左鍵，開啟新的頁面

; 新增 Alt + 滑鼠左鍵模擬 Ctrl + 滑鼠左鍵
!LButton::
{
    ; 按下 Ctrl
    Send("{Ctrl Down}")
    ; 模擬滑鼠左鍵單擊
    Click
    ; 釋放 Ctrl
    Send("{Ctrl Up}")
    Return
}




!w::
{
    If WinActive("A") { ; 檢查是否有活動窗口
        If WinExist("A") { ; 檢查活動窗口是否存在標籤頁
            SendInput("^{w}") ; 如果存在標籤頁，則發送 Ctrl+W 關閉當前標籤頁
        } else {
            SendInput("!{F4}") ; 如果沒有標籤頁，則發送 Alt+F4 關閉當前窗口
        }
    }
    Return
}


; Alt + 數字鍵，模擬macOS，command+數字鍵切換分頁

!1::Send("^1")
!2::Send("^2")
!3::Send("^3")
!4::Send("^4")
!5::Send("^5")
!6::Send("^6")
!7::Send("^7")
!8::Send("^8")
!9::Send("^9")



;  Windows 键 + 向左键
#Left::Send("^{Left}")
; 模擬macOS，發送 Option (Alt) + 向左键
    
;  Windows 键 + 向右键
#Right::Send("^{Right}")
; 模擬macOS，發送 Option (Alt) + 向左键

;  Windows 键 + 向左键 + shift
#+Left::Send("^+{Left}")
; 模擬macOS，發送 Option (Alt) + shift + 向左键
    
;  Windows 键 + 向右键
#+Right::Send("^+{Right}")
; 模擬macOS，發送 Option (Alt) + shift + 向左键




;vscode 快捷鍵 

;  Win + UpArrow 映射到 Alt + Up Arrow
#Up::Send("!{Up}")
;  Win + UpArrow 映射到 Alt + Up Arrow
#Down::Send("!{Down}")

;alt + shift + z (原ctrl+y) 模擬command + shift + z redo
!+z::Send("^y")

#+Up::Send("!+{Up}")
;windows shift 上下箭頭 複製上下行 (原alt + shift + 上下)
#+Down::Send("!+{Down}")


