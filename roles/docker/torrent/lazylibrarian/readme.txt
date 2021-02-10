### https://www.reddit.com/r/LazyLibrarian/comments/eczkhj/lazylibrarian_calibre_calibreweb_setup/

WIP

GOAL:LL downloads > Calibre emails > Calibre-Web in-sync

################################################################################################################
# LazyLibrarian #
################################################################################################################
*LazyLibrarian unRaid Mapping:
	/config <--> /appdata/lazylibrarian
	/downloads <--> /downloads/completed/books
	/books <--> /media/books/   [SAME AS CALIBRE library]
*LazyLibrarian Config: Settings > Processing
	Download Dir:
		/downloads/completed/books
	eBook Library Folder:
		/books
	Calibredb import program:
		/opt/calibre/calibredb [if using linuxserver unraid docker]
################################################################################################################
# Calibre #
################################################################################################################
*Calibre unRaid Mapping:
	/books <--> /media/books/
	/import <--> /downloads/completed/books/
	/librarian <--> /media/librarian/  [OPTIONAL / NOT NEEDED, just watch folder]
	/config <--> /appdata/calibre
	ADD AN EXTRA Variable to docker config:
		Name:CalibreMod
		KEY:DOCKER_MODS
		Value:linuxserver/calibre-web:calibre
		Description:optional - Adds the ability to enable the Calibredb import program
*Calibre Config:
	eBook Naming: <LEAVE AS DEFAULT>
	Calibry Library: /books [if starting new, this should be empty and import from other location]
	Automatic adding tab (path): /librarian [OPTIONAL ONLY]
################################################################################################################
# Calibre-Web #
################################################################################################################
*Calibre-Web unRaid Mapping:
	/books <--> /media/books/
	/config <--> /appdata/calibre-web
*Calibre-Web Config:
	Location of Calibre database: /books
