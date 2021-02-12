[bar/mybar]
modules-right = date

[module/date]
type = internal/date
date = %Y-%m-%d%

[colors]
background = ${xrdb:color0:#222}
foreground = ${xrdb:color7:#222}
foreground-alt = ${xrdb:color7:#222}
primary = ${xrdb:color1:#222}
secondary = ${xrdb:color2:#222}
alert = ${xrdb:color3:#222}

[bar/bar]
; ...
background = ${colors.background}
foreground = ${colors.foreground}

; ...
