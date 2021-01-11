; 此脚本是从论坛中许多类似它的脚本获得灵感
; 并建立的. 把感谢送给 ck, thinkstorm, Chris,
; 和 aurelian 的良好工作.

; 更新历史:
; 2006.11.07: 优化了 !RButton 中的大小调整代码, courtesy of bluedawn.
; 2006.02.05: 修复 double-alt (~Alt 热键) 以使它工作于最近的 AHK 版本.

; 双 Alt 修饰键是通过按下
; Alt 两次来激活的, 很像双击. 第二次时保持按住,
; 一直到您点击.
;
; 快捷键:
;  Alt + Left Button  : 拖动来移动窗口.
;  Alt + Right Button : 拖动来调整窗口大小.
;  Double-Alt + Left Button   : 最小化窗口.
;  Double-Alt + Right Button  : 最大化/还原窗口.
;  Double-Alt + Middle Button : 关闭窗口.
;
; 您可以在首次点击 Alt 后
; 松开它而不用在整个过程中都按住.

If (A_AhkVersion < "1.0.39.00")
{
    MsgBox,20,,This script may not work properly with your version of AutoHotkey. Continue?
    IfMsgBox,No
    ExitApp
}


; 这是在我的系统上运行的最顺畅
; 的设置. 根据您显卡和 CPU 的
; 速度, 您可能要增加或减小这个值.
SetWinDelay,2

CoordMode,Mouse
return

+LButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; 此消息大部分时候相当于 WinMinimize,
    ; 但是它避免了作用于 PSPad 时的问题.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; 获取初始的鼠标位置和窗口 id, 并
; 在窗口处于最大化状态时返回.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; 获取初始的窗口位置.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; 如果按钮已经被松开了则退出.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; 获取当前的鼠标位置.
    KDE_X2 -= KDE_X1 ; 得到距离原来鼠标位置的偏移.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; 把这个偏移应用到窗口位置.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; 移动窗口到新的位置.
}
return

+RButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; 在最大化和还原状态中切换.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; 获取初始的鼠标位置和窗口 id, 并
; 在窗口处于最大化状态时返回.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; 获取初始的窗口位置和大小.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; 定义鼠标当前所处的窗口区域.
; 四个区为左上, 右上, 左下和右下.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
   KDE_WinLeft := 1
Else
   KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
   KDE_WinUp := 1
Else
   KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P ; 如果按钮已经松开了则退出.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; 获取当前鼠标位置.
    ; 获取当前的窗口位置和大小.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; 得到距离原来鼠标位置的偏移.
    KDE_Y2 -= KDE_Y1
    ; 然后根据已定义区域进行动作.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; 大小调整后窗口的 X 坐标
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; 大小调整后窗口的 Y 坐标
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; 大小调整后窗口的 W (宽度)
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; 大小调整后窗口的 H (高度)
    KDE_X1 := (KDE_X2 + KDE_X1) ; 为下一次的重复重新设置初始位置.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

; "Alt + MButton" 可能简单了点, 不过我
; 喜欢给像这样的操作
; 增加额外的安全检测.
+MButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    WinClose,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
return

; 这里检测 alt 键的双击.
~Alt::
DoubleAlt := A_PriorHotKey = "~Alt" AND A_TimeSincePriorHotkey < 400
Sleep 0
KeyWait Alt  ; 这样避免了键盘的自动重复功能的扰乱.
return