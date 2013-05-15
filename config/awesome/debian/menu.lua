-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Игры_Игрушки"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Игры_Карточные"] = {
	{"Gnome FreeCell","/usr/games/sol --variation freecell","/usr/share/pixmaps/freecell.xpm"},
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
}
Debian_menu["Debian_Игры"] = {
	{ "Игрушки", Debian_menu["Debian_Игры_Игрушки"] },
	{ "Карточные", Debian_menu["Debian_Игры_Карточные"] },
}
Debian_menu["Debian_Приложения_Видео"] = {
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
}
Debian_menu["Debian_Приложения_Графика"] = {
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Приложения_Научные_Математика"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"GCalcTool","/usr/bin/gcalctool","/usr/share/pixmaps/gcalctool.xpm"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Приложения_Научные"] = {
	{ "Математика", Debian_menu["Debian_Приложения_Научные_Математика"] },
}
Debian_menu["Debian_Приложения_Оболочки"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Приложения_Офисные"] = {
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
}
Debian_menu["Debian_Приложения_Программирование"] = {
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
}
Debian_menu["Debian_Приложения_Программы_просмотра"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"Xditview","xditview"},
}
Debian_menu["Debian_Приложения_Работа_со_звуком"] = {
	{"easytag","/usr/bin/easytag","/usr/share/pixmaps/easytag.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Debian_menu["Debian_Приложения_Работа_с_текстом"] = {
	{"Character map","/usr/bin/gucharmap"},
}
Debian_menu["Debian_Приложения_Редакторы"] = {
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gtk -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Приложения_Сеть_Мониторинг"] = {
	{"Mtr","mtr"},
}
Debian_menu["Debian_Приложения_Сеть_Общение"] = {
	{"Pidgin","/usr/bin/pidgin","/usr/share/pixmaps/pidgin-menu.xpm"},
	{"Remmina","/usr/bin/remmina"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Приложения_Сеть_Пересылка_файлов"] = {
	{"FileZilla","/usr/bin/filezilla","/usr/share/pixmaps/filezilla.xpm"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Приложения_Сеть_Просмотр_веб"] = {
	{"Lynx-cur", "x-terminal-emulator -e ".."lynx"},
}
Debian_menu["Debian_Приложения_Сеть"] = {
	{ "Мониторинг", Debian_menu["Debian_Приложения_Сеть_Мониторинг"] },
	{ "Общение", Debian_menu["Debian_Приложения_Сеть_Общение"] },
	{ "Пересылка файлов", Debian_menu["Debian_Приложения_Сеть_Пересылка_файлов"] },
	{ "Просмотр веб", Debian_menu["Debian_Приложения_Сеть_Просмотр_веб"] },
}
Debian_menu["Debian_Приложения_Системные_Администрирование"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center",},
	{"GNOME Network Tool","/usr/bin/gnome-nettool","/usr/share/pixmaps/gnome-nettool.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Приложения_Системные_Аппаратное_обеспечение"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Приложения_Системные_Безопасность"] = {
	{"Seahorse","/usr/bin/seahorse",},
}
Debian_menu["Debian_Приложения_Системные_Мониторинг"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Приложения_Системные_Управление_пакетами"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Приложения_Системные_Языковое_окружение"] = {
	{"Input Method Swicher", "x-terminal-emulator -e ".."/usr/bin/im-switch"},
}
Debian_menu["Debian_Приложения_Системные"] = {
	{ "Администрирование", Debian_menu["Debian_Приложения_Системные_Администрирование"] },
	{ "Аппаратное обеспечение", Debian_menu["Debian_Приложения_Системные_Аппаратное_обеспечение"] },
	{ "Безопасность", Debian_menu["Debian_Приложения_Системные_Безопасность"] },
	{ "Мониторинг", Debian_menu["Debian_Приложения_Системные_Мониторинг"] },
	{ "Управление пакетами", Debian_menu["Debian_Приложения_Системные_Управление_пакетами"] },
	{ "Языковое окружение", Debian_menu["Debian_Приложения_Системные_Языковое_окружение"] },
}
Debian_menu["Debian_Приложения_Специальные_возможности"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Приложения_Управление_проектами"] = {
	{"Getting Things GNOME!","/usr/bin/gtg","/usr/share/pixmaps/gtg.xpm"},
}
Debian_menu["Debian_Приложения_Управление_файлами"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"mc", "x-terminal-emulator -e ".."/usr/bin/mc","/usr/share/pixmaps/mc.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Приложения_Эмуляторы_терминалов"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Приложения"] = {
	{ "Видео", Debian_menu["Debian_Приложения_Видео"] },
	{ "Графика", Debian_menu["Debian_Приложения_Графика"] },
	{ "Научные", Debian_menu["Debian_Приложения_Научные"] },
	{ "Оболочки", Debian_menu["Debian_Приложения_Оболочки"] },
	{ "Офисные", Debian_menu["Debian_Приложения_Офисные"] },
	{ "Программирование", Debian_menu["Debian_Приложения_Программирование"] },
	{ "Программы просмотра", Debian_menu["Debian_Приложения_Программы_просмотра"] },
	{ "Работа со звуком", Debian_menu["Debian_Приложения_Работа_со_звуком"] },
	{ "Работа с текстом", Debian_menu["Debian_Приложения_Работа_с_текстом"] },
	{ "Редакторы", Debian_menu["Debian_Приложения_Редакторы"] },
	{ "Сеть", Debian_menu["Debian_Приложения_Сеть"] },
	{ "Системные", Debian_menu["Debian_Приложения_Системные"] },
	{ "Специальные возможности", Debian_menu["Debian_Приложения_Специальные_возможности"] },
	{ "Управление проектами", Debian_menu["Debian_Приложения_Управление_проектами"] },
	{ "Управление файлами", Debian_menu["Debian_Приложения_Управление_файлами"] },
	{ "Эмуляторы терминалов", Debian_menu["Debian_Приложения_Эмуляторы_терминалов"] },
}
Debian_menu["Debian_Справка"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Экран_Блокировщики"] = {
	{"Workrave","/usr/bin/workrave","/usr/share/pixmaps/workrave/workrave.xpm"},
}
Debian_menu["Debian_Экран"] = {
	{ "Блокировщики", Debian_menu["Debian_Экран_Блокировщики"] },
}
Debian_menu["Debian"] = {
	{ "Игры", Debian_menu["Debian_Игры"] },
	{ "Приложения", Debian_menu["Debian_Приложения"] },
	{ "Справка", Debian_menu["Debian_Справка"] },
	{ "Экран", Debian_menu["Debian_Экран"] },
}
