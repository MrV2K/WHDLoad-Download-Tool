;- ############### WHDLoad Download Tool Info
;
; Version 0.5a
;
; © 2021 / 2022 Paul Vince (MrV2k)
;
; https://easyemu.mameworld.info
;
; [ PB V5.7x/V6.x / 32Bit / 64Bit / Windows / DPI ]
;
; A downloader for Retroplay's WHDLoad Archive & More!
;
;- ############### Credits
;
; RSBasic for the PBEx_FTP library
; Conrad Fenech & Brian Lloyd for bug testing the connection issues
;
;- ############### Version Info
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
; VERSION INFO v0.5a 
;============================================
;
; 1. Fixed FTP fallback crashing the download window.
; 2. Added separate folder for Beta games.
;
;============================================
; To Do List
;============================================
;
; Fix bug in download procedure that prevents non unicode characters from being downloaded.
; FTP program still crashes main list sometimes
;
;============================================
;

EnableExplicit

;- ############### Console Stuff

Global ConsoleHandle

If OpenLibrary(0, "Kernel32.dll")
  Prototype GetConsoleWindow()
  Global GetConsoleWindow.GetConsoleWindow = GetFunction(0, "GetConsoleWindow")
  CloseLibrary(0)
EndIf

;- ############### FTP Stuff

Global PBEx_FTP

#PBEx_FTP_Version$ = "1.0.4.0"
#PBEx_FTP_Protocol_FTP = 1
#PBEx_FTP_Protocol_SFTP = 2
#PBEx_FTP_Protocol_FTPS_Implicit = 3
#PBEx_FTP_Protocol_FTPS_Explicit = 4

CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
  PBEx_FTP = OpenLibrary(#PB_Any, "PB.Ex_FTP_x86.dll")
CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
  PBEx_FTP = OpenLibrary(#PB_Any, "PB.Ex_FTP_x64.dll")
CompilerEndIf

If PBEx_FTP
  Prototype OpenFTPEx(ID, Protocol, ServerName.p-Unicode, Port, User.p-Unicode, Password.p-Unicode, Charset, ErrorOutput)
  Global OpenFTPEx.OpenFTPEx = GetFunction(PBEx_FTP, "OpenFTPEx")
  Prototype CloseFTPEx(ID, ErrorOutput)
  Global CloseFTPEx.CloseFTPEx = GetFunction(PBEx_FTP, "CloseFTPEx")
  Prototype CheckFTPConnectionEx(ID, ErrorOutput)
  Global CheckFTPConnectionEx.CheckFTPConnectionEx = GetFunction(PBEx_FTP, "CheckFTPConnectionEx")
  Prototype IsFTPEx(ID, ErrorOutput)
  Global IsFTPEx.IsFTPEx = GetFunction(PBEx_FTP, "IsFTPEx")
  Prototype ExamineFTPDirectoryEx(ID, ErrorOutput)
  Global ExamineFTPDirectoryEx.ExamineFTPDirectoryEx = GetFunction(PBEx_FTP, "ExamineFTPDirectoryEx")
  Prototype FinishFTPDirectoryEx(ID, ErrorOutput)
  Global FinishFTPDirectoryEx.FinishFTPDirectoryEx = GetFunction(PBEx_FTP, "FinishFTPDirectoryEx")
  Prototype NextFTPDirectoryEntryEx(ID, ErrorOutput)
  Global NextFTPDirectoryEntryEx.NextFTPDirectoryEntryEx = GetFunction(PBEx_FTP, "NextFTPDirectoryEntryEx")
  Prototype FTPDirectoryEntryNameEx(ID, Output, ErrorOutput)
  Global FTPDirectoryEntryNameEx.FTPDirectoryEntryNameEx = GetFunction(PBEx_FTP, "FTPDirectoryEntryNameEx")
  Prototype FTPDirectoryEntrySizeEx(ID, ErrorOutput)
  Global FTPDirectoryEntrySizeEx.FTPDirectoryEntrySizeEx = GetFunction(PBEx_FTP, "FTPDirectoryEntrySizeEx")
  Prototype FTPDirectoryEntryTypeEx(ID, ErrorOutput)
  Global FTPDirectoryEntryTypeEx.FTPDirectoryEntryTypeEx = GetFunction(PBEx_FTP, "FTPDirectoryEntryTypeEx")
  Prototype FTPDirectoryEntryDateEx(ID, ErrorOutput)
  Global FTPDirectoryEntryDateEx.FTPDirectoryEntryDateEx = GetFunction(PBEx_FTP, "FTPDirectoryEntryDateEx")
  Prototype FTPDirectoryEntryAttributesEx(ID, ErrorOutput)
  Global FTPDirectoryEntryAttributesEx.FTPDirectoryEntryAttributesEx = GetFunction(PBEx_FTP, "FTPDirectoryEntryAttributesEx")
  Prototype GetFTPDirectoryEx(ID, Output, ErrorOutput)
  Global GetFTPDirectoryEx.GetFTPDirectoryEx = GetFunction(PBEx_FTP, "GetFTPDirectoryEx")
  Prototype SetFTPDirectoryEx(ID, DirectoryName.p-Unicode, ErrorOutput)
  Global SetFTPDirectoryEx.SetFTPDirectoryEx = GetFunction(PBEx_FTP, "SetFTPDirectoryEx")
  Prototype CreateFTPDirectoryEx(ID, DirectoryName.p-Unicode, ErrorOutput)
  Global CreateFTPDirectoryEx.CreateFTPDirectoryEx = GetFunction(PBEx_FTP, "CreateFTPDirectoryEx")
  Prototype DeleteFTPDirectoryEx(ID, DirectoryName.p-Unicode, ErrorOutput)
  Global DeleteFTPDirectoryEx.DeleteFTPDirectoryEx = GetFunction(PBEx_FTP, "DeleteFTPDirectoryEx")
  Prototype DeleteFTPFileEx(ID, FileName.p-Unicode, ErrorOutput)
  Global DeleteFTPFileEx.DeleteFTPFileEx = GetFunction(PBEx_FTP, "DeleteFTPFileEx")
  Prototype RenameFTPFileEx(ID, FileName.p-Unicode, NewFileName.p-Unicode, ErrorOutput)
  Global RenameFTPFileEx.RenameFTPFileEx = GetFunction(PBEx_FTP, "RenameFTPFileEx")
  Prototype ReceiveFTPFileEx(ID, RemoteFileName.p-Unicode, FileName.p-Unicode,IsAsynchron,  ErrorOutput)
  Global ReceiveFTPFileEx.ReceiveFTPFileEx = GetFunction(PBEx_FTP, "ReceiveFTPFileEx")
  Prototype SendFTPFileEx(ID, FileName.p-Unicode, RemoteFileName.p-Unicode, IsAsynchron, ErrorOutput)
  Global SendFTPFileEx.SendFTPFileEx = GetFunction(PBEx_FTP, "SendFTPFileEx")
  Prototype FTPProgressEx(ID, PercentValue, TransferRate, EstimatedTime, ErrorOutput)
  Global FTPProgressEx.FTPProgressEx = GetFunction(PBEx_FTP, "FTPProgressEx")
Else
  MessageRequester("Error","Unable to load PBEx_FTP library.",#PB_MessageRequester_Error|#PB_MessageRequester_Ok)
  End  
EndIf

;- ############### Enumerations

Enumeration
  
  #FTP
  #REGEX
  
  #MAIN_WINDOW
  #MAIN_STATUS
  #MAIN_LIST
  #MAIN_FONT
  #MAIN_MENU
  #MAIN_FILTER_CONTAINER
  #MAIN_PATH_CONTAINER
  #MAIN_FTP_CONTAINER
  #MAIN_BUTTON_CONTAINER
    
  #DELETE_WINDOW
  #DELETE_LIST
  #DELETE_CANCEL_BUTTON
  #DELETE_DEL_BUTTON
  #DELETE_BACKUP_BUTTON
  #DELETE_OWN_BUTTON
  
  #HELP_WINDOW
  #HELP_EDITOR
  #HELP_FONT
  
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
    
  #SCAN_BUTTON
  #DOWNLOAD_BUTTON
  #CLEAR_LIST_BUTTON
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
  
  #FTP_PASS_STRING
  #FTP_USER_STRING
  #FTP_SERVER_STRING
  #FTP_FOLDER_STRING
  #FTP_PORT_STRING
  
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
  #WHD_SUBFOLDER_CHECK
  #WHD_0TOZ_CHECK
  
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
  #IMAGE_OPTION
  #FILES_OPTION
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
  #CHIP_OPTION
  #FAST_OPTION
  
EndEnumeration

;- ############### Structures

Structure Game_Data
  File_Name.s
  File_Path.s
  File_SubFolder.s
  File_Type.s
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
EndStructure

Structure Down_Data
  Down_Subfolder.s
  Down_Name.s
  Down_0toZ.s
  Down_FTP_Folder.s
EndStructure

Structure Own_Data
  own_file.s
  own_folder.s
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

Global Version.s="0.6a"

Global Path.s, Count.i, Folder.s
Global Home_Path.s=GetCurrentDirectory()
Global Temp_Folder.s=GetTemporaryDirectory()+"whd_temp\"
Global Dat_Folder.s=Home_Path+"Dats\"
Global List_Path.s=Home_Path+"Lists\"
Global First_Run.b=#False
Global Prefs_Name.s="default.prefs"
Global Lang_Bool.b=#True
Global Avail_Games.i=0
Global Old_Pos.i
Global Use_Subfolder.b=#False
Global Use_0toZ_Folder.b=#False

Global FTP_Folder.s
Global FTP_Server.s
Global FTP_User.s
Global FTP_Pass.s
Global FTP_Passive.b
Global FTP_Port.i

Global WHD_Folder.s
Global FTP_Game_Folder.s
Global WHD_Game_Folder.s
Global FTP_Demo_Folder.s
Global WHD_Demo_Folder.s
Global WHD_Beta_Folder.s
Global FTP_Beta_Folder.s
Global WHD_Mags_Folder.s
Global FTP_Mags_Folder.s

Global FCount.f

Global Event.l, Gadget.l, Type.l

Global Dim Filter.Filter_Data(0)

;- ############### Declares

Declare Draw_List()

;- ############### Macros

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
  InvalidateRect_(GadgetID(gadget), 0, 0)             ; invalidate control area
  UpdateWindow_(GadgetID(gadget))                     ; redraw invalidated area
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

Macro Update_File_List()
  
  ClearList(File_List())
  List_Files_Recursive(WHD_Folder,File_List(),"")  
  
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
  Path+" - ("+StrF(FCount,2)+" MB)"
  
  SetWindowTitle(#MAIN_WINDOW,Path)  
  
EndMacro

Macro PrintNCol(PText,PFCol,PBCol)
  ConsoleColor(PFCol,PBCol)
  PrintN(PText)
  ConsoleColor(7,0)
EndMacro

Macro Default_Settings()
  
  Prefs_Name="default.prefs"
  
  FTP_Folder="Retroplay WHDLoad Packs"
  FTP_Server="grandis.nu"
  FTP_User="ftp"
  FTP_Pass="amiga"
  FTP_Passive=#True
  FTP_Port=21
  
  WHD_Folder=Home_Path+"Download\"
  FTP_Game_Folder="Commodore_Amiga_-_WHDLoad_-_Games"
  WHD_Game_Folder="Games"
  FTP_Demo_Folder="Commodore_Amiga_-_WHDLoad_-_Demos"
  WHD_Demo_Folder="Demos"
  FTP_Beta_Folder="Commodore_Amiga_-_WHDLoad_-_Games_-_Beta_&_Unreleased"
  WHD_Beta_Folder="Beta"
  FTP_Mags_Folder="Commodore_Amiga_-_WHDLoad_-_Magazines"
  WHD_Mags_Folder="Magazines"
  
  Filter(0)\F_Games=#True
  Filter(0)\F_Demos=#True
  Filter(0)\F_Beta=#True
  Filter(0)\F_Mags=#True
  Filter(0)\F_AGA=#True
  Filter(0)\F_ECS=#True
  Filter(0)\F_NTSC=#True
  Filter(0)\F_PAL=#True
  Filter(0)\F_Amiga=#True
  Filter(0)\F_Arcadia=#True
  Filter(0)\F_CD32=#True
  Filter(0)\F_CDTV=#True
  Filter(0)\F_CDROM=#True
  Filter(0)\F_Files=#True
  Filter(0)\F_Image=#True
  Filter(0)\F_Chip=#True
  Filter(0)\F_Fast=#True
  
  Filter(0)\F_Czech=#True
  Filter(0)\F_Danish=#True
  Filter(0)\F_Dutch=#True
  Filter(0)\F_English=#True
  Filter(0)\F_Finnish=#True
  Filter(0)\F_French=#True
  Filter(0)\F_German=#True
  Filter(0)\F_Greek=#True
  Filter(0)\F_Italian=#True
  Filter(0)\F_Multi=#True
  Filter(0)\F_Polish=#True
  Filter(0)\F_Spanish=#True
  Filter(0)\F_Swedish=#True
  
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

;- ############### Update Gadgets

Procedure Set_List_Gadgets(bool)
  
  DisableGadget(#LIST_APPEND_BUTTON,bool)
  
EndProcedure

Procedure Disable_Gadgets(bool.b)
  
  Pause_Window(#MAIN_WINDOW)
  
  DisableGadget(#GAME_OPTION,bool)
  DisableGadget(#DEMO_OPTION,bool)
  DisableGadget(#BETA_OPTION,bool)
  DisableGadget(#MAGS_OPTION,bool)
  
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
  DisableGadget(#CLEAR_LIST_BUTTON,bool)
  DisableGadget(#RESET_BUTTON,bool)

  DisableGadget(#DOWNLOAD_BUTTON,bool)
  
  DisableGadget(#LIST_EDIT_BUTTON,bool)
  DisableGadget(#LIST_LOAD_BUTTON,bool)
  DisableGadget(#LIST_SAVE_BUTTON,bool)
    
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
    
    Debug Game_List()\File_Name
    
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

;- ############### File I/O

Procedure List_Files_Recursive(Dir.s, List Files.s(), Extension.s) ; <------> Adds All Files In A Folder Into The Supplied List
  
  Protected NewList Directories.s()
  
  Protected Folder_LIST
  
  ;ClearList(Directory_List())
  
  If Right(Dir, 1) <> "\"
    Dir + "\"
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
  
  ;ClearList(Directory_List())
  
  If Right(Dir, 1) <> "\"
    Dir + "\"
  EndIf
  
  If ExamineDirectory(Folder_LIST, Dir, Extension)
    While NextDirectoryEntry(Folder_LIST)
      Select DirectoryEntryType(Folder_LIST)
        Case #PB_DirectoryEntry_File
          AddElement(Files())
          Files()\R_File_Name = Dir + DirectoryEntryName(Folder_LIST) 
          Files()\R_File_Size = DirectoryEntrySize(Folder_LIST)
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
  
  ProcedureReturn f_return
  
EndProcedure

Procedure Set_Filter_Gadgets()
  
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
  
  ForEach Game_List()
    If Use_Subfolder=#False
      File_Map(WHD_Folder+Game_List()\File_Name)=ListIndex(Game_List())
    EndIf
    If Use_Subfolder=#True
      If Use_0toZ_Folder=#True
        If Game_List()\File_Type="Game" : File_Map(WHD_Folder+WHD_Game_Folder+"\"+Game_List()\File_SubFolder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) :EndIf
        If Game_List()\File_Type="Demo" : File_Map(WHD_Folder+WHD_Demo_Folder+"\"+Game_List()\File_SubFolder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) :EndIf
        If Game_List()\File_Type="Magazine" : File_Map(WHD_Folder+WHD_Mags_Folder+"\"+Game_List()\File_SubFolder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) :EndIf
      Else
        If Game_List()\File_Type="Game" : File_Map(WHD_Folder+WHD_Game_Folder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) :EndIf
        If Game_List()\File_Type="Demo" : File_Map(WHD_Folder+WHD_Demo_Folder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) :EndIf
        If Game_List()\File_Type="Magazine" : File_Map(WHD_Folder+WHD_Mags_Folder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) :EndIf
      EndIf
    EndIf  
  Next
  
  ForEach Game_List()
    Game_List()\File_Available=#False
    Game_List()\File_Filtered=#False  
    If Game_List()\File_Ignore=#True : Game_List()\File_Filtered=#True : EndIf
    If Filter(0)\F_Games=#False And Game_List()\File_Type="Game" : Game_List()\File_Filtered=#True : EndIf   
    If Filter(0)\F_Demos=#False And Game_List()\File_Type="Demo" : Game_List()\File_Filtered=#True : EndIf 
    If Filter(0)\F_Mags=#False And Game_List()\File_Type="Magazine" : Game_List()\File_Filtered=#True : EndIf 
    If Filter(0)\F_Beta=#False And Game_List()\File_BETA=#True : Game_List()\File_Filtered=#True : EndIf 
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
  Next
  
  Avail_Games=0  
  
  ForEach File_List()  
    Count=CountString(File_List(),"\")
    If FindMapElement(File_Map(),File_List())
      SelectElement(Game_List(),File_Map())
      Game_List()\File_Available=#True
      Avail_Games+1
      Game_List()\File_Path=GetPathPart(File_List())
    EndIf
  Next
  
  FreeMap(File_Map())
  
  ClearList(Filtered_List())

  ForEach Game_List()
    If Game_List()\File_Filtered=#False : AddElement(Filtered_List()) : Filtered_List()=ListIndex(Game_List()) : EndIf
    If Game_List()\File_Filtered=#True And Game_List()\File_Extra=#True : AddElement(Filtered_List()) : Filtered_List()=ListIndex(Game_List()) : EndIf
  Next
  
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
  WritePreferenceInteger("FTP_Port",FTP_Port)
  WritePreferenceString("FTP_Folder",FTP_Folder)
  WritePreferenceString("FTP_Game_Folder",FTP_Game_Folder)
  WritePreferenceString("FTP_Demo_Folder",FTP_Demo_Folder)
  WritePreferenceString("FTP_Beta_Folder",FTP_Beta_Folder)
  WritePreferenceString("FTP_Magazine_Folder",FTP_Mags_Folder)
  
  PreferenceComment("")
  
  PreferenceGroup("Paths")
  WritePreferenceString("WHD_Path",WHD_Folder)
  WritePreferenceString("WHD_Game",WHD_Game_Folder)
  WritePreferenceString("WHD_Demo",WHD_Demo_Folder)
  WritePreferenceString("WHD_Beta",WHD_Beta_Folder)
  WritePreferenceString("WHD_Mags",WHD_Mags_Folder)
  WritePreferenceInteger("WHD_Subfolder",Use_Subfolder)
  WritePreferenceInteger("WHD_0toZ",Use_0toZ_Folder)
  
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
  
  ClosePreferences()
  
EndProcedure

Procedure Load_Prefs(p_path.s)
  
  If OpenPreferences(p_path) 
    
    Prefs_Name=GetFilePart(p_path)
    
    PreferenceGroup("FTP")
    FTP_User=ReadPreferenceString("FTP_User",FTP_User)
    FTP_Pass=ReadPreferenceString("FTP_Pass",FTP_Pass)
    FTP_Server=ReadPreferenceString("FTP_Server",FTP_Server)
    FTP_Port=ReadPreferenceInteger("FTP_Port",FTP_Port)
    FTP_Folder=ReadPreferenceString("FTP_Folder",FTP_Folder)
    FTP_Game_Folder=ReadPreferenceString("FTP_Game_Folder",FTP_Game_Folder)
    FTP_Demo_Folder=ReadPreferenceString("FTP_Demo_Folder",FTP_Demo_Folder)
    FTP_Beta_Folder=ReadPreferenceString("FTP_Beta_Folder",FTP_Beta_Folder)
    FTP_Mags_Folder=ReadPreferenceString("FTP_Magazine_Folder",FTP_Mags_Folder)
    
    PreferenceGroup("Paths")
    WHD_Folder=ReadPreferenceString("WHD_Path",WHD_Folder)
    WHD_Game_Folder=ReadPreferenceString("WHD_Game",WHD_Game_Folder)
    WHD_Demo_Folder=ReadPreferenceString("WHD_Demo",WHD_Demo_Folder)
    WHD_Beta_Folder=ReadPreferenceString("WHD_Beta",WHD_Beta_Folder)
    WHD_Mags_Folder=ReadPreferenceString("WHD_Mags",WHD_Mags_Folder)
    Use_Subfolder=ReadPreferenceInteger("WHD_Subfolder",Use_Subfolder)
    Use_0toZ_Folder=ReadPreferenceInteger("WHD_0toZ",Use_0toZ_Folder)
    
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
                Game_List()\File_Name=attribval 
                Game_List()\File_SubFolder=Folder
                
              Case "size"
                Game_List()\File_Size=Val(attribval)
                
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
  Protected file.l, text$
  
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
      file=ReadFile(#PB_Any,path)
      If file
        While Not Eof(file)
          text$=ReadString(file)
          If Left(text$,1)<>";"
            If FindMapElement(LHA_Files(), text$)
              AddElement(List_Games())
              List_Games()=MapKey(LHA_Files())
            EndIf
          EndIf
        Wend
        FlushFileBuffers(file)
        CloseFile(file)
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
  
  Protected file.l
  
  Path=OpenFileRequester("Save List File",List_Path,"List File (*.lst)|*.lst",0)
  If Path<>""
    If GetExtensionPart(path)<>"lst" : path+".lst" : EndIf 
    If FileSize(Path)<>-1
      If MessageRequester("Warning","Overwrite file?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_No
        Goto Proc_Exit2:
      EndIf
    EndIf
    file=CreateFile(#PB_Any,Path)
    If file
      ForEach Filtered_List()
        SelectElement(Game_List(),Filtered_List())
        WriteStringN(file,Game_List()\File_Name)
      Next
      CloseFile(file)
    Else
      MessageRequester("Error","Cannot Create File!",#PB_MessageRequester_Error|#PB_MessageRequester_Ok)
    EndIf
  EndIf
  
  Proc_Exit2:
  
EndProcedure

Procedure Append_List()
  
  Protected file.l, text$
  
  Protected NewMap LHA_Files.i()
  
  ForEach Game_List()
    LHA_Files(Game_List()\File_Name)=ListIndex(Game_List())
  Next
  
  path=OpenFileRequester("Append List File",List_Path,"List File (*.lst)|*.lst",0)
  If path<>""
    file=ReadFile(#PB_Any,path)
    If file
      While Not Eof(file)
        text$=ReadString(file)
        If Left(text$,1)<>";"
          If FindMapElement(LHA_Files(), text$)
            AddElement(List_Games())
            List_Games()=MapKey(LHA_Files())
          EndIf
        EndIf
      Wend
      FlushFileBuffers(file)
      CloseFile(file)
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

Procedure Scan_FTP()
  
  Protected NewList Dat_List.s() ; Zipped DAT files on FTP.
  Protected NewList XML_List.s() ; DAT files in each zip.
  Protected NewList Scan_List.s()
  Protected NewMap File_Map.s()
  
  Protected oldgadgetlist.i, prog_path.s
  Protected new_dat.b=#False
  Protected dat_archive.i, xml_file.i    
  Protected cd_file.i, output.s, path2.s 
  Protected UM_Program.i, time.i, name$
  
  Protected ftp_log.s
  
  Protected result.l
  
  Protected ErrorOutput$ = Space(128)
  Protected FileName$ = Space(#MAX_PATH)
  
  ClearList(Down_List())
  ClearList(List_Games())
  
  CreateDirectory(Temp_Folder)
  
  Protected ConsoleTitle$, system_menu.l
      
  ConsoleTitle$="FTP Download (Press 'Esc' to cancel download.)"
      
  OpenConsole(ConsoleTitle$)
      
  ConsoleHandle = GetConsoleWindow()
  DeleteMenu_(GetSystemMenu_(ConsoleHandle, #False), 6, #MF_BYPOSITION)
  SendMessage_(ConsoleHandle, #WM_NCPAINT, 1, 0)
  
  If OpenFTPEx(#FTP,#PBEx_FTP_Protocol_FTP,FTP_Server,FTP_Port,FTP_User,FTP_Pass,#PB_Ascii,@ErrorOutput$)
    PrintNCol("Checking for update...",11,0)
    PrintN("")
    PrintNCol("Connected to "+ftp_server+" on port:"+Str(FTP_Port),2,0)
    ftp_log="Connected to "+ftp_server+" on port:"+Str(FTP_Port)+#CRLF$
    Count=0
    
    Repeat
      result=SetFTPDirectoryEx(#FTP,FTP_Folder,@ErrorOutput$)
      PrintN("")
      PrintNCol("Opening FTP Folder - "+FTP_Folder+" Attempt:"+Str(Count),9,0)
      ftp_log+"Opening FTP Folder - "+FTP_Folder+" Attempt:"+Str(Count)+#CRLF$
      Delay(100)
      Count+1
      GetFTPDirectoryEx(#FTP,@FileName$,@ErrorOutput$)
    Until RemoveString(FileName$,"/")=FTP_Folder Or Count=100
    
    If result>-1   
      If ExamineFTPDirectoryEx(#FTP,@ErrorOutput$)
        PrintN("")
        PrintNCol("Reading FTP Folder - "+FTP_Folder,13,0)
        ftp_log+"Reading FTP Folder - "+FTP_Folder+#CRLF$
        Delay(100)
        While NextFTPDirectoryEntryEx(#FTP,@ErrorOutput$)
          If FTPDirectoryEntrySizeEx(#FTP,@ErrorOutput$)>0
            If FTPDirectoryEntryTypeEx(#FTP,@ErrorOutput$)=#PB_FTP_File
              FTPDirectoryEntryNameEx(#FTP,@FileName$,@ErrorOutput$)
              If FindString(FileName$,"Commodore Amiga - WHDLoad - Games") Or FindString(FileName$,"Commodore Amiga - WHDLoad - Demos") Or FindString(FileName$,"Commodore Amiga - WHDLoad - Magazines")
                If FTPDirectoryEntrySizeEx(#FTP,@ErrorOutput$)>0
                  If FileSize(Dat_Folder)<>-2 : CreateDirectory(Dat_Folder) : EndIf
                  FTPDirectoryEntryNameEx(#FTP,@FileName$,@ErrorOutput$)
                  If FileSize(Dat_Folder+FileName$)=-1 ; If the dat file doesn't exist, download it
                    ReceiveFTPFileEx(#FTP,FileName$,Dat_Folder+FileName$,#False,@ErrorOutput$)
                    PrintN("Downloading : "+FileName$)
                    ftp_log+"Downloading : "+FileName$+#CRLF$
                    new_dat=#True
                  EndIf
                  AddElement(Dat_List())
                  Dat_List()=Dat_Folder+FileName$ ; Add file to downloaded file list
                EndIf
              EndIf
            EndIf
          EndIf
        Wend
        FinishFTPDirectoryEx(#FTP,@ErrorOutput$)
        SetFTPDirectoryEx(#FTP,"/",@ErrorOutput$) 
      EndIf
    Else
      PrintN("")
      PrintNCol("Error - Cannot find FTP folder!",4,0)
    EndIf
    CloseFTPEx(#FTP,@ErrorOutput$)  
    PrintN("")
    PrintNCol("FTP connection closed.",14,0)
    ftp_log+"FTP connection closed."+#CRLF$
  Else
    PrintN("")
    PrintNCol("Error: Cannot connect to FTP!",4,0)
    Delay(2000)
    Goto Proc_Exit
  EndIf
  
  If ListSize(Dat_List())=0
    PrintNCol("Scanning local dat folder.",9,0)
    List_Files_Recursive(Dat_Folder,Dat_List(),"*.zip")
  EndIf
    
  If ListSize(Dat_List())>0  
    
    List_Files_Recursive(Dat_Folder,Scan_List(),"*.zip") ; Scan all the files in the dat folder
    
    PrintN("")
    PrintNCol("Processing dat files...",11,0)
    
    SetCurrentDirectory(Dat_Folder)     
    
    ForEach Dat_List() ; Load the datfiles into a map
      File_Map(Dat_List())=""
    Next
    
    ForEach File_List() ; compare the file list to the dat folder map and delete anything not needed
      If Not FindMapElement(File_Map(),Scan_List()) : DeleteFile(Scan_List(),#PB_FileSystem_Force) : EndIf
    Next
    
    FreeMap(File_Map())
    ClearList(Scan_List())

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
      
      If FindString(XML_List(), "Demos") : path="Demo" : EndIf
      If FindString(XML_List(), "Games") : path="Game" : EndIf
      If FindString(XML_List(), "Beta") : path="Beta" : EndIf
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
    
    Update_File_List()   
    
  Else
    PrintN("")
    PrintNCol("Error - Nothing downloaded! Please check the FTP status.",4,0)
    ftp_log+"Error - Nothing downloaded! Please check the FTP status."+#CRLF$
    Delay(2000)
    
  EndIf

  Proc_Exit:
  
  Protected log_file.l
  
  If CreateFile(log_file, Home_Path+"ftp.log")
    WriteString(log_file, Trim(ErrorOutput$))
    WriteString(log_file, ftp_log)
    CloseFile(log_file)  
  EndIf
  
  Delay(1500)  
  
  CloseConsole()  
  
  SetCurrentDirectory(home_path)  

EndProcedure

Procedure Download_FTP()
  
  Protected oldgadgetlist.i, down_path.s, log_file.i
  Protected ftp_script.s, ftp_string.s, ftp_file.l, ftp_batch.s
  
  Protected ftp_log.s=""
  Protected log_path.s=Home_Path+"ftp.log"
  Protected conHandle.l
  
  Protected ErrorOutput$ = Space(128)
  Protected FileName$ = Space(#MAX_PATH)
  Protected Keypressed$
  
  Protected NewList Fail_List.s()
  
  ClearList(Down_List())
  
  ForEach Filtered_List()
    SelectElement(Game_List(),Filtered_List())
    If Game_List()\File_Available<>#True ; if file not available locally add to downlist
      AddElement(Down_List())
      Down_List()\Down_Name=Game_List()\File_Name
      Down_List()\Down_0toZ=Game_List()\File_SubFolder
      If Game_List()\File_Type="Game" And Game_List()\File_BETA<>#True
        Down_List()\Down_Subfolder=WHD_Game_Folder+"\"
        Down_List()\Down_FTP_Folder=FTP_Game_Folder
      EndIf 
      If Game_List()\File_Type="Game" And Game_List()\File_BETA=#True
        Down_List()\Down_Subfolder=WHD_Beta_Folder+"\"
        Down_List()\Down_FTP_Folder=FTP_Beta_Folder
      EndIf 
      If Game_List()\File_Type="Demo" 
        Down_List()\Down_Subfolder=WHD_Demo_Folder+"\"
        Down_List()\Down_FTP_Folder=FTP_Demo_Folder
      EndIf          
      If Game_List()\File_Type="Magazine" 
        Down_List()\Down_Subfolder=WHD_Mags_Folder+"\"
        Down_List()\Down_FTP_Folder=FTP_Mags_Folder
      EndIf 
    EndIf
  Next   
    
  Protected cancel.b
  Protected path$=""
    
  If ListSize(Down_List())>0   
    
    If MessageRequester("Warning","Download "+Str(ListSize(Down_List()))+" Files?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes
      
      If FileSize(log_path)>-1 : DeleteFile(log_path) : EndIf
      If FileSize(WHD_Folder)<>-2 : CreateDirectory(WHD_Folder) : EndIf
      
      Protected ConsoleTitle$, system_menu.l
      
      ConsoleTitle$="FTP Download (Press 'Esc' to cancel download.)"
      
      OpenConsole(ConsoleTitle$)
      
      ConsoleHandle = GetConsoleWindow()
      DeleteMenu_(GetSystemMenu_(ConsoleHandle, #False), 6, #MF_BYPOSITION)
      SendMessage_(ConsoleHandle, #WM_NCPAINT, 1, 0)
      
      If OpenFTPEx(#FTP,#PBEx_FTP_Protocol_FTP,FTP_Server,FTP_Port,FTP_User,FTP_Pass,#PB_Ascii,@ErrorOutput$)
        PrintNCol("Connected to "+ftp_server+" on port:"+Str(ftp_port),2,0)
        ftp_log+"Connected to "+ftp_server+" on port:"+Str(ftp_port)+#CRLF$
        If CreateFile(log_file, Home_Path+"ftp.log")
          WriteString(log_file, Trim(ErrorOutput$))
          WriteString(log_file, ftp_log)
          CloseFile(log_file)  
        EndIf
        If SetFTPDirectoryEx(#FTP,FTP_Folder,@ErrorOutput$) 
          Delay(50)
          PrintN("")
          PrintNCol("Opening FTP Folder - "+FTP_Folder,9,0)
          PrintN("")
          ForEach Down_List() 
            Debug Down_List()\Down_Name
            SetFTPDirectoryEx(#FTP,Down_List()\Down_FTP_Folder,@ErrorOutput$) ; Change to FTP folder
            Delay(50)
            SetFTPDirectoryEx(#FTP,Down_List()\Down_0toZ,@ErrorOutput$) ; Change to subfolder
            Delay(50)
            If Use_Subfolder
              CreateDirectory(WHD_Folder+Down_List()\Down_Subfolder)
              down_path=WHD_Folder+Down_List()\Down_Subfolder+"\"+Down_List()\Down_Name
              If Use_0toZ_Folder 
                CreateDirectory(WHD_Folder+Down_List()\Down_Subfolder+Down_List()\Down_0toZ) 
                down_path=WHD_Folder+Down_List()\Down_Subfolder+Down_List()\Down_0toZ+"\"+Down_List()\Down_Name
              EndIf
            Else
              down_path=WHD_Folder+Down_List()\Down_Name
            EndIf   
            
            If ReceiveFTPFileEx(#FTP,Down_List()\Down_Name,down_path,#False,@ErrorOutput$)  
              If FileSize(down_path)>0
                PrintN("Downloading ("+Str(ListIndex(Down_List()))+" of "+Str(ListSize(Down_List()))+") - "+Down_List()\Down_Name+" ("+Str(FileSize(down_path))+" bytes)")
                ftp_log+"Downloaded - " + Down_List()\Down_Name+" ("+Str(FileSize(down_path))+" bytes)"+#CRLF$    
              Else
                ftp_log+"No data received for file "+Down_List()\Down_Name+". Retrying DOS FTP after other downloads..."+#CRLF$
                PrintNCol("No data received for file " + Down_List()\Down_Name+". Retrying with DOS FTP after other downloads...",4,0)
                DeleteFile(down_path)
                AddElement(Fail_List()) 
                GetFTPDirectoryEx(#FTP,@path$,@ErrorOutput$)
                Fail_List()=Trim(path$)+"/"+Down_List()\Down_Name
                Debug Fail_List()
              EndIf
            Else
              ftp_log+"Error downloading "+Down_List()\Down_Name+#CRLF$
              PrintNCol("Error downloading : " + Down_List()\Down_Name,4,0)   
            EndIf 
            FinishFTPDirectoryEx(#FTP,@ErrorOutput$)
            SetFTPDirectoryEx(#FTP,"/",@ErrorOutput$)
            SetFTPDirectoryEx(#FTP,ftp_Folder,@ErrorOutput$)   
            If OpenFile(log_file, Home_Path+"ftp.log")
              WriteString(log_file, Trim(ErrorOutput$))
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
          CloseFTPEx(#FTP,@ErrorOutput$)
          PrintN("")
          PrintNCol("FTP connection closed.",14,0)
          ftp_log+"FTP connection closed."+#CRLF$
        EndIf
        
        If cancel<>#True
            PrintN("")
            PrintNCol("Download complete.",2,0)
            ftp_log+"Download complete."+#CRLF$
          EndIf
          
        PrintN("")
        PrintNCol("Please donate to the Turran FTP. The link is on the 'About' window.",2,0)
        ftp_log+"Please donate to the Turran FTP.."+#CRLF$
        Delay(3000)
      Else
        PrintNCol("Error: Cannot connect to FTP.",4,0)
        ftp_log+"Error: Cannot connect to FTP."+#CRLF$
        Delay(3000)
        Goto Proc_Exit
      EndIf 

      If ListSize(Fail_List())>0    
        CloseConsole()
        OpenConsole("Retrying failed downloads")
        PrintNCol("Retrying failed downloads using DOS FTP command."+FTP_Folder,9,0)
        PrintN("")

        ForEach Fail_List() 
          ftp_batch="CD "+WHD_Folder+GetPathPart(Fail_List())+#CRLF$
          ftp_batch+"ftp.exe -v -s:ftp.txt"
          ftp_string=Fail_List()
          ftp_script="open grandis.nu"+#CRLF$
          ftp_script+"ftp"+#CRLF$
          ftp_script+"amiga"+#CRLF$
          ftp_script+"binary"+#CRLF$
          ftp_script+"cd "+StringField(ftp_string,2,"/")+#CRLF$
          ftp_script+"cd "+StringField(ftp_string,3,"/")+#CRLF$
          ftp_script+"cd "+StringField(ftp_string,4,"/")+#CRLF$
          ftp_script+"get "+StringField(ftp_string,5,"/")+#CRLF$
          ftp_script+"close"+#CRLF$
          ftp_script+"quit"+#CRLF$
          SetCurrentDirectory(GetPathPart(down_path))
          If CreateFile(ftp_file,"ftp.txt")
            WriteStringN(ftp_file,ftp_script)
            FlushFileBuffers(ftp_file)
            CloseFile(ftp_file)
          EndIf
          If CreateFile(ftp_file,"ftp.bat")
            WriteStringN(ftp_file,ftp_batch)
            FlushFileBuffers(ftp_file)
            CloseFile(ftp_file)
          EndIf
          RunProgram("cmd","/c ftp.bat",GetPathPart(down_path),#PB_Program_Wait|#PB_Program_Ascii)
          Delay(100)
          DeleteFile("ftp.txt")
          DeleteFile("ftp.bat")
          If FileSize(down_path)>0 
            ftp_log+"Downloaded via DOS FTP - "+GetFilePart(Fail_List())+" ("+Str(FileSize(down_path))+" bytes)"+#CRLF$
            PrintN("Downloaded via DOS FTP - " +GetFilePart(Fail_List())+" ("+Str(FileSize(down_path))+" bytes)")
          EndIf
        Next
        Delay(1000) 
      EndIf
      
      Proc_Exit:
      
      CloseConsole()
      
      If CreateFile(log_file, Home_Path+"ftp.log")
        WriteString(log_file, Trim(ErrorOutput$))
        WriteString(log_file, ftp_log)
        CloseFile(log_file)  
      EndIf
            
    EndIf 
    
  Else
    
    MessageRequester("Information","Nothing to download!",#PB_MessageRequester_Ok|#PB_MessageRequester_Info)
    
  EndIf
  
  SetCurrentDirectory(Home_Path)
  
  ClearList(Down_List())
  FreeList(Fail_List())
  
EndProcedure

Procedure Update_Files()
  
  ; Base clean files on subfolder selections.
  
  Protected oldgadgetlist.i, base_count.i
  
  Protected NewMap Delete_Map.i()
  Protected NewMap Archive_Map.s()
  Protected NewList LHA_Files.s()
  Protected NewList LZX_Files.s()
  Protected NewList Own_Files.Own_Data()
  Protected NewList Zero_Files.s()
  
  ClearList(Delete_List())
  
  ForEach Filtered_List()
    SelectElement(Game_List(),Filtered_List())
    If Game_List()\File_Available 
      If Use_Subfolder=#False: Delete_Map(Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
      If Use_Subfolder=#True
        If Use_0toZ_Folder=#False 
          If Game_List()\File_Type="Game" : Delete_Map(WHD_Game_Folder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
          If Game_List()\File_Type="Demo" : Delete_Map(WHD_Demo_Folder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
          If Game_List()\File_Type="Magazine" : Delete_Map(WHD_Mags_Folder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
        EndIf
        If Use_0toZ_Folder=#True
          If Game_List()\File_Type="Game" : Delete_Map(WHD_Game_Folder+"\"+Game_List()\File_SubFolder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
          If Game_List()\File_Type="Demo" : Delete_Map(WHD_Demo_Folder+"\"+Game_List()\File_SubFolder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
          If Game_List()\File_Type="Magazine" : Delete_Map(WHD_Mags_Folder+"\"+Game_List()\File_SubFolder+"\"+Game_List()\File_Name)=ListIndex(Game_List()) : EndIf
        EndIf
      EndIf
    EndIf
  Next  
  
  base_count=CountString(WHD_Folder,"\")
  
  ForEach File_List()
    
    If Use_Subfolder=#False 
      Count=base_count
      If Not FindMapElement(Delete_Map(),StringField(File_List(),Count+1,"\"))
        AddElement(Delete_List())
        Delete_List()=File_List()
      EndIf
    EndIf
    If Use_Subfolder=#True And Use_0toZ_Folder=#False 
      Count=base_count+1
      If Not FindMapElement(Delete_Map(),StringField(File_List(),Count,"\")+"\"+StringField(File_List(),Count+1,"\"))
        AddElement(Delete_List())
        Delete_List()=File_List()
      EndIf
    EndIf
    If Use_Subfolder=#True And Use_0toZ_Folder=#True
      Count=base_count+2
      If Not FindMapElement(Delete_Map(),StringField(File_List(),Count-1,"\")+"\"+StringField(File_List(),Count,"\")+"\"+StringField(File_List(),Count+1,"\"))    
        AddElement(Delete_List())
        Delete_List()=File_List()
      EndIf
    EndIf
  Next
  
  List_Files_Recursive_Size(WHD_Folder,File_List_Size(),"*.*")
  
  ForEach File_List_Size()
    If File_List_Size()\R_File_Size=0
      AddElement(Zero_Files())
      Zero_Files()=File_List_Size()\R_File_Name
    EndIf
  Next
  
  ClearList(File_List_Size())
  
  OpenWindow(#DELETE_WINDOW,0,0,385,400,"Remove Un-Needed Files", #PB_Window_Tool|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  
  oldgadgetlist=UseGadgetList(WindowID(#DELETE_WINDOW))
  
  DisableWindow(#MAIN_WINDOW,#True)
  
  Pause_Window(#DELETE_WINDOW)
  
  TreeGadget(#DELETE_LIST,0,0,385,360)
  ButtonGadget(#DELETE_DEL_BUTTON,5,365,90,30,"Delete")
  ButtonGadget(#DELETE_BACKUP_BUTTON,100,365,90,30,"Back Up")
  ButtonGadget(#DELETE_OWN_BUTTON,195,365,90,30,"Own Files")
  ButtonGadget(#DELETE_CANCEL_BUTTON,290,365,90,30,"Cancel")
  
  Pause_Gadget(#DELETE_LIST)
  
  If ListSize(Delete_List())>0
    ForEach Delete_List()
      AddGadgetItem(#DELETE_LIST,-1,Delete_List(),0,0)
      AddGadgetItem(#DELETE_LIST,-1,"No longer needed!",0,1)
      SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
    Next
  EndIf
  
  If ListSize(Zero_Files())>0
    ForEach Zero_Files()
      AddGadgetItem(#DELETE_LIST,-1,Zero_Files(),0,0)
      AddGadgetItem(#DELETE_LIST,-1,"0kb File!",0,1)
      SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
    Next
  EndIf
  
  MergeLists(Zero_Files(),Delete_List())
  
  Resume_Gadget(#DELETE_LIST)
  
  If ListSize(Delete_List())=0
    DisableGadget(#DELETE_BACKUP_BUTTON,#True)
    DisableGadget(#DELETE_DEL_BUTTON,#True)
  EndIf
  
  TreeExpandAllItems(#DELETE_LIST)
  
  SetWindowTitle(#DELETE_WINDOW,"Remove Un-Needed Files ("+Str(ListSize(Delete_List()))+" files)")
  
  Resume_Window(#DELETE_WINDOW)
      
  Repeat
    
    Event=WaitWindowEvent()
    Gadget=EventGadget()
    
    Select Gadget
        
      Case #DELETE_CANCEL_BUTTON : Break
        
      Case #DELETE_DEL_BUTTON
        If ListSize(Delete_List())>0
          If MessageRequester("Warning","Delete listed files?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
            ForEach Delete_List() 
              DeleteFile(Delete_List())
            Next
            Break
          EndIf         
        Else
          MessageRequester("Information","Nothing to delete.",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
        EndIf
        
      Case #DELETE_BACKUP_BUTTON
        If ListSize(Delete_List())>0
          If MessageRequester("Warning","Back up listed files?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
            ForEach Delete_List()
              Count=CountString(Delete_List(),"\")
              Path=Home_Path+"Backup"
              CreateDirectory(Path)
              CopyFile(Delete_List(),Path+"\"+GetFilePart(Delete_List()))
              DeleteFile(Delete_List())
            Next
            Break
          EndIf
        Else
          MessageRequester("Information","Nothing to move.",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
        EndIf
        
      Case #DELETE_OWN_BUTTON
        ClearList(Delete_List())
        Path=PathRequester("Select a folder to scan.",Home_Path)
        If Path<>""
          List_Files_Recursive(Path,LHA_Files(),"*.*")
          ForEach LHA_Files()
            If GetExtensionPart(LHA_Files())="lha" Or GetExtensionPart(LHA_Files())="lzx"
              AddElement(Own_Files())
              Own_Files()\own_file=GetFilePart(LHA_Files())
              Own_Files()\own_folder=GetPathPart(LHA_Files())
            EndIf
          Next
          FreeList(LHA_Files())
          FreeList(LZX_Files())
          ForEach Game_List() ; Create a map of all the filenames in the database
            Archive_Map(Game_List()\File_Name)=""
          Next
          ForEach Own_Files() ; Compare the filenames in the own list and add any to the delete list
            If Not FindMapElement(Archive_Map(),Own_Files()\own_file)
              AddElement(Delete_List())
              Delete_List()=Own_Files()\own_folder+Own_Files()\own_file
              Debug Delete_List()
            EndIf
          Next
          ClearGadgetItems(#DELETE_LIST)
          If ListSize(Delete_List())>0
            ForEach Delete_List()
              AddGadgetItem(#DELETE_LIST,-1,Delete_List(),0,0)
              AddGadgetItem(#DELETE_LIST,-1,"No longer needed!",0,1)
              SetGadgetItemColor(#DELETE_LIST,-1,#PB_Gadget_FrontColor,#Red,1)
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
  
  FreeList(Own_Files())
  FreeList(Zero_Files())
  FreeMap(Delete_Map())
  FreeMap(Archive_Map())
  ClearList(Delete_List())
  
  DisableWindow(#MAIN_WINDOW,#False)
  
  For count = 1 To 3
    ForEach Directory_List()
      DeleteDirectorySafely(Directory_List())
    Next
  Next
  
EndProcedure

Procedure Scrape_Data()
  
  ForEach Game_List()  
    Game_List()\File_Amiga=#True
    Game_List()\File_Ignore=#False
    If Game_List()\File_Type="Beta" : Game_List()\File_Type="Game" : Game_List()\File_BETA=#True :  Game_List()\File_Amiga=#False : EndIf  
    If FindString(LCase(Game_List()\File_Name),"arcadia") : Game_List()\File_Arcadia=#True : Game_List()\File_Amiga=#False : EndIf
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
  
  SortStructuredList(Game_List(),#PB_Sort_Ascending|#PB_Sort_NoCase,OffsetOf(Game_Data\File_Name),TypeOf(Game_Data\File_Name))
  
EndProcedure

;- ############### Windows & Gadgets

Procedure File_Viewer(file.s)
  
  Protected f_window, f_gadget
   
  OpenWindow(f_window,0,0,700,600,"File Viewer ("+GetFilePart(file)+")",#PB_Window_SystemMenu|#PB_Window_SizeGadget|#PB_Window_MinimizeGadget|#PB_Window_MaximizeGadget|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  Pause_Window(f_window)
  WebGadget(f_gadget,0,0,700,600,"file://"+file)
  SetActiveGadget(f_gadget)
  Resume_Window(f_window)
  
  proc_exit:
  
EndProcedure 

Procedure Draw_List()
    
  Pause_Gadget(#MAIN_LIST)
  
  ClearGadgetItems(#MAIN_LIST)
  
  Filter_List()

  ForEach Filtered_List()
    Count=ListIndex(Filtered_List())
    SelectElement(Game_List(),Filtered_List())
    AddGadgetItem(#MAIN_LIST,-1,Game_List()\File_Name)
    If Game_List()\File_Available=#True : SetGadgetItemColor(#MAIN_LIST,Count,#PB_Gadget_FrontColor,$00008800) : EndIf 
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
    SetGadgetItemAttribute(#MAIN_LIST,1,#PB_ListIcon_ColumnWidth,422)
  Else
    SetGadgetItemAttribute(#MAIN_LIST,1,#PB_ListIcon_ColumnWidth,440)
  EndIf
  
EndProcedure

Procedure About_Window()
  
  Protected oldgadgetlist.i, output$
  
  OpenWindow(#ABOUT_WINDOW,0,0,340,300,"About", #PB_Window_SystemMenu|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  
  SetWindowColor(#ABOUT_WINDOW,#White)
  
  oldgadgetlist=UseGadgetList(WindowID(#ABOUT_WINDOW))
  
  DisableWindow(#MAIN_WINDOW,#True)
  
  Pause_Window(#ABOUT_WINDOW)
  
  output$="         ╔═════════════════════════════════╗"+#CRLF$
  output$+"         ║                                 ║"+#CRLF$
  output$+"         ║   WHDLoad Download Tool v"+Version+"   ║"+#CRLF$
  output$+"         ║                                 ║"+#CRLF$
  output$+"         ║           © 2021 MrV2k          ║"+#CRLF$
  output$+"         ║                                 ║"+#CRLF$
  output$+"         ╚═════════════════════════════════╝"+#CRLF$
  output$+#CRLF$
  output$+#CRLF$
  output$+"   A downloader for Retroplay's WHDLoad Archives!"+#CRLF$
  output$+#CRLF$

  output$+"   ----------------------------------------------"+#CRLF$

  output$+#CRLF$
  output$+"If you use this tool, please consider donating towards the running costs of the Turran file server. I'm sure that Turran will be most appreciative! The link is below..."+#CRLF$ 

  StringGadget(#ABOUT_STRING,0,0,340,270,output$, #PB_String_ReadOnly | #ES_MULTILINE | #ESB_DISABLE_LEFT|#ESB_DISABLE_RIGHT)
  
  SetWindowLongPtr_(GadgetID(#ABOUT_STRING),#GWL_EXSTYLE,0)
  SetWindowPos_(GadgetID(#ABOUT_STRING),0,0,0,0,0,#SWP_NOMOVE | #SWP_NOSIZE | #SWP_FRAMECHANGED)
  
  SetGadgetFont(#ABOUT_STRING,FontID(#HELP_FONT))
  
  HyperLinkGadget(#ABOUT_LINK,50,270,250,25,"Please Donate Here To Support The Turran FTP",#Red,#PB_HyperLink_Underline)
  SetGadgetColor(#ABOUT_STRING,#PB_Gadget_BackColor,#White)
  SetGadgetColor(#ABOUT_LINK,#PB_Gadget_FrontColor,#Blue)
  SetGadgetColor(#ABOUT_LINK,#PB_Gadget_BackColor,#White)
  
  Resume_Window(#ABOUT_WINDOW)
  
  Repeat
    Event=WaitWindowEvent()
    If EventGadget()=#ABOUT_LINK And EventType()=#PB_EventType_LeftClick
      RunProgram("https://www.paypal.com/donate/?cmd=_donations&business=eab@grandis.nu&lc=US&item_name=Donation+to+EAB+FTP&no_note=0&cn=&curency_code=USD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted","","")
    EndIf
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
  
  OpenWindow(#HELP_WINDOW,0,0,500,600,"Help", #PB_Window_SystemMenu|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  
  oldgadgetlist=UseGadgetList(WindowID(#HELP_WINDOW))
  
  Pause_Window(#HELP_WINDOW)
  
  StringGadget(#HELP_EDITOR,0,0,500,600,"", #PB_String_ReadOnly|#ES_MULTILINE | #ES_AUTOVSCROLL|#WS_VSCROLL|#ESB_DISABLE_LEFT|#ESB_DISABLE_RIGHT)
  
  SetGadgetColor(#HELP_EDITOR,#PB_Gadget_BackColor,#White)
  
  SetGadgetFont(#HELP_EDITOR,FontID(#HELP_FONT))
  
  output$="                ╔══════════════════════════════════════════╗"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ║        WHDLoad Download Tool v"+Version+"       ║"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ║                © 2021 MrV2k              ║"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ╚══════════════════════════════════════════╝"+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Introduction"+#CRLF$
  output$+"============"+#CRLF$
  output$+"WHDLoad Download Tool is a utility that will download Retroplay's WHDLoad collection from the Turran FTP server. "
  output$+"The tool includes advanced filtering to help you curate a collection to your needs and flexible setups to help you manage your files. "
  output$+"Once you have set the filters, the tool will connect to the Turran FTP site and download the required files. "
  output$+"It also has the facility to scan your current archives and remove any redundant / un-needed files. "+#CRLF$
  output$+#CRLF$
  output$+"Please note that this program is reliant on the Turran FTP server so if you get errors, please check the status of the Turran file server on the EAB forum before posting bugs. "
  output$+"I have tried to build in redundancies for FTP problems that use local files to generate the database."+#CRLF$
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
  output$+"The file list shows a list of the software available on the Turran FTP site. "
  output$+"As you change the filters, the file list will adapt to your selection. "
  output$+"The entries in the list are selectable and the status bar at the bottom of the window will show any data available. "
  output$+"If the entry is available in the relevant download folder, the entry will be highlighted in green. "
  output$+"Any software highlighted in green will not be downloaded when you click the download button."+#CRLF$
  output$+#CRLF$
  output$+"FTP Settings"+#CRLF$
  output$+"------------"+#CRLF$
  output$+"This section shows the current FTP settings. A couple of text boxes are blocked on purpose as they need to remain unchanged, though, all the FTP settings are stored in the prefs files and can be changed there. "
  output$+"There are two entries that you can change in the UI. These are... "+#CRLF$
  output$+#CRLF$
  output$+"    User Name - This allows you to change the default FTP user name."+#CRLF$
  output$+"    Password  - This allows you to change the default FTP password."+#CRLF$
  output$+#CRLF$
  output$+"You should only change these settings if you have an EAB FTP account. "
  output$+"If you change them by mistake, the default user name is 'ftp' and the default password is anything you want (e.g.'amiga')."+#CRLF$
  output$+#CRLF$
  output$+"Folder Settings"+#CRLF$
  output$+"---------------"+#CRLF$
  output$+"This section lets you set the paths that the archives are downloaded to. "
  output$+"By default this tools supports four types of archives (games, demos, beta and disk magazines). Beta files are internally classed as games so are stored in the games folder."+#CRLF$
  output$+#CRLF$
  output$+"The 'Set' button on the 'Parent' path will open a requester so you can choose the default download path. *Note* You cannot set this path to a root folder for safety reasons. "
  output$+"The 'Games', 'Demos' and 'Mags' text boxes are for the names of the subdirectories that the categories will be saved to. "
  output$+"You do not need to enter a full path in these boxes as they are only used for the subfolder names. "+#CRLF$
  output$+#CRLF$
  output$+"There are also three check boxes next to each archive type. These are part of the filter and allow you to set which type of file is downloaded. The main list will change as you tick/untick the boxes."+#CRLF$
  output$+#CRLF$
  output$+"If you select the 'Use Subfolders' check box, any files you download will be separated into the folder names specified in the 'Games', 'Demos' and 'Mags' boxes. "+#CRLF$
  output$+#CRLF$
  output$+"To set a subfolder path, simply type the name of the folder into one of the boxes. You can only use these boxes if the 'Use Subfolders' check box is selected. "+#CRLF$
  output$+#CRLF$
  output$+"As an addition, the 'Add 0-Z Subfolders' check box will separate the downloads into alphabetical subfolders in the category folders. "+#CRLF$
  output$+#CRLF$
  output$+"Finally, pressing any of the 'Open' buttons will open the matching download folder (if it exists)."+#CRLF$
  output$+#CRLF$
  output$+"    Configurable Paths"+#CRLF$
  output$+"    ------------------"+#CRLF$
  output$+"    Parent - This is the main folder that the two subfolders will be"+#CRLF$
  output$+"             created in"+#CRLF$
  output$+"    Games  - This is the subfolder that games are downloaded to."+#CRLF$
  output$+"    Demos  - This is the subfolder that demos are downloaded to."+#CRLF$
  output$+"    Mags   - This is the subfolder that magazines are downloaded to."+#CRLF$
  output$+#CRLF$
  output$+"All path information is saved in preference files. "+#CRLF$
  output$+#CRLF$
  output$+"Filters"+#CRLF$
  output$+"-------"+#CRLF$
  output$+"This section is where you can filter down the main list. "+#CRLF$
  output$+#CRLF$
  output$+"The 'System' section lets you filter the list by system type. Beta files are also included in this section. "+#CRLF$
  output$+#CRLF$
  output$+"The 'Extras' section filters out specific categories of file. This can help reduce the size of the main list and get rid of unneeded file types. "+#CRLF$
  output$+#CRLF$
  output$+"The 'Language' section lets you filter out files that are in unneeded languages. The 'Clear/All' button will toggle all the languages on or off. "+#CRLF$
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
  output$+"                 is a newer version on the Turran FTP, the new one"+#CRLF$
  output$+"                 will be downloaded and the old one deleted. "+#CRLF$
  output$+#CRLF$  
  output$+"  Download     - Downloads the files that are left in the main list. A"+#CRLF$
  output$+"                 small window will open to show the download progress."+#CRLF$
  output$+"                 A file called 'ftp.log' stores the FTP information"+#CRLF$
  output$+"                 and is saved in the folder that this tool is stored"+#CRLF$
  output$+"                 in. There is also a 'Cancel' button which aborts the"+#CRLF$
  output$+"                 current download. (N.B. If you press cancel, it will"+#CRLF$
  output$+"                 take a few seconds to stop the current download.)"+#CRLF$
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
  output$+"  Clear Data   - Clears all loaded data and resets the filter."+#CRLF$
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
  output$+"                 so you can donate to support the Turran FTP."+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"                ╔══════════════════════════════════════════╗"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ║                Instructions              ║"+#CRLF$
  output$+"                ║                                          ║"+#CRLF$
  output$+"                ╚══════════════════════════════════════════╝"+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Create A WHDLoad Set"+#CRLF$
  output$+"===================="+#CRLF$
  output$+#CRLF$
  output$+"It is quite a simple process to create a set of WHDLoad files. This is what you need to do..."+#CRLF$
  output$+#CRLF$
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Set the download folder by pressing the 'Set' button next to the"+#CRLF$
  output$+"     'Parent' text box. If you don't set a new path, a folder called"+#CRLF$
  output$+"     'Download' will be created in the folder that this tool in in."+#CRLF$
  output$+"  3. Use the filter options to remove any files that you don't require."+#CRLF$
  output$+"  4. Use the 'Edit List' window to further refine the file list."+#CRLF$
  output$+"  5. Press the 'Download' button to download the files from the FTP."+#CRLF$
  output$+"  6. If you want to save your settings, press the 'Save Prefs' button"+#CRLF$
  output$+"     and use your own filename. If you want use these settings by default"+#CRLF$
  output$+"     , overwrite the 'default.prefs' file. If you want to revert to the "+#CRLF$
  output$+"     original default settings, simply delete the 'default.prefs' file"+#CRLF$
  output$+"     and run the tool again, a new 'default.prefs' file will be created."+#CRLF$
  output$+"  7. Saving the file list as a list is a quick way to store any edits"+#CRLF$
  output$+"     you have made as well."+#CRLF$
  output$+#CRLF$
  output$+"**** Important Notes ****"+#CRLF$
  output$+"-------------------------"+#CRLF$
  output$+"1. This process will not delete or change any of your files and will only"+#CRLF$
  output$+"   only download the files that you don't already have."+#CRLF$
  output$+"2. You cannot select a root folder on your harddrives."+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Clean Up A WHDLoad Set"+#CRLF$
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
  output$+"Clean using filters"+#CRLF$
  output$+"-------------------"+#CRLF$ 
  output$+#CRLF$
  output$+"The default way it to use the path, filter and list settings to check the files. If you have a specific setup that you use all the time, this is the best method to use as it will keep your set up to date."+#CRLF$ 
  output$+#CRLF$
  output$+"  1. Press the 'Load Data' button to load the main database."+#CRLF$
  output$+"  2. Set the 'Parent' folder to the folder you have your WHDLoad files"+#CRLF$
  output$+"     stored in."+#CRLF$
  output$+"  3. Set the filter options to your required settings."+#CRLF$
  output$+"  4. Press the 'Clean Files' button."+#CRLF$
  output$+"  5. IMPORTANT! DOUBLE CHECK THE LISTS FILES BEFORE CONTINUING!."+#CRLF$
  output$+"  6. Choose 'Delete' to delete the files or 'Back Up' to back up the"+#CRLF$
  output$+"     files. Pressing 'Cancel' aborts the process. Back ups are stored"+#CRLF$
  output$+"     in a folder called 'Backup' in the folder that this program is in."+#CRLF$
  output$+#CRLF$
  output$+"Clean an existing set"+#CRLF$
  output$+"---------------------"+#CRLF$ 
  output$+#CRLF$
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
  output$+"     in a folder called 'Backup' in the folder that this program is in."+#CRLF$
  output$+#CRLF$
  output$+"**** Important Notes ****"+#CRLF$
  output$+"-------------------------"+#CRLF$
  output$+"1. You cannot select a root folder on your harddrives."+#CRLF$
  output$+"2. Please note that if you change the subfolder settings after"+#CRLF$
  output$+"   downloading a set and then run the 'Clean Files', it will scan based "+#CRLF$
  output$+"   on the new settings and delete any files in the wrong location."+#CRLF$
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
  output$+"List files are just text files with lists of filenames in them. If you want to add comments to a list file, you can add them by using a semicolon ';' at the beginning of the text line. You can edit list files in any text editor and add comments but remember to save them with the '.lst' file extension."+#CRLF$
  output$+#CRLF$+#CRLF$
  output$+"Disclaimer"+#CRLF$
  output$+"=========="+#CRLF$
  output$+#CRLF$
  output$+"This SOFTWARE PRODUCT is provided by THE PROVIDER 'as is' and 'with all faults.' THE PROVIDER makes no representations or warranties of any kind concerning the safety, suitability, lack of viruses, inaccuracies, typographical errors, or other harmful components of this SOFTWARE PRODUCT. There are inherent dangers in the use of any software, and you are solely responsible for determining whether this SOFTWARE PRODUCT is compatible with your equipment and other software installed on your equipment. You are also solely responsible for the protection of your equipment and backup of your data, and THE PROVIDER will not be liable for any damages you may suffer in connection with using, modifying, or distributing this SOFTWARE PRODUCT. "+#CRLF$
  
  SetGadgetText(#HELP_EDITOR,output$)
  
  Resume_Window(#HELP_WINDOW)
  
EndProcedure

Procedure Main_Window()
  
  OpenWindow(#MAIN_WINDOW,5,5,875,607,"",#PB_Window_ScreenCentered|#PB_Window_SystemMenu|#PB_Window_MinimizeGadget)
  
  Update_Title()
  
  CreateStatusBar(#MAIN_STATUS,WindowID(#MAIN_WINDOW))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(120))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(120))
  AddStatusBarField(DpiX(100))
  AddStatusBarField(DpiX(110))
  AddStatusBarField(DpiX(110))
  AddStatusBarField(DpiX(114))
  
  Pause_Window(#MAIN_WINDOW)
  
  ListIconGadget(#MAIN_LIST,5,5,445,575,"",0,#PB_ListIcon_FullRowSelect | #LVS_NOCOLUMNHEADER)
  
  SetGadgetFont(#MAIN_LIST,FontID(#MAIN_FONT))
  
  FrameGadget(#PB_Any,455,0,320,150,"FTP Info")
  
  TextGadget(#PB_Any,465,25,60,25,"User Name")
  StringGadget(#FTP_USER_STRING,535,22,230,25,ftp_user)
  TextGadget(#PB_Any,465,55,60,25,"Password")
  StringGadget(#FTP_PASS_STRING,535,52,230,25,ftp_pass)
  TextGadget(#PB_Any,465,85,60,25,"Server")
  StringGadget(#FTP_SERVER_STRING,535,82,150,25,ftp_server,#PB_String_ReadOnly)
  TextGadget(#PB_Any,695,85,40,25,"Port")
  StringGadget(#FTP_PORT_STRING,725,82,40,25,Str(ftp_port),#PB_String_ReadOnly)
  TextGadget(#PB_Any,465,115,60,25,"FTP Folder")
  StringGadget(#FTP_FOLDER_STRING,535,112,230,25,ftp_Folder,#PB_String_ReadOnly)
  
  FrameGadget(#PB_Any,455,150,320,190,"Folder Settings")
  
  TextGadget(#PB_Any,465,170,40,25,"Parent")  
  StringGadget(#WHD_MAIN_STRING,510,167,162,25,WHD_Folder,#PB_String_ReadOnly)
  ButtonGadget(#WHD_OPEN_PATH_BUTTON,682,167,40,25,"Open")
  ButtonGadget(#WHD_SET_PATH_BUTTON,727,167,40,25,"Set")
  
  CheckBoxGadget(#GAME_OPTION,465,198,20,20,"")
  TextGadget(#PB_Any,485,200,40,25,"Games")
  StringGadget(#WHD_GAME_STRING,530,197,192,25,WHD_Game_Folder)
  ButtonGadget(#WHD_OPEN_GAME_BUTTON,727,197,40,25,"Open") 
  
  CheckBoxGadget(#DEMO_OPTION,465,228,20,20,"")
  TextGadget(#PB_Any,485,230,40,25,"Demos")
  StringGadget(#WHD_DEMO_STRING,530,227,192,25,WHD_Demo_Folder)
  ButtonGadget(#WHD_OPEN_DEMO_BUTTON,727,227,40,25,"Open")
  
  CheckBoxGadget(#BETA_OPTION,465,258,20,20,"")
  TextGadget(#PB_Any,485,260,40,25,"Beta")
  StringGadget(#WHD_BETA_STRING,530,257,192,25,WHD_Beta_Folder)
  ButtonGadget(#WHD_OPEN_BETA_BUTTON,727,257,40,25,"Open")
  
  TextGadget(#PB_Any,485,290,40,25,"Mags")
  StringGadget(#WHD_MAGS_STRING,530,287,192,25,WHD_Mags_Folder)
  ButtonGadget(#WHD_OPEN_MAGS_BUTTON,727,287,40,25,"Open")
  CheckBoxGadget(#MAGS_OPTION,465,288,20,20,"")
  
  CheckBoxGadget(#WHD_SUBFOLDER_CHECK,480,315,140,21,"Use Subfolders")
  SetGadgetState(#WHD_SUBFOLDER_CHECK,Use_Subfolder)
  CheckBoxGadget(#WHD_0TOZ_CHECK,620,315,140,21,"Add 0-Z Subfolders")
  SetGadgetState(#WHD_0TOZ_CHECK,Use_0toZ_Folder)
  
  If Use_Subfolder
    DisableGadget(#WHD_GAME_STRING,#False)
    DisableGadget(#WHD_OPEN_GAME_BUTTON,#False)
    DisableGadget(#WHD_DEMO_STRING,#False)
    DisableGadget(#WHD_OPEN_DEMO_BUTTON,#False)
    DisableGadget(#WHD_BETA_STRING,#False)
    DisableGadget(#WHD_OPEN_BETA_BUTTON,#False)
    DisableGadget(#WHD_MAGS_STRING,#False)
    DisableGadget(#WHD_OPEN_MAGS_BUTTON,#False)
    DisableGadget(#WHD_0TOZ_CHECK,#False)
  Else
    DisableGadget(#WHD_GAME_STRING,#True)
    DisableGadget(#WHD_OPEN_GAME_BUTTON,#True)
    DisableGadget(#WHD_DEMO_STRING,#True)
    DisableGadget(#WHD_OPEN_DEMO_BUTTON,#True)
    DisableGadget(#WHD_BETA_STRING,#True)
    DisableGadget(#WHD_OPEN_BETA_BUTTON,#True)
    DisableGadget(#WHD_MAGS_STRING,#True)
    DisableGadget(#WHD_OPEN_MAGS_BUTTON,#True)
    DisableGadget(#WHD_0TOZ_CHECK,#True)
  EndIf
  
  FrameGadget(#PB_Any,455,340,320,240,"Filter")
   
  FrameGadget(#PB_Any,460,355,150,100,"System")
  
  CheckBoxGadget(#AMIGA_OPTION,465,375,60,25,"Amiga")
  CheckBoxGadget(#ARCADIA_OPTION,530,375,60,25,"Arcadia")
  CheckBoxGadget(#CD32_OPTION,465,400,60,25,"CD32")
  CheckBoxGadget(#CDTV_OPTION,530,400,60,25,"CDTV")
  CheckBoxGadget(#CDROM_OPTION,465,425,60,23,"CDROM")
  
  FrameGadget(#PB_Any,460,455,150,120,"Extras")
  
  CheckBoxGadget(#AGA_OPTION,465,475,60,20,"AGA")
  CheckBoxGadget(#ECS_OPTION,530,475,65,20,"ECS/OCS")
  CheckBoxGadget(#NTSC_OPTION,465,500,60,20,"NTSC")
  CheckBoxGadget(#PAL_OPTION,530,500,60,20,"PAL")  
  CheckBoxGadget(#CHIP_OPTION,465,525,60,18,"Chip")
  CheckBoxGadget(#FAST_OPTION,530,525,60,18,"Fast")
  CheckBoxGadget(#FILES_OPTION,465,550,60,18,"Files")
  CheckBoxGadget(#IMAGE_OPTION,530,550,60,18,"Image")
  
  FrameGadget(#PB_Any,615,355,155,190,"Language")
  
  CheckBoxGadget(#CZECH_OPTION,625,370,60,25,"Czech")
  CheckBoxGadget(#GREEK_OPTION,700,370,60,25,"Greek")
  CheckBoxGadget(#DANISH_OPTION,625,395,60,25,"Danish") 
  CheckBoxGadget(#ITALIAN_OPTION,700,395,60,25,"Italian")
  CheckBoxGadget(#DUTCH_OPTION,625,420,60,25,"Dutch")
  CheckBoxGadget(#MULTI_OPTION,700,420,60,25,"Multi")
  CheckBoxGadget(#ENGLISH_OPTION,625,445,60,25,"English")
  CheckBoxGadget(#POLISH_OPTION,700,445,60,25,"Polish")
  CheckBoxGadget(#FINNISH_OPTION,625,470,60,25,"Finnish") 
  CheckBoxGadget(#SPANISH_OPTION,700,470,60,25,"Spanish")
  CheckBoxGadget(#FRENCH_OPTION,625,495,60,25,"French")
  CheckBoxGadget(#SWEDISH_OPTION,700,495,60,25,"Swedish")
  CheckBoxGadget(#GERMAN_OPTION,625,520,60,22,"German")
  ButtonGadget(#CLEAR_LANG_BUTTON,700,519,65,22,"Clear")
  
  ButtonGadget(#CLEAR_BUTTON,615,548,78,27,"Clear Filter")
  ButtonGadget(#RESET_BUTTON,695,548,75,27,"Reset Filter")   
  
  ; #### Button List
  
  FrameGadget(#PB_Any,780,0,90,95,"FTP Actions")
  
  ButtonGadget(#SCAN_BUTTON,785,20,80,30,"Load Data")
  ButtonGadget(#DOWNLOAD_BUTTON,785,55,80,30,"Download")

  FrameGadget(#PB_Any,780,95,90,195,"Lists")
  
  ButtonGadget(#LIST_EDIT_BUTTON,785,115,80,30,"Edit List")  
  ButtonGadget(#LIST_LOAD_BUTTON,785,150,80,30,"Load List")
  ButtonGadget(#LIST_SAVE_BUTTON,785,185,80,30,"Save List")
  ButtonGadget(#LIST_APPEND_BUTTON,785,220,80,30,"Append List")
  ButtonGadget(#CLEAR_EDITS_BUTTON,785,255,80,30,"Clear Edits")
  
  FrameGadget(#PB_Any,780,295,90,95,"Data")

  ButtonGadget(#CLEANUP_BUTTON,785,315,80,30,"Clean Files") 
  ButtonGadget(#CLEAR_LIST_BUTTON,785,350,80,30,"Clear Data")   
  
  FrameGadget(#PB_Any,780,420,90,160,"Misc")
  
  ButtonGadget(#SAVE_PREFS_BUTTON,785,440,80,30,"Save Prefs")
  ButtonGadget(#LOAD_PREFS_BUTTON,785,475,80,30,"Load Prefs")   
  ButtonGadget(#HELP_BUTTON,785,510,80,30,"Help")
  ButtonGadget(#ABOUT_BUTTON,785,545,80,30,"About")
  
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
  
  Update_Statusbar()
  
  Resume_Window(#MAIN_WINDOW)
  
EndProcedure

;- ############### Program Startup

InitNetwork()
UseZipPacker()

LoadFont(#HELP_FONT,"Consolas",9,#PB_Font_HighQuality)
LoadFont(#MAIN_FONT,GetDefaultFontName(),9,#PB_Font_HighQuality)

Default_Settings()

If FileSize(Home_Path+Prefs_Name)=-1 
  Save_Prefs(Home_Path+Prefs_Name)
  First_Run=#True
Else
  Load_Prefs(Home_Path+Prefs_Name) 
EndIf

Main_Window()

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
  
  Select Gadget
      
    Case #WHD_SUBFOLDER_CHECK
      Use_Subfolder=GetGadgetState(#WHD_SUBFOLDER_CHECK)
      If Use_Subfolder
        DisableGadget(#WHD_GAME_STRING,#False)
        DisableGadget(#WHD_OPEN_GAME_BUTTON,#False)
        DisableGadget(#WHD_DEMO_STRING,#False)
        DisableGadget(#WHD_OPEN_DEMO_BUTTON,#False)
        DisableGadget(#WHD_BETA_STRING,#False)
        DisableGadget(#WHD_OPEN_BETA_BUTTON,#False)
        DisableGadget(#WHD_MAGS_STRING,#False)
        DisableGadget(#WHD_OPEN_MAGS_BUTTON,#False)
        DisableGadget(#WHD_0TOZ_CHECK,#False)
      Else
        Use_0toZ_Folder=#False
        SetGadgetState(#WHD_0TOZ_CHECK,#False)
        DisableGadget(#WHD_GAME_STRING,#True)
        DisableGadget(#WHD_OPEN_GAME_BUTTON,#True)
        DisableGadget(#WHD_DEMO_STRING,#True)
        DisableGadget(#WHD_OPEN_DEMO_BUTTON,#True)
        DisableGadget(#WHD_BETA_STRING,#True)
        DisableGadget(#WHD_OPEN_BETA_BUTTON,#True)
        DisableGadget(#WHD_MAGS_STRING,#True)
        DisableGadget(#WHD_OPEN_MAGS_BUTTON,#True)
        DisableGadget(#WHD_0TOZ_CHECK,#True)
      EndIf
      Draw_List()
      
    Case #WHD_0TOZ_CHECK
      Use_0toZ_Folder=GetGadgetState(#WHD_0TOZ_CHECK)
      Draw_List()
      
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
        RunProgram("file://"+Path)
      Else
        MessageRequester("Error","This folder is created on"+Chr(10)+"your first download.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_SET_PATH_BUTTON
      Path=PathRequester("Select Folder",WHD_Folder)
      If Path<>""
        If CountString(path,"\")=1
          MessageRequester("Error", "Do not use a root path!", #PB_MessageRequester_Error|#PB_MessageRequester_Ok)
        Else
          WHD_Folder=Path  
          Update_File_List()
          SetGadgetText(#WHD_MAIN_STRING,WHD_Folder)
          Draw_List()
        EndIf
      EndIf
      
    Case #WHD_OPEN_GAME_BUTTON
      Path=WHD_Folder+WHD_Game_Folder+"\"
      If FileSize(path)=-2
        RunProgram("file://"+Path)
      Else
        MessageRequester("Error","This folder is created on"+Chr(10)+"your first download.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
           
    Case #WHD_GAME_STRING
      If Type=#PB_EventType_Change
        WHD_Game_Folder=GetGadgetText(#WHD_GAME_STRING)
      EndIf
            
    Case #WHD_OPEN_DEMO_BUTTON
      Path=WHD_Folder+WHD_Demo_Folder+"\"
      If FileSize(path)=-2
        RunProgram("file://"+Path)
      Else
        MessageRequester("Error","This folder does not exist!",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_DEMO_STRING
      If Type=#PB_EventType_Change
        WHD_Demo_Folder=GetGadgetText(#WHD_DEMO_STRING)
      EndIf
      
    Case #WHD_OPEN_MAGS_BUTTON
      Path=WHD_Folder+WHD_Mags_Folder+"\"
      If FileSize(path)=-2
        RunProgram("file://"+Path)
      Else
        MessageRequester("Error","This folder is created on"+Chr(10)+"your first download.",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
      EndIf
      
    Case #WHD_MAGS_STRING
      If Type=#PB_EventType_Change
        WHD_Mags_Folder=GetGadgetText(#WHD_MAGS_STRING)
      EndIf
      
    Case #FTP_USER_STRING
      If Type=#PB_EventType_Change
        ftp_user=GetGadgetText(#FTP_USER_STRING)
      EndIf
      
    Case #FTP_PASS_STRING
      If Type=#PB_EventType_Change
        ftp_pass=GetGadgetText(#FTP_PASS_STRING)
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
      
    Case #SCAN_BUTTON
      If ListSize(Game_List())>0
        Count=MessageRequester("Warning","Clear the database and reload?",#PB_MessageRequester_Warning|#PB_MessageRequester_YesNo)
        If count=#PB_MessageRequester_Yes
          ClearList(Game_List())
          ClearGadgetItems(#MAIN_LIST)
          Scan_FTP()
          If ListSize(Game_List())>0
            Scrape_Data()
            Disable_Gadgets(#False)
            Draw_List()
          EndIf
        EndIf
      Else
        Scan_FTP()
        If ListSize(Game_List())>0
          Scrape_Data()
          Disable_Gadgets(#False)
          Draw_List()
        EndIf
      EndIf
      
    Case #DOWNLOAD_BUTTON 
      Download_FTP()
      Update_File_List()
      Draw_List()
      
    Case #CLEANUP_BUTTON 
      Update_Files()
      Update_File_List()
      Draw_List()
      
    Case #CLEAR_LIST_BUTTON
      If MessageRequester("Warning", "Clear all data?", #PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes
        If ListSize(Game_List())>0 : ClearList(Game_List()) : EndIf
        If ListSize(Delete_List())>0 : ClearList(Delete_List()) : EndIf
        If ListSize(File_List())>0 : ClearList(File_List()) : EndIf
        If ListSize(Down_List())>0 : ClearList(Down_List()) : EndIf
        If ListSize(Filtered_List())>0 : ClearList(Filtered_List()) : EndIf
        If ListSize(Directory_List())>0 : ClearList(Directory_List()) : EndIf
        Default_Settings()
        SetGadgetText(#WHD_MAIN_STRING,WHD_Folder)
        SetGadgetText(#WHD_GAME_STRING,WHD_Game_Folder)
        SetGadgetText(#WHD_DEMO_STRING,WHD_Demo_Folder)
        SetGadgetText(#WHD_BETA_STRING,WHD_Beta_Folder)
        SetGadgetText(#WHD_MAGS_STRING,WHD_Mags_Folder)        
        SetGadgetText(#FTP_USER_STRING,FTP_User)
        SetGadgetText(#FTP_PASS_STRING,FTP_Pass)
        DisableGadget(#CLEAR_EDITS_BUTTON,#True)
        Set_Filter(#True)
        Disable_Gadgets(#True)
        Set_List_Gadgets(#True)
        Pause_Gadget(#MAIN_LIST)
        ClearGadgetItems(#MAIN_LIST)
        Resume_Gadget(#MAIN_LIST)
        Update_Title()
        ;Draw_List()
      EndIf   
      
    Case #RESET_BUTTON
      Set_Filter(#True)
      Draw_List()
      
    Case #CLEAR_BUTTON
      Set_Filter(#False)
      Draw_List()
      
    Case #LOAD_PREFS_BUTTON
      Path=OpenFileRequester("Load Prefs",Home_Path,"Prefs File (*.prefs)|*.prefs",0)
      If Path<>""
        Load_Prefs(Path)
        SetGadgetText(#FTP_USER_STRING,ftp_user)
        SetGadgetText(#FTP_PASS_STRING,ftp_pass)
        SetGadgetText(#WHD_MAIN_STRING,WHD_Folder)
        SetGadgetText(#WHD_GAME_STRING,WHD_Game_Folder)
        SetGadgetText(#WHD_DEMO_STRING,WHD_Demo_Folder)
        SetGadgetState(#WHD_SUBFOLDER_CHECK,Use_Subfolder)
        SetGadgetState(#WHD_0TOZ_CHECK,Use_0toZ_Folder)
        If Use_Subfolder 
          DisableGadget(#WHD_0TOZ_CHECK,#False)
          DisableGadget(#WHD_GAME_STRING,#False)
          DisableGadget(#WHD_DEMO_STRING,#False)
          DisableGadget(#WHD_OPEN_GAME_BUTTON,#False)
          DisableGadget(#WHD_OPEN_DEMO_BUTTON,#False)
        Else
          DisableGadget(#WHD_0TOZ_CHECK,#True)
          DisableGadget(#WHD_GAME_STRING,#True)
          DisableGadget(#WHD_DEMO_STRING,#True)
          DisableGadget(#WHD_OPEN_GAME_BUTTON,#True)
          DisableGadget(#WHD_OPEN_DEMO_BUTTON,#True)
        EndIf
        Update_File_List()
        Set_Filter_Gadgets()
        Draw_List()
      EndIf
      
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
      Filter(0)\F_Games=GetGadgetState(#GAME_OPTION)
      Draw_List()
      
    Case #DEMO_OPTION
      Filter(0)\F_Demos=GetGadgetState(#DEMO_OPTION)
      Draw_List()
      
    Case #BETA_OPTION
      Filter(0)\F_Beta=GetGadgetState(#BETA_OPTION)
      Draw_List()
      
    Case #MAGS_OPTION
      Filter(0)\F_Mags=GetGadgetState(#MAGS_OPTION)
      Draw_List()
      
    Case #AGA_OPTION
      Filter(0)\F_AGA=GetGadgetState(#AGA_OPTION)
      Draw_List()
      
    Case #ECS_OPTION
      Filter(0)\F_ECS=GetGadgetState(#ECS_OPTION)
      Draw_List()
      
    Case #NTSC_OPTION
      Filter(0)\F_NTSC=GetGadgetState(#NTSC_OPTION)
      Draw_List()
      
    Case #PAL_OPTION
      Filter(0)\F_PAL=GetGadgetState(#PAL_OPTION)
      Draw_List()
      
    Case #CD32_OPTION
      Filter(0)\F_CD32=GetGadgetState(#CD32_OPTION)
      Draw_List()
      
    Case #CDTV_OPTION
      Filter(0)\F_CDTV=GetGadgetState(#CDTV_OPTION)
      Draw_List()
      
    Case #CDROM_OPTION
      Filter(0)\F_CDROM=GetGadgetState(#CDROM_OPTION)
      Draw_List()
      
    Case #AMIGA_OPTION
      Filter(0)\F_Amiga=GetGadgetState(#AMIGA_OPTION)
      Draw_List()
      
    Case #FILES_OPTION
      Filter(0)\F_Files=GetGadgetState(#FILES_OPTION)
      Draw_List()
      
    Case #IMAGE_OPTION
      Filter(0)\F_Image=GetGadgetState(#IMAGE_OPTION)
      Draw_List()
      
    Case #CHIP_OPTION
      Filter(0)\F_Chip=GetGadgetState(#CHIP_OPTION)
      Draw_List()
      
    Case #FAST_OPTION
      Filter(0)\F_Fast=GetGadgetState(#FAST_OPTION)
      Draw_List()
          
    Case #ARCADIA_OPTION
      Filter(0)\F_Arcadia=GetGadgetState(#ARCADIA_OPTION)
      Draw_List()
      
    Case #CZECH_OPTION
      Filter(0)\F_Czech=GetGadgetState(#CZECH_OPTION)
      Draw_List()
      
    Case #DANISH_OPTION
      Filter(0)\F_Danish=GetGadgetState(#DANISH_OPTION)
      Draw_List()
      
    Case #DUTCH_OPTION
      Filter(0)\F_Dutch=GetGadgetState(#DUTCH_OPTION)
      Draw_List()
      
    Case #ENGLISH_OPTION
      Filter(0)\F_English=GetGadgetState(#ENGLISH_OPTION)
      Draw_List()
      
    Case #FINNISH_OPTION
      Filter(0)\F_Finnish=GetGadgetState(#FINNISH_OPTION)
      Draw_List()
      
    Case #FRENCH_OPTION
      Filter(0)\F_French=GetGadgetState(#FRENCH_OPTION)
      Draw_List()
      
    Case #GERMAN_OPTION
      Filter(0)\F_German=GetGadgetState(#GERMAN_OPTION)
      Draw_List()
      
    Case #GREEK_OPTION
      Filter(0)\F_Greek=GetGadgetState(#GREEK_OPTION)
      Draw_List()
      
    Case #ITALIAN_OPTION
      Filter(0)\F_Italian=GetGadgetState(#ITALIAN_OPTION)
      Draw_List()
      
    Case #MULTI_OPTION
      Filter(0)\F_MULTI=GetGadgetState(#MULTI_OPTION)
      Draw_List()
      
    Case #POLISH_OPTION
      Filter(0)\F_Polish=GetGadgetState(#POLISH_OPTION)
      Draw_List()
      
    Case #SPANISH_OPTION
      Filter(0)\F_Spanish=GetGadgetState(#SPANISH_OPTION)
      Draw_List()
      
    Case #SWEDISH_OPTION
      Filter(0)\F_Swedish=GetGadgetState(#SWEDISH_OPTION)
      Draw_List()
      
  EndSelect
  
  If Event=#PB_Event_CloseWindow
    If EventWindow()=#MAIN_WINDOW : Break : EndIf
    If EventWindow()=#HELP_WINDOW : CloseWindow(#HELP_WINDOW) : EndIf
  EndIf
    
ForEver 

End
; IDE Options = PureBasic 6.00 Beta 1 (Windows - x64)
; CursorPosition = 1850
; FirstLine = 568
; Folding = AAAAAAB9
; Optimizer
; EnableXP
; DPIAware
; UseIcon = boing.ico
; Executable = WHDTool_x86.exe
; Compiler = PureBasic 6.00 Beta 1 - C Backend (Windows - x64)
; Debugger = Standalone
; Warnings = Display