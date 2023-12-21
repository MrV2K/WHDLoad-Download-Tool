;- ############### WHDLoad Download Tool Info
;
; Version 1.3
;
; © 2023 Paul Vince (MrV2k)
;
; https://easyemu.mameworld.info
;
; [ PB V5.7x/V6.x / 32Bit / 64Bit / Windows / DPI ]
;
; A downloader for Retroplay's WHDLoad Archive & More!
;
;- ############### Credits
;
; Conrad Fenech & Brian Lloyd for bug testing the connection issues
;
;- ############### Version Info
;

Global Version.s="1.3"
;
;============================================
; VERSION INFO v0.1a (Initial Release)
;============================================
;
;============================================
; VERSION INFO v0.2a 
;============================================
;
; Updated Turran FTP info in docs.
; Updated donate link on about window.
; Fixed save path gadgets actions when loading prefs. 
;
;============================================
; VERSION INFO v0.3a 
;============================================
;
; Load / Save prefs now only shows prefs files
; Changed FTP connections to PBEx_FTP DLL which has fixed the connection errors.
; Fixed a typo in the demo download paths
; Fixed bug in list creator/editor that ignored selected files when updating main list.
; Changed download to console window and added escape key
; Blocked close console button
;
;============================================
; VERSION INFO v0.4a 
;============================================
;
; Added support for WHDLoad based disk magazines.
; Added a check to FTP download to catch if a file is created but no data is downloaded. The error is logged in the ftp.log file and the empty file is deleted.
; Fixed a crash if the required DLL files are missing by preventing the program loading.
; Added minimize to main window.
; Switched dat file download to a console and added ftp log support.
; The edit window now work with the filters. You can now filter and add/remove files to the same list.
; Added Chip and Fast memory files to the filter.
; Preference files have been updated for new filters.
; Re-worked the filter panel to make room by moving game, demo and magazine filters next to path boxes.
; All FTP settings and FTP paths are now stored in the preferences files and can be edited.
; Updated the help window to reflect all the new changes.
;
;============================================
; VERSION INFO v0.5a 
;============================================
;
; Added magazines to the 'Clean Files' procedure.
; Added 0kb file check to 'Clean Files' procedure.
; Added temporary fix to FTP download for 0kb files via DOS FTP command.
; Added a few more donation notifications to the download procedure.
;
;============================================
; VERSION INFO v0.6a 
;============================================
;
; Fixed escaping FTP download crashing the download window.
; Added separate download folder for Beta games.
; Added preview window to show download file list.
; Fixed Port gadget overlap on main window.
; Fixed disabled gadgets when loading a prefs file.
; Added switch to change between default PB or alternate FTP procedures.
; Updated help to reflect changes.
; Adapted filter to show beta files separate to games
;
;============================================
; VERSION INFO v0.7a 
;============================================
;
; Moved FTP procedures To Windows API functions.
; Fixed FTP fallback related console And UI crashes.
; Fixed non unicode characters in download name saving as empty files.
; Fixed open beta folder button.
; Removed requirement For PB_FTPEx libraries
; Clean files now only lists lha & lzx files.
; Added experimental support For Linux Ubuntu 20+ & MacOS (source available).
; Added check For lists folder. Creates If Not found.
; Added donate button To main window.
; Added version information To executables
;
;============================================
; VERSION INFO v0.8a 
;============================================
;
; Fixed old dat files not being deleted in Scan FTP procedure.
; Cleaned up unneeded variables and lists from the FTP download procedures.
; Fixed console actions on Download FTP procedure.
; Tweaked FTP procedures to use real FTP variables rather than 1 & 0.
; Minor speed up when processing strings.
; Added button that makes a new folder of archives based on your filter selections.
; Make Folder opens the output folder window when complete.
;
;============================================
; VERSION INFO v0.9a 
;============================================
;
; Fixed a bug in subfolder creation.
; Added ability to download to folder structures either by category or alphabetically.
; Changed 'Save Prefs' and 'Load Prefs' to be disabled until the database is loaded.
; Updated the default ftp login to ftp2.grandis.nu.
; Centered console on main window.
; Added HTTP based downloads.
; HTTP & FTP downloading now selectable fron the main window. HTTP is now the default, but the setting is saved in the prefs files if the user wants to change it.
; Added HTTP path to main window and prefs.
; Removed 'Use Subfolders' gadget and replaced with selectable combo gadgets for sorting downloads.
; Improved the download preview window procedure.
; Added a selectable 255 file limit to the download folders for the A500 mini home computer.
; All FTP and download gadgets are enabled by default.
; The FTP procedure has been updated to support the 0-Z and category downloads.
; Removed 'Make Folder' until I can make a better implementation of it.
; Fixed a small bug in scrape data procedure.
; Updated help file to reflect this versions changes.
; Improved the filter speed.
; Clear data now keeps the server and filter settings.
; Fixed a couple of bugs in the save/load prefs procedure. All gadgets now update properly.
; The clean files process is a bit dumber in the sense that it just looks for the right filename and deletes any lha or lzx file that doesn't match. It does still look for zero kilobyte files.
; Added a 'refresh list' keyboard shortcut (F5) to update the available files if the user deletes any files manually.
;
;============================================
; VERSION INFO v1.0 
;============================================
;
; Added a check for duplicate dat files and delete the older one.
; 'Load Prefs' now enabled by default as it loads server settings.
;
;============================================
; VERSION INFO v1.1
;============================================
;
; Added 28 new filters.
; Fixed bug in scrape procedure that forgot to add beta games to Amiga system.
; Added fix for x86 compilation.
; Fixed download number in download screen.
;
;============================================
; VERSION INFO v1.11
;============================================
;
; Fixed bug in beta path.
; Fixed compilation version info.
; Added paypal.me link To the about window If you think I deserve a coffee.
;
;============================================
; VERSION INFO v1.12
;============================================
;
; Fixed bug where default.prefs was loaded at startup but the gadgets didn't update.
;
;============================================
; VERSION INFO v1.2
;============================================
;
; Added alphabetical sorting to category download.
; Fixed the sort gadgets not updating when the default.prefs was loaded at startup.
; Added an improved 'Make Folder' procedure back. It doesn't support A500 mini 255 file limit though.
; Fixed sort gadget logic.
; Updated the help window to reflect the new changes.
; Increased the window height to fit new button in and space out the filter a bit better.
;
;============================================
; VERSION INFO v1.21
;============================================
;
; Fixed a bug when the FTP and sort settings weren't applied to the relevant gadgets when loading the default prefs.
;
;============================================
; VERSION INFO v1.3
;============================================
;
; Added CRC32 checking to the update procedure.
; Added support for the new Beta Demo folder on the FTP. All beta files are still saved to the selected beta folder.
; Users are now prompted to download the dat files when a prefs file is loaded and no data has been downloaded.
; All download files are size checked against the dat files and removed it they are wrong.
; HTTP download errors are logged in a file called error_log.txt.
; You can now toggle the file tree in the download preview.
; Downloads are a tiny bit slower as the files are size and crc checked once received.
; You can now save the download list as a text file.
; Fixed status bar spacing.
; Changing prefs files will prompt for clearing the database and will rescan the WHDLoad folders.
; Save Prefs button is now active all the time.
; The file list now shows any errors in your files by highlighting them with red for missing and blue for bad CRC32.
; Moved all donate links to a new window.
;
;============================================
; To Do List
;============================================
;
;
;============================================
;

EnableExplicit

;- ############### Imports

CompilerIf #PB_Compiler_64Bit
  Import ""
    GetConsoleWindow(Void)
  EndImport
CompilerEndIf


;- ############### Enumerations

Enumeration
  
  #FTP
  #REGEX
  #LIST_FILE
  #FILE
  
  #MAIN_WINDOW
  #MAIN_STATUS
  #MAIN_LIST
  #MAIN_FONT
  #MAIN_MENU
  #MAIN_FILTER_CONTAINER
  #MAIN_PATH_CONTAINER
  #MAIN_FTP_CONTAINER
  #MAIN_BUTTON_CONTAINER
  #FILTER_PANEL
  
  #DELETE_WINDOW
  #DELETE_LIST
  #DELETE_CANCEL_BUTTON
  #DELETE_DEL_BUTTON
  #DELETE_BACKUP_BUTTON
  #DELETE_OWN_BUTTON
  
  #HELP_WINDOW
  #HELP_EDITOR
  #HELP_FONT
  
  #DONATE_WINDOW
  #DONATE_BUTTON_A
  #DONATE_BUTTON_B
  
  #ABOUT_WINDOW
  #ABOUT_STRING
  #ABOUT_LINK
  
  #UPDATE_WINDOW
  #UPDATE_LIST
  #UPDATE_UPDATE_BUTTON
  #UPDATE_CANCEL_BUTTON
  
  #EDIT_WINDOW
  #EDIT_UPDATE_BUTTON
  #EDIT_CANCEL_BUTTON
  #EDIT_CLEAR_BUTTON
  #EDIT_LIST
  #EDIT_FILTER
  
  #DOWNLOAD_WINDOW
  #DOWNLOAD_LIST
  #DOWNLOAD_YES
  #DOWNLOAD_NO
  #DOWNLOAD_A500MINI
  #DOWNLOAD_SAVE
  #DOWNLOAD_EXPAND
  
  #SCAN_BUTTON
  #DOWNLOAD_BUTTON
  #DOWNLOAD_TYPE_COMBO
  #CLEAR_DATA_BUTTON
  #RESET_BUTTON
  #SAVE_PREFS_BUTTON
  #LOAD_PREFS_BUTTON
  #CLEANUP_BUTTON
  #HELP_BUTTON
  #ABOUT_BUTTON
  #CLEAR_LANG_BUTTON
  
  #LIST_APPEND_BUTTON
  #LIST_LOAD_BUTTON
  #LIST_SAVE_BUTTON
  #LIST_EDIT_BUTTON
  #CLEAR_EDITS_BUTTON
  #MAKE_FOLDER_BUTTON
  
  #DONATE_BUTTON
  #COFFEE_BUTTON
  
  #FTP_PASS_STRING
  #FTP_USER_STRING
  #FTP_SERVER_STRING
  #FTP_FOLDER_STRING
  #FTP_PORT_STRING
  #HTTP_SERVER_STRING
  
  #WHD_MAIN_STRING  
  #WHD_OPEN_PATH_BUTTON
  #WHD_SET_PATH_BUTTON
  #WHD_GAME_STRING
  #WHD_OPEN_GAME_BUTTON
  #WHD_DEMO_STRING
  #WHD_OPEN_DEMO_BUTTON
  #WHD_MAGS_STRING
  #WHD_OPEN_MAGS_BUTTON
  #WHD_BETA_STRING
  #WHD_OPEN_BETA_BUTTON
  #WHD_SORT_COMBO
  #WHD_CATEGORY_CHECK
  #WHD_LANGUAGE_COMBO
  
  #GAME_OPTION
  #DEMO_OPTION
  #BETA_OPTION
  #MAGS_OPTION
  #AGA_OPTION
  #ECS_OPTION
  #CD32_OPTION
  #CDTV_OPTION
  #CDROM_OPTION
  #ARCADIA_OPTION
  #NTSC_OPTION
  #PAL_OPTION
  #AMIGA_OPTION
  #CZECH_OPTION
  #DANISH_OPTION
  #DUTCH_OPTION
  #ENGLISH_OPTION
  #FINNISH_OPTION
  #FRENCH_OPTION
  #GERMAN_OPTION
  #GREEK_OPTION
  #ITALIAN_OPTION
  #MULTI_OPTION
  #POLISH_OPTION
  #SPANISH_OPTION
  #SWEDISH_OPTION
  #CLEAR_BUTTON
  
  #MT32_OPTION
  #NOVOICE_OPTION
  #NOSPEECH_OPTION
  #NOMUSIC_OPTION
  
  #MEM_1MB_OPTION
  #MEM_1MB_CHIP_OPTION
  #MEM_8MB_OPTION
  #MEM_12MB_OPTION
  #MEM_15MB_OPTION
  #MEM_2MB_OPTION
  #MEM_512K_OPTION
  #MEM_512KB_OPTION
  #CHIP_OPTION
  #FAST_OPTION
  #LOWMEM_OPTION
  #SLOWMEM_OPTION
  
  #IMAGE_OPTION
  #FILES_OPTION
  #DISK1_OPTION
  #DISK2_OPTION
  #DISK3_OPTION
  #DISK4_OPTION
  #NOINTRO_OPTION
  #HIRES_OPTION
  #LORES_OPTION
  #PRERELEASE_OPTION
  #PREVIEW_OPTION
  #GAMEDEMO_OPTION
  #ENHANCED_OPTION
  #CENSORED_OPTION
  #UNCENSORED_OPTION
  #NOMOVIE_OPTION
  
EndEnumeration

;- ############### Structures

Structure Game_Data
  File_Name.s
  File_Path.s
  File_CRC.s
  File_Archive_CRC.s
  File_InvalidCRC.b
  File_SubFolder.s
  File_Genre.s
  File_Type.s
  File_Beta_Type.s
  File_BETA.b
  File_Language.s
  File_Chip.b
  File_Fast.b
  File_AGA.b
  File_CD32.b
  File_CDTV.b
  File_CDROM.b
  File_Amiga.b
  File_Arcadia.b
  File_NTSC.b
  File_Available.b
  File_Filtered.b
  File_Size.i
  File_Files.b
  File_Image.b
  File_Version.s
  File_Ignore.b
  File_Extra.b
  
  File_512K.b
  File_512KB.b
  File_1MB.b
  File_1_5MB.b
  File_1MBCHIP.b
  File_2MB.b
  File_8MB.b
  File_12MB.b
  File_LowMem.b
  File_SlowMem.b
  File_NoIntro.b
  File_MT32.b
  File_NoVoice.b
  File_NoSpeech.b
  File_NoMusic.b
  File_NoMovie.b
  File_1Disk.b
  File_2Disk.b
  File_3Disk.b
  File_4Disk.b
  File_HiRes.b
  File_LoRes.b
  File_GameDemo.b
  File_Preview.b
  File_PreRelease.b
  File_Enhanced.b
  File_Censored.b
  File_UnCensored.b
  
EndStructure

Structure Filter_Data
  F_Games.b
  F_Demos.b
  F_Beta.b
  F_Mags.b
  F_AGA.b
  F_ECS.b
  F_NTSC.b
  F_PAL.b
  F_Amiga.b 
  F_Arcadia.b
  F_Files.b
  F_Image.b
  F_Chip.b
  F_Fast.b
  F_CDTV.b
  F_CD32.b
  F_CDROM.b
  F_Czech.b
  F_Danish.b
  F_Dutch.b
  F_English.b
  F_Finnish.b
  F_French.b
  F_German.b
  F_Greek.b
  F_Italian.b
  F_Multi.b
  F_Polish.b
  F_Spanish.b
  F_Swedish.b
  F_512K.b
  F_512KB.b
  F_1MB.b
  F_1_5MB.b
  F_1MBCHIP.b
  F_2MB.b
  F_8MB.b
  F_12MB.b
  F_LowMem.b
  F_SlowMem.b
  F_NoIntro.b
  F_MT32.b
  F_NoVoice.b
  F_NoSpeech.b
  F_NoMusic.b
  F_NoMovie.b
  F_1Disk.b
  F_2Disk.b
  F_3Disk.b
  F_4Disk.b
  F_HiRes.b
  F_LoRes.b
  F_GameDemo.b
  F_Preview.b
  F_PreRelease.b
  F_Enhanced.b
  F_Censored.b
  F_UnCensored.b
EndStructure

Structure Down_Data
  Down_Name.s
  Down_Type.s
  Down_Index.i
  Down_CRC.s
  Down_FTP_CRC.s
  Down_Genre.s
  Down_Folder.s
  Down_Size.i
  Down_FTP_Folder.s
  Down_HTTP_Folder.s
  Down_SubFolder_1.s
  Down_SubFolder_2.s
  Down_SubFolder_3.s
  Down_Path.s
  Down_0toZ.s
EndStructure

Structure Own_Data
  own_file.s
  own_folder.s
  own_crc32.s
  own_size.i
EndStructure

Structure Del_Structure
  del_name.s
  del_type.i
EndStructure

Structure Edit_Data
  Edit_File.s
  Edit_Index.i
  Edit_Existing.b
  Edit_Filter.b
  Edit_Type.s
EndStructure

Structure File_Data
  R_File_Size.l
  R_File_Name.s
  R_File_File.s
  R_File_CRC32.s
EndStructure

Structure Sort_Struct
  Sort_Name.s
  Sort_Index.i
EndStructure

Structure Temp_Struct
  List nums.s()
  List a.s()
  List b.s()
  List c.s()
  List d.s()
  List e.s()
  List f.s()
  List g.s()
  List h.s()
  List i.s()
  List j.s()
  List k.s()
  List l.s()
  List m.s()
  List n.s()
  List o.s()
  List p.s()
  List q.s()
  List r.s()
  List s.s()
  List t.s()
  List u.s()
  List v.s()
  List w.s()
  List x.s()
  List y.s()
  List z.s()
EndStructure
  
;- ############### Lists

Global NewList File_List.s()
Global NewList Game_List.Game_Data()
Global NewList Down_List.Down_Data()
Global NewList File_List_Size.File_Data()
Global NewList Delete_List.s()
Global NewList Filtered_List.i()
Global NewList Edit_Filtered_List.i()
Global NewList Directory_List.s()
Global NewList List_Games.s()
Global NewList Editor_List.Edit_Data()

;- ############### Global Variables

Global Path.s, Path2.s, Count.i, Folder.s, FCount.f
Global Home_Path.s=GetCurrentDirectory()

Global Temp_Folder.s=GetTemporaryDirectory()+"whd_temp\"
Global Dat_Folder.s=Home_Path+"Dats\"
Global List_Path.s=Home_Path+"Lists\"

Global First_Run.b=#False
Global Prefs_Name.s="default.prefs"
Global Lang_Bool.b=#True
Global Avail_Games.i=0
Global Old_Pos.i
Global Sort_Type.i=0
Global Split_Languages.i=0
Global A500Mini.b=#False
Global Slash$ ; For cross platform path compatibility

Global FTP_Folder.s
Global FTP_Server.s
Global FTP_User.s
Global FTP_Pass.s
Global FTP_Passive.b
Global FTP_Port.i
Global HTTP_Server.s

Global Download_Type.i

Global WHD_Folder.s
Global FTP_Game_Folder.s
Global WHD_Game_Folder.s
Global FTP_Demo_Folder.s
Global WHD_Demo_Folder.s
Global WHD_Beta_Folder.s
Global FTP_Beta_Folder1.s
Global FTP_Beta_Folder2.s
Global WHD_Mags_Folder.s
Global FTP_Mags_Folder.s

Global Event.l, Gadget.l, Type.l

Global hWnd

Global Dim Filter.Filter_Data(0)

;- ############### Declares

Declare Draw_List()

;- ############### Macros

