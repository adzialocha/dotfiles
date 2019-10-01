(xbindkey '("XF86AudioRaiseVolume") "amixer set Master 2dB+ unmute")
(xbindkey '("XF86AudioLowerVolume") "amixer set Master 2dB- unmute")

(xbindkey '("XF86AudioMute") "amixer set Master toggle")
(xbindkey '("XF86AudioMicMute") "amixer set Mic toggle")

(xbindkey '("XF86MonBrightnessDown") "light -U 10")
(xbindkey '("XF86MonBrightnessUp") "light -A 10")

(xbindkey '("XF86ScreenSaver") "xscreensaver-command -lock")
