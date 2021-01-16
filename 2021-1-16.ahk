#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetCapsLockState , AlwaysOff
CapsLock & 1:: Send {f1}
CapsLock & 2:: Send {f2}
CapsLock & 3:: Send {f3}
CapsLock & 4:: Send {f4}
CapsLock & 5:: Send {f5}
CapsLock & 6:: Send {f6}
CapsLock & 7:: Send {f7}
CapsLock & 8:: Send {f8}
CapsLock & 9:: Send {f9}
CapsLock & 0:: Send {f10}
CapsLock & -:: Send {f11}
CapsLock & =:: Send {f12}
CapsLock & a:: Send {A}
CapsLock & b:: Send {B}
CapsLock & c:: Send {C}
CapsLock & d:: Send {D}
CapsLock & e:: Send {E}
CapsLock & f:: Send {F}
CapsLock & g:: Send {G}
CapsLock & h:: Send {H}
CapsLock & i:: Send {I}
CapsLock & j:: Send {J}
CapsLock & k:: Send {K}
CapsLock & l:: Send {L}
CapsLock & m:: Send {M}
CapsLock & n:: Send {N}
CapsLock & o:: Send {O}
CapsLock & p:: Send {P}
CapsLock & q:: Send {Q}
CapsLock & r:: Send {R}
CapsLock & s:: Send {S}
CapsLock & t:: Send {T}
CapsLock & u:: Send {U}
CapsLock & v:: Send {V}
CapsLock & w:: Send {W}
CapsLock & x:: Send {X}
CapsLock & y:: Send {Y}
CapsLock & z:: Send {Z} 
Capslock::BS

;标准层
'::`
/::?
;空格层

space:: 
send {space}
return




space & `;:: Send {enter}
space & ,:: Send {<}
space & .:: Send {>} 
space & p:: Send {`~}
space & 1:: Send {!}
space & 2:: Send {@}
space & 3:: Send {#}
space & 4:: Send {$}
space & 5:: Send {`%}
space & 6:: Send {^}
space & 7:: Send {&}
space & 8:: Send {*}
space & 9:: Send {(}
space & 0:: Send {)}
space & b:: Send {:}
;space & d::
space & e:: Send {=}
;space & f:: 
space & g:: Send {end}
space & h:: Send {home}
space & i:: Send {up}
space & j:: Send {left}
space & k:: Send {down}
space & l:: Send {right}
space & m:: Send {}}
space & n:: Send {{}
space & q:: Send {-}
space & r:: Send {+}
space & s:: Send {"}
space & t:: Send {/}
space & w:: Send {_}
space & y:: Send {\}
space & u:: Send {[}
 space & o:: Send {]}
space &  ':: Send {'} 
space & /:: Send {?} 




~LButton & RButton::
WinMinimize,A
return

space & a::
send {ctrl down}
send {a}
send {ctrl up}
return
space & c::
send {ctrl down}
send {c}
send {ctrl up}
return
space & v:: 
send {ctrl down}
send {v}
send {ctrl up}
return 
space & x:: 
send {ctrl down}
send {x}
send {ctrl up}
return
space & z::
send {ctrl down}
send {z}
send {ctrl up}
return