;  LEGO Stunt Rally Alternate Installer
;  Created 2013-2014 Triangle717
;  <http://Triangle717.WordPress.com/>
;  Contains source code from Grim Fandango Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  <http://quick.mixnmojo.com/>

; If any version below the specified version is used for compiling,
; this error will be shown.
#if VER < EncodeVer(5, 5, 8)
  #error You must use Inno Setup 5.5.8 or newer to compile this script
#endif

#define MyAppInstallerName "LEGO Stunt Rally Alternate Installer"
#define MyAppInstallerVersion "1.0.0"
#define MyAppName "LEGO Stunt Rally"
#define MyAppVersion "0.3.5.1"
#define MyAppPublisher "LEGO Media"
#define MyAppExeName "StuntRally.exe"
#define MySecondAppExeName "_msr.exe"

[Setup]
AppID={#MyAppName}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyAppInstallerVersion}
AppPublisher={#MyAppPublisher}
AppCopyright=(c) 2000 {#MyAppPublisher}
LicenseFile=license.txt
; Start menu/screen and Desktop shortcuts
DefaultDirName={pf}\LEGO Media\Games\{#MyAppName}
DefaultGroupName=LEGO Media\{#MyAppName}
AllowNoIcons=yes
; Installer Graphics
SetupIconFile=StuntRally.ico
; WizardImageFile=Sidebar.bmp
WizardSmallImageFile=Small-Image.bmp
WizardImageStretch=True
; Location of the compiled Exe
OutputDir=bin
OutputBaseFilename={#MyAppName} Alternate Installer {#MyAppInstallerVersion}
; Uninstallation stuff
UninstallFilesDir={app}
UninstallDisplayIcon={app}\StuntRally.ico
CreateUninstallRegKey=yes
UninstallDisplayName={#MyAppName}
; This is required so Inno can correctly report the installation size.
UninstallDisplaySize=301989888
; Compression
Compression=lzma2/ultra64
SolidCompression=True
InternalCompressLevel=ultra
LZMAUseSeparateProcess=yes
; From top to bottom:
; Require Admin rights, no other languages, do not restart upon finish.
PrivilegesRequired=admin
ShowLanguageDialog=no
RestartIfNeededByRun=no

[Languages]
Name: "English"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel={#MyAppInstallerName}
;; WelcomeLabel2 is overridden because I'm unsure if every
; LEGO Stunt Rally disc says version 0.3.5.1 or just mine.
WelcomeLabel2=This will install [name] on your computer.%n%nIt is recommended that you close all other applications before continuing.
; DiskSpaceMBLabel is overridden because it reports an incorrect installation size.
DiskSpaceMBLabel=At least 399 MB of free disk space is required.

; Both Types and Components sections are required
; to create the installation options.
[Types]
Name: "Full"; Description: "Full Installation (With Movies)"
Name: "Minimal"; Description: "Minimal Installation (Without Movies)"

[Components]
Name: "Full"; Description: "Full Installation (With Movies)"; Types: Full
Name: "Minimal"; Description: "Minimal Installation (Without Movies)"; Types: Minimal

[Files]
; Pull the game files off the LEGO Stunt Rally disc.
Source: "{code:GetSourceDrive}data1.cab"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall
Source: "{code:GetSourceDrive}resource.cfg"; DestDir: "{app}"; Flags: external ignoreversion

; Manual and icon
Source: "STUNT_RALLY_MANUAL_UK.pdf"; DestDir: "{app}"; Flags: ignoreversion
Source: "StuntRally.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "Tools\d3drm.dll"; DestDir: "{app}"; Flags: ignoreversion

; Tool needed to extract the CAB
Source: "Tools\CABExtract\i5comp.exe"; DestDir: "{app}"; Flags: deleteafterinstall
Source: "Tools\CABExtract\ZD51145.DLL"; DestDir: "{app}"; Flags: deleteafterinstall

[Icons]
; First and last icons are created only if user choose not to use the videos,
; else the normal ones are created.
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\StuntRally.ico"; Comment: "Run {#MyAppName}"; Components: Full
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MySecondAppExeName}"; IconFilename: "{app}\StuntRally.ico"; Parameters: "/NOINTROVIDEO"; Comment: "Run {#MyAppName} without Intro videos"; Components: Minimal
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\StuntRally.ico"; Comment: "Run {#MyAppName}"; Components: Full; Tasks: desktopicon
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MySecondAppExeName}"; IconFilename: "{app}\StuntRally.ico"; Parameters: "/NOINTROVIDEO"; Comment: "Run {#MyAppName} without Intro videos"; Components: Minimal; Tasks: desktopicon
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\Stunt-Rally.ico"; Comment: "Run {#MyAppName}";

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "Admin"; Description: "Run {#MyAppName} with Administrator Rights"; GroupDescription: "{cm:AdditionalIcons}"

[Registry]
; Registry strings are always hard-coded (!No ISPP functions!) to ensure everything works properly
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: none; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "AutoSave_Track_Name"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Avis_Installed"; ValueData: "1"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Balance"; ValueData: "50"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Campaign_Player_Avatar"; ValueData: "10"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Campaign_Player_Car"; ValueData: "60010"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Campaign_Player_Skin"; ValueData: "0"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Campaign_Player_Tyre"; ValueData: "0"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Campaign_Progress"; ValueData: "0"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Controller1"; ValueData: "1"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Controller2"; ValueData: "2"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Controller3"; ValueData: "3"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Controller4"; ValueData: "0"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "EffectsLevel"; ValueData: "0"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "HelpOnBeforeRestart"; ValueData: "1"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "NumDevices"; ValueData: "4"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Resolution"; ValueData: "0"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally"; ValueType: string; ValueName: "Volume"; ValueData: "100"; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKLM"; Subkey: "SOFTWARE\LEGO Media\LEGO Stunt Rally\1.00.000"; ValueType: none; Flags: uninsdeletekey; Components: Full Minimal
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\StuntRally.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\_msr.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin

[Run]
; From to to bottom: Extract the CAB, run game
; (depending on user's choice on the videos).
Filename: "{app}\i5comp.exe"; Parameters: "x ""{app}\data1.cab"""; Flags: runascurrentuser
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent runascurrentuser; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Full
Filename: "{app}\{#MySecondAppExeName}"; Parameters: "/NOINTROVIDEO"; Flags: nowait postinstall skipifsilent runascurrentuser; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Minimal

[UninstallDelete]
; Because the files came from a CAB were not installed from [Files],
; this section needed to uninstall them.
Type: files; Name: "{app}\{#MyAppExeName}"
Type: files; Name: "{app}\{#MySecondAppExeName}"
Type: files; Name: "{app}\ReadMeUS.txt"
Type: files; Name: "{app}\QMDX.dll"
Type: filesandordirs; Name: "{app}\art"
Type: filesandordirs; Name: "{app}\CampaignTracks"
Type: filesandordirs; Name: "{app}\GameTracks"
Type: filesandordirs; Name: "{app}\res"

[Dirs]
; Created to ensure the save games are not removed
; (which should never ever happen)
Name: "{app}\SavedTracks"; Flags: uninsneveruninstall

[Code]
// Pascal script from Bgbennyboy to pull files off a CD, greatly trimmed up
// and modified to support ANSI and Unicode Inno Setup by Triangle717
var
    SourceDrive: string;

#include "FindDisc.pas"

function GetSourceDrive(Param: String): String;
begin
    Result:=SourceDrive;
end;

procedure InitializeWizard();
begin
    SourceDrive:=GetSourceCdDrive();
end;