Macro Center_Console()
  CompilerIf #PB_Compiler_64Bit
    hWnd = GetConsoleWindow(0)
    MoveWindow_(hWnd, DpiX(WindowX(#MAIN_WINDOW))+(WindowWidth(#MAIN_WINDOW)/8), DpiY(WindowY(#MAIN_WINDOW))+(WindowHeight(#MAIN_WINDOW)/8), DpiX(WindowWidth(#MAIN_WINDOW)/1.25), DpiY(WindowHeight(#MAIN_WINDOW)/1.25), 1)
  CompilerEndIf
EndMacro

Macro Remove_Console_Close()
  CompilerIf #PB_Compiler_64Bit
    hWnd = GetConsoleWindow(0)
    DeleteMenu_(GetSystemMenu_(hWnd, #False), 6, #MF_BYPOSITION)
    SendMessage_(hWnd, #WM_NCPAINT, 1, 0)
  CompilerEndIf
EndMacro

Macro Pause_Window(window)
  SendMessage_(WindowID(window),#WM_SETREDRAW,#False,0)
EndMacro

Macro Resume_Window(window)
  SendMessage_(WindowID(window),#WM_SETREDRAW,#True,0)
  RedrawWindow_(WindowID(window),#Null,#Null,#RDW_INVALIDATE)
EndMacro

Macro Pause_Gadget(gadget)
  SendMessage_(GadgetID(gadget),#WM_SETREDRAW,#False,0)
EndMacro

Macro Resume_Gadget(gadget)
  SendMessage_(GadgetID(gadget),#WM_SETREDRAW,#True,0)
  InvalidateRect_(GadgetID(gadget), 0, 0)
  UpdateWindow_(GadgetID(gadget))
EndMacro

Macro Pause_Console()
  PrintN("Press A Key To Continue...")
  Repeat : Until Inkey()<>""
EndMacro

Macro DpiX(value) ; <--------------------------------------------------> DPI X Scaling
  DesktopScaledX(value)
EndMacro

Macro DpiY(value) ; <--------------------------------------------------> DPI Y Scaling
  DesktopScaledY(value)
EndMacro

Macro Language(exp,lang)
  CreateRegularExpression(#REGEX,"_("+exp+")(\.|_)")
  If MatchRegularExpression(#REGEX, Game_List()\File_Name) : Game_List()\File_Language=lang : EndIf
  FreeRegularExpression(#REGEX)
EndMacro

Macro Version()
  
  CreateRegularExpression(#REGEX,"(?i)_v[0-9].[0-9][0-9](\.|_)")
  ExamineRegularExpression(#REGEX,Game_List()\File_Name)
  While NextRegularExpressionMatch(#REGEX)
    Path=RemoveString(RegularExpressionMatchString(#REGEX),"_")
    Game_List()\File_Version=path
  Wend
  FreeRegularExpression(#REGEX)
  
  CreateRegularExpression(#REGEX,"(?i)_v[0-9].[0-9](\.|_)")
  ExamineRegularExpression(#REGEX,LCase(Game_List()\File_Name))
  While NextRegularExpressionMatch(#REGEX)
    Path=RemoveString(RegularExpressionMatchString(#REGEX),"_")
    Game_List()\File_Version=path
  Wend
  FreeRegularExpression(#REGEX)
  
  CreateRegularExpression(#REGEX,"(?i)_v[0-9].[0-9][a-z](\.|_)")
  ExamineRegularExpression(#REGEX,Game_List()\File_Name)
  While NextRegularExpressionMatch(#REGEX)
    Path=RemoveString(RegularExpressionMatchString(#REGEX),"_")
    Game_List()\File_Version=path
  Wend
  FreeRegularExpression(#REGEX)
  
  CreateRegularExpression(#REGEX,"(?i)_v[0-9].[0-9][a-z][0-9](\.|_)")
  ExamineRegularExpression(#REGEX,Game_List()\File_Name)
  While NextRegularExpressionMatch(#REGEX)
    Path=RemoveString(RegularExpressionMatchString(#REGEX),"_")
    Game_List()\File_Version=path
  Wend
  FreeRegularExpression(#REGEX)
  
  CreateRegularExpression(#REGEX,"(?i)_v[0-9].[0-9]-[a-z](\.|_)")
  ExamineRegularExpression(#REGEX,Game_List()\File_Name)
  While NextRegularExpressionMatch(#REGEX)
    Path=RemoveString(RegularExpressionMatchString(#REGEX),"_")
    Game_List()\File_Version=path
  Wend
  FreeRegularExpression(#REGEX)
  
  CreateRegularExpression(#REGEX,"(?i)_v[0-9].[0-9][0-9][a-z](\.|_)")
  ExamineRegularExpression(#REGEX,Game_List()\File_Name)
  While NextRegularExpressionMatch(#REGEX)
    Path=RemoveString(RegularExpressionMatchString(#REGEX),"_")
    Game_List()\File_Version=path
  Wend
  FreeRegularExpression(#REGEX)
  
  If Right(Game_List()\File_Version,1)="." : Game_List()\File_Version=RTrim(Game_List()\File_Version,".") : EndIf
  
EndMacro

Macro Update_Title()
  
  FCount=0
  
  ForEach Filtered_List()
    SelectElement(Game_List(),Filtered_List())
    FCount+Game_List()\File_Size
  Next
  
  FCount/1048576 ; Convert to MBs
  
  Path="WHDLoad Download Tool v"+Version+" "
  If Prefs_Name<>"default.prefs" : Path+" ["+GetFilePart(Prefs_Name)+"] - " : EndIf
  Path+"(Showing "+Str(ListSize(Filtered_List()))+" of "+Str(ListSize(Game_List()))+")"
  Path+" - ("+StrF(FCount,2)+" MB) - (Press F5 to refresh list)"
  
  SetWindowTitle(#MAIN_WINDOW,Path)  
  
EndMacro

Macro PrintNCol(PText,PFCol,PBCol)
  ConsoleColor(PFCol,PBCol)
  PrintN(PText)
  ConsoleColor(7,0)
EndMacro

Macro Default_Settings()
  
  Prefs_Name="default.prefs"
  
  Download_Type=1 ; 0=FTP 1=HTTP
  
  FTP_Folder="Retroplay WHDLoad Packs"
  FTP_Server="ftp2.grandis.nu"
  FTP_User="ftp"
  FTP_Pass="amiga"
  FTP_Passive=#True
  FTP_Port=21 
  WHD_Folder=Home_Path+"Download\"
  FTP_Game_Folder="Commodore_Amiga_-_WHDLoad_-_Games"
  WHD_Game_Folder="Games"
  FTP_Demo_Folder="Commodore_Amiga_-_WHDLoad_-_Demos"
  WHD_Demo_Folder="Demos"
  FTP_Beta_Folder1="Commodore_Amiga_-_WHDLoad_-_Games_-_Beta_&_Unreleased"
  FTP_Beta_Folder2="Commodore_Amiga_-_WHDLoad_-_Demos_-_Beta_&_Unreleased"
  WHD_Beta_Folder="Beta"
  FTP_Mags_Folder="Commodore_Amiga_-_WHDLoad_-_Magazines"
  WHD_Mags_Folder="Magazines"
  HTTP_Server="http://ftp2.grandis.nu/turran/FTP/Retroplay%20WHDLoad%20Packs"
  
EndMacro

Macro Update_Gadgets()
  SetGadgetText(#FTP_FOLDER_STRING,FTP_Folder)
  SetGadgetText(#FTP_USER_STRING,FTP_User)
  SetGadgetText(#FTP_PASS_STRING,FTP_Pass)
  SetGadgetText(#FTP_PORT_STRING,Str(FTP_Port))
  SetGadgetText(#FTP_SERVER_STRING,FTP_Server)
  SetGadgetText(#HTTP_SERVER_STRING,HTTP_Server)
  SetGadgetText(#WHD_MAIN_STRING,WHD_Folder)
  SetGadgetText(#WHD_GAME_STRING,WHD_Game_Folder)
  SetGadgetText(#WHD_DEMO_STRING,WHD_Demo_Folder)
  SetGadgetText(#WHD_BETA_STRING,WHD_Beta_Folder)
  SetGadgetText(#WHD_MAGS_STRING,WHD_Mags_Folder)   
  SetGadgetState(#DOWNLOAD_TYPE_COMBO,Download_Type)
  SetGadgetState(#WHD_SORT_COMBO,Sort_Type)
  SetGadgetState(#WHD_LANGUAGE_COMBO,Split_Languages)
EndMacro

Macro OpenFolder(folder_path)
  RunProgram(folder_path)  
EndMacro

Macro Delete_File_List_Entry(entry)
  
  ForEach File_List_Size()
    If entry=File_List_Size()\R_File_File
      DeleteElement(File_List_Size())
      Break
    EndIf
  Next
  
EndMacro

;- ############### Misc Procedures

Procedure.i Game_Number(archive.s)
  
  Protected NewMap Games.i()
  Protected proc_return.i
  
  proc_return=-1
  
  ForEach Game_List()
    Games(Game_List()\File_Name)=ListIndex(Game_List())
  Next
  
  If FindMapElement(Games(),archive)
    proc_return=Games()
  EndIf
  
  ProcedureReturn proc_return
  
  FreeMap(Games())
  
EndProcedure   

Procedure.s GetDefaultFontName()
  
  Protected fnt.l=GetStockObject_(#DEFAULT_GUI_FONT)
  If fnt
    Protected finfo.LOGFONT
    GetObject_(fnt,SizeOf(LOGFONT),@finfo)
    Protected systemfontname.s=PeekS(@finfo\lfFaceName[0])
    ProcedureReturn PeekS(@finfo\lfFaceName[0])
  EndIf
  ProcedureReturn "System"
  
EndProcedure

Procedure TreeExpandAllItems(TreeId)
  Protected CurItem.i, CurState.i, ItemCnt.i = CountGadgetItems(TreeId) 
  If ItemCnt <= 0: ProcedureReturn: EndIf 
  For CurItem = 0 To ItemCnt-1
    CurState = GetGadgetItemState(TreeId, CurItem)
    CurState = CurState ! #PB_Tree_Collapsed
    If CurState & #PB_Tree_Checked
      CurState = #PB_Tree_Checked | #PB_Tree_Expanded
    ElseIf CurState & #PB_Tree_Inbetween
      CurState = #PB_Tree_Inbetween | #PB_Tree_Expanded
    Else
      CurState = #PB_Tree_Expanded
    EndIf
    SetGadgetItemState(TreeId, CurItem, CurState)    
  Next
  
EndProcedure

Procedure TreeCollapseAllItems(TreeId)
  Protected CurItem.i, CurState.i, ItemCnt.i = CountGadgetItems(TreeId) 
  If ItemCnt <= 0: ProcedureReturn: EndIf 
  For CurItem = 0 To ItemCnt-1
    CurState = GetGadgetItemState(TreeId, CurItem)
    CurState = CurState ! #PB_Tree_Expanded
    If CurState & #PB_Tree_Checked
      CurState = #PB_Tree_Checked | #PB_Tree_Collapsed
    ElseIf CurState & #PB_Tree_Inbetween
      CurState = #PB_Tree_Inbetween | #PB_Tree_Collapsed
    Else
      CurState = #PB_Tree_Collapsed
    EndIf
    SetGadgetItemState(TreeId, CurItem, CurState)    
  Next
EndProcedure

;- ############### Update Gadgets

Procedure Set_List_Gadgets(bool)
  
  DisableGadget(#LIST_APPEND_BUTTON,bool)
  
EndProcedure

Procedure Disable_Gadgets(bool.b)
  
  Pause_Window(#MAIN_WINDOW)
  
  DisableGadget(#AMIGA_OPTION,bool)
  DisableGadget(#CD32_OPTION,bool)
  DisableGadget(#CDTV_OPTION,bool)
  DisableGadget(#CDROM_OPTION,bool)
  DisableGadget(#ARCADIA_OPTION,bool)
  
  DisableGadget(#AGA_OPTION,bool)
  DisableGadget(#ECS_OPTION,bool)
  DisableGadget(#NTSC_OPTION,bool)
  DisableGadget(#PAL_OPTION,bool)
  
  DisableGadget(#FILES_OPTION,bool)
  DisableGadget(#IMAGE_OPTION,bool)
  DisableGadget(#CHIP_OPTION,bool)
  DisableGadget(#FAST_OPTION,bool)
  
  DisableGadget(#MEM_512K_OPTION,bool)
  DisableGadget(#MEM_512KB_OPTION,bool)
  DisableGadget(#MEM_1MB_OPTION,bool)
  DisableGadget(#MEM_15MB_OPTION,bool)
  DisableGadget(#MEM_1MB_CHIP_OPTION,bool)
  DisableGadget(#MEM_2MB_OPTION,bool)
  DisableGadget(#MEM_8MB_OPTION,bool)
  DisableGadget(#MEM_12MB_OPTION,bool)
  DisableGadget(#LOWMEM_OPTION,bool)
  DisableGadget(#SLOWMEM_OPTION,bool)
  DisableGadget(#NOINTRO_OPTION,bool)
  DisableGadget(#MT32_OPTION,bool)
  DisableGadget(#NOVOICE_OPTION,bool)
  DisableGadget(#NOSPEECH_OPTION,bool)
  DisableGadget(#NOMUSIC_OPTION,bool)
  DisableGadget(#NOMOVIE_OPTION,bool)
  DisableGadget(#DISK1_OPTION,bool)
  DisableGadget(#DISK2_OPTION,bool)
  DisableGadget(#DISK3_OPTION,bool)
  DisableGadget(#DISK4_OPTION,bool)
  DisableGadget(#HIRES_OPTION,bool)
  DisableGadget(#LORES_OPTION,bool)
  DisableGadget(#GAMEDEMO_OPTION,bool)
  DisableGadget(#PREVIEW_OPTION,bool)
  DisableGadget(#PRERELEASE_OPTION,bool)
  DisableGadget(#ENHANCED_OPTION,bool)
  DisableGadget(#CENSORED_OPTION,bool)
  DisableGadget(#UNCENSORED_OPTION,bool)
  
  DisableGadget(#CZECH_OPTION,bool)
  DisableGadget(#DANISH_OPTION,bool)
  DisableGadget(#DUTCH_OPTION,bool)
  DisableGadget(#ENGLISH_OPTION,bool)
  DisableGadget(#FINNISH_OPTION,bool)
  DisableGadget(#FRENCH_OPTION,bool)
  DisableGadget(#GERMAN_OPTION,bool)
  DisableGadget(#GREEK_OPTION,bool)
  DisableGadget(#ITALIAN_OPTION,bool)
  DisableGadget(#MULTI_OPTION,bool)
  DisableGadget(#POLISH_OPTION,bool)
  DisableGadget(#SPANISH_OPTION,bool)
  DisableGadget(#SWEDISH_OPTION,bool)
  DisableGadget(#CLEAR_LANG_BUTTON,bool)
  
  DisableGadget(#CLEANUP_BUTTON,bool)
  DisableGadget(#CLEAR_BUTTON,bool)
  DisableGadget(#CLEAR_DATA_BUTTON,bool)
  DisableGadget(#MAKE_FOLDER_BUTTON,bool)
  DisableGadget(#RESET_BUTTON,bool)
  
  DisableGadget(#DOWNLOAD_BUTTON,bool)
  
  DisableGadget(#LIST_EDIT_BUTTON,bool)
  DisableGadget(#LIST_LOAD_BUTTON,bool)
  DisableGadget(#LIST_SAVE_BUTTON,bool)
  
  ;DisableGadget(#SAVE_PREFS_BUTTON,bool)
  
  DisableGadget(#WHD_MAIN_STRING,bool)
  DisableGadget(#WHD_GAME_STRING,bool)
  DisableGadget(#WHD_OPEN_GAME_BUTTON,bool)
  DisableGadget(#WHD_BETA_STRING,bool)
  DisableGadget(#WHD_OPEN_BETA_BUTTON,bool)
  DisableGadget(#WHD_DEMO_STRING,bool)
  DisableGadget(#WHD_OPEN_DEMO_BUTTON,bool)
  DisableGadget(#WHD_MAGS_STRING,bool)
  DisableGadget(#WHD_OPEN_MAGS_BUTTON,bool)
  DisableGadget(#WHD_OPEN_PATH_BUTTON,bool)
  DisableGadget(#WHD_SET_PATH_BUTTON,bool)
  DisableGadget(#WHD_SORT_COMBO,bool)
  If Sort_Type=2
    DisableGadget(#WHD_LANGUAGE_COMBO,bool)
  EndIf
  DisableGadget(#GAME_OPTION,bool)
  DisableGadget(#DEMO_OPTION,bool)
  DisableGadget(#BETA_OPTION,bool)
  DisableGadget(#MAGS_OPTION,bool)
  
  Resume_Window(#MAIN_WINDOW)
  
EndProcedure

Procedure Update_Statusbar()
  
  If CountGadgetItems(#MAIN_LIST)>0
    If Game_List()\File_Amiga : StatusBarText(#MAIN_STATUS,0,"System: Amiga",#PB_StatusBar_Center) : EndIf
    If Game_List()\File_CD32 : StatusBarText(#MAIN_STATUS,0,"System: CD32",#PB_StatusBar_Center) : EndIf
    If Game_List()\File_CDTV : StatusBarText(#MAIN_STATUS,0,"System: CDTV",#PB_StatusBar_Center) : EndIf
    If Game_List()\File_CDROM : StatusBarText(#MAIN_STATUS,0,"System: CDROM",#PB_StatusBar_Center) : EndIf
    If Game_List()\File_Arcadia : StatusBarText(#MAIN_STATUS,0,"System: Arcadia",#PB_StatusBar_Center) : EndIf
    If Game_List()\File_AGA : StatusBarText(#MAIN_STATUS,1,"Chipset: AGA",#PB_StatusBar_Center) : Else : StatusBarText(#MAIN_STATUS,1,"Chipset: ECS/OCS",#PB_StatusBar_Center) : EndIf
    If Game_List()\File_NTSC : StatusBarText(#MAIN_STATUS,2,"TV System: NTSC",#PB_StatusBar_Center) : Else : StatusBarText(#MAIN_STATUS,2,"TV System: PAL",#PB_StatusBar_Center) : EndIf
    StatusBarText(#MAIN_STATUS,3,"Language: "+Game_List()\File_Language,#PB_StatusBar_Center)
    If Game_List()\File_BETA=#True
      Path="Beta"
    Else
      path=Game_List()\File_Type
    EndIf
    StatusBarText(#MAIN_STATUS,4,"Type: "+Path,#PB_StatusBar_Center)
    If Game_List()\File_Available 
      StatusBarText(#MAIN_STATUS,5,"Status: Available",#PB_StatusBar_Center)
    Else
      StatusBarText(#MAIN_STATUS,5,"Status: Missing",#PB_StatusBar_Center)
    EndIf
    StatusBarText(#MAIN_STATUS,6,"Size: "+Str(Game_List()\File_Size/1024)+" KB",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,7,"Version: "+Game_List()\File_Version,#PB_StatusBar_Center)      
  Else
    StatusBarText(#MAIN_STATUS,0,"System: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,1,"Chipset: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,2,"TV System: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,3,"Language: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,4,"Type: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,5,"Status: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,6,"Size: ?",#PB_StatusBar_Center)
    StatusBarText(#MAIN_STATUS,7,"Version: ?",#PB_StatusBar_Center)
  EndIf
  
EndProcedure

Procedure Update_Genre()

  ForEach Game_List()
    If Game_List()\File_Type="Game" And Game_List()\File_BETA<>#True
      If Split_Languages=0
        If Game_List()\File_AGA And Game_List()\File_NTSC=#False : Game_List()\File_Genre="AGA" : EndIf
        If Game_List()\File_AGA=#False And Game_List()\File_NTSC=#False : Game_List()\File_Genre="ECS-OCS" : EndIf
        If Game_List()\File_Arcadia : Game_List()\File_Genre="Arcadia" : EndIf
        If Game_List()\File_CD32 And Game_List()\File_NTSC=#False : Game_List()\File_Genre="CD32" : EndIf
        If Game_List()\File_CDROM And Game_List()\File_NTSC=#False : Game_List()\File_Genre="CDROM" : EndIf
        If Game_List()\File_CDTV And Game_List()\File_NTSC=#False : Game_List()\File_Genre="CDTV" : EndIf
        If Game_List()\File_NTSC : Game_List()\File_Genre="NTSC" : EndIf
      EndIf
      If Split_Languages=1
        If Game_List()\File_AGA And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Game_List()\File_Genre="AGA" : EndIf 
        If Game_List()\File_AGA=#False And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Game_List()\File_Genre="ECS-OCS" : EndIf
        If Game_List()\File_Arcadia And Game_List()\File_Language="English" : Game_List()\File_Genre="Arcadia" : EndIf
        If Game_List()\File_CD32 And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Game_List()\File_Genre="CD32" : EndIf
        If Game_List()\File_CDROM And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Game_List()\File_Genre="CDROM" : EndIf
        If Game_List()\File_CDTV And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Game_List()\File_Genre="CDTV" : EndIf
        If Game_List()\File_NTSC And Game_List()\File_Language="English" : Game_List()\File_Genre="NTSC" : EndIf
        If Game_List()\File_Language<>"English" : Game_List()\File_Genre=Game_List()\File_Language : EndIf
      EndIf
    EndIf 
    If Game_List()\File_Type="Game" And Game_List()\File_BETA=#True
      If Game_List()\File_AGA : Game_List()\File_Genre="AGA" : EndIf
      If Game_List()\File_AGA=#False : Game_List()\File_Genre="ECS-OCS" : EndIf
    EndIf 
    If Game_List()\File_Type="Demo" 
      If Game_List()\File_AGA : Game_List()\File_Genre="AGA" : EndIf
      If Game_List()\File_AGA=#False : Game_List()\File_Genre="ECS-OCS" : EndIf
    EndIf          
    If Game_List()\File_Type="Magazine" 
      Game_List()\File_Genre="Magazine"
    EndIf 
    
  Next  
  
EndProcedure

Procedure Make_Download_List()
  
  ClearList(Down_List())
  
  ForEach Filtered_List()
    SelectElement(Game_List(),Filtered_List())
    If Game_List()\File_Available<>#True Or Game_List()\File_CRC<>Game_List()\File_Archive_CRC ; if file not available locally or has an invalid crc add to downlist
      AddElement(Down_List())
      Down_List()\Down_Name=Game_List()\File_Name
      Down_List()\Down_Type=Game_List()\File_Type
      Down_List()\Down_Size=Game_List()\File_Size
      Down_List()\Down_Index=ListIndex(Game_List())
      Down_List()\Down_CRC=Game_List()\File_CRC
      Down_List()\Down_Folder=Game_List()\File_SubFolder
      Down_List()\Down_0toZ=Game_List()\File_SubFolder
      If Game_List()\File_Type="Game" And Game_List()\File_BETA<>#True
        If Split_Languages=0
          If Game_List()\File_AGA And Game_List()\File_NTSC=#False : Down_List()\Down_Folder="AGA" : EndIf
          If Game_List()\File_AGA=#False And Game_List()\File_NTSC=#False : Down_List()\Down_Folder="ECS-OCS" : EndIf
          If Game_List()\File_Arcadia : Down_List()\Down_Folder="Arcadia" : EndIf
          If Game_List()\File_CD32 And Game_List()\File_NTSC=#False : Down_List()\Down_Folder="CD32" : EndIf
          If Game_List()\File_CDROM And Game_List()\File_NTSC=#False : Down_List()\Down_Folder="CDROM" : EndIf
          If Game_List()\File_CDTV And Game_List()\File_NTSC=#False : Down_List()\Down_Folder="CDTV" : EndIf
          If Game_List()\File_NTSC : Down_List()\Down_Folder="NTSC" : EndIf
        EndIf
        If Split_Languages=1
          If Game_List()\File_AGA And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Down_List()\Down_Folder="AGA" : EndIf 
          If Game_List()\File_AGA=#False And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Down_List()\Down_Folder="ECS-OCS" : EndIf
          If Game_List()\File_Arcadia And Game_List()\File_Language="English" : Down_List()\Down_Folder="Arcadia" : EndIf
          If Game_List()\File_CD32 And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Down_List()\Down_Folder="CD32" : EndIf
          If Game_List()\File_CDROM And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Down_List()\Down_Folder="CDROM" : EndIf
          If Game_List()\File_CDTV And Game_List()\File_NTSC=#False And Game_List()\File_Language="English" : Down_List()\Down_Folder="CDTV" : EndIf
          If Game_List()\File_NTSC And Game_List()\File_Language="English" : Down_List()\Down_Folder="NTSC" : EndIf
          If Game_List()\File_Language<>"English" : Down_List()\Down_Folder=Game_List()\File_Language : EndIf
        EndIf
        Down_List()\Down_FTP_Folder=FTP_Game_Folder
      EndIf 
      If Game_List()\File_Type="Game" And Game_List()\File_BETA=#True
        Down_List()\Down_Type="Beta"
        If Game_List()\File_AGA : Down_List()\Down_Folder="AGA" : EndIf
        If Game_List()\File_AGA=#False : Down_List()\Down_Folder="ECS-OCS" : EndIf
        Down_List()\Down_FTP_Folder=FTP_Beta_Folder1
      EndIf 
      If Game_List()\File_Type="Demo" 
        If Game_List()\File_AGA : Down_List()\Down_Folder="AGA" : EndIf
        If Game_List()\File_AGA=#False : Down_List()\Down_Folder="ECS-OCS" : EndIf
        Down_List()\Down_FTP_Folder=FTP_Demo_Folder
      EndIf   
      If Game_List()\File_Type="Demo" And Game_List()\File_BETA=#True
        Down_List()\Down_Type="Beta"
        If Game_List()\File_AGA : Down_List()\Down_Folder="AGA" : EndIf
        If Game_List()\File_AGA=#False : Down_List()\Down_Folder="ECS-OCS" : EndIf
        Down_List()\Down_FTP_Folder=FTP_Beta_Folder2
      EndIf 
      If Game_List()\File_Type="Magazine" 
        Down_List()\Down_Folder="Magazine"
        Down_List()\Down_FTP_Folder=FTP_Mags_Folder
      EndIf 
      Down_List()\Down_HTTP_Folder=HTTP_Server+"/"+Down_List()\Down_FTP_Folder+"/"+Down_List()\Down_0toZ+"/"+Down_List()\Down_Name
    EndIf
  Next  
  
EndProcedure

;- ############### File I/O

Procedure List_Files_Recursive(Dir.s, List Files.s(), Extension.s) ; <------> Adds All Files In A Folder Into The Supplied List
  
  Protected NewList Directories.s()
  
  Protected Folder_LIST
  
  If Right(Dir, 1) <> Chr(92)
    Dir + Chr(92)
  EndIf
  
  If ExamineDirectory(Folder_LIST, Dir, Extension)
    While NextDirectoryEntry(Folder_LIST)
      Select DirectoryEntryType(Folder_LIST)
        Case #PB_DirectoryEntry_File
          AddElement(Files())
          Files() = Dir + DirectoryEntryName(Folder_LIST)
        Case #PB_DirectoryEntry_Directory
          Select DirectoryEntryName(Folder_LIST)
            Case ".", ".."
              Continue
            Default
              AddElement(Directories())
              Directories() = Dir + DirectoryEntryName(Folder_LIST)
          EndSelect
      EndSelect
    Wend
    FinishDirectory(Folder_LIST)
    ForEach Directories()
      AddElement(Directory_List())
      Directory_List()=Directories()
      List_Files_Recursive(Directories(), Files(), Extension)
    Next
  EndIf 
  
  FreeList(Directories())
  
EndProcedure

Procedure List_Files_Recursive_Size(Dir.s, List Files.File_Data(), Extension.s) ; <------> Adds All Files In A Folder Into The Supplied List with size information
   
  Protected NewList Directories.s()
  
  Protected Folder_LIST
   
  If Right(Dir, 1) <> Chr(92)
    Dir + Chr(92)
  EndIf
  
  If ExamineDirectory(Folder_LIST, Dir, Extension)
    While NextDirectoryEntry(Folder_LIST)
      Select DirectoryEntryType(Folder_LIST)
        Case #PB_DirectoryEntry_File
          AddElement(Files())
          Files()\R_File_Name = Dir + DirectoryEntryName(Folder_LIST) 
          Files()\R_File_File = DirectoryEntryName(Folder_LIST) 
          Files()\R_File_CRC32 = FileFingerprint(Files()\R_File_Name,#PB_Cipher_CRC32)
        Case #PB_DirectoryEntry_Directory
          Select DirectoryEntryName(Folder_LIST)
            Case ".", ".."
              Continue
            Default
              AddElement(Directories())
              Directories() = Dir + DirectoryEntryName(Folder_LIST)
              
          EndSelect
      EndSelect
    Wend
    FinishDirectory(Folder_LIST)
    ForEach Directories()
      List_Files_Recursive_Size(Directories(), Files(), Extension)
    Next
  EndIf 
  
  FreeList(Directories())
  
EndProcedure

Procedure DeleteDirectorySafely(Path.s)
  Protected PathID
  Protected Result
  Protected EntryName.s
  Protected PathNotEmpty
  Protected i
  
  If Not FileSize(Path.s)=-2
    ProcedureReturn #False
  EndIf
  
  PathID=ExamineDirectory(#PB_Any,Path.s,"")
  If PathID
    For i=1 To 3
      Result=NextDirectoryEntry(PathID)
      EntryName.s=DirectoryEntryName(PathID)
      If Result And EntryName.s<>"." And EntryName.s<>".."
        PathNotEmpty=#True
      EndIf
    Next i
    
    If Not PathNotEmpty
      FinishDirectory(PathID)
      Result=DeleteDirectory(Path.s,"")
      ProcedureReturn Result
    EndIf
    
    FinishDirectory(PathID)
  EndIf
  
  ProcedureReturn #False
EndProcedure

Procedure Make_Folder()
  
  Protected NewMap Game_Map.i()
  
  Protected Out_Folder.s, Keypressed$
  
  ClearList(Down_List())
  
  Out_Folder=PathRequester("Select the output folder.",Home_Path)
  
  If Out_Folder<>WHD_Folder And Out_Folder<>""
    
    ;1 create a list of all the files in the whd folder
    ;2 parse the database and if the file exists move it to the selected sort type
    
    OpenConsole("Make Game Folder (Press 'Esc' to cancel copy.)")    
    Center_Console()
    Remove_Console_Close()
    
    List_Files_Recursive(WHD_Folder,File_List(),"*.lha")
    List_Files_Recursive(WHD_Folder,File_List(),"*.lzx")
    
    ForEach Filtered_List()
      SelectElement(Game_List(),Filtered_List())
      Game_Map(Game_List()\File_Name)=ListIndex(Game_List())
    Next
    
    ForEach File_List()
      If FindMapElement(Game_Map(), GetFilePart(File_List()))
        SelectElement(Game_List(),Game_Map())
        AddElement(Down_List())
        Down_List()\Down_Name=Game_List()\File_Name
        If Sort_Type=0
          Down_List()\Down_FTP_Folder=File_List()
          Down_List()\Down_Name=Game_List()\File_Name
          Down_List()\Down_SubFolder_1=Game_List()\File_Type+"\"
          If Game_List()\File_BETA : Down_List()\Down_SubFolder_1="Beta\" : EndIf
          Down_List()\Down_Path=Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_Name 
        EndIf
        If Sort_Type=1
          Down_List()\Down_FTP_Folder=File_List()
          Down_List()\Down_SubFolder_1=Game_List()\File_Type+"\"
          If Game_List()\File_BETA : Down_List()\Down_SubFolder_1="Beta\" : EndIf
          Down_List()\Down_SubFolder_2=Game_List()\File_SubFolder+"\"
          Down_List()\Down_Path=Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2+Game_List()\File_Name
        EndIf
        If Sort_Type=2
          Down_List()\Down_FTP_Folder=File_List()
          If Game_List()\File_Type<>"Magazine"
            Down_List()\Down_SubFolder_1=Game_List()\File_Type+"\"
            If Game_List()\File_BETA : Down_List()\Down_SubFolder_1="Beta\" : EndIf
            Down_List()\Down_SubFolder_2=Game_List()\File_Genre+"\"
            Down_List()\Down_Path=Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2+Game_List()\File_Name
          Else
            Down_List()\Down_SubFolder_1=Game_List()\File_Type+"\"
            If Game_List()\File_BETA : Down_List()\Down_SubFolder_1="Beta\" : EndIf
            Down_List()\Down_Path=Out_Folder+Down_List()\Down_SubFolder_1+Game_List()\File_Name
          EndIf
        EndIf
        If Sort_Type=3
          Down_List()\Down_FTP_Folder=File_List()
          If Game_List()\File_Type<>"Magazine"
            Down_List()\Down_SubFolder_1=Game_List()\File_Type+"\"
            If Game_List()\File_BETA : Down_List()\Down_SubFolder_1="Beta\" : EndIf
            Down_List()\Down_SubFolder_2=Game_List()\File_Genre+"\"
            Down_List()\Down_SubFolder_3=Game_List()\File_SubFolder+"\"
            Down_List()\Down_Path=Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2+Down_List()\Down_SubFolder_3+Game_List()\File_Name
          Else
            Down_List()\Down_SubFolder_1=Game_List()\File_Type+"\"
            If Game_List()\File_BETA : Down_List()\Down_SubFolder_1="Beta\" : EndIf
            Down_List()\Down_SubFolder_2=Game_List()\File_SubFolder+"\"
            Down_List()\Down_Path=Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2+Game_List()\File_Name
          EndIf
        EndIf
      EndIf  
    Next
    
    If ListSize(Down_List())>0    
      
      path="Making new folder..."+Chr(10)+Chr(10)
      
      Select Sort_Type
        Case 0 : path+"Sort : No Sorting"+Chr(10)
        Case 1 : path+"Sort : Alphabetical (0-Z)"+Chr(10)
        Case 2 : path+"Sort : By Category"+Chr(10)
        Case 3 : path+"Sort : By Category (0-Z)"+Chr(10)
      EndSelect
      
      If Sort_Type=2 Or Sort_Type=3
        If Split_Languages=1 : path+"Languages : Split"+Chr(10) : EndIf
        If Split_Languages=0 : path+"Languages : Ignore"+Chr(10) : EndIf
      EndIf
      
      If MessageRequester("Warning!",path+Chr(10)+"Copy "+Str(ListSize(Down_List()))+" files?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes 
        
        ForEach Down_List() 
          
          If Down_List()\Down_SubFolder_1<>""
            CreateDirectory(Out_Folder+Down_List()\Down_SubFolder_1)
          EndIf
          
          If Down_List()\Down_SubFolder_2<>""
            CreateDirectory(Out_Folder+Down_List()\Down_SubFolder_1)
            CreateDirectory(Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2)
          EndIf
          
          If Down_List()\Down_SubFolder_3<>""
            CreateDirectory(Out_Folder+Down_List()\Down_SubFolder_1)
            CreateDirectory(Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2)
            CreateDirectory(Out_Folder+Down_List()\Down_SubFolder_1+Down_List()\Down_SubFolder_2+Down_List()\Down_SubFolder_3)
          EndIf
          
          If FileSize(Down_List()\Down_Path)=-1
            PrintNCol("Copying "+Down_List()\Down_Name+" ("+Str(ListIndex(Down_List())+1)+" of "+Str(ListSize(Down_List())),10,0)          
            CopyFile(Down_List()\Down_FTP_Folder,Down_List()\Down_Path)
          Else
            PrintNCol("Skipping "+Down_List()\Down_Name+" ("+Str(ListIndex(Down_List())+1)+" of "+Str(ListSize(Down_List())),12,0)   
          EndIf
          
          Keypressed$=Inkey()
          
          If Keypressed$=Chr(27)
            PrintN("")
            PrintNCol("*** File copy cancelled. ***",4,0)
            Delay(1000)
            Break
          EndIf
          
        Next 
        
        CloseConsole()
        
        RunProgram("file://"+Out_Folder)
        
      Else
        
        PrintN("")
        PrintNCol("*** File copy cancelled. ***",2,0)
        Delay(1000)
        CloseConsole()
        
      EndIf
      
    Else
      
      MessageRequester("Information","Nothing to copy!",#PB_MessageRequester_Ok|#PB_MessageRequester_Info)
      
    EndIf
    
  Else
    
    MessageRequester("Error","No output folder.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
    
  EndIf
  
  SetCurrentDirectory(Home_Path)
  
  ClearList(Down_List())
  FreeMap(Game_Map())
  
EndProcedure

Procedure Rescan_Files()
  OpenConsole("Scanning...")
  Center_Console()
  PrintN("")
  PrintNCol("Scanning WHDLoad folders...",9,0)
  ClearList(File_List_Size())
  List_Files_Recursive_Size(WHD_Folder,File_List_Size(),"")    
  
  NewMap Comp_Map.i()
  
  ForEach Game_List()
    Comp_Map(Game_List()\File_Name)=ListIndex(Game_List())
  Next
  
  ForEach File_List_Size()
    If FindMapElement(Comp_Map(),File_List_Size()\R_File_File)
      SelectElement(Game_List(),Comp_Map())
      Game_List()\File_Archive_CRC=File_List_Size()\R_File_CRC32
    EndIf
  Next
  
  FreeMap(Comp_Map())
  
  CloseConsole()
EndProcedure
        
;- ############### Filter

Procedure.b Check_Filter()
  
  Protected f_return.b
  
  If Filter(0)\F_Games=#False : f_return=#True : EndIf
  If Filter(0)\F_Demos=#False : f_return=#True : EndIf
  If Filter(0)\F_Beta=#False : f_return=#True : EndIf
  If Filter(0)\F_Mags=#False : f_return=#True : EndIf
  If Filter(0)\F_AGA=#False : f_return=#True : EndIf
  If Filter(0)\F_ECS=#False : f_return=#True : EndIf
  If Filter(0)\F_NTSC=#False : f_return=#True : EndIf
  If Filter(0)\F_PAL=#False : f_return=#True : EndIf
  If Filter(0)\F_Amiga=#False : f_return=#True : EndIf
  If Filter(0)\F_Arcadia=#False : f_return=#True : EndIf
  If Filter(0)\F_CD32=#False : f_return=#True : EndIf
  If Filter(0)\F_CDTV=#False : f_return=#True : EndIf
  If Filter(0)\F_CDROM=#False : f_return=#True : EndIf
  If Filter(0)\F_Files=#False : f_return=#True : EndIf
  If Filter(0)\F_Image=#False : f_return=#True : EndIf
  
  If Filter(0)\F_Czech=#False : f_return=#True : EndIf
  If Filter(0)\F_Danish=#False : f_return=#True : EndIf
  If Filter(0)\F_Dutch=#False : f_return=#True : EndIf
  If Filter(0)\F_English=#False : f_return=#True : EndIf
  If Filter(0)\F_Finnish=#False : f_return=#True : EndIf
  If Filter(0)\F_French=#False : f_return=#True : EndIf
  If Filter(0)\F_German=#False : f_return=#True : EndIf
  If Filter(0)\F_Greek=#False : f_return=#True : EndIf
  If Filter(0)\F_Italian=#False : f_return=#True : EndIf
  If Filter(0)\F_Multi=#False : f_return=#True : EndIf
  If Filter(0)\F_Polish=#False : f_return=#True : EndIf
  If Filter(0)\F_Spanish=#False : f_return=#True : EndIf
  If Filter(0)\F_Swedish=#False : f_return=#True : EndIf
  
  If Filter(0)\F_512K=#False : f_return=#True : EndIf
  If Filter(0)\F_512KB=#False : f_return=#True : EndIf
  If Filter(0)\F_1MB=#False : f_return=#True : EndIf
  If Filter(0)\F_1_5MB=#False : f_return=#True : EndIf
  If Filter(0)\F_1MBCHIP=#False : f_return=#True : EndIf
  If Filter(0)\F_2MB=#False : f_return=#True : EndIf
  If Filter(0)\F_8MB=#False : f_return=#True : EndIf
  If Filter(0)\F_12MB=#False : f_return=#True : EndIf
  If Filter(0)\F_LowMem=#False : f_return=#True : EndIf
  If Filter(0)\F_SlowMem=#False : f_return=#True : EndIf
  If Filter(0)\F_NoIntro=#False : f_return=#True : EndIf
  If Filter(0)\F_MT32=#False : f_return=#True : EndIf
  If Filter(0)\F_NoVoice=#False : f_return=#True : EndIf
  If Filter(0)\F_NoSpeech=#False : f_return=#True : EndIf
  If Filter(0)\F_NoMusic=#False : f_return=#True : EndIf
  If Filter(0)\F_NoMovie=#False : f_return=#True : EndIf
  If Filter(0)\F_1Disk=#False : f_return=#True : EndIf
  If Filter(0)\F_2Disk=#False : f_return=#True : EndIf
  If Filter(0)\F_3Disk=#False : f_return=#True : EndIf
  If Filter(0)\F_4Disk=#False : f_return=#True : EndIf
  If Filter(0)\F_HiRes=#False : f_return=#True : EndIf
  If Filter(0)\F_LoRes=#False : f_return=#True : EndIf
  If Filter(0)\F_GameDemo=#False : f_return=#True : EndIf
  If Filter(0)\F_Preview=#False : f_return=#True : EndIf
  If Filter(0)\F_PreRelease=#False : f_return=#True : EndIf
  If Filter(0)\F_Enhanced=#False : f_return=#True : EndIf
  If Filter(0)\F_Censored=#False : f_return=#True : EndIf
  If Filter(0)\F_UnCensored=#False : f_return=#True : EndIf
  
  ProcedureReturn f_return
  
EndProcedure

Procedure Set_Filter_Gadgets()
  
  SetGadgetState(#WHD_SORT_COMBO,Sort_Type)
  SetGadgetState(#WHD_LANGUAGE_COMBO,Split_Languages)
  
  SetGadgetState(#GAME_OPTION,Filter(0)\F_Games)
  SetGadgetState(#DEMO_OPTION,Filter(0)\F_Demos)
  SetGadgetState(#BETA_OPTION,Filter(0)\F_Beta)
  SetGadgetState(#MAGS_OPTION,Filter(0)\F_Mags)
  SetGadgetState(#AGA_OPTION,Filter(0)\F_AGA)
  SetGadgetState(#ECS_OPTION,Filter(0)\F_ECS)
  SetGadgetState(#NTSC_OPTION,Filter(0)\F_NTSC)
  SetGadgetState(#PAL_OPTION,Filter(0)\F_PAL)
  SetGadgetState(#AMIGA_OPTION,Filter(0)\F_Amiga)
  SetGadgetState(#ARCADIA_OPTION,Filter(0)\F_Arcadia)
  SetGadgetState(#CD32_OPTION,Filter(0)\F_CD32)
  SetGadgetState(#CDTV_OPTION,Filter(0)\F_CDTV)
  SetGadgetState(#CDROM_OPTION,Filter(0)\F_CDROM)
  SetGadgetState(#FILES_OPTION,Filter(0)\F_Files)
  SetGadgetState(#IMAGE_OPTION,Filter(0)\F_Image)
  SetGadgetState(#CHIP_OPTION,Filter(0)\F_Chip)
  SetGadgetState(#FAST_OPTION,Filter(0)\F_Fast)
  
  SetGadgetState(#CZECH_OPTION,Filter(0)\F_Czech)
  SetGadgetState(#DANISH_OPTION,Filter(0)\F_Danish)
  SetGadgetState(#DUTCH_OPTION,Filter(0)\F_Dutch)
  SetGadgetState(#ENGLISH_OPTION,Filter(0)\F_English)
  SetGadgetState(#FINNISH_OPTION,Filter(0)\F_Finnish)
  SetGadgetState(#FRENCH_OPTION,Filter(0)\F_French)
  SetGadgetState(#GERMAN_OPTION,Filter(0)\F_German)
  SetGadgetState(#GREEK_OPTION,Filter(0)\F_Greek)
  SetGadgetState(#ITALIAN_OPTION,Filter(0)\F_Italian)
  SetGadgetState(#MULTI_OPTION,Filter(0)\F_Multi)
  SetGadgetState(#POLISH_OPTION,Filter(0)\F_Polish)
  SetGadgetState(#SPANISH_OPTION,Filter(0)\F_Spanish)
  SetGadgetState(#SWEDISH_OPTION,Filter(0)\F_Swedish)
  
  SetGadgetState(#MEM_512K_OPTION,Filter(0)\F_512K)
  SetGadgetState(#MEM_512KB_OPTION,Filter(0)\F_512KB)
  SetGadgetState(#MEM_1MB_OPTION,Filter(0)\F_1MB)
  SetGadgetState(#MEM_15MB_OPTION,Filter(0)\F_1_5MB)
  SetGadgetState(#MEM_1MB_CHIP_OPTION,Filter(0)\F_1MBCHIP)
  SetGadgetState(#MEM_2MB_OPTION,Filter(0)\F_2MB)
  SetGadgetState(#MEM_8MB_OPTION,Filter(0)\F_8MB)
  SetGadgetState(#MEM_12MB_OPTION,Filter(0)\F_12MB)
  SetGadgetState(#LOWMEM_OPTION,Filter(0)\F_LowMem)
  SetGadgetState(#SLOWMEM_OPTION,Filter(0)\F_LowMem)
  SetGadgetState(#NOINTRO_OPTION,Filter(0)\F_NoIntro)
  SetGadgetState(#MT32_OPTION,Filter(0)\F_MT32)
  SetGadgetState(#NOVOICE_OPTION,Filter(0)\F_NoVoice)
  SetGadgetState(#NOSPEECH_OPTION,Filter(0)\F_NoSpeech)
  SetGadgetState(#NOMUSIC_OPTION,Filter(0)\F_NoMusic)
  SetGadgetState(#NOMOVIE_OPTION,Filter(0)\F_NoMusic)
  SetGadgetState(#DISK1_OPTION,Filter(0)\F_1Disk)
  SetGadgetState(#DISK2_OPTION,Filter(0)\F_2Disk)
  SetGadgetState(#DISK3_OPTION,Filter(0)\F_3Disk)
  SetGadgetState(#DISK4_OPTION,Filter(0)\F_4Disk)
  SetGadgetState(#HIRES_OPTION,Filter(0)\F_HiRes)
  SetGadgetState(#LORES_OPTION,Filter(0)\F_LoRes)
  SetGadgetState(#GAMEDEMO_OPTION,Filter(0)\F_GameDemo)
  SetGadgetState(#PREVIEW_OPTION,Filter(0)\F_Preview)
  SetGadgetState(#PRERELEASE_OPTION,Filter(0)\F_PreRelease)
  SetGadgetState(#ENHANCED_OPTION,Filter(0)\F_Enhanced)
  SetGadgetState(#CENSORED_OPTION,Filter(0)\F_Censored)
  SetGadgetState(#UNCENSORED_OPTION,Filter(0)\F_UnCensored)
  
EndProcedure

Procedure Set_Filter(bool)
  
  Filter(0)\F_Games=bool
  Filter(0)\F_Demos=bool
  Filter(0)\F_Beta=bool
  Filter(0)\F_Mags=bool
  Filter(0)\F_AGA=bool
  Filter(0)\F_ECS=bool
  Filter(0)\F_NTSC=bool
  Filter(0)\F_PAL=bool
  Filter(0)\F_Amiga=bool
  Filter(0)\F_Arcadia=bool
  Filter(0)\F_CD32=bool
  Filter(0)\F_CDTV=bool
  Filter(0)\F_CDROM=bool
  Filter(0)\F_Files=bool
  Filter(0)\F_Image=bool
  Filter(0)\F_Chip=bool
  Filter(0)\F_Fast=bool
  
  Filter(0)\F_Czech=bool
  Filter(0)\F_Danish=bool
  Filter(0)\F_Dutch=bool
  Filter(0)\F_English=bool
  Filter(0)\F_Finnish=bool
  Filter(0)\F_French=bool
  Filter(0)\F_German=bool
  Filter(0)\F_Greek=bool
  Filter(0)\F_Italian=bool
  Filter(0)\F_Multi=bool
  Filter(0)\F_Polish=bool
  Filter(0)\F_Spanish=bool
  Filter(0)\F_Swedish=bool
  
  Filter(0)\F_512K=bool
  Filter(0)\F_512KB=bool
  Filter(0)\F_1MB=bool
  Filter(0)\F_1_5MB=bool
  Filter(0)\F_1MBCHIP=bool
  Filter(0)\F_2MB=bool
  Filter(0)\F_8MB=bool
  Filter(0)\F_12MB=bool
  Filter(0)\F_LowMem=bool
  Filter(0)\F_SlowMem=bool
  Filter(0)\F_NoIntro=bool
  Filter(0)\F_MT32=bool
  Filter(0)\F_NoVoice=bool
  Filter(0)\F_NoSpeech=bool
  Filter(0)\F_NoMusic=bool
  Filter(0)\F_NoMovie=bool
  Filter(0)\F_1Disk=bool
  Filter(0)\F_2Disk=bool
  Filter(0)\F_3Disk=bool
  Filter(0)\F_4Disk=bool
  Filter(0)\F_HiRes=bool
  Filter(0)\F_LoRes=bool
  Filter(0)\F_GameDemo=bool
  Filter(0)\F_Preview=bool
  Filter(0)\F_PreRelease=bool
  Filter(0)\F_Enhanced=bool
  Filter(0)\F_Censored=bool
  Filter(0)\F_UnCensored=bool
  
  Set_Filter_Gadgets()
  
EndProcedure

Procedure Set_Language_Gadgets(bool)
  
  Filter(0)\F_Czech=bool
  Filter(0)\F_Danish=bool
  Filter(0)\F_Dutch=bool
  Filter(0)\F_English=bool
  Filter(0)\F_Finnish=bool
  Filter(0)\F_French=bool
  Filter(0)\F_German=bool
  Filter(0)\F_Greek=bool
  Filter(0)\F_Italian=bool
  Filter(0)\F_Multi=bool
  Filter(0)\F_Polish=bool
  Filter(0)\F_Spanish=bool
  Filter(0)\F_Swedish=bool
  
  If bool : SetGadgetText(#CLEAR_LANG_BUTTON,"Clear") : Else  : SetGadgetText(#CLEAR_LANG_BUTTON,"All") : EndIf
  
  Set_Filter_Gadgets()
  
EndProcedure

Procedure Filter_List()
  
  Protected NewMap File_Map.i();, filetype.s
  ClearList(Filtered_List())
  
  ForEach Game_List()
    File_Map(LCase(Game_List()\File_Name))=ListIndex(Game_List())
    Game_List()\File_Available=#False
    Game_List()\File_Filtered=#False  
    If Game_List()\File_Ignore=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Games=#False And Game_List()\File_Type="Game" And Game_List()\File_BETA<>#True : Game_List()\File_Filtered=#True : EndIf   
    If Filter(0)\F_Demos=#False And Game_List()\File_Type="Demo" : Game_List()\File_Filtered=#True : EndIf 
    If Filter(0)\F_Mags=#False And Game_List()\File_Type="Magazine" : Game_List()\File_Filtered=#True : EndIf 
    If Filter(0)\F_Beta=#False And Game_List()\File_Type="Game" And Game_List()\File_BETA=#True : Game_List()\File_Filtered=#True : EndIf 
    If Filter(0)\F_AGA=#False And Game_List()\File_AGA=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_ECS=#False And Game_List()\File_AGA=#False : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_NTSC=#False And Game_List()\File_NTSC=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_PAL=#False And Game_List()\File_NTSC=#False : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_CDTV=#False And Game_List()\File_CDTV=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_CD32=#False And Game_List()\File_CD32=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_CDROM=#False And Game_List()\File_CDROM=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Arcadia=#False And Game_List()\File_Arcadia=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Amiga=#False And Game_List()\File_Amiga=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Files=#False And Game_List()\File_Files=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Image=#False And Game_List()\File_Image=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Chip=#False And Game_List()\File_Chip=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Fast=#False And Game_List()\File_Fast=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Czech=#False And Game_List()\File_Language="Czech" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Danish=#False And Game_List()\File_Language="Danish" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Dutch=#False And Game_List()\File_Language="Dutch" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_English=#False And Game_List()\File_Language="English" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Finnish=#False And Game_List()\File_Language="Finnish" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_French=#False And Game_List()\File_Language="French" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_German=#False And Game_List()\File_Language="German" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Greek=#False And Game_List()\File_Language="Greek" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Italian=#False And Game_List()\File_Language="Italian" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Multi=#False And Game_List()\File_Language="Multi" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Polish=#False And Game_List()\File_Language="Polish" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Spanish=#False And Game_List()\File_Language="Spanish" : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Swedish=#False And Game_List()\File_Language="Swedish" : Game_List()\File_Filtered=#True : EndIf 
    
    If Filter(0)\F_512K=#False And Game_List()\File_512K=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_512KB=#False And Game_List()\File_512KB=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_1MB=#False And Game_List()\File_1MB=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_1_5MB=#False And Game_List()\File_1_5MB=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_1MBCHIP=#False And Game_List()\File_1MBCHIP=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_2MB=#False And Game_List()\File_2MB=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_8MB=#False And Game_List()\File_8MB=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_12MB=#False And Game_List()\File_12MB=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_LowMem=#False And Game_List()\File_LowMem=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_SlowMem=#False And Game_List()\File_SlowMem=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_NoIntro=#False And Game_List()\File_NoIntro=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_MT32=#False And Game_List()\File_MT32=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_NoVoice=#False And Game_List()\File_NoVoice=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_NoSpeech=#False And Game_List()\File_NoSpeech=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_NoMusic=#False And Game_List()\File_NoMusic=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_NoMovie=#False And Game_List()\File_NoMovie=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_1Disk=#False And Game_List()\File_1Disk=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_2Disk=#False And Game_List()\File_2Disk=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_3Disk=#False And Game_List()\File_3Disk=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_4Disk=#False And Game_List()\File_4Disk=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_HiRes=#False And Game_List()\File_HiRes=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_LoRes=#False And Game_List()\File_LoRes=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_GameDemo=#False And Game_List()\File_GameDemo=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Preview=#False And Game_List()\File_Preview=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_PreRelease=#False And Game_List()\File_PreRelease=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Enhanced=#False And Game_List()\File_Enhanced=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Censored=#False And Game_List()\File_Censored=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_UnCensored=#False And Game_List()\File_UnCensored=#True : Game_List()\File_Filtered=#True : EndIf
    
    If Game_List()\File_Filtered=#False : AddElement(Filtered_List()) : Filtered_List()=ListIndex(Game_List()) : EndIf
    If Game_List()\File_Filtered=#True And Game_List()\File_Extra=#True : AddElement(Filtered_List()) : Filtered_List()=ListIndex(Game_List()) : EndIf
  Next
  
  Avail_Games=0  
  
  ForEach File_List_Size()  
    If FindMapElement(File_Map(),LCase(File_List_Size()\R_File_File)) 
      SelectElement(Game_List(),File_Map())
      Game_List()\File_Available=#True
      Avail_Games+1
      Game_List()\File_Path=GetPathPart(File_List_Size()\R_File_Name)
    EndIf
  Next
  
  FreeMap(File_Map())
  
EndProcedure

;- ############### Prefs

Procedure Save_Prefs(p_path.s)
  
  CreatePreferences(p_path)
  
  PreferenceComment("*** WHDLoad Tool Prefs File ***")
  
  PreferenceComment("")
  
  PreferenceGroup("FTP")
  WritePreferenceString("FTP_User",FTP_User)
  WritePreferenceString("FTP_Pass",FTP_Pass)
  WritePreferenceString("FTP_Server",FTP_Server)
  WritePreferenceString("HTTP_Server",HTTP_Server)
  WritePreferenceInteger("FTP_Port",FTP_Port)
  WritePreferenceString("FTP_Folder",FTP_Folder)
  WritePreferenceString("FTP_Game_Folder",FTP_Game_Folder)
  WritePreferenceString("FTP_Demo_Folder",FTP_Demo_Folder)
  WritePreferenceString("FTP_Beta_Folder1",FTP_Beta_Folder1)
  WritePreferenceString("FTP_Beta_Folder2",FTP_Beta_Folder2)
  WritePreferenceString("FTP_Magazine_Folder",FTP_Mags_Folder)
  WritePreferenceInteger("Download_Type",Download_Type)
  
  PreferenceComment("")
  
  PreferenceGroup("Paths")
  WritePreferenceString("WHD_Path",WHD_Folder)
  WritePreferenceString("WHD_Game",WHD_Game_Folder)
  WritePreferenceString("WHD_Demo",WHD_Demo_Folder)
  WritePreferenceString("WHD_Beta",WHD_Beta_Folder)
  WritePreferenceString("WHD_Mags",WHD_Mags_Folder)
  WritePreferenceInteger("WHD_Sort",Sort_Type)
  WritePreferenceInteger("WHD_Language_Split",Split_Languages)
  
  PreferenceComment("")
  
  PreferenceGroup("Filter")
  WritePreferenceInteger("Filter_Games",Filter(0)\F_Games)
  WritePreferenceInteger("Filter_Demos",Filter(0)\F_Demos)
  WritePreferenceInteger("Filter_Beta",Filter(0)\F_Beta)
  WritePreferenceInteger("Filter_Mags",Filter(0)\F_Mags)
  WritePreferenceInteger("Filter_AGA",Filter(0)\F_AGA)
  WritePreferenceInteger("Filter_ECS",Filter(0)\F_ECS)
  WritePreferenceInteger("Filter_NTSC",Filter(0)\F_NTSC)
  WritePreferenceInteger("Filter_PAL",Filter(0)\F_PAL)
  WritePreferenceInteger("Filter_Files",Filter(0)\F_Files)
  WritePreferenceInteger("Filter_Image",Filter(0)\F_Image)
  WritePreferenceInteger("Filter_Chip",Filter(0)\F_Chip)
  WritePreferenceInteger("Filter_Fast",Filter(0)\F_Fast)
  WritePreferenceInteger("Filter_Amiga",Filter(0)\F_Amiga)
  WritePreferenceInteger("Filter_Arcadia",Filter(0)\F_Arcadia)
  WritePreferenceInteger("Filter_CD32",Filter(0)\F_CD32)
  WritePreferenceInteger("Filter_CDTV",Filter(0)\F_CDTV)
  WritePreferenceInteger("Filter_CDROM",Filter(0)\F_CDROM)
  WritePreferenceInteger("Filter_Czech",Filter(0)\F_Czech)
  WritePreferenceInteger("Filter_Danish",Filter(0)\F_Danish)
  WritePreferenceInteger("Filter_Dutch",Filter(0)\F_Dutch)
  WritePreferenceInteger("Filter_English",Filter(0)\F_English)
  WritePreferenceInteger("Filter_Finnish",Filter(0)\F_Finnish)
  WritePreferenceInteger("Filter_French",Filter(0)\F_French)
  WritePreferenceInteger("Filter_German",Filter(0)\F_German)
  WritePreferenceInteger("Filter_Greek",Filter(0)\F_Greek)
  WritePreferenceInteger("Filter_Italian",Filter(0)\F_Italian)
  WritePreferenceInteger("Filter_Multi",Filter(0)\F_Multi)
  WritePreferenceInteger("Filter_Polish",Filter(0)\F_Polish)
  WritePreferenceInteger("Filter_Spanish",Filter(0)\F_Spanish)
  WritePreferenceInteger("Filter_Swedish",Filter(0)\F_Swedish)  
  WritePreferenceInteger("Filter_512K",Filter(0)\F_512K)
  WritePreferenceInteger("Filter_512KB",Filter(0)\F_512KB)
  WritePreferenceInteger("Filter_1MB",Filter(0)\F_1MB)
  WritePreferenceInteger("Filter_1_5MB",Filter(0)\F_1_5MB)
  WritePreferenceInteger("Filter_1MBCHIP",Filter(0)\F_1MBCHIP)
  WritePreferenceInteger("Filter_2MB",Filter(0)\F_2MB)
  WritePreferenceInteger("Filter_8MB",Filter(0)\F_8MB)
  WritePreferenceInteger("Filter_12MB",Filter(0)\F_12MB)
  WritePreferenceInteger("Filter_LowMem",Filter(0)\F_LowMem)
  WritePreferenceInteger("Filter_SlowMem",Filter(0)\F_SlowMem)
  WritePreferenceInteger("Filter_NoIntro",Filter(0)\F_NoIntro)
  WritePreferenceInteger("Filter_MT32",Filter(0)\F_MT32)
  WritePreferenceInteger("Filter_NoVoice",Filter(0)\F_NoVoice)
  WritePreferenceInteger("Filter_NoSpeech",Filter(0)\F_NoSpeech)
  WritePreferenceInteger("Filter_NoMusic",Filter(0)\F_NoMusic)
  WritePreferenceInteger("Filter_NoMovie",Filter(0)\F_NoMovie)
  WritePreferenceInteger("Filter_1Disk",Filter(0)\F_1Disk)
  WritePreferenceInteger("Filter_2Disk",Filter(0)\F_2Disk)
  WritePreferenceInteger("Filter_3Disk",Filter(0)\F_3Disk)
  WritePreferenceInteger("Filter_4Disk",Filter(0)\F_4Disk)
  WritePreferenceInteger("Filter_HiRes",Filter(0)\F_HiRes)
  WritePreferenceInteger("Filter_LoRes",Filter(0)\F_LoRes)
  WritePreferenceInteger("Filter_GameDemo",Filter(0)\F_GameDemo)
  WritePreferenceInteger("Filter_Preview",Filter(0)\F_Preview)
  WritePreferenceInteger("Filter_PreRelease",Filter(0)\F_PreRelease)
  WritePreferenceInteger("Filter_Enhanced",Filter(0)\F_Enhanced)
  WritePreferenceInteger("Filter_Censored",Filter(0)\F_Censored)
  WritePreferenceInteger("Filter_UnCensored",Filter(0)\F_UnCensored)
  
  ClosePreferences()
  
EndProcedure

Procedure Load_Prefs(p_path.s)
  
  If OpenPreferences(p_path) 
    
    Prefs_Name=GetFilePart(p_path)
    
    PreferenceGroup("FTP")
    FTP_User=ReadPreferenceString("FTP_User",FTP_User)
    FTP_Pass=ReadPreferenceString("FTP_Pass",FTP_Pass)
    FTP_Server=ReadPreferenceString("FTP_Server",FTP_Server)
    HTTP_Server=ReadPreferenceString("HTTP_Server",HTTP_Server)
    FTP_Port=ReadPreferenceInteger("FTP_Port",FTP_Port)
    FTP_Folder=ReadPreferenceString("FTP_Folder",FTP_Folder)
    FTP_Game_Folder=ReadPreferenceString("FTP_Game_Folder",FTP_Game_Folder)
    FTP_Demo_Folder=ReadPreferenceString("FTP_Demo_Folder",FTP_Demo_Folder)
    FTP_Beta_Folder1=ReadPreferenceString("FTP_Beta_Folder1",FTP_Beta_Folder1)
    FTP_Beta_Folder2=ReadPreferenceString("FTP_Beta_Folder2",FTP_Beta_Folder2)
    FTP_Mags_Folder=ReadPreferenceString("FTP_Magazine_Folder",FTP_Mags_Folder)
    Download_Type=ReadPreferenceInteger("Download_Type",Download_Type)
    
    PreferenceGroup("Paths")
    WHD_Folder=ReadPreferenceString("WHD_Path",WHD_Folder)
    WHD_Game_Folder=ReadPreferenceString("WHD_Game",WHD_Game_Folder)
    WHD_Demo_Folder=ReadPreferenceString("WHD_Demo",WHD_Demo_Folder)
    WHD_Beta_Folder=ReadPreferenceString("WHD_Beta",WHD_Beta_Folder)
    WHD_Mags_Folder=ReadPreferenceString("WHD_Mags",WHD_Mags_Folder)
    Sort_Type=ReadPreferenceInteger("WHD_Sort",Sort_Type)
    Split_Languages=ReadPreferenceInteger("WHD_Language_Split",Split_Languages)
    
    PreferenceGroup("Filter")
    Filter(0)\F_Games=ReadPreferenceInteger("Filter_Games",Filter(0)\F_Games)
    Filter(0)\F_Demos=ReadPreferenceInteger("Filter_Demos",Filter(0)\F_Demos)
    Filter(0)\F_Beta=ReadPreferenceInteger("Filter_Beta",Filter(0)\F_Beta)
    Filter(0)\F_Mags=ReadPreferenceInteger("Filter_Mags",Filter(0)\F_Mags)
    Filter(0)\F_AGA=ReadPreferenceInteger("Filter_AGA",Filter(0)\F_AGA)
    Filter(0)\F_ECS=ReadPreferenceInteger("Filter_ECS",Filter(0)\F_ECS)
    Filter(0)\F_NTSC=ReadPreferenceInteger("Filter_NTSC",Filter(0)\F_NTSC)
    Filter(0)\F_PAL=ReadPreferenceInteger("Filter_PAL",Filter(0)\F_PAL)
    Filter(0)\F_Files=ReadPreferenceInteger("Filter_Files",Filter(0)\F_Files)
    Filter(0)\F_Image=ReadPreferenceInteger("Filter_Image",Filter(0)\F_Image)
    Filter(0)\F_Chip=ReadPreferenceInteger("Filter_Chip",Filter(0)\F_Chip)
    Filter(0)\F_Fast=ReadPreferenceInteger("Filter_Fast",Filter(0)\F_Fast)
    Filter(0)\F_Amiga=ReadPreferenceInteger("Filter_Amiga",Filter(0)\F_Amiga)
    Filter(0)\F_Arcadia=ReadPreferenceInteger("Filter_Arcadia",Filter(0)\F_Arcadia)
    Filter(0)\F_CD32=ReadPreferenceInteger("Filter_CD32",Filter(0)\F_CD32)
    Filter(0)\F_CDTV=ReadPreferenceInteger("Filter_CDTV",Filter(0)\F_CDTV)
    Filter(0)\F_CDROM=ReadPreferenceInteger("Filter_CDROM",Filter(0)\F_CDROM)
    Filter(0)\F_Czech=ReadPreferenceInteger("Filter_Czech",Filter(0)\F_Czech)
    Filter(0)\F_Danish=ReadPreferenceInteger("Filter_Danish",Filter(0)\F_Danish)
    Filter(0)\F_Dutch=ReadPreferenceInteger("Filter_Dutch",Filter(0)\F_Dutch)
    Filter(0)\F_English=ReadPreferenceInteger("Filter_English",Filter(0)\F_English)
    Filter(0)\F_Finnish=ReadPreferenceInteger("Filter_Finnish",Filter(0)\F_Finnish)
    Filter(0)\F_French=ReadPreferenceInteger("Filter_French",Filter(0)\F_French)
    Filter(0)\F_German=ReadPreferenceInteger("Filter_German",Filter(0)\F_German)
    Filter(0)\F_Greek=ReadPreferenceInteger("Filter_Greek",Filter(0)\F_Greek)
    Filter(0)\F_Italian=ReadPreferenceInteger("Filter_Italian",Filter(0)\F_Italian)
    Filter(0)\F_Multi=ReadPreferenceInteger("Filter_Multi",Filter(0)\F_Multi)
    Filter(0)\F_Polish=ReadPreferenceInteger("Filter_Polish",Filter(0)\F_Polish)
    Filter(0)\F_Spanish=ReadPreferenceInteger("Filter_Spanish",Filter(0)\F_Spanish)
    Filter(0)\F_Swedish=ReadPreferenceInteger("Filter_Swedish",Filter(0)\F_Swedish)
    
    Filter(0)\F_512K=ReadPreferenceInteger("Filter_512K",Filter(0)\F_512K)
    Filter(0)\F_512KB=ReadPreferenceInteger("Filter_512KB",Filter(0)\F_512KB)
    Filter(0)\F_1MB=ReadPreferenceInteger("Filter_1MB",Filter(0)\F_1MB)
    Filter(0)\F_1_5MB=ReadPreferenceInteger("Filter_1_5MB",Filter(0)\F_1_5MB)
    Filter(0)\F_1MBCHIP=ReadPreferenceInteger("Filter_1MBCHIP",Filter(0)\F_1MBCHIP)
    Filter(0)\F_2MB=ReadPreferenceInteger("Filter_2MB",Filter(0)\F_2MB)
    Filter(0)\F_8MB=ReadPreferenceInteger("Filter_8MB",Filter(0)\F_8MB)
    Filter(0)\F_12MB=ReadPreferenceInteger("Filter_12MB",Filter(0)\F_12MB)
    Filter(0)\F_LowMem=ReadPreferenceInteger("Filter_LowMem",Filter(0)\F_LowMem)
    Filter(0)\F_SlowMem=ReadPreferenceInteger("Filter_SlowMem",Filter(0)\F_SlowMem)
    Filter(0)\F_NoIntro=ReadPreferenceInteger("Filter_NoIntro",Filter(0)\F_NoIntro)
    Filter(0)\F_MT32=ReadPreferenceInteger("Filter_MT32",Filter(0)\F_MT32)
    Filter(0)\F_NoVoice=ReadPreferenceInteger("Filter_NoVoice",Filter(0)\F_NoVoice)
    Filter(0)\F_NoSpeech=ReadPreferenceInteger("Filter_NoSpeech",Filter(0)\F_NoSpeech)
    Filter(0)\F_NoMusic=ReadPreferenceInteger("Filter_NoMusic",Filter(0)\F_NoMusic)
    Filter(0)\F_NoMovie=ReadPreferenceInteger("Filter_NoMovie",Filter(0)\F_NoMovie)
    Filter(0)\F_1Disk=ReadPreferenceInteger("Filter_1Disk",Filter(0)\F_1Disk)
    Filter(0)\F_2Disk=ReadPreferenceInteger("Filter_2Disk",Filter(0)\F_2Disk)
    Filter(0)\F_3Disk=ReadPreferenceInteger("Filter_3Disk",Filter(0)\F_3Disk)
    Filter(0)\F_4Disk=ReadPreferenceInteger("Filter_4Disk",Filter(0)\F_4Disk)
    Filter(0)\F_HiRes=ReadPreferenceInteger("Filter_HiRes",Filter(0)\F_HiRes)
    Filter(0)\F_LoRes=ReadPreferenceInteger("Filter_LoRes",Filter(0)\F_LoRes)
    Filter(0)\F_GameDemo=ReadPreferenceInteger("Filter_GameDemo",Filter(0)\F_GameDemo)
    Filter(0)\F_Preview=ReadPreferenceInteger("Filter_Preview",Filter(0)\F_Preview)
    Filter(0)\F_PreRelease=ReadPreferenceInteger("Filter_PreRelease",Filter(0)\F_PreRelease)
    Filter(0)\F_Enhanced=ReadPreferenceInteger("Filter_Enhanced",Filter(0)\F_Enhanced)
    Filter(0)\F_Censored=ReadPreferenceInteger("Filter_Censored",Filter(0)\F_Censored)
    Filter(0)\F_UnCensored=ReadPreferenceInteger("Filter_UnCensored",Filter(0)\F_UnCensored)
    
    ClosePreferences()
    
  EndIf
  
EndProcedure

;- ############### XML

Procedure FillTree(*CurrentNode)
  
  Define node.s
  Define attrib.s
  Define attribval.s
  Define nodetext.s
  
  ; Ignore anything except normal nodes. See the manual for
  ; XMLNodeType() for an explanation of the other node types.
  ;
  If XMLNodeType(*CurrentNode) = #PB_XML_Normal
    
    ; Add this node to the tree. Add name and attributes
    ;
    node = GetXMLNodeName(*CurrentNode) 
    
    If ExamineXMLAttributes(*CurrentNode)
      While NextXMLAttribute(*CurrentNode)
        attrib = XMLAttributeName(*CurrentNode)
        attribval = XMLAttributeValue(*CurrentNode) 
        
        Select node          
            
          Case "machine"
            Select attrib 
              Case "name" : Folder=attribval
                
            EndSelect
            
          Case "rom"
            Select attrib 
              Case "name"
                AddElement(Game_List()) 
                Game_List()\File_Type=Path
                Game_List()\File_Beta_Type=Path2
                Game_List()\File_Name=attribval 
                Game_List()\File_SubFolder=Folder
                
              Case "size"
                Game_List()\File_Size=Val(attribval)
                
              Case "crc"
                Game_List()\File_CRC=attribval
                
            EndSelect
            
            
        EndSelect   
      Wend
      
      nodetext + GetXMLNodeText(*CurrentNode)
      
    EndIf
    
    ; Now get the first child node (if any)
    
    Define *ChildNode = ChildXMLNode(*CurrentNode)
    
    ; Loop through all available child nodes and call this procedure again
    ;
    While *ChildNode <> 0
      FillTree(*ChildNode)      
      *ChildNode = NextXMLNode(*ChildNode)
    Wend        
    
  EndIf
  
EndProcedure

;- ############### Lists

Procedure Load_List()
  
  Protected result.l
  Protected text$
  
  If Check_Filter()
    result=MessageRequester("Warning","This will reset all filters. Continue?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)
  EndIf
  
  If result<>#PB_MessageRequester_No
    
    Set_Filter(#True)
    Set_Filter_Gadgets()
    Draw_List()
    
    ClearList(List_Games())
    
    Protected NewMap LHA_Files.i()
    
    ForEach Game_List()
      LHA_Files(Game_List()\File_Name)=ListIndex(Game_List())
    Next
    
    path=OpenFileRequester("Load List File",List_Path,"List File (*.lst)|*.lst",0)
    If path<>""
      ReadFile(#LIST_FILE,path)
      If #LIST_FILE
        While Not Eof(#LIST_FILE)
          text$=ReadString(#LIST_FILE)
          If Left(text$,1)<>";"
            If FindMapElement(LHA_Files(), text$)
              AddElement(List_Games())
              List_Games()=MapKey(LHA_Files())
            EndIf
          EndIf
        Wend
        FlushFileBuffers(#LIST_FILE)
        CloseFile(#LIST_FILE)
      EndIf
      DisableGadget(#CLEAR_EDITS_BUTTON,#False)
    EndIf
    
    FreeMap(LHA_Files())
    
    If ListSize(List_Games())>0
      SetGadgetText(#LIST_EDIT_BUTTON,"Edit List")
      
      ForEach Game_List()
        Game_List()\File_Ignore=#True
      Next
      
      ForEach List_Games()
        SelectElement(Game_List(),Game_Number(List_Games()))
        Game_List()\File_Ignore=#False
      Next
      
      Set_List_Gadgets(#False)
    EndIf
  EndIf
  
EndProcedure  

Procedure Save_List()
  
  Path=OpenFileRequester("Save List File",List_Path,"List File (*.lst)|*.lst",0)
  If Path<>""
    If GetExtensionPart(path)<>"lst" : path+".lst" : EndIf 
    If FileSize(Path)<>-1
      If MessageRequester("Warning","Overwrite file?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_No
        Goto Proc_Exit2:
      EndIf
    EndIf
    If CreateFile(#LIST_FILE,Path)
      ForEach Filtered_List()
        SelectElement(Game_List(),Filtered_List())
        WriteStringN(#LIST_FILE,Game_List()\File_Name)
      Next
      CloseFile(#LIST_FILE)
    Else
      MessageRequester("Error","Cannot Create File!",#PB_MessageRequester_Error|#PB_MessageRequester_Ok)
    EndIf
  EndIf
  
  Proc_Exit2:
  
EndProcedure

Procedure Append_List()
  
  Protected text$
  
  Protected NewMap LHA_Files.i()
  
  ForEach Game_List()
    LHA_Files(Game_List()\File_Name)=ListIndex(Game_List())
  Next
  
  path=OpenFileRequester("Append List File",List_Path,"List File (*.lst)|*.lst",0)
  If path<>""
    If ReadFile(#PB_Any,path)
      While Not Eof(#LIST_FILE)
        text$=ReadString(#LIST_FILE)
        If Left(text$,1)<>";"
          If FindMapElement(LHA_Files(), text$)
            AddElement(List_Games())
            List_Games()=MapKey(LHA_Files())
          EndIf
        EndIf
      Wend
      FlushFileBuffers(#LIST_FILE)
      CloseFile(#LIST_FILE)
    EndIf
  EndIf
  
  FreeMap(LHA_Files())
  
  ForEach List_Games()
    SelectElement(Game_List(),Game_Number(List_Games()))
    Game_List()\File_Ignore=#False
  Next
  
  Set_List_Gadgets(#False)
  
EndProcedure  

Procedure Edit_List()
  
  Protected result.l
  
  Protected oldgadgetlist.i, i.i
  Protected changes.b=#False
  
  Protected check.b=#True
  
  OpenWindow(#EDIT_WINDOW,0,0,360,510,"Edit List", #PB_Window_Tool|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  
  Pause_Window(#EDIT_WINDOW)
  
  oldgadgetlist=UseGadgetList(WindowID(#EDIT_WINDOW))
  
  DisableWindow(#MAIN_WINDOW,#True)
  
  ListIconGadget(#EDIT_LIST,0,0,360,465,"",450,#PB_ListIcon_FullRowSelect | #LVS_NOCOLUMNHEADER | #PB_ListIcon_CheckBoxes)
  
  Pause_Gadget(#EDIT_LIST)
  
  ClearGadgetItems(#EDIT_LIST)
  
  ForEach Game_List()
    AddElement(Edit_Filtered_List())
    AddGadgetItem(#EDIT_LIST,-1,Game_List()\File_Name)
    If Game_List()\File_Filtered=#False Or Game_List()\File_Extra=#True: SetGadgetItemState(#EDIT_LIST,ListIndex(Game_List()),#PB_ListIcon_Checked) : EndIf
  Next
  
  Resume_Gadget(#EDIT_LIST)    
  
  ButtonGadget(#EDIT_CLEAR_BUTTON,5,470,110,35,"Clear Checks")
  ButtonGadget(#EDIT_UPDATE_BUTTON,125,470,110,35,"Update List")
  ButtonGadget(#EDIT_CANCEL_BUTTON,245,470,110,35,"Cancel")
  
  DisableGadget(#EDIT_UPDATE_BUTTON,#True)
  
  Resume_Window(#EDIT_WINDOW)
  
  Repeat
    
    Event=WaitWindowEvent()
    Gadget=EventGadget()
    Type=EventType()
    
    Select Gadget
        
      Case #EDIT_LIST 
        If Type=#PB_EventType_Change             
          If changes=#False 
            DisableGadget(#EDIT_UPDATE_BUTTON,#False)
          EndIf
          changes=#True
        EndIf
        
      Case #EDIT_CANCEL_BUTTON 
        If changes
          If MessageRequester("Warning","Cancel changes?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
            Break
          EndIf
        Else
          Break
        EndIf
        
      Case #EDIT_CLEAR_BUTTON
        If Type=#PB_EventType_LeftClick
          If changes=#False : DisableGadget(#EDIT_UPDATE_BUTTON,#False) : EndIf
          changes=#True
          Pause_Gadget(#EDIT_LIST)
          If check=#False
            check=#True
            SetGadgetText(#EDIT_CLEAR_BUTTON,"Clear Checks")
            For Count=0 To CountGadgetItems(#EDIT_LIST)-1
              SetGadgetItemState(#EDIT_LIST,Count,#PB_ListIcon_Checked)
            Next
          Else
            check=#False
            SetGadgetText(#EDIT_CLEAR_BUTTON,"Check All")
            For Count=0 To CountGadgetItems(#EDIT_LIST)-1
              SetGadgetItemState(#EDIT_LIST,Count,#False)
            Next
          EndIf
          Resume_Gadget(#EDIT_LIST)
        EndIf
        
      Case #EDIT_UPDATE_BUTTON
        If changes
          result=MessageRequester("Warning","Make changes to main list?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNoCancel)
          Select result
            Case #PB_MessageRequester_Yes
              SetGadgetText(#LIST_EDIT_BUTTON,"Edit List")
              DisableGadget(#CLEAR_EDITS_BUTTON,#False)
              For Count=0 To CountGadgetItems(#EDIT_LIST)-1
                SelectElement(Game_List(),Count)
                GetGadgetItemText(#EDIT_LIST,Count)
                Game_List()\File_Extra=#False
                If GetGadgetItemState(#EDIT_LIST,Count) & #PB_ListIcon_Checked
                  Game_List()\File_Ignore=#False
                  
                  If Game_List()\File_Filtered=#True
                    Game_List()\File_Extra=#True
                  EndIf
                  
                Else          
                  Game_List()\File_Ignore=#True
                EndIf
              Next
              Break
              
            Case #PB_MessageRequester_No
              Break
              
            Case #PB_MessageRequester_Cancel
              Continue
              
          EndSelect
        EndIf
        
    EndSelect
    
  ForEver
  
  UseGadgetList(oldgadgetlist)
  
  CloseWindow(#EDIT_WINDOW)
  
  DisableWindow(#MAIN_WINDOW,#False)
  
EndProcedure

;- ############### FTP & Data

Procedure.l FTPInit() 
  ProcedureReturn InternetOpen_("FTP",#INTERNET_OPEN_TYPE_DIRECT,"","",0) 
EndProcedure 

Procedure.l FTPConnect(hInternet,Server.s,User.s,Password.s,port.l) 
  ProcedureReturn InternetConnect_(hInternet,Server,#INTERNET_DEFAULT_FTP_PORT,User,Password,#INTERNET_SERVICE_FTP,#INTERNET_FLAG_PASSIVE,"")
EndProcedure 

Procedure.l FTPDir(hConnect.l, List FTPFiles.s()) 
  Protected hFind.l, Find.i
  Protected FTPFile.WIN32_FIND_DATA
  
  hFind=FtpFindFirstFile_(hConnect,"*.*",@FTPFile.WIN32_FIND_DATA,0,0) 
  If hFind 
    Find=1 
    While Find 
      Find=InternetFindNextFile_(hFind,@FTPFile) 
      If Find
        AddElement(FTPFiles())
        FTPFiles()=PeekS(@FTPFile\cFileName) ;Files
      EndIf      
    Wend
    InternetCloseHandle_(hFind) 
  EndIf 
EndProcedure 

Procedure.l FTPSetDir(hConnect.l,Dir.s) 
  ProcedureReturn FtpSetCurrentDirectory_(hConnect,Dir) 
EndProcedure 

Procedure.l FTPDownload(hConnect.l,Source.s,Dest.s) 
  ProcedureReturn FtpGetFile_(hConnect,Source,Dest,0,#FILE_ATTRIBUTE_NORMAL,#FTP_TRANSFER_TYPE_BINARY,0) 
EndProcedure 

Procedure.l FTPClose(hInternet.l) 
  ProcedureReturn InternetCloseHandle_(hInternet) 
EndProcedure 

Procedure Update_Files(bool.b)
  
  ;Structure 0=Not needed 1=Wrong CRC
  
  Protected NewList U_Delete_List.Del_Structure()
  Protected NewList File_List_Own.File_Data()
  
  Protected oldgadgetlist.i, base_count.i, update.b
  
  Protected NewMap Delete_Map.i()
  Protected NewMap Archive_Map.s()
  Protected NewList Own_Files.Own_Data()
  
  update=#False
  
  ClearList(U_Delete_List())
  
  ForEach Filtered_List()
    SelectElement(Game_List(),Filtered_List())
    Archive_Map(Game_List()\File_Name)=Str(ListIndex(Game_List()))
  Next
  
  ClearList(File_List())
  List_Files_Recursive(WHD_Folder,File_List(),"") 
  
  ForEach File_List()
    If Not FindMapElement(Archive_Map(),GetFilePart(File_List()))
      If GetExtensionPart(File_List())="lha" Or GetExtensionPart(File_List())="lzx"
        AddElement(U_Delete_List())
        U_Delete_List()\del_name=File_List()
        U_Delete_List()\del_type=0
      EndIf
    EndIf
    If FindMapElement(Archive_Map(),GetFilePart(File_List()))
      SelectElement(Game_List(),Val(Archive_Map()))
      If Game_List()\File_CRC<>Game_List()\File_Archive_CRC
        AddElement(U_Delete_List())
        U_Delete_List()\del_name=File_List()
        U_Delete_List()\del_type=1
      EndIf
    EndIf
  Next
  
  ClearList(File_List())
  
  If Bool
    
    OpenWindow(#DELETE_WINDOW,0,0,385,400,"Scanning WHDLoad folders. Please wait...", #PB_Window_Tool|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
    
    oldgadgetlist=UseGadgetList(WindowID(#DELETE_WINDOW))
    
    DisableWindow(#MAIN_WINDOW,#True)
    
    Pause_Window(#DELETE_WINDOW)
    
    TreeGadget(#DELETE_LIST,0,0,385,360)
    ButtonGadget(#DELETE_DEL_BUTTON,5,365,90,30,"Delete")
    ButtonGadget(#DELETE_BACKUP_BUTTON,100,365,90,30,"Back Up")
    ButtonGadget(#DELETE_OWN_BUTTON,195,365,90,30,"Own Files")
    ButtonGadget(#DELETE_CANCEL_BUTTON,290,365,90,30,"Cancel")   
    
    Pause_Gadget(#DELETE_LIST)
    
    If ListSize(U_Delete_List())>0
      SetWindowTitle(#DELETE_WINDOW,"Found "+Str(ListSize(U_Delete_List()))+" incorrect files. Please wait...")
      ForEach U_Delete_List()
        AddGadgetItem(#DELETE_LIST,-1,U_Delete_List()\del_name,0,0)
        If U_Delete_List()\del_type=0
          AddGadgetItem(#DELETE_LIST,-1,"No longer needed!",0,1)
        EndIf
        If U_Delete_List()\del_type=1
          AddGadgetItem(#DELETE_LIST,-1,"Invalid CRC32!",0,1)
        EndIf
      Next
      #TVM_SETTEXTCOLOR = 4382
      SendMessage_(GadgetID(#DELETE_LIST),#TVM_SETTEXTCOLOR,0,RGB(255,0,0))
    EndIf
        
    If ListSize(U_Delete_List())=0
      DisableGadget(#DELETE_BACKUP_BUTTON,#True)
      DisableGadget(#DELETE_DEL_BUTTON,#True)
    EndIf
    
    TreeExpandAllItems(#DELETE_LIST)
    
    SetGadgetState(#DELETE_LIST,1)
    
    Resume_Gadget(#DELETE_LIST)   
    
    SetWindowTitle(#DELETE_WINDOW,"Remove Un-Needed Files ("+Str(ListSize(U_Delete_List()))+" files)")
    
    Resume_Window(#DELETE_WINDOW)
    
    Repeat
      
      Event=WaitWindowEvent()
      Gadget=EventGadget()
      
      Select Gadget
          
        Case #DELETE_CANCEL_BUTTON : Break
          
        Case #DELETE_DEL_BUTTON
          If ListSize(U_Delete_List())>0
            If MessageRequester("Warning","Delete listed files?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
              ForEach U_Delete_List() 
                DeleteFile(U_Delete_List()\del_name)
                Delete_File_List_Entry(U_Delete_List()\del_name)
              Next
              Break
            EndIf         
          Else
            MessageRequester("Information","Nothing to delete.",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
          EndIf
          
        Case #DELETE_BACKUP_BUTTON
          If ListSize(U_Delete_List())>0
            If MessageRequester("Warning","Back up listed files?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
              ForEach U_Delete_List()
                Count=CountString(U_Delete_List()\del_name,Chr(92))
                Path=Home_Path+"Backup"
                CreateDirectory(Path)
                CopyFile(U_Delete_List()\del_name,Path+Chr(92)+GetFilePart(U_Delete_List()\del_name))
                DeleteFile(U_Delete_List()\del_name)
                Delete_File_List_Entry(U_Delete_List()\del_name)
              Next
              Rescan_Files()
              Break
            EndIf
          Else
            MessageRequester("Information","Nothing to move.",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
          EndIf
          
        Case #DELETE_OWN_BUTTON
          ClearList(U_Delete_List())
          Path=PathRequester("Select a folder to scan.",Home_Path)
          If Path<>""
            List_Files_Recursive_Size(Path,File_List_Own(),"*.*")
            ForEach File_List_Own()
              If GetExtensionPart(File_List_Own()\R_File_Name)="lha" Or GetExtensionPart(File_List_Own()\R_File_Name)="lzx"
                AddElement(Own_Files())
                Own_Files()\own_file=File_List_Own()\R_File_File
                Own_Files()\own_folder=GetPathPart(File_List_Own()\R_File_File)
                Own_Files()\own_crc32=File_List_Own()\R_File_CRC32
                Own_Files()\own_size=File_List_Own()\R_File_Size
              EndIf
            Next
            ForEach Game_List() ; Create a map of all the filenames in the database
              Archive_Map(Game_List()\File_Name)=Game_List()\File_CRC
            Next
            ForEach Own_Files() ; Compare the filenames in the own list and add any to the delete list
              If Not FindMapElement(Archive_Map(),Own_Files()\own_file)
                AddElement(U_Delete_List())
                U_Delete_List()\del_name=Own_Files()\own_folder+Own_Files()\own_file
                U_Delete_List()\del_type=0
              EndIf
              If FindMapElement(Archive_Map(),Own_Files()\own_file)
                If Own_Files()\own_crc32<>Archive_Map()
                  AddElement(U_Delete_List())
                  U_Delete_List()\del_name=Own_Files()\own_folder+Own_Files()\own_file
                  U_Delete_List()\del_type=1
                EndIf
              EndIf
            Next
            ClearGadgetItems(#DELETE_LIST)
            If ListSize(U_Delete_List())>0
              ForEach U_Delete_List()
                AddGadgetItem(#DELETE_LIST,-1,U_Delete_List()\del_name,0,0)
                If U_Delete_List()\del_type=0
                  SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
                  AddGadgetItem(#DELETE_LIST,-1,"No longer needed!",0,1)
                  SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
                EndIf
                If U_Delete_List()\del_type=1
                  SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
                  AddGadgetItem(#DELETE_LIST,-1,"Invalid CRC32!",0,1)
                  SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
                EndIf
              Next
              DisableGadget(#DELETE_BACKUP_BUTTON,#False)
              DisableGadget(#DELETE_DEL_BUTTON,#False) 
              TreeExpandAllItems(#DELETE_LIST)
            Else
              MessageRequester("Information","Nothing to delete.",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
            EndIf
            SetWindowTitle(#DELETE_WINDOW,"Remove Un-Needed Files ("+Str(ListSize(Delete_List()))+" files)")
          EndIf
          
      EndSelect
      
    ForEver
    
    UseGadgetList(oldgadgetlist)
    
    CloseWindow(#DELETE_WINDOW)
    
    update=#True
    
   EndIf
  
  FreeList(Own_Files())
  FreeMap(Delete_Map())
  FreeMap(Archive_Map())
  ClearList(Delete_List())
  ClearList(File_List())
  FreeList(U_Delete_List())
  FreeList(File_List_Own())
  
  DisableWindow(#MAIN_WINDOW,#False)
  
  For count = 1 To 3
    ForEach Directory_List()
      DeleteDirectorySafely(Directory_List())
    Next
  Next
  
  ProcedureReturn update
  
EndProcedure

Procedure Scan_HTTP()
  
  Protected NewList Dat_List.s() ; Zipped DAT files on FTP.
  Protected NewList XML_List.s() ; DAT files in each zip.
  Protected NewList Scan_List.s(); Files in dats folder to compare
  Protected NewMap File_Map.s()  ; Files from FTP to compare to Scan_List
  
  Protected dat_archive.i, xml_file.i    
  Protected FileName$
  
  Protected NewList FTP_Dir_Files.s()  
  
  ClearList(Down_List())
  ClearList(List_Games())
  
  CreateDirectory(Temp_Folder)
  
  Protected ConsoleTitle$, system_menu.l
  
  ConsoleTitle$="HTTP Download"
  
  OpenConsole(ConsoleTitle$)
  Center_Console()
  Remove_Console_Close()
  
  Protected response, info$, input$, i, path$
  
  response=HTTPRequest(#PB_HTTP_Get,HTTP_Server)
  info$=HTTPInfo(response,#PB_HTTP_Response)
  
  count=CountString(info$,#LF$)
  
  For i=1 To count+1
    input$=StringField(info$,i,#LF$)
    If FindString(input$,"zip",#PB_String_NoCase)
      AddElement(FTP_Dir_Files())
      path$=Trim(input$)
      path$=StringField(path$,6,#DOUBLEQUOTE$)
      path$=ReplaceString(path$,"amp;","")
      FTP_Dir_Files()=path$
    EndIf
  Next
  
  PrintNCol("Checking for update...",11,0)
  PrintN("")
  PrintNCol("Reading "+HTTP_Server,2,0)
  Count=0
  
  PrintN("")
  
  If ListSize(FTP_Dir_Files())>0
    If FileSize(Dat_Folder)<>-2 : CreateDirectory(Dat_Folder) : EndIf  
    SetCurrentDirectory(Dat_Folder)
    ForEach FTP_Dir_Files()
      If FindString(FTP_Dir_Files(),"WHDLoad") 
        FileName$=FTP_Dir_Files()   
        FileName$=ReplaceString(FileName$,"%20"," ")
        FileName$=ReplaceString(filename$,"amp;","")
        AddElement(Dat_List())
        Dat_List()=FileName$ ; Add file to downloaded file list
        If FileSize(Dat_Folder+FileName$)=-1  
          PrintN("Downloading : "+FileName$)
          If ReceiveHTTPFile(HTTP_Server+"/"+FTP_Dir_Files(),Dat_Folder+FileName$)
            PrintN("Success")
          Else
            PrintN("Download Error!")
          EndIf
        Else
          PrintN(FileName$+" up to date!")
        EndIf
      EndIf
    Next
  Else
    PrintN("")
    PrintNCol("Error - Cannot find HTTP folder!",4,0)
    Goto Proc_Exit
  EndIf   
  
  List_Files_Recursive(Dat_Folder,Scan_List(),"*.zip") ; Scan all the files in the dat folder
  
  ForEach Scan_List() ; Remove path information
    Scan_List()=GetFilePart(Scan_List())
  Next
  
  ForEach Dat_List() ; Load the datfiles into a map
    File_Map(Dat_List())=""
  Next
  
  ForEach Scan_List() ; compare the scan list to the dat folder map and delete anything not needed
    If Not FindMapElement(File_Map(),Scan_List()) 
      DeleteFile(Dat_Folder+Scan_List(),#PB_FileSystem_Force)
    EndIf
  Next
  
  Protected old_name.s, mask$, date1.l, date2.l
  
  mask$="%dd-%mm-%yy"
  
  SortList(Scan_List(),#PB_Sort_Ascending)
  
  ForEach Scan_List()
    count=FindString(Scan_List(),"(")
    path=Left(Scan_List(),count)
    old_name=Scan_List()
    PushListPosition(Scan_List())
    While NextElement(Scan_List())
      If Left(Scan_List(),count) = path
        date1=ParseDate(mask$,Mid(Scan_List(),count+1,8))
        date2=ParseDate(mask$,Mid(old_name,count+1,8))
        If date1<date2
          DeleteFile(Dat_Folder+Scan_List(),#PB_FileSystem_Force)
        Else
          DeleteFile(Dat_Folder+old_name,#PB_FileSystem_Force)
        EndIf
      EndIf
    Wend
    PopListPosition(Scan_List())
  Next
  
  FreeMap(File_Map())
  ClearList(Scan_List())
  
  PrintN("")
  PrintNCol("Processing dat files...",11,0)
  
  ClearList(Dat_List())
  
  List_Files_Recursive(Dat_Folder,Dat_List(),"*.zip")  
  
  SetCurrentDirectory(Temp_Folder)
  
  ForEach Dat_List()
    dat_archive=OpenPack(#PB_Any,Dat_List(),#PB_PackerPlugin_Zip)
    If dat_archive
      If ExaminePack(dat_archive)
        While NextPackEntry(dat_archive)
          UncompressPackFile(dat_archive,PackEntryName(dat_archive))
          AddElement(XML_List())
          XML_List()=PackEntryName(dat_archive)
        Wend
      EndIf
      ClosePack(dat_archive)
    Else
      PrintN("")
      PrintNCol("Error - Cannot open archive",4,0)
    EndIf
  Next
  
  ForEach XML_List()
    
    If FindString(XML_List(), "Demos")
      If FindString(XML_List(), "Beta")
        path="Beta" : path2="Demo"
      Else
        path="Demo" : path2=""
      EndIf
    EndIf
    If FindString(XML_List(), "Games")
      If FindString(XML_List(), "Beta")
        path="Beta" : path2="Game"
      Else
        path="Game" : path2=""
      EndIf
    EndIf
    
    If FindString(XML_List(), "Magazines") : path="Magazine" : EndIf
    
    xml_file=LoadXML(#PB_Any, XML_List()) 
    
    If xml_file            
      If XMLStatus(xml_file) <> #PB_XML_Success
        Define Message.s = "Error in the XML file:" + Chr(13)
        Message + "Message: " + XMLError(xml_file) + Chr(13)
        Message + "Line: " + Str(XMLErrorLine(xml_file)) + "   Character: " + Str(XMLErrorPosition(xml_file))
        MessageRequester("Error", Message)
        End
      EndIf
      Define *mainnode = MainXMLNode(xml_file)
      If *MainNode
        FillTree(*MainNode)
      EndIf   
      FreeXML(xml_file) ; Free Memory  
    EndIf
    
    DeleteFile(XML_List(),#PB_FileSystem_Force)
    
  Next
  
  SetCurrentDirectory(Home_Path)
  
  DeleteDirectory(Temp_Folder,"",#PB_FileSystem_Force)
  
  FreeList(Dat_List())
  FreeList(XML_List())
  FreeList(FTP_Dir_Files())
  
  Proc_Exit:
  
  Delay(1500)  
  
  CloseConsole()  
  
  SetCurrentDirectory(home_path)  
  
EndProcedure

Procedure Scan_FTP()
  
  Protected NewList Dat_List.s() ; Zipped DAT files on FTP.
  Protected NewList XML_List.s() ; DAT files in each zip.
  Protected NewList Scan_List.s(); Files in dats folder to compare
  Protected NewMap File_Map.s()  ; Files from FTP to compare to Scan_List
  
  Protected dat_archive.i, xml_file.i    
  Protected hInternet.l, hConnect.l 
  Protected ftp_log.s 
  Protected FileName$
  
  Protected NewList FTP_Dir_Files.s()  
  
  ClearList(Down_List())
  ClearList(List_Games())
  
  CreateDirectory(Temp_Folder)
  
  Protected ConsoleTitle$, system_menu.l
  
  ConsoleTitle$="FTP Download (Press 'Esc' to cancel download.)"
  
  OpenConsole(ConsoleTitle$)
  Center_Console()
  Remove_Console_Close()
  
  hInternet=FTPInit()   
  hConnect=FTPConnect(hInternet,FTP_Server,FTP_User,FTP_Pass,FTP_Port) 
  
  If hConnect
    PrintNCol("Checking for update...",11,0)
    PrintN("")
    PrintNCol("Connected to "+ftp_server+" on port:"+Str(FTP_Port),2,0)
    ftp_log="Connected to "+ftp_server+" on port:"+Str(FTP_Port)+#CRLF$
    Count=0
    
    If FTPSetDir(hConnect,FTP_Folder)
      PrintN("")
      PrintNCol("Opening FTP Folder - "+FTP_Folder,9,0)
      ftp_log+"Opening FTP Folder - "+FTP_Folder+#CRLF$
      FTPDir(hConnect,FTP_Dir_Files())
      ForEach FTP_Dir_Files()
        If GetExtensionPart(FTP_Dir_Files())<>"zip" : DeleteElement(FTP_Dir_Files()) : EndIf
      Next  
      If ListSize(FTP_Dir_Files())>0
        PrintN("")
        PrintNCol("Reading FTP Folder - "+FTP_Folder,13,0)
        ftp_log+"Reading FTP Folder - "+FTP_Folder+#CRLF$
        Delay(50)
        ForEach FTP_Dir_Files()
          FileName$=FTP_Dir_Files()
          If FindString(FileName$,"Commodore Amiga - WHDLoad - Games") Or FindString(FileName$,"Commodore Amiga - WHDLoad - Demos") Or FindString(FileName$,"Commodore Amiga - WHDLoad - Magazines")
            If FileSize(Dat_Folder)<>-2 : CreateDirectory(Dat_Folder) : EndIf
            SetCurrentDirectory(Dat_Folder)
            If FileSize(Dat_Folder+FileName$)=-1 ; If the dat file doesn't exist, download it 
              FTPDownload(hConnect,FileName$,FileName$)
              PrintN("Downloading : "+FileName$)
              ftp_log+"Downloading : "+FileName$+#CRLF$
            EndIf
            AddElement(Dat_List())
            Dat_List()=FileName$ ; Add file to downloaded file list
          EndIf
        Next
      EndIf
    Else
      PrintN("")
      PrintNCol("Error - Cannot find FTP folder!",4,0)
      ftp_log+"Error - Cannot find FTP folder!"+#CRLF$
      Delay(2000)  
      FTPClose(hInternet)  
      PrintN("")
      PrintNCol("FTP connection closed.",14,0)
      ftp_log+"FTP connection closed."+#CRLF$
      
      Goto Proc_Exit
      
    EndIf   
    
  Else
    
    PrintN("")
    PrintNCol("Error - Cannot connect to FTP!",4,0)
    ftp_log+"Error - Cannot connect to FTP!"+#CRLF$
    Goto Proc_Exit
    
  EndIf
  
  FTPClose(hInternet)  
  PrintN("")
  PrintNCol("FTP connection closed.",14,0)
  ftp_log+"FTP connection closed."+#CRLF$
  
  List_Files_Recursive(Dat_Folder,Scan_List(),"*.zip") ; Scan all the files in the dat folder
  
  ForEach Scan_List() ; Remove path information
    Scan_List()=GetFilePart(Scan_List())
  Next
  
  ForEach Dat_List() ; Load the datfiles into a map
    File_Map(Dat_List())=""
  Next
  
  ForEach Scan_List() ; compare the scan list to the dat folder map and delete anything not needed
    If Not FindMapElement(File_Map(),Scan_List()) 
      DeleteFile(Dat_Folder+Scan_List(),#PB_FileSystem_Force)
    EndIf
  Next
  
  FreeMap(File_Map())
  ClearList(Scan_List())
  
  PrintN("")
  PrintNCol("Processing dat files...",11,0)
  
  SetCurrentDirectory(Dat_Folder)  
  
  ForEach Dat_List()
    dat_archive=OpenPack(#PB_Any,Dat_List(),#PB_PackerPlugin_Zip)
    If dat_archive
      If ExaminePack(dat_archive)
        While NextPackEntry(dat_archive)
          UncompressPackFile(dat_archive,PackEntryName(dat_archive))
          AddElement(XML_List())
          XML_List()=PackEntryName(dat_archive)
        Wend
      EndIf
      ClosePack(dat_archive)
    Else
      PrintN("")
      PrintNCol("Error - Cannot open archive",4,0)
      Delay(1000)
      Goto Proc_Exit
    EndIf
  Next
  
  ForEach XML_List()
    
    If FindString(XML_List(), "Demos")
      If FindString(XML_List(), "Beta")
        path="Beta" : path2="Demo"
      Else
        path="Demo" : path2=""
      EndIf
    EndIf
    If FindString(XML_List(), "Games")
      If FindString(XML_List(), "Beta")
        path="Beta" : path2="Game"
      Else
        path="Game" : path2=""
      EndIf
    EndIf
    
    If FindString(XML_List(), "Magazines") : path="Magazine" : EndIf
    
    xml_file=LoadXML(#PB_Any, XML_List()) 
    
    If xml_file            
      If XMLStatus(xml_file) <> #PB_XML_Success
        Define Message.s = "Error in the XML file:" + Chr(13)
        Message + "Message: " + XMLError(xml_file) + Chr(13)
        Message + "Line: " + Str(XMLErrorLine(xml_file)) + "   Character: " + Str(XMLErrorPosition(xml_file))
        MessageRequester("Error", Message)
        End
      EndIf
      Define *mainnode = MainXMLNode(xml_file)
      If *MainNode
        FillTree(*MainNode)
      EndIf   
      FreeXML(xml_file) ; Free Memory  
    EndIf
    
    DeleteFile(XML_List(),#PB_FileSystem_Force)
    
  Next
  
  SetCurrentDirectory(Home_Path)
  
  DeleteDirectory(Temp_Folder,"",#PB_FileSystem_Force)
  
  FreeList(Dat_List())
  FreeList(XML_List())
  FreeList(FTP_Dir_Files())
  
  Proc_Exit:
  
  Protected log_file.l
  
  If CreateFile(log_file, Home_Path+"ftp.log")
    WriteString(log_file, ftp_log)
    CloseFile(log_file)  
  EndIf
  
  Delay(1500)  
  
  CloseConsole()  
  
  SetCurrentDirectory(home_path)  
  
EndProcedure

Macro Add_Category2(ftype,category,category2)
    
  If ftype="Game" : whd_out_folder=WHD_Game_Folder : EndIf
  If ftype="Demo" : whd_out_folder=WHD_Demo_Folder : EndIf
  If ftype="Beta" : whd_out_folder=WHD_Beta_Folder : EndIf
  If ftype="Magazine" : whd_out_folder=WHD_Mags_Folder : EndIf
  
  ClearList(Sort_List())

  Count=0
  
  ForEach Down_List()
    If Down_List()\Down_Type=ftype ; game
      If Down_List()\Down_Folder=category ; aga
        If Down_List()\Down_0toZ=category2; 0-z
          AddElement(Sort_List())
          Sort_List()\Sort_Name=Down_List()\Down_Name
          Sort_List()\Sort_Index=ListIndex(Down_List())
        EndIf
      EndIf
    EndIf
  Next 
  
  If ListSize(Sort_List())>0 : found=#True : EndIf
  
  If A500Mini=#False 
    If ListSize(Sort_List())>0
      AddGadgetItem(#DOWNLOAD_LIST,-1,category2,0,2)
      ForEach Sort_List()
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,3)
        SelectElement(Down_List(),Sort_List()\Sort_Index)
        Down_List()\Down_SubFolder_1=whd_out_folder
        If ftype="Magazine"
          Down_List()\Down_SubFolder_2=category2
          Down_List()\Down_SubFolder_3=""
        Else
          Down_List()\Down_SubFolder_2=category
          Down_List()\Down_SubFolder_3=category2
        EndIf
      Next    
    EndIf
  EndIf
  
  If A500Mini=#True    
    If ListSize(Sort_List())<=255 And ListSize(Sort_List())>0
      AddGadgetItem(#DOWNLOAD_LIST,-1,category2,0,2)
      ForEach Sort_List()
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,3)
        SelectElement(Down_List(),Sort_List()\Sort_Index)
        Down_List()\Down_SubFolder_1=whd_out_folder
        Down_List()\Down_SubFolder_2=category
        Down_List()\Down_SubFolder_3=category2
      Next    
    EndIf
    
    If ListSize(Sort_List())>255       
      count=0
      c_count=0
      down_folder=category2+"("+Str(c_count)+")"
      AddGadgetItem(#DOWNLOAD_LIST,-1,category2+"("+Str(c_count)+")",0,2)
      ForEach Sort_List()
        If count=255 Or ListIndex(Sort_List())=ListSize(Sort_List()) 
          c_count+1 
          down_folder=category2+"("+Str(c_count)+")"
          AddGadgetItem(#DOWNLOAD_LIST,-1,down_folder,0,2)
          count=0
        EndIf
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,3)
        SelectElement(Down_List(),Sort_List()\Sort_Index)
        Down_List()\Down_SubFolder_1=whd_out_folder
        Down_List()\Down_SubFolder_2=category
        Down_List()\Down_SubFolder_3=down_folder
        count+1
      Next
    EndIf
    
  EndIf
  
EndMacro

Macro Add_Category(ftype,category,category2)
    
  If ftype="Game" : whd_out_folder=WHD_Game_Folder : EndIf
  If ftype="Demo" : whd_out_folder=WHD_Demo_Folder : EndIf
  If ftype="Beta" : whd_out_folder=WHD_Beta_Folder : EndIf
  If ftype="Magazine" : whd_out_folder=WHD_Mags_Folder : EndIf
  
  ClearList(Sort_List())

  Count=0
  
  If Sort_Type=2
    ForEach Down_List()
      If Down_List()\Down_Type=ftype
        If Down_List()\Down_Folder=category
          AddElement(Sort_List())
          Sort_List()\Sort_Name=Down_List()\Down_Name
          Sort_List()\Sort_Index=ListIndex(Down_List())
        EndIf
      EndIf
    Next 
  EndIf
    
  If Sort_Type=1
    ForEach Down_List()
      If Down_List()\Down_Type=ftype
        If Down_List()\Down_0toZ=category
          AddElement(Sort_List())
          Sort_List()\Sort_Name=Down_List()\Down_Name
          Sort_List()\Sort_Index=ListIndex(Down_List())
        EndIf
      EndIf
    Next 
  EndIf 
  
  If ListSize(Sort_List())>0 : found=#True : EndIf
  
  If A500Mini=#False 
    If ListSize(Sort_List())>0
      AddGadgetItem(#DOWNLOAD_LIST,-1,category,0,1)
      ForEach Sort_List()
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,2)
        SelectElement(Down_List(),Sort_List()\Sort_Index)
        Down_List()\Down_SubFolder_1=whd_out_folder
        If ftype="Magazine" And Sort_Type=2
          Down_List()\Down_SubFolder_2=""
        Else
          Down_List()\Down_SubFolder_2=category
        EndIf
        Down_List()\Down_SubFolder_3=category2
      Next    
    EndIf
  EndIf
  
  If A500Mini=#True    
    If ListSize(Sort_List())<=255 And ListSize(Sort_List())>0
      AddGadgetItem(#DOWNLOAD_LIST,-1,category,0,1)
      ForEach Sort_List()
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,2)
        SelectElement(Down_List(),Sort_List()\Sort_Index)
        Down_List()\Down_SubFolder_1=whd_out_folder
        Down_List()\Down_SubFolder_2=category
        Down_List()\Down_SubFolder_3=category2
      Next    
    EndIf
    
    If ListSize(Sort_List())>255       
      count=0
      c_count=0
      down_folder=category+"("+Str(c_count)+")"
      AddGadgetItem(#DOWNLOAD_LIST,-1,category+"("+Str(c_count)+")",0,1)
      ForEach Sort_List()
        If count=255 Or ListIndex(Sort_List())=ListSize(Sort_List()) 
          c_count+1 
          down_folder=category+"("+Str(c_count)+")"
          AddGadgetItem(#DOWNLOAD_LIST,-1,down_folder,0,1)
          count=0
        EndIf
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,2)
        SelectElement(Down_List(),Sort_List()\Sort_Index)
        Down_List()\Down_SubFolder_1=whd_out_folder
        Down_List()\Down_SubFolder_2=down_folder
        Down_List()\Down_SubFolder_3=category2
        count+1
      Next
    EndIf
  EndIf
  
EndMacro

Macro Add_Unsorted(ftype,category)
  
  If ftype="Game" : whd_out_folder=WHD_Game_Folder : EndIf
  If ftype="Demo" : whd_out_folder=WHD_Demo_Folder : EndIf
  If ftype="Beta" : whd_out_folder=WHD_Beta_Folder : EndIf
  If ftype="Magazine" : whd_out_folder=WHD_Mags_Folder : EndIf
  
  ForEach Down_List()   
    If Down_List()\Down_Type=ftype
      AddElement(Sort_List())
      Sort_List()\Sort_Name=Down_List()\Down_Name
      Down_List()\Down_SubFolder_1=whd_out_folder
      Down_List()\Down_SubFolder_2=""
      Down_List()\Down_SubFolder_3=""
    EndIf
  Next
  If ListSize(Sort_List())>0
    AddGadgetItem(#DOWNLOAD_LIST,-1,category,0,0)
    ForEach Sort_List()   
      AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,1)
    Next
  EndIf
  ClearList(Sort_List())
  
EndMacro

Macro Add_Unsorted_A500(ftype,category)
  
  If ftype="Game" : whd_out_folder=WHD_Game_Folder : EndIf
  If ftype="Demo" : whd_out_folder=WHD_Demo_Folder : EndIf
  If ftype="Beta" : whd_out_folder=WHD_Beta_Folder : EndIf
  If ftype="Magazine" : whd_out_folder=WHD_Mags_Folder : EndIf
  
  If ListSize(Down_List())<=255
    ForEach Down_List()   
      If Down_List()\Down_Type=ftype
        AddElement(Sort_List())
        Sort_List()\Sort_Name=Down_List()\Down_Name
        Down_List()\Down_SubFolder_1=whd_out_folder
        Down_List()\Down_SubFolder_2=""
        Down_List()\Down_SubFolder_3=""
      EndIf
    Next
    If ListSize(Sort_List())>0
      AddGadgetItem(#DOWNLOAD_LIST,-1,category,0,0)
      ForEach Sort_List()   
        AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,1)
      Next
    EndIf
    ClearList(Sort_List())
  EndIf
  
  If ListSize(Down_List())>255
    count=0
    found=#False
    ForEach Down_List()     
      If Down_List()\Down_Type=ftype
        AddElement(Cat_List())
        Cat_List()\Sort_Name=Down_List()\Down_Name
        Cat_List()\Sort_Index=ListIndex(Down_List())
      EndIf 
    Next
    
    ForEach Cat_List()
      count+1
      AddElement(Sort_List())
      Sort_List()\Sort_Name=Cat_List()\Sort_Name
      Sort_List()\Sort_Index=Cat_List()\Sort_Index
      If count=255 Or ListIndex(Cat_List())=ListSize(Cat_List())-1
        If Not found : AddGadgetItem(#DOWNLOAD_LIST,-1,category,0,0) : Found=#True : EndIf
        If ListSize(Sort_List())>0
          FirstElement(Sort_List())
          first_letter=Left(Sort_List()\Sort_Name,2)
          LastElement(Sort_List())
          last_letter=Left(Sort_List()\Sort_Name,2)
          down_folder=first_letter+"-"+last_letter
          AddGadgetItem(#DOWNLOAD_LIST,-1,down_folder,0,1)
          ForEach Sort_List()
            AddGadgetItem(#DOWNLOAD_LIST,-1,Sort_List()\Sort_Name,0,2)
            SelectElement(Down_List(),Sort_List()\Sort_Index)
            Down_List()\Down_SubFolder_1=whd_out_folder
            Down_List()\Down_SubFolder_2=down_folder
            Down_List()\Down_SubFolder_3=""
          Next
          ClearList(Sort_List())
          count=0
        EndIf
      EndIf
    Next 
  EndIf
  
  ClearList(Cat_List())
  
EndMacro

Procedure Draw_Preview()
  
  Protected first_letter.s, last_letter.s, old_first_letter.s, append_number.s, c_count.i, down_folder.s, found.b, whd_out_folder.s, old_title.s
  
  Protected level
  
  NewList Cat_List.Sort_Struct()
  NewList Sort_List.Sort_Struct()
  NewList Temp_List.Temp_Struct()
  
  old_title=GetWindowTitle(#DOWNLOAD_WINDOW)
  SetWindowTitle(#DOWNLOAD_WINDOW,"Adding entries. Please wait...")
  
  Pause_Gadget(#DOWNLOAD_LIST)
  
  ClearGadgetItems(#DOWNLOAD_LIST)
  
  append_number=""
  
  found=#False
  
  c_count=1
  
  If Sort_Type=0
    
    If A500Mini=#False
      
      Add_Unsorted("Game",WHD_Game_Folder)
      Add_Unsorted("Demo",WHD_Demo_Folder)
      Add_Unsorted("Beta",WHD_Beta_Folder)
      Add_Unsorted("Magazine",WHD_Mags_Folder)
      
    EndIf
    
    
    If A500Mini=#True
      
      Add_Unsorted_A500("Game",WHD_Game_Folder)
      Add_Unsorted_A500("Demo",WHD_Demo_Folder)
      Add_Unsorted_A500("Beta",WHD_Beta_Folder)
      Add_Unsorted_A500("Magazine",WHD_Mags_Folder)
      
    EndIf
    
  EndIf
  
  If Sort_Type=1
    
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Game_Folder,0,0)
    Add_Category("Game","0","")
    Add_Category("Game","A","")
    Add_Category("Game","B","")
    Add_Category("Game","C","")
    Add_Category("Game","D","")
    Add_Category("Game","E","")
    Add_Category("Game","F","")
    Add_Category("Game","G","")
    Add_Category("Game","H","")
    Add_Category("Game","I","")
    Add_Category("Game","J","")
    Add_Category("Game","K","")
    Add_Category("Game","L","")
    Add_Category("Game","M","")
    Add_Category("Game","N","")
    Add_Category("Game","O","")
    Add_Category("Game","P","")
    Add_Category("Game","Q","")
    Add_Category("Game","R","")
    Add_Category("Game","S","")
    Add_Category("Game","T","")
    Add_Category("Game","U","")
    Add_Category("Game","V","")
    Add_Category("Game","W","")
    Add_Category("Game","X","")
    Add_Category("Game","Y","")
    Add_Category("Game","Z","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Demo_Folder,0,0)
    Add_Category("Demo","0","")
    Add_Category("Demo","A","")
    Add_Category("Demo","B","")
    Add_Category("Demo","C","")
    Add_Category("Demo","D","")
    Add_Category("Demo","E","")
    Add_Category("Demo","F","")
    Add_Category("Demo","G","")
    Add_Category("Demo","H","")
    Add_Category("Demo","I","")
    Add_Category("Demo","J","")
    Add_Category("Demo","K","")
    Add_Category("Demo","L","")
    Add_Category("Demo","M","")
    Add_Category("Demo","N","")
    Add_Category("Demo","O","")
    Add_Category("Demo","P","")
    Add_Category("Demo","Q","")
    Add_Category("Demo","R","")
    Add_Category("Demo","S","")
    Add_Category("Demo","T","")
    Add_Category("Demo","U","")
    Add_Category("Demo","V","")
    Add_Category("Demo","W","")
    Add_Category("Demo","X","")
    Add_Category("Demo","Y","")
    Add_Category("Demo","Z","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Beta_Folder,0,0)
    Add_Category("Beta","0","")
    Add_Category("Beta","A","")
    Add_Category("Beta","B","")
    Add_Category("Beta","C","")
    Add_Category("Beta","D","")
    Add_Category("Beta","E","")
    Add_Category("Beta","F","")
    Add_Category("Beta","G","")
    Add_Category("Beta","H","")
    Add_Category("Beta","I","")
    Add_Category("Beta","J","")
    Add_Category("Beta","K","")
    Add_Category("Beta","L","")
    Add_Category("Beta","M","")
    Add_Category("Beta","N","")
    Add_Category("Beta","O","")
    Add_Category("Beta","P","")
    Add_Category("Beta","Q","")
    Add_Category("Beta","R","")
    Add_Category("Beta","S","")
    Add_Category("Beta","T","")
    Add_Category("Beta","U","")
    Add_Category("Beta","V","")
    Add_Category("Beta","W","")
    Add_Category("Beta","X","")
    Add_Category("Beta","Y","")
    Add_Category("Beta","Z","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Mags_Folder,0,0)
    Add_Category("Magazine","0","")
    Add_Category("Magazine","A","")
    Add_Category("Magazine","B","")
    Add_Category("Magazine","C","")
    Add_Category("Magazine","D","")
    Add_Category("Magazine","E","")
    Add_Category("Magazine","F","")
    Add_Category("Magazine","G","")
    Add_Category("Magazine","H","")
    Add_Category("Magazine","I","")
    Add_Category("Magazine","J","")
    Add_Category("Magazine","K","")
    Add_Category("Magazine","L","")
    Add_Category("Magazine","M","")
    Add_Category("Magazine","N","")
    Add_Category("Magazine","O","")
    Add_Category("Magazine","P","")
    Add_Category("Magazine","Q","")
    Add_Category("Magazine","R","")
    Add_Category("Magazine","S","")
    Add_Category("Magazine","T","")
    Add_Category("Magazine","U","")
    Add_Category("Magazine","V","")
    Add_Category("Magazine","W","")
    Add_Category("Magazine","X","")
    Add_Category("Magazine","Y","")
    Add_Category("Magazine","Z","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
  EndIf
  
  If Sort_Type=2
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Game_Folder,0,0)
    Add_Category("Game","AGA","")
    Add_Category("Game","ECS-OCS","")
    Add_Category("Game","NTSC","")
    Add_Category("Game","Arcadia","")
    Add_Category("Game","CD32","")
    Add_Category("Game","CDTV","")
    Add_Category("Game","CDROM","")
    Add_Category("Game","French","")
    Add_Category("Game","Finnish","")
    Add_Category("Game","German","")
    Add_Category("Game","Italian","")
    Add_Category("Game","Spanish","")
    Add_Category("Game","Greek","")
    Add_Category("Game","Danish","")
    Add_Category("Game","Dutch","")
    Add_Category("Game","Swedish","")
    Add_Category("Game","Polish","")
    Add_Category("Game","Czech","")
    Add_Category("Game","Multi","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Demo_Folder,0,0) 
    Add_Category("Demo","AGA","")
    Add_Category("Demo","ECS-OCS","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Beta_Folder,0,0) 
    Add_Category("Beta","AGA","")
    Add_Category("Beta","ECS-OCS","")
    Add_Category("Beta","NTSC","")
    Add_Category("Beta","Arcadia","")
    Add_Category("Beta","CD32","")
    Add_Category("Beta","CDTV","")
    Add_Category("Beta","CDROM","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Mags_Folder,0,0) 
    Add_Category("Magazine","Magazine","")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
  EndIf
  
  If Sort_Type=3
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Game_Folder,0,0)
    AddGadgetItem(#DOWNLOAD_LIST,-1,"AGA",0,1)
    Add_Category2("Game","AGA","0")
    Add_Category2("Game","AGA","A")
    Add_Category2("Game","AGA","B")
    Add_Category2("Game","AGA","C")
    Add_Category2("Game","AGA","D")
    Add_Category2("Game","AGA","E")
    Add_Category2("Game","AGA","F")
    Add_Category2("Game","AGA","G")
    Add_Category2("Game","AGA","H")
    Add_Category2("Game","AGA","I")
    Add_Category2("Game","AGA","J")
    Add_Category2("Game","AGA","K")
    Add_Category2("Game","AGA","L")
    Add_Category2("Game","AGA","M")
    Add_Category2("Game","AGA","N")
    Add_Category2("Game","AGA","O")
    Add_Category2("Game","AGA","P")
    Add_Category2("Game","AGA","Q")
    Add_Category2("Game","AGA","R")
    Add_Category2("Game","AGA","S")
    Add_Category2("Game","AGA","T")
    Add_Category2("Game","AGA","U")
    Add_Category2("Game","AGA","V")
    Add_Category2("Game","AGA","W")
    Add_Category2("Game","AGA","X")
    Add_Category2("Game","AGA","Y")
    Add_Category2("Game","AGA","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"ECS-OCS",0,1)
    Add_Category2("Game","ECS-OCS","0")
    Add_Category2("Game","ECS-OCS","A")
    Add_Category2("Game","ECS-OCS","B")
    Add_Category2("Game","ECS-OCS","C")
    Add_Category2("Game","ECS-OCS","D")
    Add_Category2("Game","ECS-OCS","E")
    Add_Category2("Game","ECS-OCS","F")
    Add_Category2("Game","ECS-OCS","G")
    Add_Category2("Game","ECS-OCS","H")
    Add_Category2("Game","ECS-OCS","I")
    Add_Category2("Game","ECS-OCS","J")
    Add_Category2("Game","ECS-OCS","K")
    Add_Category2("Game","ECS-OCS","L")
    Add_Category2("Game","ECS-OCS","M")
    Add_Category2("Game","ECS-OCS","N")
    Add_Category2("Game","ECS-OCS","O")
    Add_Category2("Game","ECS-OCS","P")
    Add_Category2("Game","ECS-OCS","Q")
    Add_Category2("Game","ECS-OCS","R")
    Add_Category2("Game","ECS-OCS","S")
    Add_Category2("Game","ECS-OCS","T")
    Add_Category2("Game","ECS-OCS","U")
    Add_Category2("Game","ECS-OCS","V")
    Add_Category2("Game","ECS-OCS","W")
    Add_Category2("Game","ECS-OCS","X")
    Add_Category2("Game","ECS-OCS","Y")
    Add_Category2("Game","ECS-OCS","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"NTSC",0,1)
    Add_Category2("Game","NTSC","0")
    Add_Category2("Game","NTSC","A")
    Add_Category2("Game","NTSC","B")
    Add_Category2("Game","NTSC","C")
    Add_Category2("Game","NTSC","D")
    Add_Category2("Game","NTSC","E")
    Add_Category2("Game","NTSC","F")
    Add_Category2("Game","NTSC","G")
    Add_Category2("Game","NTSC","H")
    Add_Category2("Game","NTSC","I")
    Add_Category2("Game","NTSC","J")
    Add_Category2("Game","NTSC","K")
    Add_Category2("Game","NTSC","L")
    Add_Category2("Game","NTSC","M")
    Add_Category2("Game","NTSC","N")
    Add_Category2("Game","NTSC","O")
    Add_Category2("Game","NTSC","P")
    Add_Category2("Game","NTSC","Q")
    Add_Category2("Game","NTSC","R")
    Add_Category2("Game","NTSC","S")
    Add_Category2("Game","NTSC","T")
    Add_Category2("Game","NTSC","U")
    Add_Category2("Game","NTSC","V")
    Add_Category2("Game","NTSC","W")
    Add_Category2("Game","NTSC","X")
    Add_Category2("Game","NTSC","Y")
    Add_Category2("Game","NTSC","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Arcadia",0,1)
    Add_Category2("Game","Arcadia","0")
    Add_Category2("Game","Arcadia","A")
    Add_Category2("Game","Arcadia","B")
    Add_Category2("Game","Arcadia","C")
    Add_Category2("Game","Arcadia","D")
    Add_Category2("Game","Arcadia","E")
    Add_Category2("Game","Arcadia","F")
    Add_Category2("Game","Arcadia","G")
    Add_Category2("Game","Arcadia","H")
    Add_Category2("Game","Arcadia","I")
    Add_Category2("Game","Arcadia","J")
    Add_Category2("Game","Arcadia","K")
    Add_Category2("Game","Arcadia","L")
    Add_Category2("Game","Arcadia","M")
    Add_Category2("Game","Arcadia","N")
    Add_Category2("Game","Arcadia","O")
    Add_Category2("Game","Arcadia","P")
    Add_Category2("Game","Arcadia","Q")
    Add_Category2("Game","Arcadia","R")
    Add_Category2("Game","Arcadia","S")
    Add_Category2("Game","Arcadia","T")
    Add_Category2("Game","Arcadia","U")
    Add_Category2("Game","Arcadia","V")
    Add_Category2("Game","Arcadia","W")
    Add_Category2("Game","Arcadia","X")
    Add_Category2("Game","Arcadia","Y")
    Add_Category2("Game","Arcadia","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"CD32",0,1)
    Add_Category2("Game","CD32","0")
    Add_Category2("Game","CD32","A")
    Add_Category2("Game","CD32","B")
    Add_Category2("Game","CD32","C")
    Add_Category2("Game","CD32","D")
    Add_Category2("Game","CD32","E")
    Add_Category2("Game","CD32","F")
    Add_Category2("Game","CD32","G")
    Add_Category2("Game","CD32","H")
    Add_Category2("Game","CD32","I")
    Add_Category2("Game","CD32","J")
    Add_Category2("Game","CD32","K")
    Add_Category2("Game","CD32","L")
    Add_Category2("Game","CD32","M")
    Add_Category2("Game","CD32","N")
    Add_Category2("Game","CD32","O")
    Add_Category2("Game","CD32","P")
    Add_Category2("Game","CD32","Q")
    Add_Category2("Game","CD32","R")
    Add_Category2("Game","CD32","S")
    Add_Category2("Game","CD32","T")
    Add_Category2("Game","CD32","U")
    Add_Category2("Game","CD32","V")
    Add_Category2("Game","CD32","W")
    Add_Category2("Game","CD32","X")
    Add_Category2("Game","CD32","Y")
    Add_Category2("Game","CD32","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"CDTV",0,1)
    Add_Category2("Game","CDTV","0")
    Add_Category2("Game","CDTV","A")
    Add_Category2("Game","CDTV","B")
    Add_Category2("Game","CDTV","C")
    Add_Category2("Game","CDTV","D")
    Add_Category2("Game","CDTV","E")
    Add_Category2("Game","CDTV","F")
    Add_Category2("Game","CDTV","G")
    Add_Category2("Game","CDTV","H")
    Add_Category2("Game","CDTV","I")
    Add_Category2("Game","CDTV","J")
    Add_Category2("Game","CDTV","K")
    Add_Category2("Game","CDTV","L")
    Add_Category2("Game","CDTV","M")
    Add_Category2("Game","CDTV","N")
    Add_Category2("Game","CDTV","O")
    Add_Category2("Game","CDTV","P")
    Add_Category2("Game","CDTV","Q")
    Add_Category2("Game","CDTV","R")
    Add_Category2("Game","CDTV","S")
    Add_Category2("Game","CDTV","T")
    Add_Category2("Game","CDTV","U")
    Add_Category2("Game","CDTV","V")
    Add_Category2("Game","CDTV","W")
    Add_Category2("Game","CDTV","X")
    Add_Category2("Game","CDTV","Y")
    Add_Category2("Game","CDTV","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"CDROM",0,1)
    Add_Category2("Game","CDROM","0")
    Add_Category2("Game","CDROM","A")
    Add_Category2("Game","CDROM","B")
    Add_Category2("Game","CDROM","C")
    Add_Category2("Game","CDROM","D")
    Add_Category2("Game","CDROM","E")
    Add_Category2("Game","CDROM","F")
    Add_Category2("Game","CDROM","G")
    Add_Category2("Game","CDROM","H")
    Add_Category2("Game","CDROM","I")
    Add_Category2("Game","CDROM","J")
    Add_Category2("Game","CDROM","K")
    Add_Category2("Game","CDROM","L")
    Add_Category2("Game","CDROM","M")
    Add_Category2("Game","CDROM","N")
    Add_Category2("Game","CDROM","O")
    Add_Category2("Game","CDROM","P")
    Add_Category2("Game","CDROM","Q")
    Add_Category2("Game","CDROM","R")
    Add_Category2("Game","CDROM","S")
    Add_Category2("Game","CDROM","T")
    Add_Category2("Game","CDROM","U")
    Add_Category2("Game","CDROM","V")
    Add_Category2("Game","CDROM","W")
    Add_Category2("Game","CDROM","X")
    Add_Category2("Game","CDROM","Y")
    Add_Category2("Game","CDROM","Z")
    If Split_Languages
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"French",0,1)
    Add_Category2("Game","French","0")
    Add_Category2("Game","French","A")
    Add_Category2("Game","French","B")
    Add_Category2("Game","French","C")
    Add_Category2("Game","French","D")
    Add_Category2("Game","French","E")
    Add_Category2("Game","French","F")
    Add_Category2("Game","French","G")
    Add_Category2("Game","French","H")
    Add_Category2("Game","French","I")
    Add_Category2("Game","French","J")
    Add_Category2("Game","French","K")
    Add_Category2("Game","French","L")
    Add_Category2("Game","French","M")
    Add_Category2("Game","French","N")
    Add_Category2("Game","French","O")
    Add_Category2("Game","French","P")
    Add_Category2("Game","French","Q")
    Add_Category2("Game","French","R")
    Add_Category2("Game","French","S")
    Add_Category2("Game","French","T")
    Add_Category2("Game","French","U")
    Add_Category2("Game","French","V")
    Add_Category2("Game","French","W")
    Add_Category2("Game","French","X")
    Add_Category2("Game","French","Y")
    Add_Category2("Game","French","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"German",0,1)
    Add_Category2("Game","German","0")
    Add_Category2("Game","German","A")
    Add_Category2("Game","German","B")
    Add_Category2("Game","German","C")
    Add_Category2("Game","German","D")
    Add_Category2("Game","German","E")
    Add_Category2("Game","German","F")
    Add_Category2("Game","German","G")
    Add_Category2("Game","German","H")
    Add_Category2("Game","German","I")
    Add_Category2("Game","German","J")
    Add_Category2("Game","German","K")
    Add_Category2("Game","German","L")
    Add_Category2("Game","German","M")
    Add_Category2("Game","German","N")
    Add_Category2("Game","German","O")
    Add_Category2("Game","German","P")
    Add_Category2("Game","German","Q")
    Add_Category2("Game","German","R")
    Add_Category2("Game","German","S")
    Add_Category2("Game","German","T")
    Add_Category2("Game","German","U")
    Add_Category2("Game","German","V")
    Add_Category2("Game","German","W")
    Add_Category2("Game","German","X")
    Add_Category2("Game","German","Y")
    Add_Category2("Game","German","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Italian",0,1)
    Add_Category2("Game","Italian","0")
    Add_Category2("Game","Italian","A")
    Add_Category2("Game","Italian","B")
    Add_Category2("Game","Italian","C")
    Add_Category2("Game","Italian","D")
    Add_Category2("Game","Italian","E")
    Add_Category2("Game","Italian","F")
    Add_Category2("Game","Italian","G")
    Add_Category2("Game","Italian","H")
    Add_Category2("Game","Italian","I")
    Add_Category2("Game","Italian","J")
    Add_Category2("Game","Italian","K")
    Add_Category2("Game","Italian","L")
    Add_Category2("Game","Italian","M")
    Add_Category2("Game","Italian","N")
    Add_Category2("Game","Italian","O")
    Add_Category2("Game","Italian","P")
    Add_Category2("Game","Italian","Q")
    Add_Category2("Game","Italian","R")
    Add_Category2("Game","Italian","S")
    Add_Category2("Game","Italian","T")
    Add_Category2("Game","Italian","U")
    Add_Category2("Game","Italian","V")
    Add_Category2("Game","Italian","W")
    Add_Category2("Game","Italian","X")
    Add_Category2("Game","Italian","Y")
    Add_Category2("Game","Italian","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Spanish",0,1)
    Add_Category2("Game","Spanish","0")
    Add_Category2("Game","Spanish","A")
    Add_Category2("Game","Spanish","B")
    Add_Category2("Game","Spanish","C")
    Add_Category2("Game","Spanish","D")
    Add_Category2("Game","Spanish","E")
    Add_Category2("Game","Spanish","F")
    Add_Category2("Game","Spanish","G")
    Add_Category2("Game","Spanish","H")
    Add_Category2("Game","Spanish","I")
    Add_Category2("Game","Spanish","J")
    Add_Category2("Game","Spanish","K")
    Add_Category2("Game","Spanish","L")
    Add_Category2("Game","Spanish","M")
    Add_Category2("Game","Spanish","N")
    Add_Category2("Game","Spanish","O")
    Add_Category2("Game","Spanish","P")
    Add_Category2("Game","Spanish","Q")
    Add_Category2("Game","Spanish","R")
    Add_Category2("Game","Spanish","S")
    Add_Category2("Game","Spanish","T")
    Add_Category2("Game","Spanish","U")
    Add_Category2("Game","Spanish","V")
    Add_Category2("Game","Spanish","W")
    Add_Category2("Game","Spanish","X")
    Add_Category2("Game","Spanish","Y")
    Add_Category2("Game","Spanish","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Greek",0,1)
    Add_Category2("Game","Greek","0")
    Add_Category2("Game","Greek","A")
    Add_Category2("Game","Greek","B")
    Add_Category2("Game","Greek","C")
    Add_Category2("Game","Greek","D")
    Add_Category2("Game","Greek","E")
    Add_Category2("Game","Greek","F")
    Add_Category2("Game","Greek","G")
    Add_Category2("Game","Greek","H")
    Add_Category2("Game","Greek","I")
    Add_Category2("Game","Greek","J")
    Add_Category2("Game","Greek","K")
    Add_Category2("Game","Greek","L")
    Add_Category2("Game","Greek","M")
    Add_Category2("Game","Greek","N")
    Add_Category2("Game","Greek","O")
    Add_Category2("Game","Greek","P")
    Add_Category2("Game","Greek","Q")
    Add_Category2("Game","Greek","R")
    Add_Category2("Game","Greek","S")
    Add_Category2("Game","Greek","T")
    Add_Category2("Game","Greek","U")
    Add_Category2("Game","Greek","V")
    Add_Category2("Game","Greek","W")
    Add_Category2("Game","Greek","X")
    Add_Category2("Game","Greek","Y")
    Add_Category2("Game","Greek","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Danish",0,1)
    Add_Category2("Game","Danish","0")
    Add_Category2("Game","Danish","A")
    Add_Category2("Game","Danish","B")
    Add_Category2("Game","Danish","C")
    Add_Category2("Game","Danish","D")
    Add_Category2("Game","Danish","E")
    Add_Category2("Game","Danish","F")
    Add_Category2("Game","Danish","G")
    Add_Category2("Game","Danish","H")
    Add_Category2("Game","Danish","I")
    Add_Category2("Game","Danish","J")
    Add_Category2("Game","Danish","K")
    Add_Category2("Game","Danish","L")
    Add_Category2("Game","Danish","M")
    Add_Category2("Game","Danish","N")
    Add_Category2("Game","Danish","O")
    Add_Category2("Game","Danish","P")
    Add_Category2("Game","Danish","Q")
    Add_Category2("Game","Danish","R")
    Add_Category2("Game","Danish","S")
    Add_Category2("Game","Danish","T")
    Add_Category2("Game","Danish","U")
    Add_Category2("Game","Danish","V")
    Add_Category2("Game","Danish","W")
    Add_Category2("Game","Danish","X")
    Add_Category2("Game","Danish","Y")
    Add_Category2("Game","Danish","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Dutch",0,1)
    Add_Category2("Game","Dutch","0")
    Add_Category2("Game","Dutch","A")
    Add_Category2("Game","Dutch","B")
    Add_Category2("Game","Dutch","C")
    Add_Category2("Game","Dutch","D")
    Add_Category2("Game","Dutch","E")
    Add_Category2("Game","Dutch","F")
    Add_Category2("Game","Dutch","G")
    Add_Category2("Game","Dutch","H")
    Add_Category2("Game","Dutch","I")
    Add_Category2("Game","Dutch","J")
    Add_Category2("Game","Dutch","K")
    Add_Category2("Game","Dutch","L")
    Add_Category2("Game","Dutch","M")
    Add_Category2("Game","Dutch","N")
    Add_Category2("Game","Dutch","O")
    Add_Category2("Game","Dutch","P")
    Add_Category2("Game","Dutch","Q")
    Add_Category2("Game","Dutch","R")
    Add_Category2("Game","Dutch","S")
    Add_Category2("Game","Dutch","T")
    Add_Category2("Game","Dutch","U")
    Add_Category2("Game","Dutch","V")
    Add_Category2("Game","Dutch","W")
    Add_Category2("Game","Dutch","X")
    Add_Category2("Game","Dutch","Y")
    Add_Category2("Game","Dutch","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Finnish",0,1)
    Add_Category2("Game","Finnish","0")
    Add_Category2("Game","Finnish","A")
    Add_Category2("Game","Finnish","B")
    Add_Category2("Game","Finnish","C")
    Add_Category2("Game","Finnish","D")
    Add_Category2("Game","Finnish","E")
    Add_Category2("Game","Finnish","F")
    Add_Category2("Game","Finnish","G")
    Add_Category2("Game","Finnish","H")
    Add_Category2("Game","Finnish","I")
    Add_Category2("Game","Finnish","J")
    Add_Category2("Game","Finnish","K")
    Add_Category2("Game","Finnish","L")
    Add_Category2("Game","Finnish","M")
    Add_Category2("Game","Finnish","N")
    Add_Category2("Game","Finnish","O")
    Add_Category2("Game","Finnish","P")
    Add_Category2("Game","Finnish","Q")
    Add_Category2("Game","Finnish","R")
    Add_Category2("Game","Finnish","S")
    Add_Category2("Game","Finnish","T")
    Add_Category2("Game","Finnish","U")
    Add_Category2("Game","Finnish","V")
    Add_Category2("Game","Finnish","W")
    Add_Category2("Game","Finnish","X")
    Add_Category2("Game","Finnish","Y")
    Add_Category2("Game","Finnish","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Swedish",0,1)
    Add_Category2("Game","Swedish","0")
    Add_Category2("Game","Swedish","A")
    Add_Category2("Game","Swedish","B")
    Add_Category2("Game","Swedish","C")
    Add_Category2("Game","Swedish","D")
    Add_Category2("Game","Swedish","E")
    Add_Category2("Game","Swedish","F")
    Add_Category2("Game","Swedish","G")
    Add_Category2("Game","Swedish","H")
    Add_Category2("Game","Swedish","I")
    Add_Category2("Game","Swedish","J")
    Add_Category2("Game","Swedish","K")
    Add_Category2("Game","Swedish","L")
    Add_Category2("Game","Swedish","M")
    Add_Category2("Game","Swedish","N")
    Add_Category2("Game","Swedish","O")
    Add_Category2("Game","Swedish","P")
    Add_Category2("Game","Swedish","Q")
    Add_Category2("Game","Swedish","R")
    Add_Category2("Game","Swedish","S")
    Add_Category2("Game","Swedish","T")
    Add_Category2("Game","Swedish","U")
    Add_Category2("Game","Swedish","V")
    Add_Category2("Game","Swedish","W")
    Add_Category2("Game","Swedish","X")
    Add_Category2("Game","Swedish","Y")
    Add_Category2("Game","Swedish","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Polish",0,1)
    Add_Category2("Game","Polish","0")
    Add_Category2("Game","Polish","A")
    Add_Category2("Game","Polish","B")
    Add_Category2("Game","Polish","C")
    Add_Category2("Game","Polish","D")
    Add_Category2("Game","Polish","E")
    Add_Category2("Game","Polish","F")
    Add_Category2("Game","Polish","G")
    Add_Category2("Game","Polish","H")
    Add_Category2("Game","Polish","I")
    Add_Category2("Game","Polish","J")
    Add_Category2("Game","Polish","K")
    Add_Category2("Game","Polish","L")
    Add_Category2("Game","Polish","M")
    Add_Category2("Game","Polish","N")
    Add_Category2("Game","Polish","O")
    Add_Category2("Game","Polish","P")
    Add_Category2("Game","Polish","Q")
    Add_Category2("Game","Polish","R")
    Add_Category2("Game","Polish","S")
    Add_Category2("Game","Polish","T")
    Add_Category2("Game","Polish","U")
    Add_Category2("Game","Polish","V")
    Add_Category2("Game","Polish","W")
    Add_Category2("Game","Polish","X")
    Add_Category2("Game","Polish","Y")
    Add_Category2("Game","Polish","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Czech",0,1)
    Add_Category2("Game","Czech","0")
    Add_Category2("Game","Czech","A")
    Add_Category2("Game","Czech","B")
    Add_Category2("Game","Czech","C")
    Add_Category2("Game","Czech","D")
    Add_Category2("Game","Czech","E")
    Add_Category2("Game","Czech","F")
    Add_Category2("Game","Czech","G")
    Add_Category2("Game","Czech","H")
    Add_Category2("Game","Czech","I")
    Add_Category2("Game","Czech","J")
    Add_Category2("Game","Czech","K")
    Add_Category2("Game","Czech","L")
    Add_Category2("Game","Czech","M")
    Add_Category2("Game","Czech","N")
    Add_Category2("Game","Czech","O")
    Add_Category2("Game","Czech","P")
    Add_Category2("Game","Czech","Q")
    Add_Category2("Game","Czech","R")
    Add_Category2("Game","Czech","S")
    Add_Category2("Game","Czech","T")
    Add_Category2("Game","Czech","U")
    Add_Category2("Game","Czech","V")
    Add_Category2("Game","Czech","W")
    Add_Category2("Game","Czech","X")
    Add_Category2("Game","Czech","Y")
    Add_Category2("Game","Czech","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Multi",0,1)
    Add_Category2("Game","Multi","0")
    Add_Category2("Game","Multi","A")
    Add_Category2("Game","Multi","B")
    Add_Category2("Game","Multi","C")
    Add_Category2("Game","Multi","D")
    Add_Category2("Game","Multi","E")
    Add_Category2("Game","Multi","F")
    Add_Category2("Game","Multi","G")
    Add_Category2("Game","Multi","H")
    Add_Category2("Game","Multi","I")
    Add_Category2("Game","Multi","J")
    Add_Category2("Game","Multi","K")
    Add_Category2("Game","Multi","L")
    Add_Category2("Game","Multi","M")
    Add_Category2("Game","Multi","N")
    Add_Category2("Game","Multi","O")
    Add_Category2("Game","Multi","P")
    Add_Category2("Game","Multi","Q")
    Add_Category2("Game","Multi","R")
    Add_Category2("Game","Multi","S")
    Add_Category2("Game","Multi","T")
    Add_Category2("Game","Multi","U")
    Add_Category2("Game","Multi","V")
    Add_Category2("Game","Multi","W")
    Add_Category2("Game","Multi","X")
    Add_Category2("Game","Multi","Y")
    Add_Category2("Game","Multi","Z")
    EndIf
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Demo_Folder,0,0) 
    AddGadgetItem(#DOWNLOAD_LIST,-1,"AGA",0,1)
    Add_Category2("Demo","AGA","0")
    Add_Category2("Demo","AGA","A")
    Add_Category2("Demo","AGA","B")
    Add_Category2("Demo","AGA","C")
    Add_Category2("Demo","AGA","D")
    Add_Category2("Demo","AGA","E")
    Add_Category2("Demo","AGA","F")
    Add_Category2("Demo","AGA","G")
    Add_Category2("Demo","AGA","H")
    Add_Category2("Demo","AGA","I")
    Add_Category2("Demo","AGA","J")
    Add_Category2("Demo","AGA","K")
    Add_Category2("Demo","AGA","L")
    Add_Category2("Demo","AGA","M")
    Add_Category2("Demo","AGA","N")
    Add_Category2("Demo","AGA","O")
    Add_Category2("Demo","AGA","P")
    Add_Category2("Demo","AGA","Q")
    Add_Category2("Demo","AGA","R")
    Add_Category2("Demo","AGA","S")
    Add_Category2("Demo","AGA","T")
    Add_Category2("Demo","AGA","U")
    Add_Category2("Demo","AGA","V")
    Add_Category2("Demo","AGA","W")
    Add_Category2("Demo","AGA","X")
    Add_Category2("Demo","AGA","Y")
    Add_Category2("Demo","AGA","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"ECS-OCS",0,1)
    Add_Category2("Demo","ECS-OCS","0")
    Add_Category2("Demo","ECS-OCS","A")
    Add_Category2("Demo","ECS-OCS","B")
    Add_Category2("Demo","ECS-OCS","C")
    Add_Category2("Demo","ECS-OCS","D")
    Add_Category2("Demo","ECS-OCS","E")
    Add_Category2("Demo","ECS-OCS","F")
    Add_Category2("Demo","ECS-OCS","G")
    Add_Category2("Demo","ECS-OCS","H")
    Add_Category2("Demo","ECS-OCS","I")
    Add_Category2("Demo","ECS-OCS","J")
    Add_Category2("Demo","ECS-OCS","K")
    Add_Category2("Demo","ECS-OCS","L")
    Add_Category2("Demo","ECS-OCS","M")
    Add_Category2("Demo","ECS-OCS","N")
    Add_Category2("Demo","ECS-OCS","O")
    Add_Category2("Demo","ECS-OCS","P")
    Add_Category2("Demo","ECS-OCS","Q")
    Add_Category2("Demo","ECS-OCS","R")
    Add_Category2("Demo","ECS-OCS","S")
    Add_Category2("Demo","ECS-OCS","T")
    Add_Category2("Demo","ECS-OCS","U")
    Add_Category2("Demo","ECS-OCS","V")
    Add_Category2("Demo","ECS-OCS","W")
    Add_Category2("Demo","ECS-OCS","X")
    Add_Category2("Demo","ECS-OCS","Y")
    Add_Category2("Demo","ECS-OCS","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Beta_Folder,0,0) 
    AddGadgetItem(#DOWNLOAD_LIST,-1,"AGA",0,1)
    Add_Category2("Beta","AGA","0")
    Add_Category2("Beta","AGA","A")
    Add_Category2("Beta","AGA","B")
    Add_Category2("Beta","AGA","C")
    Add_Category2("Beta","AGA","D")
    Add_Category2("Beta","AGA","E")
    Add_Category2("Beta","AGA","F")
    Add_Category2("Beta","AGA","G")
    Add_Category2("Beta","AGA","H")
    Add_Category2("Beta","AGA","I")
    Add_Category2("Beta","AGA","J")
    Add_Category2("Beta","AGA","K")
    Add_Category2("Beta","AGA","L")
    Add_Category2("Beta","AGA","M")
    Add_Category2("Beta","AGA","N")
    Add_Category2("Beta","AGA","O")
    Add_Category2("Beta","AGA","P")
    Add_Category2("Beta","AGA","Q")
    Add_Category2("Beta","AGA","R")
    Add_Category2("Beta","AGA","S")
    Add_Category2("Beta","AGA","T")
    Add_Category2("Beta","AGA","U")
    Add_Category2("Beta","AGA","V")
    Add_Category2("Beta","AGA","W")
    Add_Category2("Beta","AGA","X")
    Add_Category2("Beta","AGA","Y")
    Add_Category2("Beta","AGA","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,"ECS-OCS",0,1)
    Add_Category2("Beta","ECS-OCS","0")
    Add_Category2("Beta","ECS-OCS","A")
    Add_Category2("Beta","ECS-OCS","B")
    Add_Category2("Beta","ECS-OCS","C")
    Add_Category2("Beta","ECS-OCS","D")
    Add_Category2("Beta","ECS-OCS","E")
    Add_Category2("Beta","ECS-OCS","F")
    Add_Category2("Beta","ECS-OCS","G")
    Add_Category2("Beta","ECS-OCS","H")
    Add_Category2("Beta","ECS-OCS","I")
    Add_Category2("Beta","ECS-OCS","J")
    Add_Category2("Beta","ECS-OCS","K")
    Add_Category2("Beta","ECS-OCS","L")
    Add_Category2("Beta","ECS-OCS","M")
    Add_Category2("Beta","ECS-OCS","N")
    Add_Category2("Beta","ECS-OCS","O")
    Add_Category2("Beta","ECS-OCS","P")
    Add_Category2("Beta","ECS-OCS","Q")
    Add_Category2("Beta","ECS-OCS","R")
    Add_Category2("Beta","ECS-OCS","S")
    Add_Category2("Beta","ECS-OCS","T")
    Add_Category2("Beta","ECS-OCS","U")
    Add_Category2("Beta","ECS-OCS","V")
    Add_Category2("Beta","ECS-OCS","W")
    Add_Category2("Beta","ECS-OCS","X")
    Add_Category2("Beta","ECS-OCS","Y")
    Add_Category2("Beta","ECS-OCS","Z")

    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
    AddGadgetItem(#DOWNLOAD_LIST,-1,WHD_Mags_Folder,0,0) 
    AddGadgetItem(#DOWNLOAD_LIST,-1,"Magazines",0,1)
    Add_Category2("Magazine","Magazine","0")
    Add_Category2("Magazine","Magazine","A")
    Add_Category2("Magazine","Magazine","B")
    Add_Category2("Magazine","Magazine","C")
    Add_Category2("Magazine","Magazine","D")
    Add_Category2("Magazine","Magazine","E")
    Add_Category2("Magazine","Magazine","F")
    Add_Category2("Magazine","Magazine","G")
    Add_Category2("Magazine","Magazine","H")
    Add_Category2("Magazine","Magazine","I")
    Add_Category2("Magazine","Magazine","J")
    Add_Category2("Magazine","Magazine","K")
    Add_Category2("Magazine","Magazine","L")
    Add_Category2("Magazine","Magazine","M")
    Add_Category2("Magazine","Magazine","N")
    Add_Category2("Magazine","Magazine","O")
    Add_Category2("Magazine","Magazine","P")
    Add_Category2("Magazine","Magazine","Q")
    Add_Category2("Magazine","Magazine","R")
    Add_Category2("Magazine","Magazine","S")
    Add_Category2("Magazine","Magazine","T")
    Add_Category2("Magazine","Magazine","U")
    Add_Category2("Magazine","Magazine","V")
    Add_Category2("Magazine","Magazine","W")
    Add_Category2("Magazine","Magazine","X")
    Add_Category2("Magazine","Magazine","Y")
    Add_Category2("Magazine","Magazine","Z")
    If found=#False : RemoveGadgetItem(#DOWNLOAD_LIST,CountGadgetItems(#DOWNLOAD_LIST)-1) : EndIf
    found=#False
  EndIf
    
  FreeList(Sort_List())
  FreeList(Cat_List())
  
  Resume_Gadget(#DOWNLOAD_LIST)
  
  SetWindowTitle(#DOWNLOAD_WINDOW,old_title)
  
EndProcedure

Procedure.b Download_Preview()
  
  Protected oldgadgetlist.l, proc_return.b
  
  If OpenWindow(#DOWNLOAD_WINDOW,0,0,300,470,"File Download ("+Str(ListSize(Down_List()))+" Files)",#PB_Window_Tool|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
    
    Pause_Window(#DOWNLOAD_WINDOW)
    
    oldgadgetlist=UseGadgetList(WindowID(#DOWNLOAD_WINDOW))
    
    TreeGadget(#DOWNLOAD_LIST,0,0,300,400)
    CheckBoxGadget(#DOWNLOAD_A500MINI,5,402,200,30,"255 Files Per Folder (A500 Mini)")
    CheckBoxGadget(#DOWNLOAD_EXPAND,210,402 ,95,30,"Expand Tree")
    ButtonGadget(#DOWNLOAD_YES,5,435,95,30,"Start")
    ButtonGadget(#DOWNLOAD_NO,105,435,95,30,"Cancel")
    ButtonGadget(#DOWNLOAD_SAVE,205,435,90,30,"Save Text")
    
    SetGadgetState(#DOWNLOAD_A500MINI,A500Mini)
       
    A500Mini=#False
    SetGadgetState(#DOWNLOAD_A500MINI,A500Mini)
    
    Resume_Window(#DOWNLOAD_WINDOW)  
    
    Draw_Preview()
    
    Repeat
      Event=WaitWindowEvent()
      Gadget=EventGadget()
      Type=EventType()
      
      Select Event
          
        Case #PB_Event_Gadget
          
          Select Gadget
              
            Case #DOWNLOAD_A500MINI
              A500Mini=GetGadgetState(#DOWNLOAD_A500MINI)
              Draw_Preview()
              
            Case #DOWNLOAD_EXPAND
              If GetGadgetState(#DOWNLOAD_EXPAND)=#PB_Checkbox_Checked
                Pause_Gadget(#DOWNLOAD_LIST)
                TreeExpandAllItems(#DOWNLOAD_LIST)
                Resume_Gadget(#DOWNLOAD_LIST)
              EndIf
              If GetGadgetState(#DOWNLOAD_EXPAND)=#PB_Checkbox_Unchecked
                Pause_Gadget(#DOWNLOAD_LIST)
                TreeCollapseAllItems(#DOWNLOAD_LIST)
                Resume_Gadget(#DOWNLOAD_LIST)
              EndIf

            Case #DOWNLOAD_YES
              proc_return=#True
              Break
              
            Case #DOWNLOAD_NO
              proc_return=#False
              Break
              
            Case #DOWNLOAD_SAVE
              path=SaveFileRequester("Save File","","*.txt",0)
              If Not FindString(path,".txt") : path+".txt" : EndIf
              If path<>""
                If CreateFile(#FILE,path,#PB_Ascii)
                  WriteStringN(#FILE,"Files downloaded...")
                  WriteStringN(#FILE,"===================")
                  WriteStringN(#FILE,"")
                  ForEach Down_List()
                    WriteStringN(#FILE,Down_List()\Down_Name)
                  Next
                  CloseFile(#FILE)
                Else
                  MessageRequester("Error","Cannot create file.",#PB_MessageRequester_Error|#PB_MessageRequester_Ok)
                EndIf
              EndIf
              
          EndSelect
      EndSelect         
      
    ForEver  
    
    UseGadgetList(oldgadgetlist)
    
    CloseWindow(#DOWNLOAD_WINDOW)
    
  EndIf
  
  ProcedureReturn proc_return
  
EndProcedure

Procedure Download_HTTP()
  
  Protected Keypressed$, Down_Path.s, error_log.s, f_size.i
  
  ClearList(Down_List())
  
  Make_Download_List()
  
  If ListSize(Down_List())>0   
    
    If Download_Preview()
      
      OpenConsole("HTTP Download (Press 'Esc' to cancel download.)")
      Center_Console()   
      
      If FileSize(WHD_Folder)<>-2 : CreateDirectory(WHD_Folder) : EndIf
      
      PrintNCol("Connected to Turran File Server",2,0)
      PrintN("")
      
      ForEach Down_List() 
               
        If FileSize(WHD_Folder)<>-2 : CreateDirectory(WHD_Folder) : EndIf
        
        If FileSize(WHD_Folder+Down_List()\Down_SubFolder_1)<>-2 : CreateDirectory(WHD_Folder+Down_List()\Down_SubFolder_1) : EndIf
        
        Down_Path=WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)
        
        If Down_List()\Down_SubFolder_2>""
          If FileSize(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2)<>-2 
            CreateDirectory(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2)
          EndIf
          Down_Path=WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2+Chr(92)
        EndIf
        
        If Down_List()\Down_SubFolder_3>""
          If FileSize(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2)<>-2 
            CreateDirectory(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2)
          EndIf
          If FileSize(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2+Chr(92)+Down_List()\Down_SubFolder_3)<>-2 
            CreateDirectory(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2+Chr(92)+Down_List()\Down_SubFolder_3)
          EndIf
          Down_Path=WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2+Chr(92)+Down_List()\Down_SubFolder_3+Chr(92)
        EndIf
        
        Down_Path+Down_List()\Down_Name
                
        If ReceiveHTTPFile(Down_List()\Down_HTTP_Folder,Down_Path)  
          
          f_size=FileSize(Down_Path)
          
          If f_size<>Down_List()\Down_Size 
            error_log+"Size Error : "+Down_Path
            PrintNCol("Size Error : " + Down_List()\Down_Name + " - File Removed!",4,0)
            Continue
          EndIf
          
          PrintN("Downloaded (" + Str(ListIndex(Down_List())+1) + " of " + Str(ListSize(Down_List())) + ") - " + Down_List()\Down_Name + " (" + Str(f_size) + " bytes)")  
          SelectElement(Game_List(),Down_List()\Down_Index)
          Game_List()\File_CRC=FileFingerprint(Down_Path,#PB_Cipher_CRC32)
          Game_List()\File_Archive_CRC=Game_List()\File_CRC
          Game_List()\File_Available=#True
          Game_List()\File_Size=f_size
          AddElement(File_List_Size())
          File_List_Size()\R_File_Name=Down_Path
          File_List_Size()\R_File_File=GetFilePart(Down_Path)
          File_List_Size()\R_File_CRC32=Game_List()\File_CRC
          File_List_Size()\R_File_Size=f_size
        Else
          PrintNCol("*** Error ***",4,0)
        EndIf 
        
        Keypressed$=Inkey()
        
        If Keypressed$=Chr(27)
          PrintN("")
          PrintNCol("*** Download Cancelled ***",4,0)
          Delay(1000)
          Break
        EndIf
        
      Next 
      
      PrintN("")
      PrintNCol("Connection Closed.",14,0)
      PrintN("")
      PrintNCol("Please donate to the Turran Server. The link is on the 'About' window.",2,0)
      Delay(3000)   
      
      CloseConsole()
      
    EndIf  
    
    If error_log<>""
      CreateFile(#FILE,Home_Path+"HTTP_Log.txt")
      WriteString(#FILE,error_log)
      CloseFile(#FIle)
    EndIf
        
  Else
    
    MessageRequester("Information","Nothing to download!",#PB_MessageRequester_Ok|#PB_MessageRequester_Info)
    
  EndIf
  
  SetCurrentDirectory(Home_Path)
  
  If ListSize(Down_List())>0 : Update_Files(0) : EndIf
  
  ClearList(Down_List())
   
EndProcedure

Procedure Download_FTP()
  
  Protected log_file.i
  Protected ftp_log.s="", f_size.i
  Protected log_path.s=Home_Path+"ftp.log"
  Protected conHandle.l, hInternet.l, hConnect.l
  Protected cancel.b, Down_Path.s
  Protected path$=""
  Protected FileName$
  Protected Keypressed$
  
  ClearList(Down_List())
  
  Make_Download_List()
  
  If ListSize(Down_List())>0   
    
    If Download_Preview()
      
      OpenConsole("FTP Download (Press 'Esc' to cancel download.)")
      Center_Console()
      Remove_Console_Close()      
      
      If FileSize(log_path)>-1 : DeleteFile(log_path) : EndIf
      If FileSize(WHD_Folder)<>-2 : CreateDirectory(WHD_Folder) : EndIf
      
      Protected system_menu.l
      
      hInternet=FTPInit()   
      hConnect=FTPConnect(hInternet,FTP_Server,FTP_User,FTP_Pass,FTP_Port) 
      
      If hConnect
        
        PrintNCol("Connected to "+ftp_server+" on port:"+Str(ftp_port),2,0)
        ftp_log+"Connected to "+ftp_server+" on port:"+Str(ftp_port)+#CRLF$
        
        If CreateFile(log_file, Home_Path+"ftp.log")
          WriteString(log_file, ftp_log)
          CloseFile(log_file)  
        EndIf
        
        PrintN("")
        PrintNCol("Opening FTP Folder - "+FTP_Folder,9,0)
        ftp_log+"Opening FTP Folder - "+FTP_Folder+#CRLF$ 
        
        FTPSetDir(hConnect,FTP_Folder)
        Delay(50)
        
        PrintN("")
        
        ForEach Down_List() 
          
          FTPSetDir(hConnect,Down_List()\Down_FTP_Folder) ; Change to FTP folder
          Delay(50)
          FTPSetDir(hConnect,Down_List()\Down_0toZ) ; Change to subfolder
          Delay(50)
          
          If FileSize(WHD_Folder)<>-2 : CreateDirectory(WHD_Folder) : EndIf
          If FileSize(WHD_Folder+Down_List()\Down_SubFolder_1)<>-2 : CreateDirectory(WHD_Folder+Down_List()\Down_SubFolder_1) : EndIf
          Down_Path=WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)
          
          If Down_List()\Down_SubFolder_2>""
            If FileSize(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2)<>-2 : CreateDirectory(WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2) : EndIf
            Down_Path=WHD_Folder+Down_List()\Down_SubFolder_1+Chr(92)+Down_List()\Down_SubFolder_2+Chr(92)
          EndIf
          
          Down_Path+Down_List()\Down_Name
          
          If FTPDownload(hConnect,Down_List()\Down_Name,Down_Path)  
            f_size=FileSize(Down_Path)
            If f_size=Down_List()\Down_Size
              PrintN("Downloading ("+Str(ListIndex(Down_List())+1)+" of "+Str(ListSize(Down_List()))+") - "+Down_List()\Down_Name+" ("+Str(FileSize(Down_Path))+" bytes)")
              ftp_log+"Downloaded - " + Down_List()\Down_Name+" ("+Str(FileSize(Down_Path))+" bytes)"+#CRLF$    
              SelectElement(Game_List(),Down_List()\Down_Index)
              Game_List()\File_CRC=FileFingerprint(Down_Path,#PB_Cipher_CRC32)
              Game_List()\File_Archive_CRC=Game_List()\File_CRC
              Game_List()\File_Available=#True
              Game_List()\File_Size=f_size
              AddElement(File_List_Size())
              File_List_Size()\R_File_Name=Down_Path
              File_List_Size()\R_File_File=GetFilePart(Down_Path)
              File_List_Size()\R_File_CRC32=Game_List()\File_CRC
              File_List_Size()\R_File_Size=f_size
            Else
              ftp_log+"Wrong File Size : "+Down_List()\Down_Name+#CRLF$
              PrintNCol("Wrong File Size : " + Down_List()\Down_Name,4,0)
              DeleteFile(Down_Path)
            EndIf
          Else
            ftp_log+"Error downloading "+Down_List()\Down_Name+#CRLF$
            PrintNCol("Error downloading : " + Down_List()\Down_Name,4,0)   
          EndIf 
          
          FTPSetDir(hConnect,"/")
          Delay(50)
          FTPSetDir(hConnect,FTP_Folder)   
          Delay(50)
          
          If OpenFile(log_file, Home_Path+"ftp.log")
            WriteString(log_file, ftp_log)
            CloseFile(log_file)  
          EndIf
          
          Keypressed$=Inkey()
          
          If Keypressed$=Chr(27)
            PrintN("")
            PrintNCol("*** Download Cancelled ***",4,0)
            ftp_log+"*** Download Cancelled ***"+#CRLF$
            Delay(1000)
            cancel=#True
            Break
          EndIf
          
        Next 
        
        FTPClose(hInternet)
        PrintN("")
        PrintNCol("FTP connection closed.",14,0)
        ftp_log+"FTP connection closed."+#CRLF$
        PrintN("")
        PrintNCol("Please donate to the Turran Server. The link is on the 'About' window.",2,0)
        ftp_log+"Please donate to the Turran Server.."+#CRLF$
        Delay(3000)
        CloseConsole()
        
      Else
        
        PrintNCol("Error: Cannot connect to FTP Server.",4,0)
        ftp_log+"Error: Cannot connect to FTP Server."+#CRLF$
        Delay(3000)
        CloseConsole()
        
      EndIf
      
    EndIf 
    
    Proc_Exit:
    
    If CreateFile(log_file, Home_Path+"FTP.log")
      WriteString(log_file, ftp_log)
      CloseFile(log_file)  
    EndIf
    
  Else
    
    MessageRequester("Information","Nothing to download!",#PB_MessageRequester_Ok|#PB_MessageRequester_Info)
    
  EndIf
  
  SetCurrentDirectory(Home_Path)
  
  If ListSize(Down_List())>0 : Update_Files(0) : EndIf
  
  ClearList(Down_List())
  
EndProcedure

Procedure Scrape_Data()
  
  ForEach Game_List()  
    Game_List()\File_Amiga=#True
    Game_List()\File_Ignore=#False
    If Game_List()\File_Type="Beta"
      If Game_List()\File_Beta_Type="Game" : Game_List()\File_Type="Game" : Game_List()\File_BETA=#True : EndIf  
      If Game_List()\File_Beta_Type="Demo" : Game_List()\File_Type="Demo" : Game_List()\File_BETA=#True : EndIf  
    EndIf
    If FindString(LCase(Game_List()\File_Name),"arcadia.") : Game_List()\File_Arcadia=#True : Game_List()\File_Amiga=#False : EndIf
    If FindString(Game_List()\File_Name,"AGA") : Game_List()\File_AGA=#True : EndIf
    If FindString(Game_List()\File_Name,"_CD") And Not FindString(Game_List()\File_Name,"CD32") And Not FindString(Game_List()\File_Name,"CDTV")
      Game_List()\File_CDROM=#True
      Game_List()\File_Amiga=#False
    EndIf
    If FindString(Game_List()\File_Name,"_CD32") : Game_List()\File_CD32=#True : Game_List()\File_Amiga=#False : EndIf
    If FindString(Game_List()\File_Name,"_CDTV") : Game_List()\File_CDTV=#True : Game_List()\File_Amiga=#False : EndIf
    If FindString(Game_List()\File_Name,"_Chip") : Game_List()\File_Chip=#True : EndIf
    If FindString(Game_List()\File_Name,"_Fast") : Game_List()\File_Fast=#True : EndIf
    If FindString(Game_List()\File_Name,"_Slow") : Game_List()\File_Chip=#True : EndIf
    If FindString(Game_List()\File_Name,"_NTSC") : Game_List()\File_NTSC=#True : EndIf
    If FindString(Game_List()\File_Name,"_Files") : Game_List()\File_Files=#True : EndIf
    If FindString(Game_List()\File_Name,"_Image") : Game_List()\File_Image=#True : EndIf
    
    If FindString(LCase(Game_List()\File_Name),"512k") And Not FindString(LCase(Game_List()\File_Name),"512kb")  : Game_List()\File_512K=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"512kb") : Game_List()\File_512KB=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"1mb")  : Game_List()\File_1MB=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"15mb") : Game_List()\File_1_5MB=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"1mbchip") : Game_List()\File_1MBCHIP=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"2mb") : Game_List()\File_2MB=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"8mb") : Game_List()\File_8MB=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"12mb") : Game_List()\File_12MB=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"lowmem") : Game_List()\File_LowMem=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"slow")  : Game_List()\File_SlowMem=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"nointro") : Game_List()\File_NoIntro=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"mt32") : Game_List()\File_MT32=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"novoice") : Game_List()\File_NoVoice=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"nospeech") : Game_List()\File_NoSpeech=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"nomusic") : Game_List()\File_NoMusic=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"nomovie") : Game_List()\File_NoMovie=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"1disk") : Game_List()\File_1Disk=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"2disk") : Game_List()\File_2Disk=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"3disk") : Game_List()\File_3Disk=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"4disk") : Game_List()\File_4Disk=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"hires") : Game_List()\File_HiRes=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"lores") : Game_List()\File_LoRes=#True : EndIf
    If FindString(Game_List()\File_Name,"Demo")
      If Game_List()\File_Type<>"Demo" And FindString(Game_List()\File_Name,"Demo")<>1 :  Game_List()\File_GameDemo=#True : EndIf
    EndIf
    If FindString(LCase(Game_List()\File_Name),"preview") : Game_List()\File_Preview=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"prerelease") : Game_List()\File_PreRelease=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"enhanced") : Game_List()\File_Enhanced=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"censored") And Not FindString(LCase(Game_List()\File_Name),"uncensored") : Game_List()\File_Censored=#True : EndIf
    If FindString(LCase(Game_List()\File_Name),"uncensored") : Game_List()\File_UnCensored=#True : EndIf
    
    Version()
    
    Game_List()\File_Language="English"
    Language("Cz","Czech")
    Language("De","German")
    Language("Dk","Danish")
    Language("Es","Spanish")
    Language("Fi","Finnish")
    Language("Fr","French")
    Language("Gr","Greek")
    Language("It","Italian")
    Language("Nl","Dutch")
    Language("Pl","Polish")
    Language("Se","Swedish")
    Language("DeFrIt","Multi")
    Language("DeEsFrIt","Multi")
    
  Next
  
  Update_Genre()
  
  SortStructuredList(Game_List(),#PB_Sort_Ascending|#PB_Sort_NoCase,OffsetOf(Game_Data\File_Name),TypeOf(Game_Data\File_Name))
  
EndProcedure

Procedure Draw_List()
  
  Protected Error.s
  
  Pause_Gadget(#MAIN_LIST)
  
  ClearGadgetItems(#MAIN_LIST)
  
  Filter_List()
  
  ForEach Filtered_List()
    Count=ListIndex(Filtered_List())
    SelectElement(Game_List(),Filtered_List())
    If Game_List()\File_Available<>#True : error=" (Missing)" : EndIf
    If Game_List()\File_Available=#True And Game_List()\File_Archive_CRC<>Game_List()\File_CRC : error=" (Wrong CRC)" : EndIf 
    AddGadgetItem(#MAIN_LIST,-1,Game_List()\File_Name+error) : error=""
    If Game_List()\File_Available=#True : SetGadgetItemColor(#MAIN_LIST,Count,#PB_Gadget_FrontColor,$00008800) : EndIf
    If Game_List()\File_Available<>#True : SetGadgetItemColor(#MAIN_LIST,Count,#PB_Gadget_FrontColor,#Red) : EndIf
    If Game_List()\File_Available=#True And Game_List()\File_Archive_CRC<>Game_List()\File_CRC : SetGadgetItemColor(#MAIN_LIST,Count,#PB_Gadget_FrontColor,#Blue) : EndIf 

    If Mod(Count,2)=0 : SetGadgetItemColor(#MAIN_LIST,count,#PB_Gadget_BackColor,$eeeeee) : EndIf
  Next
  
  While WindowEvent() : Wend
  
  Update_Title()
  
  SetActiveGadget(#MAIN_LIST)
  SetGadgetState(#MAIN_LIST,0)
  If ListSize(Filtered_List())>0
    SelectElement(Filtered_List(),0)
    SelectElement(Game_List(),Filtered_List())
  EndIf
  Update_Statusbar()
  Resume_Gadget(#MAIN_LIST)
  
  If GetWindowLongPtr_(GadgetID(#MAIN_LIST), #GWL_STYLE) & #WS_VSCROLL
    SetGadgetItemAttribute(#MAIN_LIST,1,#PB_ListIcon_ColumnWidth,412)
  Else
    SetGadgetItemAttribute(#MAIN_LIST,1,#PB_ListIcon_ColumnWidth,430)
  EndIf
  
EndProcedure

;- ############### Window Procedures

Procedure Donate_Window()
  
  Protected d_event,d_gadget,d_type,oldgadgetlist
  
  If OpenWindow(#DONATE_WINDOW,0,0,160,80,"Donate",#PB_Window_Tool|#PB_Window_SystemMenu|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
    oldgadgetlist=UseGadgetList(WindowID(#DONATE_WINDOW))
    ButtonGadget(#DONATE_BUTTON_A,0,0,160,40,"Donate to Turran.")
    ButtonGadget(#DONATE_BUTTON_B,0,40,160,40,"Donate me a coffee.")
    
    Repeat
      
      d_event=WaitWindowEvent()
      d_gadget=EventGadget()
      d_type=EventType()
      
      Select d_gadget
          
        Case #DONATE_BUTTON_A
          path="https://www.paypal.com/donate/?cmd=_donations&business=eab@grandis.nu&lc=US&item_name=Donation+to+EAB+FTP&no_note=0&cn=&curency_code=USD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted"
          RunProgram(path,"","")
          UseGadgetList(oldgadgetlist)
          Break
        Case #DONATE_BUTTON_B
          path="https://www.paypal.com/paypalme/paulvinceags2"
          RunProgram(path,"","")
          UseGadgetList(oldgadgetlist)
          Break
          
      EndSelect
      
      If EventWindow()=#DONATE_WINDOW And d_event=#PB_Event_CloseWindow
        Break
      EndIf 
      
    ForEver 
    
    UseGadgetList(oldgadgetlist)
    CloseWindow(#DONATE_WINDOW)
    
  EndIf
  
EndProcedure

Procedure About_Window()
  
  Protected oldgadgetlist.i, output$
  
  OpenWindow(#ABOUT_WINDOW,0,0,340,270,"About", #PB_Window_Tool|#PB_Window_SystemMenu|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  
  SetWindowColor(#ABOUT_WINDOW,#White)
  
  oldgadgetlist=UseGadgetList(WindowID(#ABOUT_WINDOW))
  
  DisableWindow(#MAIN_WINDOW,#True)
  
  Pause_Window(#ABOUT_WINDOW)
  
  output$="         ╔═════════════════════════════════╗"+#CRLF$
  output$+"         ║                                 ║"+#CRLF$
  output$+"         ║   WHDLoad Download Tool v"+Version+"    ║"+#CRLF$
  output$+"         ║                                 ║"+#CRLF$
  output$+"         ║    © 2023 Paul Vince (MrV2k)    ║"+#CRLF$
  output$+"         ║                                 ║"+#CRLF$
  output$+"         ╚═════════════════════════════════╝"+#CRLF$
  output$+#CRLF$
  output$+#CRLF$
  output$+"   A downloader for Retroplay's WHDLoad Archives!"+#CRLF$
  output$+#CRLF$
  
  output$+"   ----------------------------------------------"+#CRLF$
  
  output$+#CRLF$
  output$+"If you use this tool, please consider donating towards the running costs of the Turran file server or my coffee fund. I'm sure that Turran will be most appreciative and I do love a latte!"+#CRLF$ 
  
  StringGadget(#ABOUT_STRING,0,0,340,270,output$, #PB_String_ReadOnly | #ES_MULTILINE | #ESB_DISABLE_LEFT|#ESB_DISABLE_RIGHT)
  SetWindowLongPtr_(GadgetID(#ABOUT_STRING),#GWL_EXSTYLE,0)
  SetWindowPos_(GadgetID(#ABOUT_STRING),0,0,0,0,0,#SWP_NOMOVE | #SWP_NOSIZE | #SWP_FRAMECHANGED)
  SetGadgetFont(#ABOUT_STRING,FontID(#HELP_FONT))
  
  Resume_Window(#ABOUT_WINDOW)
  
  Repeat
    Event=WaitWindowEvent()
    If EventWindow()=#ABOUT_WINDOW And Event()=#PB_Event_CloseWindow
      UseGadgetList(oldgadgetlist)
      CloseWindow(#ABOUT_WINDOW)
      Break
    EndIf
  ForEver
  
  output$=""
  
  DisableWindow(#MAIN_WINDOW,#False)
  
EndProcedure

Procedure Help_Window()
  
  Protected oldgadgetlist.i, output$
  
  OpenWindow(#HELP_WINDOW,0,0,550,600,"Help", #PB_Window_Tool|#PB_Window_SystemMenu|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  
  oldgadgetlist=UseGadgetList(WindowID(#HELP_WINDOW))
  
  Pause_Window(#HELP_WINDOW)
  
  StringGadget(#HELP_EDITOR,0,0,550,600,"", #PB_String_ReadOnly|#ES_MULTILINE | #ES_AUTOVSCROLL|#WS_VSCROLL|#ESB_DISABLE_LEFT|#ESB_DISABLE_RIGHT)
  
  SetGadgetColor(#HELP_EDITOR,#PB_Gadget_BackColor,#White)
  
  SetGadgetFont(#HELP_EDITOR,FontID(#HELP_FONT))
  
  output$="                ╔══════════════════════════════════════════╗"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ║        WHDLoad Download Tool v"+Version+"        ║"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ║         © 2023 Paul Vince (MrV2k)        ║"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ╚══════════════════════════════════════════╝"+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Introduction"+#CRLF$
  output$+"============"+#CRLF$
  output$+"WHDLoad Download Tool is a utility that will download Retroplay's WHDLoad collection from the Turran file server. "
  output$+"The tool includes advanced filtering to help you curate a collection to your needs and flexible setups to help you manage your files. "
  output$+"Once you have set the filters, the tool will connect to the Turran file server and download the required files. "
  output$+"It also has the facility to scan your current archives and remove any redundant / un-needed files. "+#CRLF$
  output$+#CRLF$
  output$+"Please note that this program is reliant on the Turran file server so if you get errors, please check the status of the Turran file server on the EAB forum before posting bugs. "+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Main Window"+#CRLF$
  output$+"==========="+#CRLF$
  output$+#CRLF$
  output$+"The main window is split into five sections..."+#CRLF$
  output$+#CRLF$
  output$+"               ╔═══════════════════╦═════════════════╦═════╗"+#CRLF$
  output$+"               ║                   ║                 ║     ║"+#CRLF$
  output$+"               ║                   ║  FTP Settings   ║     ║"+#CRLF$
  output$+"               ║                   ║                 ║  B  ║"+#CRLF$
  output$+"               ║                   ╠═════════════════╣  U  ║"+#CRLF$
  output$+"               ║                   ║                 ║  T  ║"+#CRLF$
  output$+"               ║     File List     ║  Folder Paths   ║  T  ║"+#CRLF$
  output$+"               ║                   ║                 ║  O  ║"+#CRLF$
  output$+"               ║                   ╠═════════════════╣  N  ║"+#CRLF$
  output$+"               ║                   ║                 ║  S  ║"+#CRLF$
  output$+"               ║                   ║     Filters     ║     ║"+#CRLF$
  output$+"               ║                   ║                 ║     ║"+#CRLF$
  output$+"               ╚═══════════════════╩═════════════════╩═════╝"+#CRLF$
  output$+#CRLF$
  output$+"File List"+#CRLF$
  output$+"---------"+#CRLF$
  output$+"The file list shows a list of the software available on the Turran file server. "
  output$+"As you change the filters, the file list will adapt to your selection. "
  output$+"The entries in the list are selectable and the status bar at the bottom of the window will show any data available. "
  output$+"If the entry is available in the relevant download folder, the entry will be highlighted in green. "
  output$+"If the entry is missing from the relevant download folder, the entry will be highlighted in red. "
  output$+"If the entry has a different checksum to the available FTP file, the entry will be highlighted in blue. "
  output$+"Any software highlighted in green will not be downloaded when you click the download button."+#CRLF$
  output$+#CRLF$
  output$+"If you delete any files in the download folder while the program is running, press 'F5' and the program will recheck the available files and refresh the game list to reflect any changes."+#CRLF$
  output$+#CRLF$
  output$+"Server Settings"+#CRLF$
  output$+"---------------"+#CRLF$
  output$+"This section shows the current server settings. All of the settings can be changed but bet careful when doing so as you can break the download process. Only change these settings if you know what you're doing!"+#CRLF$
  output$+#CRLF$
  output$+"    User Name  - Sets the FTP user name."+#CRLF$
  output$+"    Password   - Sets the FTP password."+#CRLF$
  output$+"    Server     - Sets the FTP server."+#CRLF$
  output$+"    Port       - Sets the FTP port."+#CRLF$
  output$+"    FTP Folder - Sets the FTP folder."+#CRLF$
  output$+"    HTTP Path  - Sets the HTTP path."+#CRLF$
  output$+#CRLF$
  output$+"You should only need to change these settings if you have an Turran FTP account. "
  output$+"If you change them by mistake, the default user name is 'ftp' and the default password is anything you want (e.g.'amiga')."+#CRLF$
  output$+#CRLF$
  output$+"You can also reset all the server settings by deleting the default.prefs file and restarting the program."+#CRLF$
  output$+#CRLF$
  output$+"Folder Settings"+#CRLF$
  output$+"---------------"+#CRLF$
  output$+"This section lets you set the paths that the archives are downloaded to. "
  output$+"This tools supports four types of archives (games, demos, beta and disk magazines)."+#CRLF$
  output$+#CRLF$
  output$+"The 'Set' button on the 'Parent' path will open a requester so you can choose the default download path. *Note* You cannot set this path to a root folder for safety reasons. "+#CRLF$
  output$+#CRLF$
  output$+"The 'Games', 'Demos', 'Beta' and 'Mags' text boxes are for the names of the subdirectories that the categories will be saved to. "
  output$+"You do not need to enter a full path in these boxes as they are only used for the subfolder names. "+#CRLF$
  output$+#CRLF$
  output$+"There are also four check boxes next to each archive type. These are part of the filter and allow you to set which type of file is downloaded. The main list will change as you tick/untick the boxes."+#CRLF$
  output$+#CRLF$ 
  output$+"Pressing any of the 'Open' buttons will open the matching download folder (if it exists)."+#CRLF$
  output$+#CRLF$
  output$+"    Configurable Paths"+#CRLF$
  output$+"    ------------------"+#CRLF$
  output$+"    Parent - This is the main folder that the subfolders will be created in."+#CRLF$
  output$+"    Games  - This is the subfolder that game files are downloaded to."+#CRLF$
  output$+"    Demos  - This is the subfolder that demo files are downloaded to."+#CRLF$
  output$+"    Beta   - This is the subfolder that beta files are downloaded to."+#CRLF$
  output$+"    Mags   - This is the subfolder that magazine files are downloaded to."+#CRLF$
  output$+#CRLF$
  output$+"Finally, next to where it says 'Sorting', there are two drop boxes. The first drop box sets how the files are sorted. It can be set three ways..."+#CRLF$
  output$+#CRLF$
  output$+"    No Sorting       - This will download the archives into the"+#CRLF$
  output$+"                       paths set in the 'Games', 'Demos', 'Beta'"+#CRLF$
  output$+"                       and 'Mags' path boxes but won't add any"+#CRLF$
  output$+"                       extra subdirectories."+#CRLF$
  output$+"    Sort by 0-Z      - This will download the archives into the"+#CRLF$
  output$+"                       paths set in the 'Games', 'Demos', 'Beta'"+#CRLF$
  output$+"                       and 'Mags' path boxes and will further split"+#CRLF$
  output$+"                       them alphabetically."+#CRLF$
  output$+"    Sort by Category - This will download the archives into the"+#CRLF$
  output$+"                       paths set in the 'Games', 'Demos', 'Beta'"+#CRLF$
  output$+"                       and 'Mags' path boxes and will further split"+#CRLF$
  output$+"                       them by category."+#CRLF$
  output$+#CRLF$
  output$+"When you select 'Sort by Category', the second sorting drop box will become available. In this box you can set whether non-english archives are split into their own folders or not."+#CRLF$
  output$+#CRLF$
  output$+"All path information and sorting settings are saved in the preference files. "+#CRLF$
  output$+#CRLF$
  output$+"Filter"+#CRLF$
  output$+"------"+#CRLF$
  output$+"This section is where you can filter down the main list. This can help reduce the size of your download list by getting rid of unneeded file types. Use the slider to scroll the list."+#CRLF$
  output$+#CRLF$
  output$+"The 'System' section lets you filter the list by system type."+#CRLF$
  output$+#CRLF$
  output$+"The 'Chipset' section lets you filter the list by amiga chipset."+#CRLF$
  output$+#CRLF$
  output$+"The 'Sound' section lets you filter the list by game sound options."+#CRLF$
  output$+#CRLF$
  output$+"The 'Memory' section lets you filter the list by game memory requirements."+#CRLF$
  output$+#CRLF$
  output$+"The 'Misc' section filters out other miscellaneous categories of file. "+#CRLF$
  output$+#CRLF$
  output$+"The 'Language' section lets you filter out files that are in unneeded languages."+#CRLF$
  output$+#CRLF$
  output$+"The 'Clear/All' button will toggle all the languages on or off."+#CRLF$
  output$+#CRLF$
  output$+"There are also two buttons 'Clear Filter' and 'Reset Filter'. 'Clear Filter' will set all the filters to off, while 'Reset Filter' will set all the filters to on."+#CRLF$
  output$+#CRLF$
  output$+"To filter the list, simply select / de-select a category. The main list will automatically change to match the selections."+#CRLF$
  output$+#CRLF$
  output$+"Buttons"+#CRLF$
  output$+"-------"+#CRLF$
  output$+"The buttons in the column on the right are separated into categories that match their function. This is what they do..."+#CRLF$
  output$+#CRLF$
  output$+"FTP Actions"+#CRLF$
  output$+"-----------"+#CRLF$ 
  output$+"  Load Data    - Loads the WHDLoad dat files from the 'Dats' folder"+#CRLF$ 
  output$+"                 and creates a list of available files. If there "+#CRLF$
  output$+"                 is a newer version on the Turran server, the new one"+#CRLF$
  output$+"                 will be downloaded and the old one deleted. "+#CRLF$
  output$+#CRLF$  
  output$+"  Download     - Downloads the files that are left in the main list. A"+#CRLF$
  output$+"                 preview window will open to show how the download folder"+#CRLF$
  output$+"                 will look. If you tick the '255 files' button the list will"+#CRLF$
  output$+"                 further split the folders so that the A500 Mini computer can"+#CRLF$
  output$+"                 view them."+#CRLF$
  output$+"                 When downloading, you can press the 'Escape' key to quit the"+#CRLF$
  output$+"                 download process and return to the main window. Once the "+#CRLF$
  output$+"                 current download is complete, your files will be automatically"+#CRLF$
  output$+"                 checked and a window will show any unneeded ones. In this"+#CRLF$
  output$+"                 window you can either back up or delete these files."+#CRLF$
  output$+#CRLF$  
  output$+"  FTP / HTTP   - Sets the connection type for all downloads. Use FTP"+#CRLF$
  output$+"                 if you have issues with the HTTP connection."+#CRLF$
  output$+#CRLF$  
  output$+"Lists"+#CRLF$
  output$+"-----"+#CRLF$ 
  output$+"  Edit List    - Opens a window with all the files in the database"+#CRLF$
  output$+"                 listed. Any files that are in the main list are"+#CRLF$
  output$+"                 checked. You can add/remove files by setting the"+#CRLF$
  output$+"                 check box next to each name."+#CRLF$
  output$+#CRLF$
  output$+"  Load List    - Loads a list of filenames and filters the main list to"+#CRLF$
  output$+"                 only show these files."+#CRLF$
  output$+#CRLF$
  output$+"  Save List    - Saves a list of filenames shown in the main list."+#CRLF$
  output$+#CRLF$
  output$+"  Append List  - Adds a list extra filenames to the main list without"+#CRLF$
  output$+"                 resetting the filtered files."+#CRLF$
  output$+#CRLF$ 
  output$+"  Clear Edits  - Removes any changes made in the 'Edit List' window and"+#CRLF$
  output$+"                 resets the main list back to it's default. Filters"+#CRLF$
  output$+"                 will not be changed but any lists that have been"+#CRLF$
  output$+"                 loaded, will be lost. "+#CRLF$
  output$+#CRLF$
  output$+"Data"+#CRLF$
  output$+"----"+#CRLF$ 
  output$+"  Clean Files  - Opens a window that let's you delete unneeded files in"+#CRLF$
  output$+"                 your collection. There is a section below that goes"+#CRLF$
  output$+"                 into more detail."+#CRLF$
  output$+#CRLF$
  output$+"                 Note: This process now checks the CRC32 checksum for each"+#CRLF$
  output$+"                 archive and will remove any files that don't match."+#CRLF$
  output$+"                 This will include any archives that you may have"+#CRLF$
  output$+"                 modified yourself. You will need to remove these"+#CRLF$
  output$+"                 files if you want to keep them."+#CRLF$
  output$+#CRLF$
  output$+"  Clear Data   - Clears all loaded data. Filter & server settings will remain."+#CRLF$
  output$+#CRLF$
  output$+"  Make Folder  - Creates a new folder of games from your downloads"+#CRLF$
  output$+"                 using the filter settings. This is useful if you've"+#CRLF$
  output$+"                 downloaded a set of archives and want to refine"+#CRLF$
  output$+"                 your selection further. This procedure will not"+#CRLF$
  output$+"                 delete the old files. You will need to do this"+#CRLF$
  output$+"                 yourself. It also does not support the A500 mini"+#CRLF$
  output$+"                 255 file limit."+#CRLF$
  output$+#CRLF$
  output$+"Misc"+#CRLF$
  output$+"----"+#CRLF$ 
  output$+"  Save Prefs   - Saves the current FTP, folder and filter settings. A"+#CRLF$
  output$+"                 file called 'default.prefs' is automatically loaded"+#CRLF$
  output$+"                 when the program starts. If you have a favourite set"+#CRLF$
  output$+"                 of options, overwrite this file."+#CRLF$
  output$+#CRLF$
  output$+"  Load Prefs   - Loads a preferences file and applies the settings"+#CRLF$
  output$+"                 stored in it."+#CRLF$
  output$+#CRLF$
  output$+"  Help         - You are already here!."+#CRLF$
  output$+#CRLF$
  output$+"  About        - Shows some information about this tool and has a link"+#CRLF$
  output$+"                 so you can donate to support the Turran server."+#CRLF$
  output$+#CRLF$
  output$+"  Donate       - Opens the PayPal.me donation page for the Turran server"+#CRLF$
  output$+"                 and my PayPal.me coffee fund. Please donate!"+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"                    ╔══════════════════════════════════════════╗"+#CRLF$
  output$+"                    ║                                          ║"+#CRLF$
  output$+"                    ║                Instructions              ║"+#CRLF$
  output$+"                    ║                                          ║"+#CRLF$
  output$+"                    ╚══════════════════════════════════════════╝"+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Create a WHDLoad set"+#CRLF$
  output$+"===================="+#CRLF$
  output$+#CRLF$
  output$+"It is quite a simple process to create a set of WHDLoad files. This is what you need to do..."+#CRLF$
  output$+#CRLF$
  output$+"  1. Decide between HTTP or FTP for downloading all the files."+#CRLF$
  output$+"  2. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  3. Set the download folder by pressing the 'Set' button next to the"+#CRLF$
  output$+"     'Parent' text box. If you don't set a new path, a folder called"+#CRLF$
  output$+"     'Download' will be created in the folder that this program is located in."+#CRLF$
  output$+"  4. Use the filter options to remove any file types that you don't require."+#CRLF$
  output$+"  5. Use the 'Edit List' window to further refine the file list."+#CRLF$
  output$+"  6. Set how the downloads are sorted with the 'Sorting' drop down menus."+#CRLF$
  output$+"  7. Press the 'Download' button to download the files from the Turran server."+#CRLF$
  output$+"  8. If you want to save your settings, press the 'Save Prefs' button"+#CRLF$
  output$+"     and use your own filename. If you want use these settings by default"+#CRLF$
  output$+"     , overwrite the 'default.prefs' file. If you want to revert to the "+#CRLF$
  output$+"     original default settings, simply delete the 'default.prefs' file"+#CRLF$
  output$+"     and run the tool again, a new 'default.prefs' file will be created."+#CRLF$
  output$+"  9. Saving the file list as a list is a quick way to store any edits"+#CRLF$
  output$+"     you have made as well."+#CRLF$
  output$+#CRLF$
  output$+"**** Important Notes ****"+#CRLF$
  output$+"-------------------------"+#CRLF$
  output$+"1. This process will not delete or change any of your files and will only"+#CRLF$
  output$+"   only download the files that you don't already have."+#CRLF$
  output$+"2. You cannot select a root folder on your harddrives."+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Clean up a WHDLoad set"+#CRLF$
  output$+"======================"+#CRLF$
  output$+#CRLF$
  output$+"WARNING! THIS IS A DESTRUCTIVE PROCESS THAT CANNOT BE UNDONE! PLEASE BE"+#CRLF$
  output$+"CAREFUL AS THIS PROCESS WILL DELETE FILES ON YOUR HARDDRIVE!"+#CRLF$
  output$+#CRLF$
  output$+"Warnings aside, this is quite a simple process that can really help "+#CRLF$
  output$+"getting rid of unwanted files. Please read the notes before you proceed!"+#CRLF$
  output$+#CRLF$
  output$+"This process can be run in two ways..."+#CRLF$
  output$+#CRLF$  
  output$+"Cleaning Your WHDLoad Set"+#CRLF$
  output$+"-------------------------"+#CRLF$ 
  output$+"This process will remove any unneeded archives from your WHDLoad set."+#CRLF$ 
  output$+#CRLF$
  output$+"Note: This process now checks for the CRC32 in each archive and will"+#CRLF$ 
  output$+"remove any files that don't match. This will include any archives that"+#CRLF$ 
  output$+"you may have modified yourself. You will need to remove these files if"+#CRLF$
  output$+"if you want to keep them."+#CRLF$
  output$+#CRLF$
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Set the 'Parent' folder to the folder you have your WHDLoad files"+#CRLF$
  output$+"     stored in."+#CRLF$
  output$+"  3. Press the 'Clean Files' button."+#CRLF$
  output$+"  4. IMPORTANT! DOUBLE CHECK THE LISTS FILES BEFORE CONTINUING!."+#CRLF$
  output$+"  5. Choose 'Delete' to delete the files or 'Back Up' to back up the"+#CRLF$
  output$+"     files. Pressing 'Cancel' aborts the process. Back ups are stored"+#CRLF$
  output$+"     in a folder called 'Backup' in the folder that this program is located in."+#CRLF$
  output$+#CRLF$
  output$+"Clean an existing set"+#CRLF$
  output$+"---------------------"+#CRLF$ 
  output$+"The alternate way it to scan a folder of WHDLoad archives and use the database to remove unneeded files. This can be good if you have an existing set of WHDLoad files and want to get rid of old files."+#CRLF$
  output$+#CRLF$
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Press the 'Clean Files' button and press the 'Own Files' button."+#CRLF$
  output$+"     Any files in the list will be removed and a path window will open."+#CRLF$
  output$+"  3. Use the path window to set the folder to scan. Any files in any"+#CRLF$
  output$+"     subfolders will be automatically added. The scan will only add"+#CRLF$
  output$+"     LHA and LZX files."+#CRLF$
  output$+"  4. IMPORTANT! DOUBLE CHECK THE LISTS FILES BEFORE CONTINUING!."+#CRLF$
  output$+"  5. Choose 'Delete' to delete the files or 'Back Up' to back up the"+#CRLF$
  output$+"     files. Pressing 'Cancel' aborts the process. Back ups are stored"+#CRLF$
  output$+"     in a folder called 'Backup' in the folder that this program is located in."+#CRLF$
  output$+#CRLF$
  output$+"**** Important Notes ****"+#CRLF$
  output$+"-------------------------"+#CRLF$
  output$+"1. You cannot select a root folder on your harddrives."+#CRLF$
  output$+"2. Please note that if you change the filter settings after"+#CRLF$
  output$+"   downloading a set and then run the 'Clean Files', it will scan based "+#CRLF$
  output$+"   on the new filter settings and delete any file types you have removed."+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Lists"+#CRLF$
  output$+"====="+#CRLF$
  output$+#CRLF$
  output$+"Lists are a quick way to create and manage curated sets of WHDLoad files. Loading a list will reset any changes that have been made to the filter as it can hide files. Loaded lists are fully filterable but will only show files that are in the list and any files added in the 'Edit List' window. "
  output$+"Editing a list has no effect on the filter and any files added or removed from a filtered list will not be affected by further changes to the filter and can only be changed in the 'Edit List' window or by using the 'Clear Edits' button."+#CRLF$
  output$+#CRLF$
  output$+"I have included a base set of lists base on game categories and a couple of curated ones based on top Amiga games lists just to give an example."+#CRLF$
  output$+#CRLF$
  output$+"Create a list"+#CRLF$
  output$+"-------------"+#CRLF$ 
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Open the 'Edit List' window and add or remove more files."+#CRLF$
  output$+"  3. Press the 'Save List' button and give it a name."+#CRLF$
  output$+#CRLF$
  output$+"Load a list"+#CRLF$
  output$+"-------------"+#CRLF$ 
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Press the 'Load List' button and select the list you want."+#CRLF$
  output$+#CRLF$
  output$+"Load multiple lists"+#CRLF$
  output$+"-------------------"+#CRLF$ 
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Press the 'Load List' button and select the list you want."+#CRLF$
  output$+"  3. Press the 'Append List' button and select the extra list you want."+#CRLF$
  output$+#CRLF$
  output$+#CRLF$
  output$+"Make Folder"+#CRLF$
  output$+"==========="+#CRLF$ 
  output$+#CRLF$
  output$+"The 'Make Folder' button allows you to copy from your existing downloads using the current filter settings. An example would be if you wanted to create a set of archives that are only for ECS/OCS machines from a full set. All you would do is deselect AGA and CD32, press the 'Make Folder' button, "
  output$+"select a new folder, decide whether to keep the same folder structure and press OK."+#CRLF$
  output$+#CRLF$
  output$+"Create a new folder"+#CRLF$
  output$+"-------------------"+#CRLF$ 
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Load a prefs file or make the necessary filter selections. All "+#CRLF$
  output$+"     listed archive should be green."+#CRLF$
  output$+"  3. Press the 'Make Folder' button and select the folder you want to "+#CRLF$
  output$+"     save the new archives to and press OK."+#CRLF$
  output$+"  4. Wait for console window to close. You can press 'Escape' to"+#CRLF$
  output$+"     cancel the copy process."+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+#CRLF$
  output$+"Disclaimer"+#CRLF$
  output$+"=========="+#CRLF$
  output$+#CRLF$
  output$+"This SOFTWARE PRODUCT is provided by THE PROVIDER 'as is' and 'with all faults.' THE PROVIDER makes no representations or warranties of any kind concerning the safety, suitability, lack of viruses, inaccuracies, typographical errors, or other harmful components of this SOFTWARE PRODUCT. There are inherent dangers in the use of any software, and you are solely responsible for determining whether this SOFTWARE PRODUCT is compatible with your equipment and other software installed on your equipment. You are also solely responsible for the protection of your equipment and backup of your data, and THE PROVIDER will not be liable for any damages you may suffer in connection with using, modifying, or distributing this SOFTWARE PRODUCT. "+#CRLF$
  
  SetGadgetText(#HELP_EDITOR,output$)
  
  Resume_Window(#HELP_WINDOW)
  
EndProcedure

Procedure Main_Window()
  
  OpenWindow(#MAIN_WINDOW,5,5,875,637,"",#PB_Window_ScreenCentered|#PB_Window_SystemMenu|#PB_Window_MinimizeGadget)
  
  Update_Title()
  
  CreateStatusBar(#MAIN_STATUS,WindowID(#MAIN_WINDOW))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(120))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(120))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(80))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(154))
  
  Pause_Window(#MAIN_WINDOW)
  
  ListIconGadget(#MAIN_LIST,5,5,435,605,"",0,#PB_ListIcon_FullRowSelect | #LVS_NOCOLUMNHEADER)
  
  SetGadgetFont(#MAIN_LIST,FontID(#MAIN_FONT))
  
  FrameGadget(#PB_Any,445,0,330,153,"Server Settings")
  
  TextGadget(#PB_Any,455,20,60,22,"User Name")
  StringGadget(#FTP_USER_STRING,525,18,245,22,ftp_user)
  TextGadget(#PB_Any,455,47,60,22,"Password")
  StringGadget(#FTP_PASS_STRING,525,45,245,22,ftp_pass)
  TextGadget(#PB_Any,455,74,60,22,"Server")
  StringGadget(#FTP_SERVER_STRING,525,72,160,22,ftp_server)
  TextGadget(#PB_Any,695,74,25,25,"Port")
  StringGadget(#FTP_PORT_STRING,725,72,45,22,Str(ftp_port),#PB_String_Numeric)
  TextGadget(#PB_Any,455,100,60,22,"FTP Folder")
  StringGadget(#FTP_FOLDER_STRING,525,98,245,22,ftp_Folder)
  TextGadget(#PB_Any,455,127,60,22,"HTTP Path")
  StringGadget(#HTTP_SERVER_STRING,525,125,245,22,HTTP_Server)
  
  FrameGadget(#PB_Any,445,153,330,187,"Folder Settings")
  
  TextGadget(#PB_Any,455,176,40,22,"Parent")  
  StringGadget(#WHD_MAIN_STRING,520,174,162,22,WHD_Folder,#PB_String_ReadOnly)
  ButtonGadget(#WHD_OPEN_PATH_BUTTON,682,174,40,22,"Open")
  ButtonGadget(#WHD_SET_PATH_BUTTON,727,174,40,22,"Set")
  
  CheckBoxGadget(#GAME_OPTION,455,202,20,20,"")
  TextGadget(#PB_Any,475,203,40,22,"Games")
  StringGadget(#WHD_GAME_STRING,520,200,202,22,WHD_Game_Folder)
  ButtonGadget(#WHD_OPEN_GAME_BUTTON,727,200,40,22,"Open") 
  
  CheckBoxGadget(#DEMO_OPTION,455,229,20,20,"")
  TextGadget(#PB_Any,475,230,40,22,"Demos")
  StringGadget(#WHD_DEMO_STRING,520,228,202,22,WHD_Demo_Folder)
  ButtonGadget(#WHD_OPEN_DEMO_BUTTON,727,228,40,22,"Open")
  
  CheckBoxGadget(#BETA_OPTION,455,253,20,20,"")
  TextGadget(#PB_Any,475,257,40,22,"Beta")
  StringGadget(#WHD_BETA_STRING,520,255,202,22,WHD_Beta_Folder)
  ButtonGadget(#WHD_OPEN_BETA_BUTTON,727,255,40,22,"Open")
  
  CheckBoxGadget(#MAGS_OPTION,455,280,20,20,"")  
  TextGadget(#PB_Any,475,284,40,22,"Mags")
  StringGadget(#WHD_MAGS_STRING,520,282,202,22,WHD_Mags_Folder)
  ButtonGadget(#WHD_OPEN_MAGS_BUTTON,727,282,40,22,"Open")
  
  TextGadget(#PB_Any,455,312,75,22,"Sorting")
  ComboBoxGadget(#WHD_SORT_COMBO,520,310,115,22)
  AddGadgetItem(#WHD_SORT_COMBO,-1,"No Sorting")
  AddGadgetItem(#WHD_SORT_COMBO,-1,"Alphabetical")
  AddGadgetItem(#WHD_SORT_COMBO,-1,"Category")
  AddGadgetItem(#WHD_SORT_COMBO,-1,"Category (0-Z)")
  SetGadgetState(#WHD_SORT_COMBO,Sort_Type)
  ComboBoxGadget(#WHD_LANGUAGE_COMBO,650,310,120,22)
  AddGadgetItem(#WHD_LANGUAGE_COMBO,-1,"Ignore Languages")
  AddGadgetItem(#WHD_LANGUAGE_COMBO,-1,"Split Languages")
  SetGadgetState(#WHD_LANGUAGE_COMBO,Split_Languages)
  
  DisableGadget(#WHD_LANGUAGE_COMBO,#True)
  
  FrameGadget(#PB_Any,445,340,330,270,"Filter")
  
  ScrollAreaGadget(#FILTER_PANEL,450,360,180,240,160,675,0,#PB_ScrollArea_BorderLess)
  
  FrameGadget(#PB_Any,5,0,150,100,"System")
  CheckBoxGadget(#AMIGA_OPTION,15,20,60,25,"Amiga")
  CheckBoxGadget(#ARCADIA_OPTION,90,20,60,25,"Arcadia")
  CheckBoxGadget(#CD32_OPTION,15,45,60,25,"CD32")
  CheckBoxGadget(#CDTV_OPTION,90,45,60,25,"CDTV")
  CheckBoxGadget(#CDROM_OPTION,15,70,60,25,"CDROM")
  
  FrameGadget(#PB_Any,5,105,150,75,"Chipset")
  CheckBoxGadget(#AGA_OPTION,15,125,60,25,"AGA")
  CheckBoxGadget(#ECS_OPTION,90,125,59,25,"ECSOCS")
  CheckBoxGadget(#NTSC_OPTION,15,150,60,25,"NTSC")
  CheckBoxGadget(#PAL_OPTION,90,150,60,25,"PAL") 
  
  FrameGadget(#PB_Any,5,185,150,75,"Sound")
  CheckBoxGadget(#MT32_OPTION,15,205,60,25,"MT32")
  CheckBoxGadget(#NOMUSIC_OPTION,89,205,65,25,"NoMusic")
  CheckBoxGadget(#NOSPEECH_OPTION,15,230,70,25,"NoSpeech")
  CheckBoxGadget(#NOVOICE_OPTION,90,230,60,25,"NoVoice")
  
  FrameGadget(#PB_Any,5,265,150,175,"Memory")
  CheckBoxGadget(#CHIP_OPTION,15,285,60,25,"Chip")
  CheckBoxGadget(#FAST_OPTION,90,285,60,25,"Fast")
  CheckBoxGadget(#MEM_512K_OPTION,15,310,60,25,"512k")
  CheckBoxGadget(#MEM_512KB_OPTION,90,310,60,25,"512KB")
  CheckBoxGadget(#MEM_1MB_OPTION,15,335,60,25,"1MB")
  CheckBoxGadget(#MEM_1MB_CHIP_OPTION,90,335,64,25,"1MBChp")
  CheckBoxGadget(#MEM_15MB_OPTION,15,360,60,25,"1.5MB")
  CheckBoxGadget(#MEM_2MB_OPTION,90,360,60,25,"2MB")
  CheckBoxGadget(#MEM_8MB_OPTION,15,385,60,25,"8MB") 
  CheckBoxGadget(#MEM_12MB_OPTION,90,385,60,25,"12MB")
  CheckBoxGadget(#LOWMEM_OPTION,15,410,65,25,"LowMem")
  CheckBoxGadget(#SLOWMEM_OPTION,90,410,64,25,"SlowMm")
  
  FrameGadget(#PB_Any,5,445,150,225,"Misc")
  CheckBoxGadget(#FILES_OPTION,15,465,60,25,"Files")
  CheckBoxGadget(#IMAGE_OPTION,90,465,60,25,"Image")
  CheckBoxGadget(#DISK1_OPTION,15,490,60,25,"1 Disk")
  CheckBoxGadget(#DISK2_OPTION,90,490,60,25,"2 Disk")
  CheckBoxGadget(#DISK3_OPTION,15,515,60,25,"3 Disk")
  CheckBoxGadget(#DISK4_OPTION,90,515,60,25,"4 Disk")
  CheckBoxGadget(#HIRES_OPTION,15,540,60,25,"HiRes")
  CheckBoxGadget(#LORES_OPTION,90,540,60,25,"LoRes")
  CheckBoxGadget(#NOMOVIE_OPTION,15,565,65,25,"NoMovie")
  CheckBoxGadget(#NOINTRO_OPTION,90,565,64,25,"NoIntro")
  CheckBoxGadget(#PRERELEASE_OPTION,15,590,64,25,"PreRel.")
  GadgetToolTip(#PRERELEASE_OPTION, "PreRelease")
  CheckBoxGadget(#PREVIEW_OPTION,90,590,64,25,"Preview")
  CheckBoxGadget(#ENHANCED_OPTION,15,615,67,25,"Enhanced")
  CheckBoxGadget(#GAMEDEMO_OPTION,90,615,64,25,"GmDmo")
  GadgetToolTip(#GAMEDEMO_OPTION, "Game Demo")
  CheckBoxGadget(#UNCENSORED_OPTION,15,640,64,25,"UnCens.")
  GadgetToolTip(#UNCENSORED_OPTION, "Uncensored")
  CheckBoxGadget(#CENSORED_OPTION,90,640,64,25,"Censor.")
  GadgetToolTip(#CENSORED_OPTION, "Censored")
  CloseGadgetList()
  
  FrameGadget(#PB_Any,635,355,135,220,"Language")
  
  CheckBoxGadget(#CZECH_OPTION,645,370,60,25,"Czech")
  CheckBoxGadget(#GREEK_OPTION,705,370,60,25,"Greek")
  CheckBoxGadget(#DANISH_OPTION,645,400,60,25,"Danish") 
  CheckBoxGadget(#ITALIAN_OPTION,705,400,60,25,"Italian")
  CheckBoxGadget(#DUTCH_OPTION,645,430,60,25,"Dutch")
  CheckBoxGadget(#MULTI_OPTION,705,430,60,25,"Multi")
  CheckBoxGadget(#ENGLISH_OPTION,645,460,60,25,"English")
  CheckBoxGadget(#POLISH_OPTION,705,460,60,25,"Polish")
  CheckBoxGadget(#FINNISH_OPTION,645,490,60,25,"Finnish") 
  CheckBoxGadget(#SPANISH_OPTION,705,490,60,25,"Spanish")
  CheckBoxGadget(#FRENCH_OPTION,645,520,60,25,"French")
  CheckBoxGadget(#SWEDISH_OPTION,705,520,60,25,"Swedish")
  CheckBoxGadget(#GERMAN_OPTION,645,550,60,22,"German")
  ButtonGadget(#CLEAR_LANG_BUTTON,710,549,55,22,"Clear")
  
  ButtonGadget(#CLEAR_BUTTON,635,578,68,27,"Clear Filter")
  ButtonGadget(#RESET_BUTTON,705,578,65,27,"Reset Filter")   
  
  ; #### Button List
  
  FrameGadget(#PB_Any,780,0,90,120,"FTP Actions")
  
  ButtonGadget(#SCAN_BUTTON,785,20,80,30,"Load Data")
  ButtonGadget(#DOWNLOAD_BUTTON,785,55,80,30,"Download")
  ComboBoxGadget(#DOWNLOAD_TYPE_COMBO,785,90,80,23)
  AddGadgetItem(#DOWNLOAD_TYPE_COMBO,-1," FTP")
  AddGadgetItem(#DOWNLOAD_TYPE_COMBO,-1," HTTP")
  GadgetToolTip(#DOWNLOAD_TYPE_COMBO,"Server Connection Type Selector")
  
  FrameGadget(#PB_Any,780,120,90,195,"Lists")
  
  ButtonGadget(#LIST_EDIT_BUTTON,785,140,80,30,"Edit List")  
  ButtonGadget(#LIST_LOAD_BUTTON,785,175,80,30,"Load List")
  ButtonGadget(#LIST_SAVE_BUTTON,785,210,80,30,"Save List")
  ButtonGadget(#LIST_APPEND_BUTTON,785,245,80,30,"Append List")
  ButtonGadget(#CLEAR_EDITS_BUTTON,785,280,80,30,"Clear Edits")
  
  FrameGadget(#PB_Any,780,320,90,120,"Data")
  
  ButtonGadget(#CLEANUP_BUTTON,785,335,80,30,"Clean Files") 
  ButtonGadget(#CLEAR_DATA_BUTTON,785,370,80,30,"Clear Data")
  ButtonGadget(#MAKE_FOLDER_BUTTON,785,405,80,30,"Make Folder")
  
  FrameGadget(#PB_Any,780,445,90,165,"Misc")
  
  ButtonGadget(#SAVE_PREFS_BUTTON,785,460,80,25,"Save Prefs")
  ButtonGadget(#LOAD_PREFS_BUTTON,785,490,80,25,"Load Prefs")   
  ButtonGadget(#HELP_BUTTON,785,520,80,25,"Help")
  ButtonGadget(#ABOUT_BUTTON,785,550,80,25,"About")   
  ButtonGadget(#DONATE_BUTTON,785,580,80,25,"Donate!")
  
  SetGadgetState(#GAME_OPTION,Filter(0)\F_Games)
  SetGadgetState(#DEMO_OPTION,Filter(0)\F_Demos)
  SetGadgetState(#BETA_OPTION,Filter(0)\F_Beta)
  SetGadgetState(#MAGS_OPTION,Filter(0)\F_Mags)
  SetGadgetState(#AGA_OPTION,Filter(0)\F_AGA)
  SetGadgetState(#ECS_OPTION,Filter(0)\F_ECS)
  SetGadgetState(#NTSC_OPTION,Filter(0)\F_NTSC)
  SetGadgetState(#PAL_OPTION,Filter(0)\F_PAL)
  SetGadgetState(#AMIGA_OPTION,Filter(0)\F_Amiga)
  SetGadgetState(#ARCADIA_OPTION,Filter(0)\F_Arcadia)
  SetGadgetState(#CD32_OPTION,Filter(0)\F_CD32)
  SetGadgetState(#CDTV_OPTION,Filter(0)\F_CDTV)
  SetGadgetState(#CDROM_OPTION,Filter(0)\F_CDROM)
  SetGadgetState(#FILES_OPTION,Filter(0)\F_Files)
  SetGadgetState(#IMAGE_OPTION,Filter(0)\F_Image)
  SetGadgetState(#CHIP_OPTION,Filter(0)\F_Chip)
  SetGadgetState(#FAST_OPTION,Filter(0)\F_Fast)
  
  SetGadgetState(#CZECH_OPTION,Filter(0)\F_Czech)
  SetGadgetState(#DANISH_OPTION,Filter(0)\F_Danish)
  SetGadgetState(#DUTCH_OPTION,Filter(0)\F_Dutch)
  SetGadgetState(#ENGLISH_OPTION,Filter(0)\F_English)
  SetGadgetState(#FINNISH_OPTION,Filter(0)\F_Finnish)
  SetGadgetState(#FRENCH_OPTION,Filter(0)\F_French)
  SetGadgetState(#GERMAN_OPTION,Filter(0)\F_German)
  SetGadgetState(#GREEK_OPTION,Filter(0)\F_Greek)
  SetGadgetState(#ITALIAN_OPTION,Filter(0)\F_Italian)
  SetGadgetState(#MULTI_OPTION,Filter(0)\F_Multi)
  SetGadgetState(#POLISH_OPTION,Filter(0)\F_Polish)
  SetGadgetState(#SPANISH_OPTION,Filter(0)\F_Spanish)
  SetGadgetState(#SWEDISH_OPTION,Filter(0)\F_Swedish)  
  
  Disable_Gadgets(#True) 
  Set_List_Gadgets(#True)
  DisableGadget(#CLEAR_EDITS_BUTTON,#True)
  
  Set_Filter_Gadgets()
  
  Update_Statusbar()
  
  Resume_Window(#MAIN_WINDOW)
  
EndProcedure

;- ############### Program Startup

UseZipPacker()
UseCRC32Fingerprint()

LoadFont(#HELP_FONT,"Consolas",9,#PB_Font_HighQuality)
LoadFont(#MAIN_FONT,GetDefaultFontName(),9,#PB_Font_HighQuality)

Default_Settings()

Main_Window()

Set_Filter(#True)

If FileSize(Home_Path+Prefs_Name)=-1 
  Save_Prefs(Home_Path+Prefs_Name)
  First_Run=#True
Else
  Load_Prefs(Home_Path+Prefs_Name)
EndIf

Update_Gadgets()
Set_Filter_Gadgets()

If FileSize(List_Path)<>-2
  CreateDirectory(List_Path)
EndIf

If First_Run
  If MessageRequester("First Run", "Would you like to open the help window?",#PB_MessageRequester_Info|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
    Help_Window()
  EndIf
EndIf

;- ############### Main Event Loop

Repeat
  Event=WaitWindowEvent()
  Gadget=EventGadget()
  Type=EventType()
  
  Select Event
      
    Case #WM_KEYDOWN
      If CountGadgetItems(#MAIN_LIST)>0
        If EventwParam() = #VK_F5
          If ListSize(Game_List())>0
            Rescan_Files()
            Scrape_Data()
            Draw_List()
          EndIf
        EndIf
      EndIf
      
      If EventwParam() = #VK_F1
        Help_Window()
      EndIf
      
  EndSelect
  
  Select Gadget

    Case #LOAD_PREFS_BUTTON
      
      If ListSize(Game_List())>0
        If MessageRequester("Warning", "Clear all data?", #PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes
          If ListSize(Game_List())>0 : ClearList(Game_List()) : EndIf
          If ListSize(Delete_List())>0 : ClearList(Delete_List()) : EndIf
          If ListSize(File_List())>0 : ClearList(File_List()) : EndIf
          If ListSize(File_List_Size())>0 : ClearList(File_List()) : EndIf
          If ListSize(Down_List())>0 : ClearList(Down_List()) : EndIf
          If ListSize(Filtered_List())>0 : ClearList(Filtered_List()) : EndIf
          If ListSize(Directory_List())>0 : ClearList(Directory_List()) : EndIf
          Pause_Window(#MAIN_WINDOW)
          ClearGadgetItems(#MAIN_LIST)
          Update_Gadgets()
          DisableGadget(#CLEAR_EDITS_BUTTON,#True)
          Disable_Gadgets(#True)
          Set_List_Gadgets(#True)
          Update_Title()
          Update_Statusbar()
          Resume_Window(#MAIN_WINDOW)
        EndIf   
      EndIf
      
      Path=OpenFileRequester("Load Prefs",Home_Path,"Prefs File (*.prefs)|*.prefs",0)
      
      If Path<>""
        Load_Prefs(Path)
        SetGadgetText(#FTP_USER_STRING,FTP_User)
        SetGadgetText(#FTP_PASS_STRING,FTP_Pass)
        SetGadgetText(#FTP_SERVER_STRING,FTP_Server)
        SetGadgetText(#FTP_PORT_STRING,Str(FTP_Port))
        SetGadgetText(#FTP_FOLDER_STRING,FTP_Folder)
        SetGadgetText(#HTTP_SERVER_STRING,HTTP_Server)
        SetGadgetText(#WHD_MAIN_STRING,WHD_Folder)
        SetGadgetText(#WHD_GAME_STRING,WHD_Game_Folder)
        SetGadgetText(#WHD_DEMO_STRING,WHD_Demo_Folder)
        SetGadgetText(#WHD_BETA_STRING,WHD_Beta_Folder)
        SetGadgetText(#WHD_MAGS_STRING,WHD_Mags_Folder)
        SetGadgetState(#WHD_SORT_COMBO,Sort_Type)
        SetGadgetState(#WHD_LANGUAGE_COMBO,Split_Languages)
        
        If Sort_Type=2
          DisableGadget(#WHD_LANGUAGE_COMBO,#False)
        Else
          Split_Languages=0
          SetGadgetState(#WHD_LANGUAGE_COMBO,0)
          DisableGadget(#WHD_LANGUAGE_COMBO,#True)
        EndIf
        Update_Gadgets() 
        Set_Filter_Gadgets()
        
        If ListSize(Game_List())=0       
          If MessageRequester("Load", "Load dat files?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Info)=#PB_MessageRequester_Yes
            If Download_Type=0
              Scan_FTP()
            Else
              Scan_HTTP()
            EndIf
          EndIf 
        EndIf 
        
        If ListSize(Game_List())>0
          Rescan_Files()
          Scrape_Data()
          Disable_Gadgets(#False)
          Draw_List()
        EndIf
        
      EndIf
                
    Case #SCAN_BUTTON
      If ListSize(Game_List())>0
        Count=MessageRequester("Warning","Clear the database and reload?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)
        
        If count=#PB_MessageRequester_Yes
          ClearList(Game_List())
          ClearGadgetItems(#MAIN_LIST)
          If Download_Type=0
            Scan_FTP()
          Else
            Scan_HTTP()
          EndIf
          If ListSize(Game_List())>0
            Rescan_Files()
            Scrape_Data()
            Disable_Gadgets(#False)
            Draw_List()
          EndIf
        EndIf
        
      Else
        
        If Download_Type=0
          Scan_FTP()
        Else
          Scan_HTTP()
        EndIf
        If ListSize(Game_List())>0
          Rescan_Files()
          Scrape_Data()
          Disable_Gadgets(#False)
          Draw_List()
        EndIf
        
      EndIf
      
    Case #DOWNLOAD_BUTTON
      If Download_Type=0
        Download_FTP()
      Else
        Download_HTTP()
      EndIf
      Scrape_Data()
      Draw_List()
      
    Case #CLEAR_DATA_BUTTON
      If MessageRequester("Warning", "Clear all data?", #PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes
        If ListSize(Game_List())>0 : ClearList(Game_List()) : EndIf
        If ListSize(Delete_List())>0 : ClearList(Delete_List()) : EndIf
        If ListSize(File_List())>0 : ClearList(File_List()) : EndIf
        If ListSize(File_List_Size())>0 : ClearList(File_List()) : EndIf
        If ListSize(Down_List())>0 : ClearList(Down_List()) : EndIf
        If ListSize(Filtered_List())>0 : ClearList(Filtered_List()) : EndIf
        If ListSize(Directory_List())>0 : ClearList(Directory_List()) : EndIf
        Pause_Window(#MAIN_WINDOW)
        ClearGadgetItems(#MAIN_LIST)
        Update_Gadgets()
        DisableGadget(#CLEAR_EDITS_BUTTON,#True)
        Disable_Gadgets(#True)
        Set_List_Gadgets(#True)
        Update_Title()
        Update_Statusbar()
        Resume_Window(#MAIN_WINDOW)
      EndIf    
      
    Case #CLEANUP_BUTTON 
      Update_Files(1)
      Draw_List()
      
    Case #MAKE_FOLDER_BUTTON
      Make_Folder()
      
    Case #DOWNLOAD_TYPE_COMBO
      If type=#PB_EventType_Change
        Download_Type=GetGadgetState(#DOWNLOAD_TYPE_COMBO)
      EndIf
      
    Case #WHD_SORT_COMBO
      Sort_Type=GetGadgetState(#WHD_SORT_COMBO)
      If Sort_Type=2 Or Sort_Type=3
        DisableGadget(#WHD_LANGUAGE_COMBO,#False)
      Else
        DisableGadget(#WHD_LANGUAGE_COMBO,#True)
      EndIf
      If Sort_Type=0 Or Sort_Type=1
        Split_Languages=0
        SetGadgetState(#WHD_LANGUAGE_COMBO,#False)
      EndIf
      Update_Genre()
      
    Case #WHD_LANGUAGE_COMBO
      Split_Languages=GetGadgetState(#WHD_LANGUAGE_COMBO)
      Update_Genre()
      
    Case #DONATE_BUTTON
        Donate_Window()
            
    Case #MAIN_LIST
      If Type=#PB_EventType_Change
        If GetGadgetState(#MAIN_LIST)<>-1
          SelectElement(Filtered_List(),GetGadgetState(#MAIN_LIST))
          SelectElement(Game_List(),Filtered_List())
          Update_Statusbar()
        EndIf
      EndIf
      
    Case #WHD_OPEN_PATH_BUTTON
      Path=WHD_Folder
      If FileSize(path)=-2
        OpenFolder(path)
      Else
        MessageRequester("Error","This folder is created on"+Chr(10)+"your first download.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_SET_PATH_BUTTON
      Path=PathRequester("Select Folder",WHD_Folder)
      If Path<>""       
        If CountString(path,slash$)=1
          MessageRequester("Error", "Do not use a root path!", #PB_MessageRequester_Error|#PB_MessageRequester_Ok)
        Else
          WHD_Folder=Path  
          ClearList(File_List())
          List_Files_Recursive(WHD_Folder,File_List(),"") 
          SetGadgetText(#WHD_MAIN_STRING,WHD_Folder)
          Draw_List()
        EndIf
      EndIf
      
    Case #WHD_OPEN_GAME_BUTTON
      Path=WHD_Folder+WHD_Game_Folder+Chr(92)
      If FileSize(Path)=-2
        OpenFolder(Path)
      Else
        MessageRequester("Error","This folder is created on"+Chr(10)+"your first download.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_GAME_STRING
      If Type=#PB_EventType_Change
        WHD_Game_Folder=GetGadgetText(#WHD_GAME_STRING)
      EndIf
      
    Case #WHD_OPEN_DEMO_BUTTON
      Path=WHD_Folder+WHD_Demo_Folder+Chr(92)
      If FileSize(Path)=-2
        OpenFolder(Path)
      Else
        MessageRequester("Error","This folder does not exist!",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_DEMO_STRING
      If Type=#PB_EventType_Change
        WHD_Demo_Folder=GetGadgetText(#WHD_DEMO_STRING)
      EndIf
      
    Case #WHD_OPEN_BETA_BUTTON
      Path=WHD_Folder+WHD_Beta_Folder+Chr(92)
      If FileSize(Path)=-2
        OpenFolder(Path)
      Else
        MessageRequester("Error","This folder does not exist!",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_BETA_STRING
      If Type=#PB_EventType_Change
        WHD_Beta_Folder=GetGadgetText(#WHD_BETA_STRING)
      EndIf
      
    Case #WHD_OPEN_MAGS_BUTTON
      Path=WHD_Folder+WHD_Mags_Folder+Chr(92)
      If FileSize(path)=-2
        OpenFolder(Path)
      Else
        MessageRequester("Error","This folder is created on"+Chr(10)+"your first download.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_MAGS_STRING
      If Type=#PB_EventType_Change
        WHD_Mags_Folder=GetGadgetText(#WHD_MAGS_STRING)
      EndIf
      
    Case #FTP_USER_STRING
      If Type=#PB_EventType_Change
        FTP_User=GetGadgetText(#FTP_USER_STRING)
      EndIf
      
    Case #FTP_PASS_STRING
      If Type=#PB_EventType_Change
        FTP_Pass=GetGadgetText(#FTP_PASS_STRING)
      EndIf 
      
    Case #FTP_PORT_STRING
      If Type=#PB_EventType_Change
        FTP_Port=Val(GetGadgetText(#FTP_PORT_STRING))
      EndIf 
      
    Case #FTP_FOLDER_STRING
      If Type=#PB_EventType_Change
        FTP_Folder=GetGadgetText(#FTP_FOLDER_STRING)
      EndIf
      
    Case #FTP_SERVER_STRING
      If Type=#PB_EventType_Change
        FTP_Server=GetGadgetText(#FTP_SERVER_STRING)
      EndIf 
      
    Case #HTTP_SERVER_STRING
      If Type=#PB_EventType_Change
        HTTP_Server=GetGadgetText(#HTTP_SERVER_STRING)
      EndIf   
      
    Case #LIST_LOAD_BUTTON
      Load_List()
      Draw_List()
      
    Case #LIST_APPEND_BUTTON
      Append_List()
      Draw_List()
      
    Case #LIST_EDIT_BUTTON
      Edit_List()
      Draw_List()
      
    Case #LIST_SAVE_BUTTON
      Save_List()
      
    Case #CLEAR_EDITS_BUTTON
      If MessageRequester("Warning","Remove all edits and list data?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
        ForEach Game_List()
          Game_List()\File_Ignore=#False
          Game_List()\File_Extra=#False
        Next
        DisableGadget(#CLEAR_EDITS_BUTTON,#True)
        Set_List_Gadgets(#True)
        Draw_List()
      EndIf
      
    Case #HELP_BUTTON
      Help_Window()
      
    Case #ABOUT_BUTTON
      About_Window()
      
    Case #CLEAR_LANG_BUTTON
      If Type=#PB_EventType_LeftClick
        If Lang_Bool : Lang_Bool=#False : Else : Lang_Bool=#True : EndIf
        Set_Language_Gadgets(Lang_Bool)
        Draw_List()
      EndIf
                  
    Case #RESET_BUTTON
      Set_Filter(#True)
      Draw_List()
      
    Case #CLEAR_BUTTON
      Set_Filter(#False)
      Draw_List()
            
    Case #SAVE_PREFS_BUTTON
      Path=OpenFileRequester("Save Prefs",Home_Path,"Prefs File (*.prefs)|*.prefs",0)
      If Path<>""
        If GetExtensionPart(path)<>"prefs" : Path+".prefs" : EndIf
        If FileSize(path)>-1
          If MessageRequester("Warning!","Overwrite File?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes 
            Save_Prefs(Path)
          EndIf
        Else
          Save_Prefs(Path)
        EndIf
      EndIf
      
    Case #GAME_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Games=GetGadgetState(#GAME_OPTION)
        Draw_List()
      EndIf
      
    Case #DEMO_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Demos=GetGadgetState(#DEMO_OPTION)
        Draw_List()
      EndIf
      
    Case #BETA_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Beta=GetGadgetState(#BETA_OPTION)
        Draw_List()
      EndIf
      
    Case #MAGS_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Mags=GetGadgetState(#MAGS_OPTION)
        Draw_List()
      EndIf
      
    Case #AGA_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_AGA=GetGadgetState(#AGA_OPTION)
        Draw_List()
      EndIf
      
    Case #ECS_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_ECS=GetGadgetState(#ECS_OPTION)
        Draw_List()
      EndIf
      
    Case #NTSC_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_NTSC=GetGadgetState(#NTSC_OPTION)
        Draw_List()
      EndIf
      
    Case #PAL_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_PAL=GetGadgetState(#PAL_OPTION)
        Draw_List()
      EndIf
      
    Case #CD32_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_CD32=GetGadgetState(#CD32_OPTION)
        Draw_List()
      EndIf
      
    Case #CDTV_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_CDTV=GetGadgetState(#CDTV_OPTION)
        Draw_List()
      EndIf
      
    Case #CDROM_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_CDROM=GetGadgetState(#CDROM_OPTION)
        Draw_List()
      EndIf
      
    Case #AMIGA_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Amiga=GetGadgetState(#AMIGA_OPTION)
        Draw_List()
      EndIf
      
    Case #FILES_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Files=GetGadgetState(#FILES_OPTION)
        Draw_List()
      EndIf
      
    Case #IMAGE_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Image=GetGadgetState(#IMAGE_OPTION)
        Draw_List()
      EndIf
      
    Case #CHIP_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Chip=GetGadgetState(#CHIP_OPTION)
        Draw_List()
      EndIf
      
    Case #FAST_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Fast=GetGadgetState(#FAST_OPTION)
        Draw_List()
      EndIf
      
    Case #ARCADIA_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Arcadia=GetGadgetState(#ARCADIA_OPTION)
        Draw_List()
      EndIf
      
    Case #CZECH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Czech=GetGadgetState(#CZECH_OPTION)
        Draw_List()
      EndIf
      
    Case #DANISH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Danish=GetGadgetState(#DANISH_OPTION)
        Draw_List()
      EndIf
      
    Case #DUTCH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Dutch=GetGadgetState(#DUTCH_OPTION)
        Draw_List()
      EndIf
      
    Case #ENGLISH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_English=GetGadgetState(#ENGLISH_OPTION)
        Draw_List()
      EndIf
      
    Case #FINNISH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Finnish=GetGadgetState(#FINNISH_OPTION)
        Draw_List()
      EndIf
      
    Case #FRENCH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_French=GetGadgetState(#FRENCH_OPTION)
        Draw_List()
      EndIf
      
    Case #GERMAN_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_German=GetGadgetState(#GERMAN_OPTION)
        Draw_List()
      EndIf
      
    Case #GREEK_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Greek=GetGadgetState(#GREEK_OPTION)
        Draw_List()
      EndIf
      
    Case #ITALIAN_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Italian=GetGadgetState(#ITALIAN_OPTION)
        Draw_List()
      EndIf
      
    Case #MULTI_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_MULTI=GetGadgetState(#MULTI_OPTION)
        Draw_List()
      EndIf
      
    Case #POLISH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Polish=GetGadgetState(#POLISH_OPTION)
        Draw_List()
      EndIf
      
    Case #SPANISH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Spanish=GetGadgetState(#SPANISH_OPTION)
        Draw_List()
      EndIf
      
    Case #SWEDISH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Swedish=GetGadgetState(#SWEDISH_OPTION)
        Draw_List()
      EndIf
      
    Case #MT32_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_MT32=GetGadgetState(#MT32_OPTION)
        Draw_List()
      EndIf
      
    Case #NOVOICE_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_NoVoice=GetGadgetState(#NOVOICE_OPTION)
        Draw_List()
      EndIf
      
    Case #NOSPEECH_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_NoSpeech=GetGadgetState(#NOSPEECH_OPTION)
        Draw_List()
      EndIf
      
    Case #NOMUSIC_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_NoMusic=GetGadgetState(#NOMUSIC_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_1MB_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_1MB=GetGadgetState(#MEM_1MB_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_1MB_CHIP_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_1MBCHIP=GetGadgetState(#MEM_1MB_CHIP_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_8MB_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_8MB=GetGadgetState(#MEM_8MB_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_12MB_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_12MB=GetGadgetState(#MEM_12MB_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_15MB_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_1_5MB=GetGadgetState(#MEM_15MB_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_2MB_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_2MB=GetGadgetState(#MEM_2MB_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_512K_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_512K=GetGadgetState(#MEM_512K_OPTION)
        Draw_List()
      EndIf
      
    Case #MEM_512KB_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_512KB=GetGadgetState(#MEM_512KB_OPTION)
        Draw_List()
      EndIf
      
    Case #LOWMEM_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_LowMem=GetGadgetState(#LOWMEM_OPTION)
        Draw_List()
      EndIf
      
    Case #SLOWMEM_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_SlowMem=GetGadgetState(#SLOWMEM_OPTION)
        Draw_List()
      EndIf
      
    Case #DISK1_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_1Disk=GetGadgetState(#DISK1_OPTION)
        Draw_List()
      EndIf
      
    Case #DISK2_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_2Disk=GetGadgetState(#DISK2_OPTION)
        Draw_List()
      EndIf
      
    Case #DISK3_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_3Disk=GetGadgetState(#DISK3_OPTION)
        Draw_List()
      EndIf
      
    Case #DISK4_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_4Disk=GetGadgetState(#DISK4_OPTION)
        Draw_List()
      EndIf
      
    Case #NOINTRO_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_NoIntro=GetGadgetState(#NOINTRO_OPTION)
        Draw_List()
      EndIf
      
    Case #HIRES_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_HiRes=GetGadgetState(#HIRES_OPTION)
        Draw_List()
      EndIf
      
    Case #LORES_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_LoRes=GetGadgetState(#LORES_OPTION)
        Draw_List()
      EndIf
      
    Case #PRERELEASE_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_PreRelease=GetGadgetState(#PRERELEASE_OPTION)
        Draw_List()
      EndIf
      
    Case #PREVIEW_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Preview=GetGadgetState(#PREVIEW_OPTION)
        Draw_List()
      EndIf
      
    Case #GAMEDEMO_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_GameDemo=GetGadgetState(#GAMEDEMO_OPTION)
        Draw_List()
      EndIf
      
    Case #ENHANCED_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Enhanced=GetGadgetState(#ENHANCED_OPTION)
        Draw_List()
      EndIf
      
    Case #CENSORED_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_Censored=GetGadgetState(#CENSORED_OPTION)
        Draw_List()
      EndIf
      
    Case #UNCENSORED_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_UnCensored=GetGadgetState(#UNCENSORED_OPTION)
        Draw_List()
      EndIf
      
    Case #NOMOVIE_OPTION
      If EventType()=#PB_EventType_LeftClick
        Filter(0)\F_NoMovie=GetGadgetState(#NOMOVIE_OPTION)
        Draw_List()
      EndIf
      
  EndSelect
  
  If Event=#PB_Event_CloseWindow
    If EventWindow()=#MAIN_WINDOW : Break : EndIf
    If EventWindow()=#HELP_WINDOW : CloseWindow(#HELP_WINDOW) : EndIf
  EndIf
  
ForEver 

End
; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; CursorPosition = 4784
; FirstLine = 739
; Folding = AAAAAAAAAAg+
; Optimizer
; EnableThread
; EnableXP
; DPIAware
; UseIcon = boing.ico
; Executable = E:\WHDLoadTool\WHDLoadTool.exe
; CurrentDirectory = E:\WHDLoadTool\
; Compiler = PureBasic 6.04 LTS (Windows - x64)
; Debugger = Standalone
; Warnings = Display
; IncludeVersionInfo
; VersionField0 = 1.3.0.0
; VersionField1 = 1.3.0.0
; VersionField2 = MrV2K
; VersionField3 = WHDLoad Download Tool
; VersionField4 = 1.3
; VersionField5 = 1.3
; VersionField6 = WHDLoad Download Tool
; VersionField7 = WHDTool
; VersionField8 = WHDTool.exe
; VersionField9 = 2023 Paul Vince (MrV2k)
; VersionField10 = -
; VersionField11 = -
; VersionField12 = -
; VersionField13 = -
; VersionField14 = -
; VersionField15 = VOS_NT
; VersionField16 = VFT_APP
; VersionField17 = 041c Albanian
; VersionField21 = -
; VersionField22 = -
; VersionField23 = -