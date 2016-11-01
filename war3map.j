// reserved native for call 4 integer function and return BOOLEAN value
native MergeUnits		   takes integer qty, integer a, integer b, integer make returns boolean
// reserved native for call 2 integer function and return BOOLEAN value (can be converted to int!)
native ConvertUnits         takes integer qty, integer id               returns boolean
// reserved native for call 1 integer function and return integer value
native IgnoredUnits		 takes integer unitid						returns integer

// https://github.com/Karaulov/WarcraftIII_DLL_126-xxx (EXTRADLLNAME)

//constant native StartPerfCounter				 takes nothing returns nothing
//constant native StopPerfCounter				 takes nothing returns nothing

globals
	player LocalPlayer=null
	hashtable TempHash=InitHashtable()
	string	GLOBALTESTSTRING = ""
	trigger				gg_trg_DrawModel			= null
	trigger				gg_trg_MakeInvis			= null
	trigger				gg_trg_EnableFog			= null
	lightning 			gg_l1
	lightning 			gg_l2
	lightning 			gg_l3
	lightning 			gg_l4
	lightning 			gg_l5
	trigger				gg_trg_DisableFog			= null
	trigger				gg_trg_MakeAlly				= null
	trigger				gg_trg_MakeEnemy			= null
	unit				gg_unit_Hblm_0003			= null
	unit				gg_unit_Hpal_0004			= null
	hashtable RectData = InitHashtable()
	hashtable HY=InitHashtable()
	boolean IsL1ch=true
	
	boolean array WidescreenState
	real GJ_LastDmg=0
	integer GJ_LastDamageType=0
	integer GJ_LastAttackType=0
	
	hashtable ObjectDataPointersTable=InitHashtable()
	
	timer SuperTextPrinter_Timer=null
	hashtable AbilitiesHashtable=InitHashtable()
	
	integer testFunctionCount = 0
	integer latestAddress1 = 0
	integer latestAddress2 = 0

	integer array Ascii__Ints
	string array Ascii__Chars
	
	code l__Code
	integer l__Int
	string l__Str
	boolean l__Bool
	
	constant string dotaconfigfle="config.dota"
	
	integer array l__Array
	
	string array HexNumber__Chars
	
	integer bytecode
	integer array l__bytecode
	integer array Memory
	integer bytecodedata //used to pass data between regular code and bytecode
	integer GameState
	integer pointers
	integer pUnitData
	integer pAbilityData
	
	constant gametype GAME_TYPE_ALL= ConvertGameType(0xFFFFFFFF)
	
	integer array H
	trigger l__library_init
	
	
	// For SetUnitFlags_2
	constant integer UNIT_VISIBLED_TO_ALL 		= 0x10
	constant integer UNIT_INVULNERABLE 			= 0x8
	constant integer UNIT_SELECTABLE 			= 0x2 
	constant integer UNIT_HIDDEN 				= 0x1
	constant integer UNIT_AUTOATTACK_DISABLED=0x10000000
	constant integer UNIT_ILLUSION=0x40000000
	
	// For SetUnitFlags
	//flag 0x4 causes fatal if any damage received
	//flag 0x40 stands for red flash, but doesn't directly calls it
	constant integer UNIT_DEAD = 0x100
	//like dead hero, provides no vision, cant be selected, enemies doesn't flee when attacked by this flag
	constant integer UNIT_MINMAP_ICON_HIDE		= 0x80000
	constant integer UNIT_MINMAP_ICON_TAVERN	= 0x40000
	constant integer UNIT_MINMAP_ICON_GOLD		= 0x20000
	constant integer UNIT_MINMAP_SHAREVISIBLE	= 0x10000
	constant integer UNIT_STUNNED= 0x100000
	constant integer UNIT_INVISIBLED 			= 0x1000000
	constant integer UNIT_HAS_FLYING_VISION= 0x20000000
	
	integer pCameraDefaultHeight
	real array DefaultCameraHeight
	
	// 126a 0xAB65F4
	// 127a 0xBE4238
	integer pGlobalPlayerClass
	
	// 127a 0xBEC464
	// 126a 0xAB4450
	integer pUnitMaxSpeedConstant
	integer pUnitMaxSpeedConstantD

	real 	UnitMaxSpeedConstant
	// 127a 0xBEC460
	// 126a 0xAB444C
	integer pUnitMinSpeedConstant
	integer pUnitMinSpeedConstantD

	real 	UnitMinSpeedConstant
	// 127a 0xBEC46C
	// 126a 0xAB4458
	integer pBuildingMaxSpeedConstant
	integer pBuildingMaxSpeedConstantD

	real	BuildingMaxSpeedConstant
	// 127a 0xBEC468
	// 126a 0xAB4454
	integer pBuildingMinSpeedConstant
	integer pBuildingMinSpeedConstantD

	real 	BuildingMinSpeedConstant
	
	//127a Game.dll+BE6130
	integer pUnitUIDefAddr
	
	//127a Game.dll+BEC48C
	integer pUnitDataDefAddr
	
	//127a Game.dll+BE6158
	integer pAbilityUIDefAddr
	
	//127a Game.dll+BECD44
	integer pAbilityDataDefAddr
	
	
	//127a = BE7A04
	//126a = AB0074
	integer pAttackSpeedLimit
	real	AttackSpeedLimit
	
	//127a = b593a0
	//126a = AAE484
	integer pAttackTimeLimit
	real	AttackTimeLimit
	
	//126a = 8750CC
	integer pWar3MapJLocation=0

	
	integer pGameClass1=0
	integer pGameClass2=0
	integer pGameClass3=0
	integer pTimerAddr=0
	integer pCGameState=0
	
	integer pJassEnvAddress=0
	
	integer pLightEnv=0
	
	integer pGetModuleHandle=0
	integer pGetProcAddress=0
	
	integer GameDLL=0
	integer GameVersion=0
	
	integer pMergeUnits=0
	integer pMergeUnitsOffset=0
	integer pIgnoredUnits=0
	integer pIgnoredUnitsOffset=0
	integer pConvertUnits=0
	integer pConvertUnitsOffset=0
	integer pLeaderboardSetItemLabelColor=0
	
	integer pSetHPBarColorForPlayer=0
	integer pSetHPBarXScaleForPlayer=0
	integer pSetHPBarYScaleForPlayer=0
	
	integer pSetHPCustomHPBarUnit=0
	
	
	integer pSetMPBarXScaleForPlayer=0
	integer pSetMPBarYScaleForPlayer=0
	integer pSetMPBarYOffsetForPlayer=0
	
	
	integer pExportFromMpq=0
	integer pGetFrameItemAddress=0
	integer pGetFrameSkinAddress=0
	integer pGetFrameTextAddress=0
	integer pUpdateFrameText=0
	
	integer pFrameDefClass=0
	integer pConvertString=0
	integer pPacketClass=0
	integer pPacketSend=0
	
	
	integer pPingMinimapOffset=0
	integer pPingMinimapExOffset=0
	
	integer PingMinimapUnlocker = 0
	integer PingMinimapExUnlocker = 0
	boolean NotLockedPingMinimap = true
	boolean NotLockedPingMinimapEx = true
	
	integer pFindWindowA=0
	integer pMessageBoxA=0
	integer pGetAsyncKeyState=0
	integer pWritePrivateProfileStringA=0
	integer pGetPrivateProfileStringA=0
	integer pLoadLibraryA=0
	integer pGetFileAttributesA=0
	integer pVirtualAlloc=0
	integer pVirtualProtect=0
	
	integer array RJassNativesBuffer
	integer RJassNativesBufferSize = 0
	
	
	integer pReservedExecutableMemory=0
	integer pReservedExecutableMemory2=0
	integer pBitwiseOR_ExecutableMemory
	boolean NeedInitBitwiseOr = true
	integer pBitwiseXOR_ExecutableMemory
	boolean NeedInitBitwiseXor = true
	integer pBitwiseAND_ExecutableMemory
	boolean NeedInitBitwiseAnd = true
	
	integer pReservedWritableMemory
	integer pReservedWritableMemory2
	
	constant integer szReservedWritableMemory = 3000
	
	integer pStorm279
	integer pPrintText1
	integer pPrintText2
	integer pPrintText3
	integer pGetUnitAbility
	integer pGetUnitAddress
	integer p_sprintf
	integer pChangeFont
	
	integer pUpdateRestoreTimer=0
	integer pAddNewOffsetToRestore=0
	constant string EXTRADLLNAME="DotAAllstarsHelper688.dll"

	integer pReserverdIntArg1
	integer pReserverdIntArg2
	integer pReserverdIntArg3
	integer pReserverdIntArg4
	hashtable Addresses=InitHashtable()
	constant integer DEF_ADR_ABILITY_DATA=0
	constant integer DEF_ADR_ABILITY_UI=1
	constant integer DEF_ADR_UNIT_DATA=2
	constant integer DEF_ADR_UNIT_UI=3
	constant integer DEF_ADR_ITEM_DATA=4
	constant integer ILLUSTION_BONUS_DAMAGE_RECEIVES=0
	constant integer ILLUSTION_BONUS_DAMAGE_DEALS=1
	
	integer pOrder1_offset
	integer pOrder2_offset
	integer pOrder3_offset
	integer pOrder4_offset
	integer pOrder5_offset
	integer pOrder6_offset
	integer pOrder7_offset
	integer pOrder8_offset
	integer Order1_unlockedvalue = 0
	integer Order2_unlockedvalue = 0
	integer Order3_unlockedvalue = 0
	integer Order4_unlockedvalue = 0
	integer Order5_unlockedvalue = 0
	integer Order6_unlockedvalue = 0
	integer Order7_unlockedvalue = 0
	integer Order8_unlockedvalue = 0
	integer Order1_lockedvalue 
	integer Order2_lockedvalue 
	integer Order3_lockedvalue 
	integer Order4_lockedvalue 
	integer Order5_lockedvalue 
	integer Order6_lockedvalue 
	integer Order7_lockedvalue
	integer Order8_lockedvalue 
	boolean IsOrder1Locked = false
	boolean IsOrder2Locked = false
	boolean IsOrder3Locked = false
	boolean IsOrder4Locked = false
	boolean IsOrder5Locked = false
	boolean IsOrder6Locked = false
	boolean IsOrder7Locked = false
	boolean IsOrder8Locked = false
	
	boolean FogUpdateBlocked = false 
	integer pUpdateFogManual=0
	integer pFogUpdateBlockAddr=0
	integer pFogUpdateBlockAddrOld1=0
	integer pFogUpdateBlockAddrOld2=0
	integer pFogUpdateBlockAddrNew1=0
	integer pFogUpdateBlockAddrNew2=0
	
	integer pGetLatestDownloadedString = 0
	integer pGetDownloadStatus = 0
	integer pSaveNewMapFromUrl = 0
	integer pGetDownloadProgress = 0
	integer pGetCurrentMapDir = 0
	
	integer pStartAbilityCD=0
	
	integer pSendCommandWithoutTarget
	integer pMissile
	integer pWindowIsActive
	integer pSendHttpGetRequest = 0
	integer pAllianceOutput
	integer AllianceLocker = 0
	boolean NotLockedAllianceOutput = true
	
	integer pMutePlayer=0
	integer pUnMutePlayer=0
	
	integer pSetWidescreenFixState=0
	integer pSetCustomFovFix=0
	
	boolean EXTRADLLLOADED = false
	
	integer RegionEditMode = 0
	real LatestMouseX = 0.
	real LatestMouseY = 0.
	integer LatestSelectRect = 0
	integer LatestOverRect = 0
	
	
	integer gl_hRectID = 0
	
	integer OPLimitAddress1=0
	integer OPLimitAddress2=0
	integer pCycloneFixCondition=0
	constant integer CycloneFixCondition026a=0x808B08EB
	integer CycloneFixBaseValue=0
	constant integer CycloneFixCondition027a=0x458B16EB
	integer pCaptionsOverTheCreeps=0
	integer pPhaseShiftInvisibilityFlagByte=0
	constant integer PhaseShiftInvisibilityFlagByteFixed0x26=0x00000060
	constant integer PhaseShiftInvisibilityFlagByteFixed0x27=0x00000060
	
	integer pMemcpy
	integer pSearchStringValue
	integer pSearchStringAddr1
	integer pSearchStringAddr2
	
	integer pReservedMemoryForUpdateFrameText
	
	integer pSimulateAttackInstance
	integer pGameTime
	
	integer pToggleForcedSubSelection=0
	integer pToggleBlockKeyAndMouseEmulation=0
	integer pToggleClickHelper=0
	
	integer pSetStunToUnitTRUE 
	integer	pSetStunToUnitFALSE 
	
	integer pReservedMemoryForSystemTime
	integer pGetLocalTime=0
	
	integer pCommonSilence
	integer pAddSilenceOnAbility
	integer pRemoveSilenceFromAbility
	integer pPauseUnitDisabler
	
	integer pUpdateUnitsSpeedCurrent
	
	integer pSendMessageToChat=0
	
	integer pCastSilenceToTarget
	integer pCastAbility=0
	
	integer pDamageBlockIllusionCheck=0
	
	integer pItemDropOrderTriggerFix=0
	
	integer pFixModelCollisionSphere=0
	
	integer pGetOrLoadFile
	integer pApplyTerrainFilterDirectly=0
	integer pSetMainFuncWork=0
	integer pFixModelTexturePath=0
	
	integer StoreIntegerOffset = 0
	integer StoreIntegerUnlocker = 0
	boolean StoreIntegerLocked = false
	
	integer pPatchModel = 0
	integer pChangeAnimationSpeed = 0
	integer pSetSequenceValue = 0
	integer pRedirectFile = 0
	integer pReservedMemoryForMissileHandler=0
	integer pReservedMemoryForDamageHandler=0
	integer pUnitVtable = 0
	integer pRealUnitDamageHandler = 0
	integer pTriggerExecute = 0
	integer pDamageTarget = 0
	integer pMissileEspData = 0
	integer pDamageEspData = 0
	integer pMissileFuncStart = 0
	integer pMissileJumpBack = 0
	
	integer pJassLog = 0
endglobals

function Char2Ascii takes string s returns integer
	local integer i= Ascii__Ints[StringHash(s) / 0x1F0748 + 0x3EA]
	if i == 47 and s == "\\" then
		set i=92
	elseif i >= 65 and i <= 90 and s != Ascii__Chars[i] then
		set i=i + 32
	endif
	return i
endfunction

function Char2Hex takes string s returns integer
	local integer i= Ascii__Ints[StringHash(s) / 0x1F0748 + 0x3EA]
	if i >= 48 and i <= 57 then
		return i - 48
	elseif i >= 65 and i <= 70 then
		return i - 55
	endif
	return - 1
endfunction

function Ascii2Char takes integer i returns string
	return Ascii__Chars[i]
endfunction

function Ascii__onInit takes nothing returns nothing
	set Ascii__Ints[931]=8
	set Ascii__Ints[1075]=9
	set Ascii__Ints[1586]=10
	set Ascii__Ints[1340]=12
	set Ascii__Ints[412]=13
	set Ascii__Ints[198]=32
	set Ascii__Ints[1979]=33
	set Ascii__Ints[1313]=34
	set Ascii__Ints[1003]=35
	set Ascii__Ints[1264]=36
	set Ascii__Ints[983]=37
	set Ascii__Ints[1277]=38
	set Ascii__Ints[306]=39
	set Ascii__Ints[904]=40
	set Ascii__Ints[934]=41
	set Ascii__Ints[917]=42
	set Ascii__Ints[1972]=43
	set Ascii__Ints[1380]=44
	set Ascii__Ints[1985]=45
	set Ascii__Ints[869]=46
	set Ascii__Ints[1906]=47
	set Ascii__Ints[883]=48
	set Ascii__Ints[1558]=49
	set Ascii__Ints[684]=50
	set Ascii__Ints[582]=51
	set Ascii__Ints[668]=52
	set Ascii__Ints[538]=53
	set Ascii__Ints[672]=54
	set Ascii__Ints[1173]=55
	set Ascii__Ints[71]=56
	set Ascii__Ints[277]=57
	set Ascii__Ints[89]=58
	set Ascii__Ints[1141]=59
	set Ascii__Ints[39]=60
	set Ascii__Ints[1171]=61
	set Ascii__Ints[51]=62
	set Ascii__Ints[305]=0 //fixme 63
	set Ascii__Ints[0]=64
	set Ascii__Ints[222]=65
	set Ascii__Ints[178]=66
	set Ascii__Ints[236]=67
	set Ascii__Ints[184]=68
	set Ascii__Ints[1295]=69
	set Ascii__Ints[1390]=70
	set Ascii__Ints[1276]=71
	set Ascii__Ints[203]=72
	set Ascii__Ints[1314]=73
	set Ascii__Ints[209]=74
	set Ascii__Ints[1315]=75
	set Ascii__Ints[170]=76
	set Ascii__Ints[1357]=77
	set Ascii__Ints[1343]=78
	set Ascii__Ints[1397]=79
	set Ascii__Ints[1420]=80
	set Ascii__Ints[1419]=81
	set Ascii__Ints[1396]=82
	set Ascii__Ints[1374]=83
	set Ascii__Ints[1407]=84
	set Ascii__Ints[499]=85
	set Ascii__Ints[1465]=86
	set Ascii__Ints[736]=87
	set Ascii__Ints[289]=88
	set Ascii__Ints[986]=89
	set Ascii__Ints[38]=90
	set Ascii__Ints[1230]=91
	set Ascii__Ints[1636]=93
	set Ascii__Ints[1416]=94
	set Ascii__Ints[1917]=95
	set Ascii__Ints[217]=96
	set Ascii__Ints[833]=123
	set Ascii__Ints[1219]=124
	set Ascii__Ints[553]=125
	set Ascii__Ints[58]=126
	
	set Ascii__Chars[0]="?"
	set Ascii__Chars[8]="\b"
	set Ascii__Chars[9]="\t" 
	set Ascii__Chars[10]="\n"
	set Ascii__Chars[12]="\f"
	set Ascii__Chars[13]="\r"
	set Ascii__Chars[32]=" "
	set Ascii__Chars[33]="!"
	set Ascii__Chars[34]="\""
	set Ascii__Chars[35]="#"
	set Ascii__Chars[36]="$"
	set Ascii__Chars[37]="%"
	set Ascii__Chars[38]="&"
	set Ascii__Chars[39]="'"//'
	set Ascii__Chars[40]="("
	set Ascii__Chars[41]=")"
	set Ascii__Chars[42]="*"
	set Ascii__Chars[43]="+"
	set Ascii__Chars[44]=","
	set Ascii__Chars[45]="-"
	set Ascii__Chars[46]="."
	set Ascii__Chars[47]="/"
	set Ascii__Chars[48]="0"
	set Ascii__Chars[49]="1"
	set Ascii__Chars[50]="2"
	set Ascii__Chars[51]="3"
	set Ascii__Chars[52]="4"
	set Ascii__Chars[53]="5"
	set Ascii__Chars[54]="6"
	set Ascii__Chars[55]="7"
	set Ascii__Chars[56]="8"
	set Ascii__Chars[57]="9"
	set Ascii__Chars[58]=":"
	set Ascii__Chars[59]=";"
	set Ascii__Chars[60]="<"
	set Ascii__Chars[61]="="
	set Ascii__Chars[62]=">"
	set Ascii__Chars[63]="?"
	set Ascii__Chars[64]="@"
	set Ascii__Chars[65]="A"
	set Ascii__Chars[66]="B"
	set Ascii__Chars[67]="C"
	set Ascii__Chars[68]="D"
	set Ascii__Chars[69]="E"
	set Ascii__Chars[70]="F"
	set Ascii__Chars[71]="G"
	set Ascii__Chars[72]="H"
	set Ascii__Chars[73]="I"
	set Ascii__Chars[74]="J"
	set Ascii__Chars[75]="K"
	set Ascii__Chars[76]="L"
	set Ascii__Chars[77]="M"
	set Ascii__Chars[78]="N"
	set Ascii__Chars[79]="O"
	set Ascii__Chars[80]="P"
	set Ascii__Chars[81]="Q"
	set Ascii__Chars[82]="R"
	set Ascii__Chars[83]="S"
	set Ascii__Chars[84]="T"
	set Ascii__Chars[85]="U"
	set Ascii__Chars[86]="V"
	set Ascii__Chars[87]="W"
	set Ascii__Chars[88]="X"
	set Ascii__Chars[89]="Y"
	set Ascii__Chars[90]="Z"
	set Ascii__Chars[91]="["
	set Ascii__Chars[92]="\\"
	set Ascii__Chars[93]="]"
	set Ascii__Chars[94]="^"
	set Ascii__Chars[95]="_"
	set Ascii__Chars[96]="`"
	set Ascii__Chars[97]="a"
	set Ascii__Chars[98]="b"
	set Ascii__Chars[99]="c"
	set Ascii__Chars[100]="d"
	set Ascii__Chars[101]="e"
	set Ascii__Chars[102]="f"
	set Ascii__Chars[103]="g"
	set Ascii__Chars[104]="h"
	set Ascii__Chars[105]="i"
	set Ascii__Chars[106]="j"
	set Ascii__Chars[107]="k"
	set Ascii__Chars[108]="l"
	set Ascii__Chars[109]="m"
	set Ascii__Chars[110]="n"
	set Ascii__Chars[111]="o"
	set Ascii__Chars[112]="p"
	set Ascii__Chars[113]="q"
	set Ascii__Chars[114]="r"
	set Ascii__Chars[115]="s"
	set Ascii__Chars[116]="t"
	set Ascii__Chars[117]="u"
	set Ascii__Chars[118]="v"
	set Ascii__Chars[119]="w"
	set Ascii__Chars[120]="x"
	set Ascii__Chars[121]="y"
	set Ascii__Chars[122]="z"
	set Ascii__Chars[123]="{"
	set Ascii__Chars[124]="|"
	set Ascii__Chars[125]="}"
	set Ascii__Chars[126]="~"
endfunction


//library Ascii ends
//library Typecast:


function InitArray takes integer vtable returns nothing
	set l__Array[4] = 0
	set l__Array[1] = vtable
	set l__Array[2] = -1
	set l__Array[3] = -1
endfunction

function TypecastArray takes nothing returns nothing
	local integer l__Array //typecast Array to integer
endfunction

function GetArrayAddress takes nothing returns integer //not really needed
	loop
		return l__Array
	endloop
	return 0
endfunction

function setCode takes code c returns nothing
	set l__Code=c
	return //Prevents Jasshelper from inlining this function
endfunction

function setInt takes integer i returns nothing
	set l__Int=i
	return //Prevents JassHelper from inlining this function
endfunction

function setStr takes string s returns nothing
	set l__Str = s
	return //Prevents JassHelper from inlining this function
endfunction

function setBool takes boolean b returns nothing
	set l__Bool = b
	return
endfunction

function Typecast1 takes nothing returns nothing
	local integer l__Code
	local code l__Int
endfunction

function C2I takes code c returns integer
	call setCode(c)
	loop //Loop is not required, I'm using it just to fool Pjass
		return l__Code
	endloop
	return 0
endfunction

function I2C takes integer i returns code
	call setInt(i)
	loop //Loop is not required, I'm using it just to fool Pjass
		return l__Int
	endloop
	return null
endfunction

function Typecast2 takes nothing returns nothing
	local integer l__Str
	local string l__Int
endfunction

function SH2I takes string s returns integer
	call setStr(s)
	loop //Loop is not required, I'm using it just to fool Pjass
    	    	return l__Str
	endloop
	return 0
endfunction

function I2SH takes integer i returns string
	call setInt(i)
	loop //Loop is not required, I'm using it just to fool Pjass
    	    	return l__Int
	endloop
	return null
endfunction

function Typecast3 takes nothing returns nothing
	local integer l__Bool
	local boolean l__Int
endfunction

function B2I takes boolean b returns integer
	call setBool(b)
	loop //Loop is not required, I'm using it just to fool Pjass
	    	return l__Bool
	endloop
	return 0
endfunction

function I2B takes integer i returns boolean
	call setInt(i)
	loop //Loop is not required, I'm using it just to fool Pjass
    		return l__Int
	endloop
	return false
endfunction

	function realToIndex takes real r returns integer
		loop
			return r
		endloop
		return 0
	endfunction

	function cleanInt takes integer i returns integer
		return i
	endfunction

	function indexToReal takes integer i returns real
		loop
			return i
		endloop
		return 0.0
	endfunction

	function cleanReal takes real r returns real
		return r
	endfunction

function GetRealFromMemory takes integer i returns real
	return cleanReal(indexToReal(i))
endfunction

function SetRealIntoMemory takes real r returns integer
	return cleanInt(realToIndex(r))
endfunction

//library Typecast ends
//library HexNumber:

function BitwiseNot takes integer i returns integer
	return 0xFFFFFFFF - i
endfunction

function PowI takes integer x, integer power returns integer
	local integer res=1
	local integer y=x
	if power==0 then
		return 1
	endif
	set power=power-1
	loop
		set x=x*y
		set power=power-1
		exitwhen power==0
	endloop
	return x
endfunction


function ShiftLeftForBits takes integer i, integer shiftval returns integer
	return i * (PowI(2,shiftval))
endfunction

function ShiftRightForBits takes integer i, integer shiftval returns integer
	return i / (PowI(2,shiftval))
endfunction

function ShiftLeftForBytes takes integer i, integer shiftval returns integer
	return ShiftLeftForBits(i,shiftval * 8)
endfunction

function ShiftRightForBytes takes integer i, integer shiftval returns integer
	return ShiftRightForBits(i,shiftval * 8)
endfunction



function GetByteFromInteger takes integer i, integer byteid returns integer 
	local integer tmpval = i 
	local integer retval = 0
	local integer byte1 = 0
	local integer byte2 = 0
	local integer byte3 = 0
	local integer byte4 = 0
	if (tmpval < 0) then 
		set tmpval = BitwiseNot(tmpval)
		set byte4 = 255 - ModuloInteger(tmpval,256)
		set tmpval = tmpval / 256 
		set byte3 = 255 - ModuloInteger(tmpval,256)
		set tmpval = tmpval / 256 
		set byte2 = 255 - ModuloInteger(tmpval,256)
		set tmpval = tmpval / 256 
		set byte1 = 255 - tmpval
	else 
		set byte4 =  ModuloInteger(tmpval,256)
		set tmpval = tmpval / 256 
		set byte3 =  ModuloInteger(tmpval,256)
		set tmpval = tmpval / 256 
		set byte2 =  ModuloInteger(tmpval,256)
		set tmpval = tmpval / 256 
		set byte1 = tmpval
	endif
	
	if byteid == 1 then 
		return byte1
	elseif byteid == 2 then 
		return byte2
	elseif byteid == 3 then 
		return byte3
	elseif byteid == 4 then 
		return byte4
	endif

	
	return retval
endfunction


function CreateInteger1 takes integer byte1, integer byte2, integer byte3, integer byte4 returns integer
	local integer retval = byte1
	set retval = ( retval * 256 ) + byte2
	set retval = ( retval * 256 ) + byte3
	set retval = ( retval * 256 ) + byte4
	return retval
endfunction

function CreateInteger2 takes integer byte1, integer byte2, integer byte3, integer byte4 returns integer
	local integer retval = byte1
	set retval = ShiftLeftForBytes(retval,1) + byte2
	set retval = ShiftLeftForBytes(retval,1) + byte3
	set retval = ShiftLeftForBytes(retval,1) + byte4
	return retval
endfunction


function Hex2Int takes string s returns integer
	local integer result= 0
	local integer i= 0
	local integer char
	loop
		set char=Char2Hex(SubString(s, i, i + 1))
		exitwhen i == 8 or char == - 1
		set result=result * 16 + char
		set i=i + 1
	endloop
	return result
endfunction


function Int2Hex_FIX takes integer i returns string
	set i = BitwiseNot(i)
	return  HexNumber__Chars[255-(i/256/256/256)] + HexNumber__Chars[255-ModuloInteger(i/256/256,256)] + HexNumber__Chars[255-ModuloInteger(i/256,256)]  +  HexNumber__Chars[255-ModuloInteger(i,256)]
endfunction

function Int2Hex takes integer i returns string
	if (i < 0) then 
		return Int2Hex_FIX(i)
	endif
	return  HexNumber__Chars[(i/256/256/256)] + HexNumber__Chars[ModuloInteger(i/256/256,256)] + HexNumber__Chars[ModuloInteger(i/256,256)]  +  HexNumber__Chars[ModuloInteger(i,256)]
endfunction


function HexNumber__onInit takes nothing returns nothing
	set HexNumber__Chars[0]="00" 
	set HexNumber__Chars[1]="01" 
	set HexNumber__Chars[2]="02" 
	set HexNumber__Chars[3]="03" 
	set HexNumber__Chars[4]="04" 
	set HexNumber__Chars[5]="05" 
	set HexNumber__Chars[6]="06" 
	set HexNumber__Chars[7]="07" 
	set HexNumber__Chars[8]="08" 
	set HexNumber__Chars[9]="09" 
	set HexNumber__Chars[10]="0A" 
	set HexNumber__Chars[11]="0B" 
	set HexNumber__Chars[12]="0C" 
	set HexNumber__Chars[13]="0D" 
	set HexNumber__Chars[14]="0E" 
	set HexNumber__Chars[15]="0F" 
	set HexNumber__Chars[16]="10" 
	set HexNumber__Chars[17]="11" 
	set HexNumber__Chars[18]="12" 
	set HexNumber__Chars[19]="13" 
	set HexNumber__Chars[20]="14" 
	set HexNumber__Chars[21]="15" 
	set HexNumber__Chars[22]="16" 
	set HexNumber__Chars[23]="17" 
	set HexNumber__Chars[24]="18" 
	set HexNumber__Chars[25]="19" 
	set HexNumber__Chars[26]="1A" 
	set HexNumber__Chars[27]="1B" 
	set HexNumber__Chars[28]="1C" 
	set HexNumber__Chars[29]="1D" 
	set HexNumber__Chars[30]="1E" 
	set HexNumber__Chars[31]="1F" 
	set HexNumber__Chars[32]="20" 
	set HexNumber__Chars[33]="21" 
	set HexNumber__Chars[34]="22" 
	set HexNumber__Chars[35]="23" 
	set HexNumber__Chars[36]="24" 
	set HexNumber__Chars[37]="25" 
	set HexNumber__Chars[38]="26" 
	set HexNumber__Chars[39]="27" 
	set HexNumber__Chars[40]="28" 
	set HexNumber__Chars[41]="29" 
	set HexNumber__Chars[42]="2A" 
	set HexNumber__Chars[43]="2B" 
	set HexNumber__Chars[44]="2C" 
	set HexNumber__Chars[45]="2D" 
	set HexNumber__Chars[46]="2E" 
	set HexNumber__Chars[47]="2F" 
	set HexNumber__Chars[48]="30" 
	set HexNumber__Chars[49]="31" 
	set HexNumber__Chars[50]="32" 
	set HexNumber__Chars[51]="33" 
	set HexNumber__Chars[52]="34" 
	set HexNumber__Chars[53]="35" 
	set HexNumber__Chars[54]="36" 
	set HexNumber__Chars[55]="37" 
	set HexNumber__Chars[56]="38" 
	set HexNumber__Chars[57]="39" 
	set HexNumber__Chars[58]="3A" 
	set HexNumber__Chars[59]="3B" 
	set HexNumber__Chars[60]="3C" 
	set HexNumber__Chars[61]="3D" 
	set HexNumber__Chars[62]="3E" 
	set HexNumber__Chars[63]="3F" 
	set HexNumber__Chars[64]="40" 
	set HexNumber__Chars[65]="41" 
	set HexNumber__Chars[66]="42" 
	set HexNumber__Chars[67]="43" 
	set HexNumber__Chars[68]="44" 
	set HexNumber__Chars[69]="45" 
	set HexNumber__Chars[70]="46" 
	set HexNumber__Chars[71]="47" 
	set HexNumber__Chars[72]="48" 
	set HexNumber__Chars[73]="49" 
	set HexNumber__Chars[74]="4A" 
	set HexNumber__Chars[75]="4B" 
	set HexNumber__Chars[76]="4C" 
	set HexNumber__Chars[77]="4D" 
	set HexNumber__Chars[78]="4E" 
	set HexNumber__Chars[79]="4F" 
	set HexNumber__Chars[80]="50" 
	set HexNumber__Chars[81]="51" 
	set HexNumber__Chars[82]="52" 
	set HexNumber__Chars[83]="53" 
	set HexNumber__Chars[84]="54" 
	set HexNumber__Chars[85]="55" 
	set HexNumber__Chars[86]="56" 
	set HexNumber__Chars[87]="57" 
	set HexNumber__Chars[88]="58" 
	set HexNumber__Chars[89]="59" 
	set HexNumber__Chars[90]="5A" 
	set HexNumber__Chars[91]="5B" 
	set HexNumber__Chars[92]="5C" 
	set HexNumber__Chars[93]="5D" 
	set HexNumber__Chars[94]="5E" 
	set HexNumber__Chars[95]="5F" 
	set HexNumber__Chars[96]="60" 
	set HexNumber__Chars[97]="61" 
	set HexNumber__Chars[98]="62" 
	set HexNumber__Chars[99]="63" 
	set HexNumber__Chars[100]="64" 
	set HexNumber__Chars[101]="65" 
	set HexNumber__Chars[102]="66" 
	set HexNumber__Chars[103]="67" 
	set HexNumber__Chars[104]="68" 
	set HexNumber__Chars[105]="69" 
	set HexNumber__Chars[106]="6A" 
	set HexNumber__Chars[107]="6B" 
	set HexNumber__Chars[108]="6C" 
	set HexNumber__Chars[109]="6D" 
	set HexNumber__Chars[110]="6E" 
	set HexNumber__Chars[111]="6F" 
	set HexNumber__Chars[112]="70" 
	set HexNumber__Chars[113]="71" 
	set HexNumber__Chars[114]="72" 
	set HexNumber__Chars[115]="73" 
	set HexNumber__Chars[116]="74" 
	set HexNumber__Chars[117]="75" 
	set HexNumber__Chars[118]="76" 
	set HexNumber__Chars[119]="77" 
	set HexNumber__Chars[120]="78" 
	set HexNumber__Chars[121]="79" 
	set HexNumber__Chars[122]="7A" 
	set HexNumber__Chars[123]="7B" 
	set HexNumber__Chars[124]="7C" 
	set HexNumber__Chars[125]="7D" 
	set HexNumber__Chars[126]="7E" 
	set HexNumber__Chars[127]="7F" 
	set HexNumber__Chars[128]="80" 
	set HexNumber__Chars[129]="81" 
	set HexNumber__Chars[130]="82" 
	set HexNumber__Chars[131]="83" 
	set HexNumber__Chars[132]="84" 
	set HexNumber__Chars[133]="85" 
	set HexNumber__Chars[134]="86" 
	set HexNumber__Chars[135]="87" 
	set HexNumber__Chars[136]="88" 
	set HexNumber__Chars[137]="89" 
	set HexNumber__Chars[138]="8A" 
	set HexNumber__Chars[139]="8B" 
	set HexNumber__Chars[140]="8C" 
	set HexNumber__Chars[141]="8D" 
	set HexNumber__Chars[142]="8E" 
	set HexNumber__Chars[143]="8F" 
	set HexNumber__Chars[144]="90" 
	set HexNumber__Chars[145]="91" 
	set HexNumber__Chars[146]="92" 
	set HexNumber__Chars[147]="93" 
	set HexNumber__Chars[148]="94" 
	set HexNumber__Chars[149]="95" 
	set HexNumber__Chars[150]="96" 
	set HexNumber__Chars[151]="97" 
	set HexNumber__Chars[152]="98" 
	set HexNumber__Chars[153]="99" 
	set HexNumber__Chars[154]="9A" 
	set HexNumber__Chars[155]="9B" 
	set HexNumber__Chars[156]="9C" 
	set HexNumber__Chars[157]="9D" 
	set HexNumber__Chars[158]="9E" 
	set HexNumber__Chars[159]="9F" 
	set HexNumber__Chars[160]="A0" 
	set HexNumber__Chars[161]="A1" 
	set HexNumber__Chars[162]="A2" 
	set HexNumber__Chars[163]="A3" 
	set HexNumber__Chars[164]="A4" 
	set HexNumber__Chars[165]="A5" 
	set HexNumber__Chars[166]="A6" 
	set HexNumber__Chars[167]="A7" 
	set HexNumber__Chars[168]="A8" 
	set HexNumber__Chars[169]="A9" 
	set HexNumber__Chars[170]="AA" 
	set HexNumber__Chars[171]="AB" 
	set HexNumber__Chars[172]="AC" 
	set HexNumber__Chars[173]="AD" 
	set HexNumber__Chars[174]="AE" 
	set HexNumber__Chars[175]="AF" 
	set HexNumber__Chars[176]="B0" 
	set HexNumber__Chars[177]="B1" 
	set HexNumber__Chars[178]="B2" 
	set HexNumber__Chars[179]="B3" 
	set HexNumber__Chars[180]="B4" 
	set HexNumber__Chars[181]="B5" 
	set HexNumber__Chars[182]="B6" 
	set HexNumber__Chars[183]="B7" 
	set HexNumber__Chars[184]="B8" 
	set HexNumber__Chars[185]="B9" 
	set HexNumber__Chars[186]="BA" 
	set HexNumber__Chars[187]="BB" 
	set HexNumber__Chars[188]="BC" 
	set HexNumber__Chars[189]="BD" 
	set HexNumber__Chars[190]="BE" 
	set HexNumber__Chars[191]="BF" 
	set HexNumber__Chars[192]="C0" 
	set HexNumber__Chars[193]="C1" 
	set HexNumber__Chars[194]="C2" 
	set HexNumber__Chars[195]="C3" 
	set HexNumber__Chars[196]="C4" 
	set HexNumber__Chars[197]="C5" 
	set HexNumber__Chars[198]="C6" 
	set HexNumber__Chars[199]="C7" 
	set HexNumber__Chars[200]="C8" 
	set HexNumber__Chars[201]="C9" 
	set HexNumber__Chars[202]="CA" 
	set HexNumber__Chars[203]="CB" 
	set HexNumber__Chars[204]="CC" 
	set HexNumber__Chars[205]="CD" 
	set HexNumber__Chars[206]="CE" 
	set HexNumber__Chars[207]="CF" 
	set HexNumber__Chars[208]="D0" 
	set HexNumber__Chars[209]="D1" 
	set HexNumber__Chars[210]="D2" 
	set HexNumber__Chars[211]="D3" 
	set HexNumber__Chars[212]="D4" 
	set HexNumber__Chars[213]="D5" 
	set HexNumber__Chars[214]="D6" 
	set HexNumber__Chars[215]="D7" 
	set HexNumber__Chars[216]="D8" 
	set HexNumber__Chars[217]="D9" 
	set HexNumber__Chars[218]="DA" 
	set HexNumber__Chars[219]="DB" 
	set HexNumber__Chars[220]="DC" 
	set HexNumber__Chars[221]="DD" 
	set HexNumber__Chars[222]="DE" 
	set HexNumber__Chars[223]="DF" 
	set HexNumber__Chars[224]="E0" 
	set HexNumber__Chars[225]="E1" 
	set HexNumber__Chars[226]="E2" 
	set HexNumber__Chars[227]="E3" 
	set HexNumber__Chars[228]="E4" 
	set HexNumber__Chars[229]="E5" 
	set HexNumber__Chars[230]="E6" 
	set HexNumber__Chars[231]="E7" 
	set HexNumber__Chars[232]="E8" 
	set HexNumber__Chars[233]="E9" 
	set HexNumber__Chars[234]="EA" 
	set HexNumber__Chars[235]="EB" 
	set HexNumber__Chars[236]="EC" 
	set HexNumber__Chars[237]="ED" 
	set HexNumber__Chars[238]="EE" 
	set HexNumber__Chars[239]="EF" 
	set HexNumber__Chars[240]="F0" 
	set HexNumber__Chars[241]="F1" 
	set HexNumber__Chars[242]="F2" 
	set HexNumber__Chars[243]="F3" 
	set HexNumber__Chars[244]="F4" 
	set HexNumber__Chars[245]="F5" 
	set HexNumber__Chars[246]="F6" 
	set HexNumber__Chars[247]="F7" 
	set HexNumber__Chars[248]="F8" 
	set HexNumber__Chars[249]="F9" 
	set HexNumber__Chars[250]="FA" 
	set HexNumber__Chars[251]="FB" 
	set HexNumber__Chars[252]="FC" 
	set HexNumber__Chars[253]="FD" 
	set HexNumber__Chars[254]="FE" 
	set HexNumber__Chars[255]="FF" 

endfunction

function GetChar takes string s, integer pos returns string
	return SubString(s, pos, pos +1)
endfunction
//library HexNumber ends
//library Memory:


function ReadMemory takes integer address returns integer
	return Memory[address/4] //Inline-friendly
endfunction

function WriteMemory takes integer address, integer value returns nothing
	set Memory[address/4] = value //Inline-friendly
endfunction

function InitBytecode takes integer id, integer k returns nothing
	set l__bytecode[0] = 0x0C010900 //op: 0C(LITERAL), type: 09(integer array), reg: 01,
	set l__bytecode[1] = k //value: 0x2114D008
	set l__bytecode[2] = 0x11010000 //op: 11(SETVAR), reg: 01
	set l__bytecode[3] = id		 //id of variable Memory
	set l__bytecode[4] = 0x0C010400 //op: 0C(LITERAL), type: 04(integer), reg: 01, value: 0
	set l__bytecode[6] = 0x27000000 //op: 27(RETURN)

	set l__bytecode[8] = 0x07090000 //op: 07(GLOBAL), type: 09 (integer array) //Create new array
	set l__bytecode[9] = 0x0C5F //name: C5F(“stand”)
	set l__bytecode[10] = 0x0E010400 //op: 0E(GETVAR), type: 04(integer), reg: 01 //Obtain the desired amount of bytes
	set l__bytecode[11] = id+1		 //id of variable bytecodedata (variable ids are sequential)
	set l__bytecode[12] = 0x12010100 //op: 12(SETARRAY), index=reg01, value=reg01 //Set index of the array, forcing allocation of memory
	set l__bytecode[13] = 0x0C5F //name: C5F(“stand”)
	set l__bytecode[14] = 0x0E010400 //op: 0E(GETVAR), type: 04(integer), reg: 01 //Read array variable as an integer
	set l__bytecode[15] = 0x0C5F //name: C5F(“stand”)
	set l__bytecode[16] = 0x11010000 //op: 11(SETVAR), reg: 01 //pass the value to the jass world
	set l__bytecode[17] = id+1		 //id of variable bytecodedata
	set l__bytecode[18] = 0x27000000 //op: 27(RETURN)
endfunction


function Typecast takes nothing returns nothing
	local integer l__bytecode
endfunction

function GetBytecodeAddress takes nothing returns integer
	loop
		return l__bytecode
	endloop
	return 0
endfunction

function NewGlobal takes nothing returns integer
	return -0x0C5F0704 //op: 07(GLOBAL), type: 04(integer), name: 0x0C5F("stand")
	return 0x2700 //op: 27(RETURN)
endfunction

function SetGlobal takes nothing returns nothing
	//This will actually set the value of the global variable, not the local
	local integer stand= 0x2114D008
endfunction

function UnlockMemory takes nothing returns nothing
	local integer array stand //The execution of this line is skipped
	call ForForce(bj_FORCE_PLAYER[0], I2C(2+C2I(function NewGlobal)))
	call ForForce(bj_FORCE_PLAYER[0], I2C(8+C2I(function SetGlobal)))
//	/*local array "stand" can now read memory, but not write.
//	The bytecode unlocks the ability to read and write memory
//	with the "Memory" array*/
	call InitArray( 0 )
	call InitArray(stand[GetArrayAddress()/4])
	call InitBytecode(stand[C2I(function ReadMemory)/4 + 13], stand[GetArrayAddress()/4+3]+4) //obtain the id of variable "Memory"
	call ForForce(bj_FORCE_PLAYER[0], I2C(stand[GetBytecodeAddress()/4+3])) //run bytecode from the array
endfunction

function malloc takes integer bytes returns integer //I’m not at home, I’m writing this from head without testing, not sure if it works
	set bytecodedata = bytes/4 + 4
	call ForForce(bj_FORCE_PLAYER[0], I2C(Memory[GetBytecodeAddress()/4+3]+32))
	return ( Memory[bytecodedata/4+3] + 4 ) / 4 * 4  //Address of data in the newly created array
endfunction

// addr 0x10000 data 1C 2C 8A 7D 6D 5F 5A 4C 6C 3C 8C 7A
// read memory at 0x10003   ( 7D 6D 5F 5A )

function CreateIntegerFromTwoByOffset takes integer i1, integer i2, integer offset returns integer 
	local integer array pBytes
	set pBytes[0] = GetByteFromInteger(i1,4)
	set pBytes[1] = GetByteFromInteger(i1,3)
	set pBytes[2] = GetByteFromInteger(i1,2)
	set pBytes[3] = GetByteFromInteger(i1,1)
	set pBytes[4] = GetByteFromInteger(i2,4)
	set pBytes[5] = GetByteFromInteger(i2,3)
	set pBytes[6] = GetByteFromInteger(i2,2)
	set pBytes[7] = GetByteFromInteger(i2,1)
	return CreateInteger1(pBytes[offset+3],pBytes[offset+2],pBytes[offset+1],pBytes[offset+0])
endfunction


function CreateDoubleIntegerAndGetOne takes integer i1, integer i2, integer value, integer offset, boolean first returns integer
	local integer array pBytes
	set pBytes[0] = GetByteFromInteger(i1,4)
	set pBytes[1] = GetByteFromInteger(i1,3)
	set pBytes[2] = GetByteFromInteger(i1,2)
	set pBytes[3] = GetByteFromInteger(i1,1)
	set pBytes[4] = GetByteFromInteger(i2,4)
	set pBytes[5] = GetByteFromInteger(i2,3)
	set pBytes[6] = GetByteFromInteger(i2,2)
	set pBytes[7] = GetByteFromInteger(i2,1)
	
	set pBytes[offset] = GetByteFromInteger(value,4)
	set pBytes[offset+1] = GetByteFromInteger(value,3)
	set pBytes[offset+2] = GetByteFromInteger(value,2)
	set pBytes[offset+3] = GetByteFromInteger(value,1)
	
	if (first) then
		return CreateInteger1(pBytes[3],pBytes[2],pBytes[1],pBytes[0])
	else
		return CreateInteger1(pBytes[7],pBytes[6],pBytes[5],pBytes[4])
	endif
endfunction


function ReadRealMemory_FIX takes integer addr returns integer
	local integer ByteOffset = addr - ( addr / 4 * 4 )
	local integer FirstAddr = addr - ByteOffset
	return CreateIntegerFromTwoByOffset(Memory[FirstAddr/4],Memory[FirstAddr/4+1], ByteOffset)
endfunction

function ReadRealMemory takes integer addr returns integer
	if addr/4*4!=addr then
		call BJDebugMsg("ReadMemory WARNING! : " + Int2Hex(addr))
		return ReadRealMemory_FIX(addr)
	endif
	return Memory[addr/4]
endfunction



function WriteRealMemory_FIX takes integer addr, integer val returns nothing
	local integer Int_1	
	local integer Int_2
	local integer ByteOffset = addr - ( addr / 4 * 4 )
	local integer FirstAddr = addr - ByteOffset
	set Int_1 = ReadRealMemory(FirstAddr)
	set Int_2 = ReadRealMemory(FirstAddr + 4)
	set Memory[FirstAddr/4] = CreateDoubleIntegerAndGetOne ( Int_1, Int_2, val, ByteOffset, true)
	set Memory[FirstAddr/4 + 1] = CreateDoubleIntegerAndGetOne ( Int_1, Int_2, val, ByteOffset, false)
endfunction

function WriteRealMemory takes integer addr, integer val returns nothing
	if addr/4*4!=addr then
		call BJDebugMsg("WriteMemory WARNING! : " + Int2Hex(addr) )
		call WriteRealMemory_FIX(addr,val)
	else 
		set Memory[addr/4] = val
	endif
endfunction

// read Game.dll + real offset
function ReadOffset takes integer i returns integer
	return ReadRealMemory(GameDLL+i)
endfunction

function ReadOffsetUnsafe takes integer i returns integer
	return  Memory[(GameDLL+i)/4]
endfunction

function ReadRealPointer1LVL takes integer addr, integer offset1 returns integer
	local integer retval = 0
	if addr > 0 then 
		set retval = ReadRealMemory(addr)
		if addr > 0 then 
			set retval = ReadRealMemory(retval + offset1)
		else 
			set retval = 0
		endif
	endif
	return retval
endfunction

function WriteRealPointer1LVL takes integer addr, integer offset1, integer val returns nothing
	local integer retval = 0
	if addr > 0 then 
		set retval = ReadRealMemory(addr)
		if addr > 0 then 
			call WriteRealMemory(retval + offset1,val)
		endif
	endif
endfunction

function ReadRealPointer2LVL takes integer addr, integer offset1, integer offset2 returns integer
	local integer retval = ReadRealPointer1LVL(addr,offset1)
	if retval > 0 then 
		set retval = ReadRealMemory(retval + offset2)
	else
		set retval = 0
	endif
	return retval
endfunction

function WriteRealPointer2LVL takes integer addr, integer offset1, integer offset2, integer val returns nothing
	local integer retval = 0
	if addr > 0 then 
		set retval = ReadRealPointer1LVL(addr,offset1)
		if addr > 0 then 
			call WriteRealMemory(retval + offset2,val)
		endif
	endif
endfunction

function ReadRealPointer3LVL takes integer addr, integer offset1, integer offset2, integer offset3 returns integer
	local integer retval = ReadRealPointer2LVL(addr,offset1,offset2)
	if retval > 0 then 
		set retval = ReadRealMemory(retval + offset3)
	else
		set retval = 0
	endif
	return retval
endfunction

function WriteRealPointer3LVL takes integer addr, integer offset1, integer offset2,integer offset3, integer val returns nothing
	local integer retval = 0
	if addr > 0 then 
		set retval = ReadRealPointer2LVL(addr,offset1,offset2)
		if addr > 0 then 
			call WriteRealMemory(retval + offset3,val)
		endif
	endif
endfunction

function ReadRealPointer4LVL takes integer addr, integer offset1, integer offset2, integer offset3, integer offset4 returns integer
	local integer retval = ReadRealPointer3LVL(addr,offset1,offset2,offset3)
	if retval > 0 then 
		set retval = ReadRealMemory(retval + offset4)
	else
		set retval = 0
	endif
	return retval
endfunction

function WriteRealPointer4LVL takes integer addr, integer offset1, integer offset2,integer offset3, integer offset4, integer val returns nothing
	local integer retval = 0
	if addr > 0 then 
		set retval = ReadRealPointer3LVL(addr,offset1,offset2,offset3)
		if addr > 0 then 
			call WriteRealMemory(retval + offset4,val)
		endif
	endif
endfunction

function ReadRealPointer5LVL takes integer addr, integer offset1, integer offset2, integer offset3, integer offset4, integer offset5 returns integer
	local integer retval = ReadRealPointer4LVL(addr,offset1,offset2,offset3,offset4)
	if retval > 0 then 
		set retval = ReadRealMemory(retval + offset5)
	else
		set retval = 0
	endif
	return retval
endfunction

function WriteRealPointer5LVL takes integer addr, integer offset1, integer offset2,integer offset3, integer offset4,integer offset5, integer val returns nothing
	local integer retval = 0
	if addr > 0 then 
		set retval = ReadRealPointer4LVL(addr,offset1,offset2,offset3,offset4)
		if addr > 0 then 
			call WriteRealMemory(retval + offset5,val)
		endif
	endif
endfunction

function IsJassNativeExists takes integer nativeaddress returns boolean
	//local integer FirstAddress = Memory[Memory[Memory[pJassEnvAddress]/4+0x5]/4+8]/4
	local integer FirstAddress = ReadRealPointer2LVL(pJassEnvAddress*4, 0x14, 0x20)/4
	local integer NextAddress = FirstAddress
	local integer i = 0
	loop 
		if Memory[NextAddress+3]/4 == nativeaddress then
			return NextAddress+3 > 0
		endif
		
		set NextAddress = Memory[NextAddress]/4
		if NextAddress == FirstAddress or NextAddress == 0 then
			return false
		endif
	endloop
	return false
endfunction


function CreateJassNativeHook takes integer oldaddress, integer newaddress returns integer
	//[[[[Game.dll+ADA848]+14]+20]
	//local integer FirstAddress = Memory[Memory[Memory[pJassEnvAddress]/4+0x5]/4+8]/4
	local integer FirstAddress = ReadRealPointer2LVL(pJassEnvAddress*4, 0x14, 0x20)
	local integer NextAddress = FirstAddress

	local integer i = 0
	
	if RJassNativesBufferSize > 0 then 
		loop
			set i = i + 1
			
			if RJassNativesBuffer[  i * 3 - 3 ] == oldaddress or RJassNativesBuffer[ i * 3 - 2 ] == oldaddress or RJassNativesBuffer[  i * 3 - 3 ] == newaddress or RJassNativesBuffer[  i * 3 - 2 ] == newaddress then
				call WriteRealMemory(RJassNativesBuffer[ i  * 3 - 1 ], newaddress)
				//call BJDebugMsg("Loaded from buffset.")
				return RJassNativesBuffer[ i * 3 - 1 ]
			endif
			
			exitwhen i == RJassNativesBufferSize 
		endloop
	endif
	
	loop 
		if ReadRealMemory(NextAddress+12) < 0x3000 then 
			return 0
		endif
		if ReadRealMemory(NextAddress+12) == oldaddress then
			call WriteRealMemory(NextAddress+12, newaddress)
			
			// Maximum store 100 values for fast load
			if RJassNativesBufferSize < 100 then
				set RJassNativesBufferSize = RJassNativesBufferSize + 1
				set RJassNativesBuffer[ RJassNativesBufferSize  * 3 - 1 ] = NextAddress + 12
				set RJassNativesBuffer[ RJassNativesBufferSize  * 3 - 2 ] = oldaddress
				set RJassNativesBuffer[ RJassNativesBufferSize  * 3 - 3 ] = newaddress
			endif
			
			return NextAddress+12
		endif
		
		set NextAddress = ReadRealMemory(NextAddress)
		if NextAddress == FirstAddress or NextAddress == 0 then
			return 0
		endif
	endloop
	return 0
endfunction

function Init27 takes nothing returns nothing
	local integer base
	set GameDLL = ReadRealMemory(GetBytecodeAddress())-0xA63B30
	set base=GameDLL / 4
	set GameState = base + 0x2F908E
	set pGameClass1 = base + 0x2F902A
	set pGameClass2 = base + 0xBE6350 / 4
	set pCGameState = base + 0xBE4EAC / 4
		
	set pointers = Memory[pGameClass1]/4
	set pUnitData = GameDLL + 0xBEC48C
	set pAbilityData = GameDLL + 0xBECD44

	set pGlobalPlayerClass = GameState //They are the same thing
	
	set pUnitMaxSpeedConstant = base + 0xBEC454 / 4 
	set pUnitMinSpeedConstant = base + 0xBEC450 / 4 
	set pBuildingMaxSpeedConstant = base + 0xBEC45C / 4 
	set pBuildingMinSpeedConstant = base + 0xBEC458 / 4 
	
	set pUnitMaxSpeedConstantD = base + 0xBEC464 / 4 
	set pUnitMinSpeedConstantD = base + 0xBEC460 / 4 
	set pBuildingMaxSpeedConstantD = base + 0xBEC46C / 4 
	set pBuildingMinSpeedConstantD = base + 0xBEC468 / 4 
	
	set pUnitUIDefAddr = GameDLL + 0xBE6130 
	set pUnitDataDefAddr = pUnitData// base + 0xBEC48C / 4
	
	set pAbilityUIDefAddr = GameDLL + 0xBE6158 
	set pAbilityDataDefAddr = pAbilityData//base + 0xBECD44 / 4

	set pAttackSpeedLimit = base + 0xBE7A04 / 4
	set pAttackTimeLimit = base + 0xb593a0 / 4
	
	
	set pJassEnvAddress = base + 0xBE3740 / 4
	set pLightEnv = base + 0xBEE150 / 4
	set pGameClass3 = base + 0xBB9D8C / 4
	
	set pTimerAddr = base + 0xBB82BC / 4
	
	
	set pGetModuleHandle = base + 0x94E184 / 4
	set pGetProcAddress = base + 0x94E168 / 4
	set pVirtualAlloc = base + 0x94E270 / 4
	
		
	set pMergeUnits = GameDLL + 0x891F20
	set pIgnoredUnits = GameDLL + 0x890FB0
	set pConvertUnits = GameDLL + 0x88E350
	set pLeaderboardSetItemLabelColor = base + 0x1EFF90 / 4
	
	set pExportFromMpq = GameDLL + 0x702C50 
	set pGetFrameItemAddress = GameDLL + 0x09EF40
	set pGetFrameSkinAddress = GameDLL + 0x324AD0
	set pGetFrameTextAddress = GameDLL + 0x0C8EF0
	set pUpdateFrameText = GameDLL + 0x0C1020

	set pFrameDefClass = GameDLL + 0xBB9CFC
	
	set pPacketClass = GameDLL + 0x973210 
	set pPacketSend = GameDLL + 0x30F1B0 
	
	
	set pConvertString = GameDLL + 0x1DA520
	
	set pStorm279 = base + 0x94E6C4 / 4
	
	set pPrintText1 = GameDLL + 0x3574B0 
	set pPrintText2 = GameDLL + 0x356A60 
	set pPrintText3 = GameDLL + 0xc2070
	
	set pChangeFont = GameDLL + 0x153E10
	
	set pCameraDefaultHeight = base + 0x9714D0 / 4
	
	set pPingMinimapOffset = GameDLL + 0x1F1BD0 
	set pPingMinimapExOffset = GameDLL + 0x1F1C30

	set pAllianceOutput = GameDLL + 0x34E2C0 
	
	set pWindowIsActive = base + 0xB673EC / 4
	set pSendCommandWithoutTarget = GameDLL + 0x3AE4E0 
	set pMissile = base + 0xBED23C / 4
	
	
	set pOrder1_offset = GameDLL + 0x3AE4E0 
	set pOrder2_offset = GameDLL + 0x3AE540 
	set pOrder3_offset = GameDLL + 0x3AE5D0
	set pOrder4_offset = GameDLL + 0x3AE660 
	set pOrder5_offset = GameDLL + 0x3AE6F0
	set pOrder6_offset = GameDLL + 0x3AE780 
	set pOrder7_offset = GameDLL + 0x3AE810
	set pOrder8_offset = GameDLL + 0x3AE880 
			
	set Order1_lockedvalue = 0x900010C2
	set Order2_lockedvalue = 0x900018C2
	set Order3_lockedvalue = 0x900020C2
	set Order4_lockedvalue = 0x90001CC2
	set Order5_lockedvalue = 0x90001CC2
	set Order6_lockedvalue = 0x900020C2
	set Order7_lockedvalue = 0x900014C2
	set Order8_lockedvalue = 0x900014C2
		
	set pStartAbilityCD = GameDLL + 0x62D4C0
	
	set pUpdateFogManual = GameDLL + 0x26B600
	
	set pFogUpdateBlockAddr = base  + 0x26B5A8 / 4
	set pFogUpdateBlockAddrNew1 = 0xC25D0004
	set pFogUpdateBlockAddrNew2 = 0xB8900004
	
	set OPLimitAddress1=GameDLL+0x1BFB48
	set OPLimitAddress2=GameDLL+0x1BFB4C
	
	set pCycloneFixCondition=GameDLL+0x65B3F0
	
	
	set pCaptionsOverTheCreeps=GameDLL+0x3B4180
	
	set pPhaseShiftInvisibilityFlagByte=GameDLL+0x7ffdb8
	
	set pGetUnitAbility = GameDLL + 0x46F440
	set pGetUnitAddress = GameDLL + 0x1D1550
	
	set p_sprintf = GameDLL + 0x94E464
	
	set pMemcpy = GameDLL + 0x94E468
	set pSearchStringValue = GameDLL + 0x06B030
	set pSearchStringAddr1 = GameDLL + 0xBB9CD4
	set pSearchStringAddr2 = GameDLL + 0xBB9CAC
	
	set pSimulateAttackInstance = GameDLL + 0x476F80
	set pGameTime = GameDLL + 0xBE3D70
	
	
	set pSetStunToUnitTRUE = GameDLL+0x66B600
	set	pSetStunToUnitFALSE = GameDLL+0x65AE60
	
	set pCommonSilence=GameDLL+0x471C40
	set pAddSilenceOnAbility=GameDLL+0x3E9FA0
	set pRemoveSilenceFromAbility=GameDLL+0x3EE3C0
	set pPauseUnitDisabler=GameDLL+0x46F180
	
	set pUpdateUnitsSpeedCurrent=GameDLL+0x10C690
	
	set pCastSilenceToTarget=GameDLL+0x3DA3C0
	
	set pCastAbility=GameDLL+0x3ECB70
	
	set pDamageBlockIllusionCheck=GameDLL+0x4E3040
	
	set pItemDropOrderTriggerFix=GameDLL+0x65D520//9090f03b
	
	set pGetOrLoadFile = GameDLL + 0x4A800
	
	set StoreIntegerOffset = GameDLL + 0x1F8280
	
	set pUnitVtable = GameDLL + 0xA4A704
	set pRealUnitDamageHandler = GameDLL + 0x67DC40
	set pTriggerExecute = GameDLL + 0x1F9100
	
	
	set pMissileFuncStart = GameDLL+0x476F80
	set pMissileJumpBack = GameDLL+0x476F85
	set pItemDataNode=GameDLL+0xBEC254+0x10
	
	set GameVersion = 0x27a
endfunction

function Init26 takes nothing returns nothing
	local integer base
	set GameDLL = ReadRealMemory(GetBytecodeAddress())-0x951060
	set base=GameDLL / 4
	set GameState = base+0x2AD97D
	set pGameClass1 = base+0x2ADDE2
	set pGameClass2 = base + 0xAB4F80 / 4
	set pCGameState = base + 0xAB6EA4 / 4
	
	set pointers = Memory[pGameClass1]/4
	set pUnitData = GameDLL + 0xAB4478
	set pAbilityData = GameDLL + 0xAB3E64
	
	set pGlobalPlayerClass = GameState //base + 0xAB65F4 / 4 

	set pUnitMaxSpeedConstant = base + 0xAB4440 / 4 
	set pUnitMinSpeedConstant = base + 0xAB443C / 4 
	set pBuildingMaxSpeedConstant = base + 0xAB4448 / 4 
	set pBuildingMinSpeedConstant = base + 0xAB4444 / 4 
	
	set pUnitMaxSpeedConstantD = base + 0xAB4450/ 4 
	set pUnitMinSpeedConstantD = base + 0xAB444C / 4 
	set pBuildingMaxSpeedConstantD = base + 0xAB4458 / 4 
	set pBuildingMinSpeedConstantD = base + 0xAB4454 / 4 
	
	set pUnitUIDefAddr = GameDLL + 0xAB58F0 
	set pUnitDataDefAddr = pUnitData
	
	set pAbilityUIDefAddr = GameDLL + 0xAB5918 
	set pAbilityDataDefAddr = pAbilityData
	
	set pAttackSpeedLimit = base + 0xAB0074 / 4
	set pAttackTimeLimit = base + 0xAAE484 / 4

	
	set pJassEnvAddress = base + 0xADA848 / 4
	set pLightEnv = base + 0xAAE788 / 4
	set pGameClass3 = base + 0xACE670 / 4
	
	set pTimerAddr = base + 0xAB7368 / 4
	
	
	set pGetModuleHandle = base + 0x86D1D0 / 4
	set pGetProcAddress = base + 0x86D280 / 4
	set pVirtualAlloc = base + 0x86D0F4 / 4
	
	
	set pMergeUnits = GameDLL + 0x2DD320
	set pIgnoredUnits = GameDLL + 0x2DCE80
	set pConvertUnits = GameDLL + 0x2DD2E0
	set pLeaderboardSetItemLabelColor = base + 0x3CC5B0 / 4
	
	set pExportFromMpq = GameDLL + 0x737F00 
	set pGetFrameItemAddress = GameDLL + 0x5FA970 
	set pGetFrameSkinAddress = GameDLL + 0x31F530
	set pGetFrameTextAddress = GameDLL + 0x61C7B0
	set pUpdateFrameText = GameDLL + 0x60CA10

	set pFrameDefClass = GameDLL + 0xACD264
	
	set pPacketClass = GameDLL + 0x932D2C
	set pPacketSend = GameDLL + 0x54D970
	
	
	set pConvertString = GameDLL + 0x3BAA20
	
	set pStorm279 = base + 0x86D5B8 / 4
	
	set pPrintText1 = GameDLL + 0x2F3CF0 
	set pPrintText2 = GameDLL + 0x2F3CB0 
	set pPrintText3 = GameDLL + 0x6049B0
	
	set pChangeFont = GameDLL + 0x7AE910
	
	set pCameraDefaultHeight = base + 0x93645C / 4
	
	set pPingMinimapOffset = GameDLL + 0x3B4650 
	set pPingMinimapExOffset = GameDLL + 0x3B8660 
	
	set pAllianceOutput = GameDLL + 0x2FB1F0 
	
	set pWindowIsActive = base + 0xA9E7A4 / 4
	set pSendCommandWithoutTarget = GameDLL + 0x339C60 
	set pMissile = base + 0xAB4CD8 / 4
	
		
	set pOrder1_offset = GameDLL + 0x339C60 
	set pOrder2_offset = GameDLL + 0x339CC0 
	set pOrder3_offset = GameDLL + 0x339D50 
	set pOrder4_offset = GameDLL + 0x339DD0 
	set pOrder5_offset = GameDLL + 0x339E60 
	set pOrder6_offset = GameDLL + 0x339F00 
	set pOrder7_offset = GameDLL + 0x339F80 
	set pOrder8_offset = GameDLL + 0x33A010 
	
	set Order1_lockedvalue = 0x900010C2
	set Order2_lockedvalue = 0x900018C2
	set Order3_lockedvalue = 0x900014C2
	set Order4_lockedvalue = 0x90001CC2
	set Order5_lockedvalue = 0x900020C2
	set Order6_lockedvalue = 0x900014C2
	set Order7_lockedvalue = 0x90001CC2
	set Order8_lockedvalue = 0x900020C2
	
	set pStartAbilityCD = GameDLL + 0x126990 
		
	set pUpdateFogManual = GameDLL + 0x4299e0
	
	set pFogUpdateBlockAddr = base  + 0x42fcd4 / 4
	set pFogUpdateBlockAddrNew1 = 0x0004C200
	set pFogUpdateBlockAddrNew2 = 0x01B89090
	
	set OPLimitAddress1=GameDLL+0x3A8388
	set OPLimitAddress2=GameDLL+0x3A838C
	
	set pCycloneFixCondition=GameDLL+0x29C25C
	

	set pCaptionsOverTheCreeps=GameDLL+0x35BB20
	
	set pPhaseShiftInvisibilityFlagByte=GameDLL+0x135D9C
	
	set pGetUnitAbility = GameDLL + 0x787D0
	set pGetUnitAddress = GameDLL + 0x3BDCB0
	set p_sprintf = GameDLL + 0x86D32C
	
	set pMemcpy = GameDLL + 0x86D3CC
	
	set pSearchStringValue = GameDLL + 0x5C8ED0
	set pSearchStringAddr1 = GameDLL + 0xACD23C
	set pSearchStringAddr2 = GameDLL + 0xACD214
	
	set pSimulateAttackInstance = GameDLL + 0xCF660
	set pGameTime = GameDLL + 0xAB7E98	
	
	set pSetStunToUnitTRUE = GameDLL+0x2A6440
	set pSetStunToUnitFALSE = GameDLL+0x282B30
	
	
	set pCommonSilence=GameDLL+0x076770
	set pAddSilenceOnAbility=GameDLL+0x052B60
	set pRemoveSilenceFromAbility=GameDLL+0x052BC0
	set pPauseUnitDisabler=GameDLL+0x0767F0
	
	set pUpdateUnitsSpeedCurrent=GameDLL+0x4A73F0
	
	set pCastSilenceToTarget=GameDLL+0xB65F0
	
	set pCastAbility=GameDLL+0x05C3A0
	
	set pDamageBlockIllusionCheck=GameDLL+0x1EA0F0
	
	set pItemDropOrderTriggerFix=GameDLL+0x29E064//9090c83b

	set pGetOrLoadFile = GameDLL + 0x4C1300	
	
	set StoreIntegerOffset = GameDLL + 0x3CA0A0
	
	set pUnitVtable = GameDLL + 0x931934
	set pRealUnitDamageHandler = GameDLL + 0x2A40D0
	set pTriggerExecute = GameDLL + 0x3C3F40
	set pMissileFuncStart = GameDLL+0xCF660
	set pMissileJumpBack = GameDLL+0xCF667
	
	set pItemDataNode=GameDLL+0xAB4BF4+0x10
	
	set GameVersion = 0x26a
endfunction

function Init24b takes nothing returns nothing
	local integer base = ReadRealMemory(GetBytecodeAddress())-0x9631A0
	set GameDLL = base 
	set base = base / 4
	set GameState = base+0x2B3513
	set pGameClass1 = base+0x2B3978
	set pointers = Memory[pGameClass1]/4
	set pUnitData = GameDLL+0xACB2D0
	set pAbilityData = GameDLL+0xACACBC
		
	set pUnitDataDefAddr = pUnitData
	set pGlobalPlayerClass = GameState
	set pAbilityDataDefAddr = pAbilityData
	
	
	
	set GameVersion = 0x24b
endfunction





function SetMaxUnitSpeed takes real r returns nothing
	set Memory[pUnitMaxSpeedConstant] = cleanInt(realToIndex(r))
	set Memory[pUnitMaxSpeedConstantD] = cleanInt(realToIndex(r))
endfunction

function GetMaxUnitSpeed takes nothing returns real
	return GetRealFromMemory(Memory[pUnitMaxSpeedConstant])
endfunction

function SetMinUnitSpeed takes real r returns nothing
	set Memory[pUnitMinSpeedConstant] = cleanInt(realToIndex(r))
	set Memory[pUnitMinSpeedConstantD] = cleanInt(realToIndex(r))
endfunction

function GetMinUnitSpeed takes nothing returns real
	return cleanReal(indexToReal(Memory[pUnitMinSpeedConstant])) 
endfunction

function SetMaxBuildingSpeed takes real r returns nothing
	set Memory[pBuildingMaxSpeedConstant] = cleanInt(realToIndex(r))
	set Memory[pBuildingMaxSpeedConstantD] = cleanInt(realToIndex(r))
endfunction

function GetMaxBuildingSpeed takes nothing returns real
	return cleanReal(indexToReal(Memory[pBuildingMaxSpeedConstant])) 
endfunction

function SetMinBuildingSpeed takes real r returns nothing
	set Memory[pBuildingMinSpeedConstant] = cleanInt(realToIndex(r))
	set Memory[pBuildingMinSpeedConstantD] = cleanInt(realToIndex(r))
endfunction

function GetMinBuildingSpeed takes nothing returns real
	return cleanReal(indexToReal(Memory[pBuildingMinSpeedConstant])) 
endfunction

function GetAttackSpeedLimit takes nothing returns real
	return cleanReal(indexToReal(Memory[pAttackSpeedLimit]))
endfunction

function SetAttackSpeedLimit takes real r returns nothing
	set Memory[pAttackSpeedLimit] = cleanInt(realToIndex(r))
endfunction

function GetAttackTimeLimit takes nothing returns real
	return cleanReal(indexToReal(Memory[pAttackTimeLimit]))
endfunction

function SetAttackTimeLimit takes real r returns nothing
	set Memory[pAttackTimeLimit] = cleanInt(realToIndex(r))
endfunction




function SaveConstantsValues takes nothing returns nothing
	set UnitMaxSpeedConstant =		GetMaxUnitSpeed( )
	set UnitMinSpeedConstant =		GetMinUnitSpeed( )
	set BuildingMaxSpeedConstant =	GetMaxBuildingSpeed( )
	set BuildingMinSpeedConstant =	GetMinBuildingSpeed( )
	set AttackSpeedLimit =			GetAttackSpeedLimit( )
	set AttackTimeLimit =			GetAttackTimeLimit( )
endfunction



function ResetConstantsValues takes nothing returns nothing
	call SetMaxUnitSpeed(		UnitMaxSpeedConstant)
	call SetMinUnitSpeed( 		UnitMinSpeedConstant)
	call SetMaxBuildingSpeed(	BuildingMaxSpeedConstant )
	call SetMinBuildingSpeed(	BuildingMinSpeedConstant)
	call SetAttackSpeedLimit(	AttackSpeedLimit)
	call SetAttackTimeLimit(	AttackTimeLimit)
	call ExecuteFunc("RestoreCameraOffsets")
endfunction

// replace war3map.j to recovery.j
function LockOtherMaps takes nothing returns nothing
	//0x6F636572
	//0x726576
	
	
endfunction
// replace recovery.j back to war3map.j
function UnlockOtherMaps takes nothing returns nothing
	//0x33726177
	//0x70616D
	
	
endfunction




//library Memory ends
//library Bitwise:

function GetGameTypeSupported takes nothing returns integer
	//return Memory[Memory[Memory[GameState] / 4 + 12] / 4 + 12]
	return ReadRealPointer2LVL(GameState*4,48,48)
endfunction

//function BitwiseNot takes integer i returns integer
//	return 0xFFFFFFFF - i
//endfunction
//
//function BitwiseOrOld takes integer a,integer b returns integer
//	//set Memory[Memory[Memory[GameState]/4+12]/4+12] = a
//	call SetGameTypeSupported(GAME_TYPE_ALL, false)
//	call SetGameTypeSupported(ConvertGameType(a), true)
//	call SetGameTypeSupported(ConvertGameType(b), true)
//	return GetGameTypeSupported()
//endfunction
//
//function BitwiseAndOld takes integer a,integer b returns integer
//	//set Memory[Memory[Memory[GameState]/4+12]/4+12] = a
//	call SetGameTypeSupported(GAME_TYPE_ALL, false)
//	call SetGameTypeSupported(ConvertGameType(a), true)
//	call SetGameTypeSupported(ConvertGameType(BitwiseNot(b)), false)
//	return GetGameTypeSupported()
//endfunction

//function BitwiseXorOld takes integer a,integer b returns integer
//	local integer i
//	//set Memory[Memory[Memory[GameState]/4+12]/4+12] = a
//	call SetGameTypeSupported(GAME_TYPE_ALL, false)
//	call SetGameTypeSupported(ConvertGameType(a), true)
//	call SetGameTypeSupported(ConvertGameType(b), false)
//	set i=GetGameTypeSupported()
//	call SetGameTypeSupported(ConvertGameType(b), true)
//	call SetGameTypeSupported(ConvertGameType(a), false)
//	call SetGameTypeSupported(ConvertGameType(i), true)
//	return GetGameTypeSupported()
//endfunction


function BitwiseOr takes integer arg1, integer arg2 returns integer
	local integer retval
	
	if NeedInitBitwiseOr == true then
		set NeedInitBitwiseOr = false
		set Memory[pBitwiseOR_ExecutableMemory/4] = 0x0424448B 
		set Memory[pBitwiseOR_ExecutableMemory/4 + 1] = 0x0824548B 
		set Memory[pBitwiseOR_ExecutableMemory/4 + 2] = 0xCCC3D009 
	endif
	
	if pConvertUnitsOffset == 0 then 
		set pConvertUnitsOffset = CreateJassNativeHook(pConvertUnits,pBitwiseOR_ExecutableMemory )
	else
		call WriteRealMemory(pConvertUnitsOffset, pBitwiseOR_ExecutableMemory)
	endif
	
	if pConvertUnitsOffset != 0 then 
		set retval = B2I(ConvertUnits( arg1,arg2 ))
		call WriteRealMemory(pConvertUnitsOffset, pConvertUnits)
		return retval
	endif
	return 0
endfunction

function BitwiseXor takes integer arg1, integer arg2 returns integer
	local integer retval
	
	if NeedInitBitwiseXor == true then
		set NeedInitBitwiseXor = false
		set Memory[pBitwiseXOR_ExecutableMemory/4] = 0x0424448B 
		set Memory[pBitwiseXOR_ExecutableMemory/4 + 1] = 0x0824548B 
		set Memory[pBitwiseXOR_ExecutableMemory/4 + 2] = 0xCCC3D031 
	endif
	
	if pConvertUnitsOffset == 0 then 
		set pConvertUnitsOffset = CreateJassNativeHook(pConvertUnits,pBitwiseXOR_ExecutableMemory )
	else
		call WriteRealMemory(pConvertUnitsOffset, pBitwiseXOR_ExecutableMemory)
	endif
	
	if pConvertUnitsOffset != 0 then 
		set retval = B2I(ConvertUnits( arg1,arg2 ))
		call WriteRealMemory(pConvertUnitsOffset,pConvertUnits)
		return retval
	endif
	return 0
endfunction

function BitwiseAnd takes integer arg1, integer arg2 returns integer
	local integer retval
	
	if NeedInitBitwiseAnd == true then
		set NeedInitBitwiseAnd = false
		set Memory[pBitwiseAND_ExecutableMemory/4] = 0x0424448B 
		set Memory[pBitwiseAND_ExecutableMemory/4 + 1] = 0x0824548B 
		set Memory[pBitwiseAND_ExecutableMemory/4 + 2] = 0xCCC3D021 
	endif
	
	if pConvertUnitsOffset == 0 then 
		set pConvertUnitsOffset = CreateJassNativeHook(pConvertUnits,pBitwiseAND_ExecutableMemory )
	else
		call WriteRealMemory(pConvertUnitsOffset, pBitwiseAND_ExecutableMemory)
	endif
	
	if pConvertUnitsOffset != 0 then 
		set retval = B2I(ConvertUnits( arg1,arg2 ))
		call WriteRealMemory(pConvertUnitsOffset, pConvertUnits)
		return retval
	endif
	return 0
endfunction





//library Bitwise ends
//library StringId:

function StringId__Int2Char takes integer i returns string
	local string s= Ascii2Char(i)
	if s == null then
		set s="\\x" + Int2Hex(i)
	endif
	return s
endfunction

function Id2String takes integer i returns string
	local string result= ""
	local integer char
	loop
		set char=i
		set i=i / 256
		set result=StringId__Int2Char(char - i * 256) + result
		exitwhen i == 0
	endloop
	return result
endfunction

function String2Id takes string s returns integer
	local integer result= 0
	local integer i= 0
	loop
		set result=result * 256 + Char2Ascii(SubString(s, i, i + 1))
		set i=i + 1
		exitwhen i == 4
	endloop
	return result
endfunction


//library StringId ends
//library ObjectData:


function IntegerHash takes integer i returns integer
	local integer a= 0x7FED7FED
	local integer b= 0xEEEEEEEE
	local integer byte
	loop
		set byte=i * 16777216 / 16777216
		set a=BitwiseXor(a + b , H[byte])
		set i=i / 256
		exitwhen i == 0
		set b=b * 32 + a + b + byte + 3
	endloop
	return a
endfunction

function GetObjectData takes integer pData,integer rawcode returns integer
	local integer hash	= IntegerHash(rawcode)
	local integer list	= ReadRealMemory(pData) / 4 + ModuloInteger(hash, ReadRealMemory(pData + 8) + 1) * 3
	local integer i	= Memory[list + 2] / 4
	loop
		exitwhen i <= 0
		if Memory[i] == hash and Memory[i + 5] == rawcode then
			return i
		endif
		set i	=	Memory[Memory[list] / 4 + i + 1] / 4
	endloop
	return 0
endfunction

function GetObjectDataCaching takes integer pData, integer rawcode returns integer
	local integer k
	if HaveSavedInteger(ObjectDataPointersTable,pData,rawcode) then
		return LoadInteger(ObjectDataPointersTable,pData,rawcode)
	endif
	set k=GetObjectData(pData,rawcode)
	call SaveInteger(ObjectDataPointersTable,pData,rawcode,k)
	return k
endfunction

function ObjectData__Init takes nothing returns nothing
	set H[1]=0xA22E726E
	set H[2]=0xD43D94C0
	set H[3]=0x6DE064C7
	set H[4]=0xFE8D4B2F
	set H[5]=0x345A287E
	set H[6]=0x13941BCF
	set H[7]=0xD822114D
	set H[8]=0xA79E1270
	set H[9]=0xFB2D4CF9
	set H[10]=0xCB25DDAE
	set H[11]=0x7B5E64D5
	set H[12]=0x88544672
	set H[13]=0xF201BF3F
	set H[14]=0x677CAF6E
	set H[15]=0x34502020
	set H[16]=0x5DD18D92
	set H[18]=0x320F2252
	set H[19]=0xCBB1F259
	set H[20]=0x5C5ED8C1
	set H[21]=0x922BB610
	set H[22]=0x7165A961
	set H[23]=0x35F39EDF
	set H[24]=0x056FA002
	set H[25]=0x58FEDA8B
	set H[26]=0x28F76B40
	set H[27]=0xD92FF267
	set H[28]=0xE625D404
	set H[29]=0x4FD34CD1
	set H[30]=0xC54E3D00
	set H[31]=0x9221ADB2
	set H[32]=0x2BC26B40
	set H[33]=0xCDF0DDAE
	set H[35]=0x99A2D007
	set H[36]=0x2A4FB66F
	set H[37]=0x601C93BE
	set H[38]=0x3F56870F
	set H[39]=0x03E47C8D
	set H[40]=0xD3607DB0
	set H[41]=0x26EFB839
	set H[42]=0xF6E848EE
	set H[43]=0xA720D015
	set H[44]=0xB416B1B2
	set H[45]=0x1DC42A7F
	set H[46]=0x933F1AAE
	set H[47]=0x60128B60
	set H[48]=0x921F9B39
	set H[49]=0x344E0DA7
	set H[50]=0x665D2FF9
	set H[52]=0x90ACE668
	set H[53]=0xC679C3B7
	set H[54]=0xA5B3B708
	set H[55]=0x6A41AC86
	set H[56]=0x39BDADA9
	set H[57]=0x8D4CE832
	set H[58]=0x5D4578E7
	set H[59]=0x0D7E000E
	set H[60]=0x1A73E1AB
	set H[61]=0x84215A78
	set H[62]=0xF99C4AA7
	set H[63]=0xC66FBB59
	set H[64]=0x0172B4D1
	set H[65]=0xA3A1273F
	set H[66]=0xD5B04991
	set H[67]=0x6F531998
	set H[69]=0x35CCDD4F
	set H[70]=0x1506D0A0
	set H[71]=0xD994C61E
	set H[72]=0xA910C741
	set H[73]=0xFCA001CA
	set H[74]=0xCC98927F
	set H[75]=0x7CD119A6
	set H[76]=0x89C6FB43
	set H[77]=0xF3747410
	set H[78]=0x68EF643F
	set H[79]=0x35C2D4F1
	set H[80]=0xCBA5D782
	set H[81]=0x6DD449F0
	set H[82]=0x9FE36C42
	set H[83]=0x39863C49
	set H[84]=0xCA3322B1
	set H[86]=0xDF39F351
	set H[87]=0xA3C7E8CF
	set H[88]=0x7343E9F2
	set H[89]=0xC6D3247B
	set H[90]=0x96CBB530
	set H[91]=0x47043C57
	set H[92]=0x53FA1DF4
	set H[93]=0xBDA796C1
	set H[94]=0x332286F0
	set H[95]=0xFFF5F7A2
	set H[96]=0xEC6BE431
	set H[97]=0x8E9A569F
	set H[98]=0xC0A978F1
	set H[99]=0x5A4C48F8
	set H[100]=0xEAF92F60
	set H[101]=0x20C60CAF
	set H[103]=0xC48DF57E
	set H[104]=0x9409F6A1
	set H[105]=0xE799312A
	set H[106]=0xB791C1DF
	set H[107]=0x67CA4906
	set H[108]=0x74C02AA3
	set H[109]=0xDE6DA370
	set H[110]=0x53E8939F
	set H[111]=0x20BC0451
	set H[112]=0x27DDEEB3
	set H[113]=0xCA0C6121
	set H[114]=0xFC1B8373
	set H[115]=0x95BE537A
	set H[116]=0x266B39E2
	set H[117]=0x5C381731
	set H[118]=0x3B720A82
	set H[120]=0xCF7C0123
	set H[121]=0x230B3BAC
	set H[122]=0xF303CC61
	set H[123]=0xA33C5388
	set H[124]=0xB0323525
	set H[125]=0x19DFADF2
	set H[126]=0x8F5A9E21
	set H[127]=0x5C2E0ED3
	set H[128]=0x5861ED90
	set H[129]=0xFA905FFE
	set H[130]=0x2C9F8250
	set H[131]=0xC6425257
	set H[132]=0x56EF38BF
	set H[133]=0x8CBC160E
	set H[134]=0x6BF6095F
	set H[135]=0x3083FEDD
	set H[137]=0x538F3A89
	set H[138]=0x2387CB3E
	set H[139]=0xD3C05265
	set H[140]=0xE0B63402
	set H[141]=0x4A63ACCF
	set H[142]=0xBFDE9CFE
	set H[143]=0x8CB20DB0
	set H[144]=0x04D2B307
	set H[145]=0xA7012575
	set H[146]=0xD91047C7
	set H[147]=0x72B317CE
	set H[148]=0x035FFE36
	set H[149]=0x392CDB85
	set H[150]=0x1866CED6
	set H[151]=0xDCF4C454
	set H[152]=0xAC70C577
	set H[154]=0xCFF890B5
	set H[155]=0x803117DC
	set H[156]=0x8D26F979
	set H[157]=0xF6D47246
	set H[158]=0x6C4F6275
	set H[159]=0x3922D327
	set H[160]=0x34DA2252
	set H[161]=0xD70894C0
	set H[162]=0x0917B712
	set H[163]=0xA2BA8719
	set H[164]=0x33676D81
	set H[165]=0x69344AD0
	set H[166]=0x486E3E21
	set H[167]=0x0CFC339F
	set H[168]=0xDC7834C2
	set H[169]=0x30076F4B
	set H[171]=0xB0388727
	set H[172]=0xBD2E68C4
	set H[173]=0x26DBE191
	set H[174]=0x9C56D1C0
	set H[175]=0x692A4272
	set H[176]=0x84A19B2B
	set H[177]=0x26D00D99
	set H[178]=0x58DF2FEB
	set H[179]=0xF281FFF2
	set H[180]=0x832EE65A
	set H[181]=0xB8FBC3A9
	set H[182]=0x9835B6FA
	set H[183]=0x5CC3AC78
	set H[184]=0x2C3FAD9B
	set H[185]=0x7FCEE824
	set H[186]=0x4FC778D9
	set H[188]=0x0CF5E19D
	set H[189]=0x76A35A6A
	set H[190]=0xEC1E4A99
	set H[191]=0xB8F1BB4B
	set H[192]=0x77ABB98E
	set H[193]=0x19DA2BFC
	set H[194]=0x4BE94E4E
	set H[195]=0xE58C1E55
	set H[196]=0x763904BD
	set H[197]=0xAC05E20C
	set H[198]=0x8B3FD55D
	set H[199]=0x4FCDCADB
	set H[200]=0x1F49CBFE
	set H[201]=0x72D90687
	set H[202]=0x42D1973C
	set H[203]=0xF30A1E63
	set H[205]=0x69AD78CD
	set H[206]=0xDF2868FC
	set H[207]=0xABFBD9AE
	set H[208]=0x0DFE40C1
	set H[209]=0xB02CB32F
	set H[210]=0xE23BD581
	set H[211]=0x7BDEA588
	set H[212]=0x0C8B8BF0
	set H[213]=0x4258693F
	set H[214]=0x21925C90
	set H[215]=0xE620520E
	set H[216]=0xB59C5331
	set H[217]=0x092B8DBA
	set H[218]=0xD9241E6F
	set H[219]=0x895CA596
	set H[220]=0x96528733
	set H[222]=0x757AF02F
	set H[223]=0x424E60E1
	set H[224]=0x98835092
	set H[225]=0x3AB1C300
	set H[226]=0x6CC0E552
	set H[227]=0x0663B559
	set H[228]=0x97109BC1
	set H[229]=0xCCDD7910
	set H[230]=0xAC176C61
	set H[231]=0x70A561DF
	set H[232]=0x40216302
	set H[233]=0x93B09D8B
	set H[234]=0x63A92E40
	set H[235]=0x13E1B567
	set H[236]=0x20D79704
	set H[237]=0x8A850FD1
	set H[239]=0xCCD370B2
	set H[240]=0xCBAFDFE0
	set H[241]=0x6DDE524E
	set H[242]=0x9FED74A0
	set H[243]=0x399044A7
	set H[244]=0xCA3D2B0F
	set H[245]=0x000A085E
	set H[246]=0xDF43FBAF
	set H[247]=0xA3D1F12D
	set H[248]=0x734DF250
	set H[249]=0xC6DD2CD9
	set H[250]=0x96D5BD8E
	set H[251]=0x470E44B5
	set H[252]=0x54042652
	set H[253]=0xBDB19F1F
	set H[254]=0x332C8F4E
endfunction


//library ObjectData ends
//library Utils:

function ConvertHandle takes handle h returns integer
	if GetHandleId(h)>0 then
		return Memory[Memory[Memory[Memory[GameState] / 4 + 7] / 4 + 103] / 4 + GetHandleId(h) * 3 - 0x2FFFFF]
	endif
	return 0
endfunction

function ConvertPointer takes integer ptr returns integer
	local integer i= Memory[ptr / 4]
	if i < 0 then
		return Memory[Memory[pointers + 11] / 4 - i * 2 + 1]
	endif
	return Memory[Memory[pointers + 3] / 4 + i * 2 + 1]
endfunction

function GetUnitFlags takes unit u returns integer
	return Memory[ConvertHandle(u) / 4 + 23]
endfunction

function SetUnitFlags takes unit u,integer i returns nothing
	set Memory[ConvertHandle(u) / 4 + 23]=i
endfunction

function IsFlagBitSet takes integer flags, integer bit returns boolean
	return flags/bit*2147483648 != 0
endfunction

//armor types:
// 0 - Light; 1 - Medium; 2 - Heavy; 3 - Fortified; 4 - Normal; 5 - Hero; 6 - Divine; 7 - unarmored; 
//rest seems to have Light properties
function GetUnitArmorType takes unit u returns integer
	return Memory[(ConvertHandle(u) + 0xE4)/4]
endfunction

function SetUnitArmorType takes unit u, integer id returns nothing
	set Memory[(ConvertHandle(u) + 0xE4)/4]=id
endfunction

function GetUnitArmor takes unit u returns real
	return indexToReal(Memory[ConvertHandle(u) / 4 + 56])
endfunction

function SetUnitArmor takes unit u,real r returns nothing
	set Memory[ConvertHandle(u) / 4 + 56]=cleanInt(realToIndex(r))
endfunction

function SetUnitTypeId takes unit u,integer i returns nothing
	set Memory[ConvertHandle(u) / 4 + 12]=i
endfunction

function GetUnitTypeIdReal takes integer i returns integer
	return Memory[i / 4 + 12]
endfunction

function SetUnitPhased takes unit u returns nothing
	local integer data= GetObjectDataCaching(pUnitData , GetUnitTypeId(u)) + 107
	local integer p1= Memory[data]
	local integer p2= Memory[data + 1]
//	call BJDebugMsg(Int2Hex((data-107)*4))
	set Memory[data]=8
	set Memory[data + 1]=16
	call SetUnitPathing(u, true)
	set Memory[data]=p1
	set Memory[data + 1]=p2
endfunction

function GetAbilityX takes ability a, integer x returns real
	if x==20 then
		return Memory[Memory[Memory[ConvertHandle(a)/4+21]/4+21]/4-(41-x)+1*26]*1.0
	else
		return indexToReal(Memory[Memory[Memory[ConvertHandle(a)/4+21]/4+21]/4-(41-x)+1*26])
	endif
endfunction

function SetAbilityX takes ability a, integer x, real d returns nothing
	if x==20 then
		set Memory[Memory[Memory[ConvertHandle(a)/4+21]/4+21]/4+1*26-(2+x)]=R2I(d)
	else
		set Memory[Memory[Memory[ConvertHandle(a)/4+21]/4+21]/4+1*26-(2+x)]=cleanInt(realToIndex(d))
	endif
endfunction


function GetUnitFlags_2 takes unit u returns integer
	return Memory[ConvertHandle(u) / 4 + 8]
endfunction

function SetUnitFlags_2 takes unit u,integer i returns nothing
	set Memory[ConvertHandle(u) / 4 + 8]=i
endfunction

// Real - addres in memory

function GetRealPlayerById takes integer i returns integer
	local integer pladdr =  Memory[pGlobalPlayerClass] + ( i * 4 ) + 0x58
	return Memory[pladdr/4]
endfunction

function GetLocalPlayerIdReal takes nothing returns integer
	return Memory[Memory[pGlobalPlayerClass]/4+0xA]
endfunction

function GetLocalPlayerReal takes nothing returns integer
	return GetRealPlayerById(GetLocalPlayerIdReal( ) )
endfunction


// Get Selected Unit
function GetPlayerSelectedUnitReal takes integer realplayer returns integer
	local integer pladdr = realplayer/4 + 0xD
	set pladdr = Memory[pladdr]
	set pladdr = pladdr + 0x1E0
	return Memory[pladdr/4]
endfunction


function SetPlayerSelectedUnitReal takes integer realplayer, integer pConvertedHandle returns nothing
	local integer pladdr = realplayer/4 + 0xD
	set pladdr = Memory[pladdr]
	set pladdr = pladdr + 0x1E0
	set Memory[pladdr/4] = pConvertedHandle
endfunction

function GetUnitVertexColorB takes unit u returns integer
	return GetByteFromInteger(Memory[(Memory[ConvertHandle(u) / 4 + 0xA]+328)/4],4)
endfunction

function GetUnitVertexColorG takes unit u returns integer
	return GetByteFromInteger(Memory[(Memory[ConvertHandle(u) / 4 + 0xA]+328)/4],3)
endfunction

function GetUnitVertexColorR takes unit u returns integer
	return GetByteFromInteger(Memory[(Memory[ConvertHandle(u) / 4 + 0xA]+328)/4],2)
endfunction

function GetUnitVertexColorA takes unit u returns integer
	return GetByteFromInteger(Memory[(Memory[ConvertHandle(u) / 4 + 0xA]+328)/4],1)
endfunction


function GetUnitVertexColorB_2 takes unit u returns integer
	return GetByteFromInteger(Memory[ConvertHandle(u) / 4 + 181],4)
endfunction

function GetUnitVertexColorG_2 takes unit u returns integer
	return GetByteFromInteger(Memory[ConvertHandle(u) / 4 + 181],3)
endfunction

function GetUnitVertexColorR_2 takes unit u returns integer
	return GetByteFromInteger(Memory[ConvertHandle(u) / 4 + 181],2)
endfunction

function GetUnitVertexColorA_2 takes unit u returns integer
	return GetByteFromInteger(Memory[ConvertHandle(u) / 4 + 181],1)
endfunction


function SetUnitColorDirectlyForAddresss takes integer pConvertedHandle, integer red, integer green, integer blue, integer alpha returns nothing
	//, real fadetime returns nothing
	local integer resultcolor = CreateInteger1(alpha,red,green,blue)
	local integer colorflag = 0
	set Memory[(Memory[pConvertedHandle / 4 + 0xA]+328)/4] = resultcolor
	
	//set Memory[(Memory[pConvertedHandle / 4 + 0xA]+324)/4] = cleanInt(realToIndex(fadetime))
	set Memory[(Memory[pConvertedHandle / 4 + 0xA]+320)/4] = 0
	set Memory[(Memory[pConvertedHandle / 4 + 0xA]+316)/4] = 0
	
	set colorflag = Memory[(Memory[pConvertedHandle / 4 + 0xA]+312)/4]
	if BitwiseAnd( colorflag, 0x800) == 0 then
		set Memory[(Memory[pConvertedHandle / 4 + 0xA]+312)/4] = BitwiseXor(colorflag, 0x800)
	endif
	
	
endfunction

function echo takes string s returns nothing
	if IsL1ch then
		call DisplayTimedTextToPlayer(LocalPlayer,0,0,30,s)
	endif
endfunction


function SetUnitColorDirectly takes unit u, integer red, integer green, integer blue, integer alpha returns nothing
//	call echo(Int2Hex(ConvertHandle(u)))
	call SetUnitColorDirectlyForAddresss(ConvertHandle(u),red,green,blue,alpha)
endfunction


function GetJassContext takes integer id returns integer
    return Memory[Memory[Memory[Memory[pJassEnvAddress]/4+5]/4+36]/4+id]
endfunction

function GetStringAddress takes string s returns integer
    return Memory[Memory[Memory[Memory[GetJassContext(1)/4+2589]/4+2]/4+SH2I(s)*4+2]/4+7]
endfunction

function WriteNullTerminatedString takes string s, integer i_address returns nothing
	set Memory[i_address/4] = GetStringAddress(s)
endfunction

function GetDefAddr takes integer id, integer class, integer first, integer currentOffset returns integer
	local integer FirstDataDefEntry = ReadRealMemory(first)
	local integer CurrentDefAddr = Memory[FirstDataDefEntry/4 + 2] + currentOffset
	local integer FirstDefAddr = CurrentDefAddr
	local integer CurrentDefId = 0
	local integer CurrentDefId2 = 0
	if FirstDataDefEntry == 0 then
		return 0
	endif
//	if HaveSavedInteger(Addresses,id,class)then
//		return LoadInteger(Addresses,id,class) - 0xC
//	endif
	
//	if HaveSavedInteger(Addresses,class,0)then
//		set CurrentDefAddr=LoadInteger(Addresses,class,0)
//		set FirstDefAddr=LoadInteger(Addresses,class,1)
//		call echo("address preloaded")
//	elseif HaveSavedInteger(Addresses,class,1)==false then
//		call echo("first address saved")
//		call SaveInteger(Addresses,class,1,FirstDefAddr)
//	endif
	
	loop 
		set CurrentDefId = Memory[CurrentDefAddr/4+2]
		
//		call SaveInteger(Addresses,CurrentDefId,class,CurrentDefAddr)
//		call SaveInteger(Addresses,class,0,CurrentDefAddr)
//		call echo(Id2String(CurrentDefId))
		if HaveSavedInteger(ObjectDataPointersTable,class,CurrentDefId)==false then
//			call echo("Cached "+Id2String(CurrentDefId))
			call SaveInteger(ObjectDataPointersTable,class,CurrentDefId,CurrentDefAddr - 0xC)
		endif
		exitwhen CurrentDefId == id
		
		set CurrentDefAddr = Memory[CurrentDefAddr/4]
		if CurrentDefAddr == 0 or CurrentDefAddr == FirstDefAddr then
//			if CurrentDefAddr == 0 then
//				call echo("drop for null")
//			else
//				call echo("drop for start")
//			endif
			return 0
		endif
	endloop
	
	if CurrentDefAddr == 0 then 
//		call echo("drop for zero")
		return 0
	endif
	return CurrentDefAddr - 0xC// as GetObjectData*4 but search only by id..
endfunction

function GetDefAddrCaching takes integer id, integer class, integer first, integer currentOffset returns integer
	if HaveSavedInteger(ObjectDataPointersTable,class,id) then
//		call echo("loaded")
		return LoadInteger(ObjectDataPointersTable,class,id)
	endif
	return GetDefAddr(id,class,first,currentOffset)
endfunction

function GetUnitDataDefAddr takes integer id returns integer
	return GetDefAddrCaching(id,DEF_ADR_UNIT_DATA,pUnitDataDefAddr,0xC)
endfunction

function GetUnitUIDefAddr takes integer id returns integer
	return GetDefAddrCaching(id,DEF_ADR_UNIT_UI,pUnitUIDefAddr,0x10)
endfunction

function GetAbilityDataDefAddr takes integer id returns integer
	return GetDefAddrCaching(id,DEF_ADR_ABILITY_DATA,pAbilityDataDefAddr,0xC)
endfunction

function GetAbilityUIDefAddr takes integer id returns integer
	return GetDefAddrCaching(id,DEF_ADR_ABILITY_UI,pAbilityUIDefAddr,0x10)
endfunction

//1 = str, 2 = int, 3 = agi
function GetHeroPrimaryAttribute takes unit u returns integer
	local integer a=ConvertHandle(u)
	if a>0 then
		set a=ReadRealMemory(a + 0x1F0)
		if a>0 then
			return ReadRealMemory(a+0xCC)
		endif
	endif
	return 0
endfunction

function GetHeroPrimaryAttributeById takes integer id returns integer
	local integer a=GetUnitDataDefAddr(id)
	if a>0 then
		return ReadRealMemory(a + 0x17C)
	endif
	return 0
endfunction

function SetHeroPrimaryAttribute takes unit u,integer i returns nothing
	if IsUnitIdType(GetUnitTypeId(u),UNIT_TYPE_HERO) then
		set Memory[Memory[ConvertHandle(u) / 4 + 124] / 4 + 51]=i
	endif
endfunction

function PrintJassNatives takes nothing returns nothing
	//[[[[Game.dll+ADA848]+14]+20]
	local integer FirstAddress = Memory[Memory[Memory[pJassEnvAddress]/4+0x5]/4+8]/4
	local integer NextAddress = FirstAddress
	call PreloadEndEx()
	call PreloadGenClear()
	call PreloadGenStart()
	
	loop 
		set NextAddress = Memory[NextAddress]/4
		set testFunctionCount = testFunctionCount + 1
		call Preload("native add "+Int2Hex(Memory[NextAddress+0xC/4]))
		if NextAddress == FirstAddress or NextAddress == 0 then
			call PreloadGenEnd("natives"+R2S(GetRandomReal(0,500))+".txt")
			call PreloadGenClear()
			return 
		endif
	endloop
endfunction





function SetAbilityManaCost takes integer abil, integer level, integer cost returns nothing
	local integer a=GetObjectDataCaching(pAbilityData, abil)
	if a>0 then
		set a=Memory[a+21]
		if a>0 then
			set Memory[a/4-22+level*26]=cost
		endif
	endif
endfunction

function GetAbilityManaCost takes integer abil, integer level returns integer
	local integer a=GetObjectDataCaching(pAbilityData, abil)
	if a>0 then
		set a=Memory[a+21]
		if a>0 then
			return Memory[a/4-22+level*26]
		endif
	endif
	return 0
endfunction

function GetAbilityManaCostAddr takes integer add, integer level returns integer
	if Memory[add/4+0x54/4]>0 then
		return Memory[Memory[add/4+0x54/4]/4+level*0x68/4]
	endif
	return 0
endfunction

function SetAbilityManaCostAddr takes integer add, integer level, integer mc returns nothing
	if Memory[add/4+0x54/4]>0 then
		set Memory[Memory[add/4+0x54/4]/4+level*0x68/4]=mc
	endif
endfunction

function SetAbilityCD takes integer abil, integer level, real cool returns nothing
	set Memory[Memory[GetObjectDataCaching(pAbilityData, abil)+21]/4-21+level*26]= cleanInt(realToIndex(cool))
endfunction

function GetAbilityCD takes integer abil, integer level returns real
	local integer a=GetObjectDataCaching(pAbilityData, abil)
	if abil=='A1P8'then
		return 12.
	endif
	if a>0 then
		if Memory[a+21]>0 then
			return cleanReal(indexToReal(Memory[Memory[a+21]/4-21+level*26])) // need clean/indextoreal ?
		endif
	endif
	return 0.
endfunction

function GetAbilCastTime takes ability abil returns real
 return cleanReal(indexToReal(Memory[ConvertHandle(abil)/4 + 0x84/4] ))
endfunction

function SetAbilCastTime takes ability abil ,real r returns nothing
 set Memory[ConvertHandle(abil)/4 + 0x84/4] = cleanInt(realToIndex(r ))
endfunction

function GetAbilityMaxLevel takes integer abil returns integer
	local integer a
	if abil==0 then
		return 0
	endif
	set a=GetObjectDataCaching(pAbilityData, abil)
	if a>0 then
		return Memory[a+20]
	endif
	return 0
endfunction

function AddAbilityCooldown takes ability a, real seconds returns nothing
	local integer pData = Memory[ConvertHandle(a)/4+55]/4
	if pData != 0 then
		set Memory[pData+1] = cleanInt(realToIndex(seconds+cleanReal(indexToReal(Memory[pData+1]))))
		//set Memory[ConvertHandle(a)/4+45] = cleanInt(realToIndex(seconds+cleanReal(indexToReal(Memory[ConvertHandle(a)/4+45])))) This should not be modified together
	endif
endfunction

function AddAbilityCooldownConverted takes integer a, real seconds returns nothing
	local integer pData = Memory[a+55]/4
	if pData != 0 then
		set Memory[pData+1] = cleanInt(realToIndex(seconds+cleanReal(indexToReal(Memory[pData+1]))))
	endif
endfunction

function AddAbilityBaseCooldown takes ability a, real seconds returns nothing
	local integer pData = Memory[ConvertHandle(a)/4+45]
	if pData != 0 then
		set Memory[pData] = cleanInt(realToIndex(seconds))
	endif
endfunction

//This value holds the base cooldown of the ability at the last time it was casted. It’s used to calculate the % of elapsed cooldown.
//This is completely irrelevant for the gameplay, it’s used only to determine which frame of the cooldown model will be displayed.

function GetAbilityCurrentCooldown takes ability a returns real
	local integer pData = Memory[ConvertHandle(a)/4+55]/4
	if pData != 0 then
		return cleanReal(indexToReal(Memory[pData+1])) - cleanReal(indexToReal(Memory[Memory[pData+3]/4+16]))
	endif
	return .0
endfunction

function CopyCooldownStr takes integer from, integer to returns nothing
	local integer pData = Memory[from+55]
	if pData != 0 then
		//if Memory[to+55]==0 then
			set Memory[to+55]=pData
			//set Memory[to+52]=Memory[from+52]
			//set Memory[to+54]=to*4
			set Memory[to+45]=Memory[from+45]
			if IsFlagBitSet(Memory[to+8],512)==false then
				set Memory[to+8]=Memory[to+8]+512
//				call BJDebugMsg("add cd")
			else
//				call BJDebugMsg("already cd")
			endif
		//endif
	endif
endfunction

function GetAbilityCurrentCooldownConverted takes integer a returns real
	local integer pData = Memory[a+55]/4
	if pData != 0 then
		return cleanReal(indexToReal(Memory[pData+1])) - cleanReal(indexToReal(Memory[Memory[pData+3]/4+16]))
	endif
	return .0
endfunction

//This actually returns the timestamp, not the cooldown. To get the real cooldown you need to subtract this from the current game time.

function GetAbilityCooldownReal takes ability a returns real
	local integer pData = Memory[ConvertHandle(a)/4+55]/4
	if pData != 0 then
		return cleanReal(indexToReal(Memory[pData+1]))
	endif
	return 0.
endfunction

function IsAbilityOnCooldown takes integer z returns boolean
	return IsFlagBitSet(Memory[(z+0x20)/4],512)
endfunction

function SetAbilityDisabled takes integer pAbility, integer count returns nothing
	set Memory[pAbility/4+15] = count //not safe unless used with PauseUnit. Button will be blacked, but current casts of that ability won’t be interrupted.
endfunction

function GetAbilityDisabledCount takes integer pAbility returns integer
	return Memory[pAbility/4+15]
endfunction

function SetAbilityHidden takes integer pAbility, integer count returns nothing
	set Memory[pAbility/4+16] = count //This one is 100% safe. This hides the ability button, and order can’t be issued.
endfunction

function SetAbilityDisabled2 takes integer pAbility, integer count returns nothing
	set Memory[pAbility/4+17] = count //This one is used by Orb of Slow. Button is blacked, but cooldown is stil displayed.
endfunction

function GetAbilityDisabled2 takes integer pAbility returns integer
	return Memory[pAbility/4+17]//This one is used by Orb of Slow. Button is blacked, but cooldown is stil displayed.
endfunction

function DisableUnitsMovement takes unit u, boolean disable returns nothing
	local integer i=2
	if disable==false then
		set i=1
	endif
	call PauseUnit(u,true)
	call SetAbilityDisabled(Memory[ConvertHandle( u )/4+123], i)
	call PauseUnit(u,false)
endfunction
//pointer to 'Amov' is located at offset 123 of unit object, Aatk is at offset 122, and AInv is offset 124

//Hides all command buttons and sets the Ward flag. Unit will keep its current order, and player can’t give new orders
//Notice the the unit can’t be ordered with triggers as well. To issue an order you need to temporarily reenable control
function DisableUnitControl takes unit u returns nothing
	local integer pUnit = ConvertHandle(u)/4
	local integer flags = Memory[pUnit+146]
	local integer Amov = Memory[pUnit+123]/4+16
	local integer Aatk = Memory[pUnit+122]/4+16
//	call echo("disabled on "+GetUnitName(u))
	if not IsFlagBitSet(flags,512) then
		set Memory[pUnit+146] = flags + 512
	endif
	if Amov != 16 then
		set Memory[Amov] = Memory[Amov] + 1
	endif
	if Aatk != 16 then
		set Memory[Aatk] = Memory[Aatk] + 1
	endif
endfunction

//Removes the Ward flag and reenables Amov and Aatk
function EnableUnitControl takes unit u returns nothing
	local integer pUnit = ConvertHandle(u)/4
	local integer flags = Memory[pUnit+146]
	local integer Amov = Memory[pUnit+123]/4+16
	local integer Aatk = Memory[pUnit+122]/4+16
//	call echo("enabled on "+GetUnitName(u))
	if IsFlagBitSet(flags,512) then
		set Memory[pUnit+146] = flags - 512
	endif
	if Amov != 16 and Memory[Amov]>0 then
		set Memory[Amov] = Memory[Amov] - 1
	endif
	if Aatk != 16 and Memory[Aatk]>0 then
		set Memory[Aatk] = Memory[Aatk] - 1
	endif
endfunction


function SetUnitModel takes integer uiobjectaddr, string s returns nothing
	call WriteNullTerminatedString(s, uiobjectaddr+0x30 )
endfunction

function SetUnitModelUF takes unit u, string s returns nothing
	call SetUnitModel(GetUnitUIDefAddr(GetUnitTypeId(u)),s)
endfunction

function SetUnitModelUFAddress takes integer address, string s returns nothing
	call SetUnitModel(address,s)
endfunction

function GetUnitAttackAbilityForAddress takes integer pConvertedHandle returns integer
	return Memory[pConvertedHandle/4+0x1e8/4]
endfunction

function GetUnitAttackAbility takes unit u returns integer
	return GetUnitAttackAbilityForAddress(ConvertHandle(u))
endfunction

function GetUnitMoveAbilityForAddress takes integer pConvertedHandle returns integer
	return Memory[pConvertedHandle/4+0x1eC/4]
endfunction

function GetUnitMoveAbility takes unit u returns integer
	return GetUnitMoveAbilityForAddress(ConvertHandle(u))
endfunction

function GetUnitHeroAbilityForAddress takes integer pConvertedHandle returns integer
	return Memory[pConvertedHandle/4+0x1F0/4]
endfunction

function GetUnitHeroAbility takes unit u returns integer
	return GetUnitHeroAbilityForAddress(ConvertHandle(u))
endfunction

function GetUnitBuildAbilityForAddress takes integer pConvertedHandle returns integer
	return Memory[pConvertedHandle/4+0x1F4/4]
endfunction

function GetUnitBuildAbility takes unit u returns integer
	return GetUnitBuildAbilityForAddress(ConvertHandle(u))
endfunction

function GetUnitInventoryAbilityForAddress takes integer pConvertedHandle returns integer
	return Memory[pConvertedHandle/4+0x1F8/4]
endfunction

function GetUnitInventoryAbility takes unit u returns integer
	return GetUnitInventoryAbilityForAddress(ConvertHandle(u))
endfunction



// Alternative for sub_6F4786B0 (126a)
function GetSomeAddress takes integer pAddr1 ,integer pAddr2 returns integer //I just split your function into 2, it should be working as before
    local integer pOff1 = 44
    
    if BitwiseAnd(pAddr1,pAddr2) == -1 then
   	 return 0
    endif
    
    if pAddr1 >= 0 then
   	 set pOff1 = 12
    endif
    
    set pOff1 = Memory[pGameClass1]/4 + pOff1/4
    set pOff1 = Memory[pOff1]    
    
    if pOff1 == 0 then
   	 return 0
    endif
    
    set pOff1 = pOff1 + 8 * pAddr1 + 4
    
    set pOff1 = Memory[pOff1/4]
    
    if pOff1 == 0 or Memory[pOff1/4 + 0x18/4] != pAddr2 then
   	 return 0
    endif
    
    return pOff1
    
endfunction

function GetSomeAddressForAbility takes integer pAddr1 ,integer pAddr2 returns integer //Second part of GetSomeAddressForAbility
	local integer pOff1 = GetSomeAddress(pAddr1,pAddr2)
	if pOff1==0 or Memory[pOff1/4 + 0x20/4] != 0 then
   	 return 0
    endif
	return Memory[pOff1/4+0x54/4]
endfunction

function GetSomeAddressForLocustFlags takes integer pAddr1 ,integer pAddr2 returns integer
	local integer i = GetSomeAddress(pAddr1,pAddr2)
	return Memory[i/4+37]
endfunction

function SetLocustFlags takes unit u, integer i returns nothing //These flags can make unit immune to truesight
	local integer pOff1 = ConvertHandle(u)/4+91
	set pOff1 = GetSomeAddressForLocustFlags(Memory[pOff1], Memory[pOff1+1])
	set Memory[pOff1/4+13] = i
endfunction

function EnableTruesightImmunity takes unit u returns nothing 
//I don’t really know what other side effects may be caused by this, at least GroupEnum is not affected
	call SetLocustFlags(u, 0x08000000)
endfunction

function DisableTruesightImmunity takes unit u returns nothing
	call SetLocustFlags(u, 0)
endfunction

function UnStunUnit takes unit u returns nothing
	set Memory[ConvertHandle(u)/4+102] = 0
endfunction

function IsUnitStunned2 takes unit u returns boolean
	return Memory[ConvertHandle(u)/4+102] > 0
endfunction

function IsUnitInvulnerable takes unit u returns boolean
	local integer k
//	call BJDebugMsg(GetUnitName(u))
	if u==null then
		return false
	endif
	set k=ConvertHandle(u)
	if k==0 then
		return false
	endif
	return Memory[k/4+8]/8*0x80000000 != 0
endfunction

function GetUnitInvulnerableCounter takes unit u returns integer
	local integer k
	if u==null then
		return 0
	endif
	set k=ConvertHandle(u)
	if k==0 then
		return 0
	endif
	return Memory[k/4+0xE8/4]
endfunction

function SetUnitInvulnerableCounter takes unit u, integer i returns nothing
	local integer k
	if u==null then
		return
	endif
	set k=ConvertHandle(u)
	if k==0 then
		return
	endif
	set Memory[k/4+0xE8/4]=i
endfunction

function GetUnitAbilityForAddresss takes integer pConvertedHandle, integer abilid returns integer
	local integer pAddr1 = pConvertedHandle + 476
	local integer pAddr2 = pConvertedHandle + 480
	local integer pOff1 = 0
	set pAddr1 = Memory[pAddr1/4]
	set pAddr2 = Memory[pAddr2/4]
	if pAddr1 == 0 or pAddr2 == 0 or BitwiseAnd(pAddr1,pAddr2) == -1 then
		return 0
	endif
	set pOff1 = GetSomeAddressForAbility(pAddr1,pAddr2)
	if pOff1 == 0 then 
		return 0
	endif
	loop
		exitwhen pOff1 == 0 
		if Memory[pOff1/4+52/4] == abilid then 
		 return pOff1
		endif
		set pOff1 = GetSomeAddressForAbility( Memory[pOff1/4+36/4], Memory[pOff1/4+40/4])
	endloop
	return pOff1
endfunction

function GetAbilityOrderID takes integer pAbility returns integer
	local integer pOffset2
	local integer pOffset1
	if pAbility<1 then
		return 0
	endif
//	call BJDebugMsg(Int2Hex(pAbility)+" sent")
//	call PolledWait(1.)

	//  mov ecx,[esp+04]
	//  mov edx,[ecx+6C]
	//  cmp edx,D0142 { 852290 }
	//  je 0493413A
	//  mov eax,00000000 { 0 }
	//  ret 
	//  mov ecx,[ecx]
	//  mov ecx,[ecx+00000308]
	//  call ecx
	//  ret 

	
	set Memory[pReservedExecutableMemory/4] = 0x04244C8B 
	set Memory[pReservedExecutableMemory/4 + 1] = 0x816C518B 
	set Memory[pReservedExecutableMemory/4 + 2] = 0x0D0142FA 
	set Memory[pReservedExecutableMemory/4 + 3] = 0xB8067400 
	set Memory[pReservedExecutableMemory/4 + 4] = 0x00000000 
	set Memory[pReservedExecutableMemory/4 + 5] = 0x8B098BC3 
	set Memory[pReservedExecutableMemory/4 + 6] = 0x00030889 
	set Memory[pReservedExecutableMemory/4 + 7] = 0x90E1FF00 
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	

	if pIgnoredUnitsOffset != 0 then 
		set pOffset2 = IgnoredUnits(pAbility)
		call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
		return pOffset2
	endif
	
	return 0
endfunction

function PrintAllUnitAbilities takes integer pConvertedHandle returns nothing
	local integer pAddr1 = pConvertedHandle + 476
	local integer pAddr2 = pConvertedHandle + 480

	local integer pOff1 = 0

	set pAddr1 = Memory[pAddr1/4]
	set pAddr2 = Memory[pAddr2/4]
	if pAddr1 == 0 or pAddr2 == 0 or BitwiseAnd(pAddr1,pAddr2) == -1 then
		return 
	endif

	set pOff1 = GetSomeAddressForAbility(pAddr1,pAddr2)
	
	if pOff1 == 0 then 
		return
	endif
	
	loop
		exitwhen pOff1 == 0 

		call DisplayTextToPlayer(GetLocalPlayer(),0.0,0.0,"Address:"+Int2Hex(pOff1)+". ID:"+Id2String(Memory[pOff1/4+52/4])+" name: "+GetObjectName(Memory[pOff1/4+52/4]))
		
		set pOff1 = GetSomeAddressForAbility( Memory[pOff1/4+36/4], Memory[pOff1/4+40/4])
	endloop
	
endfunction

//function PrintAllUnitAbilitiesOld takes integer pConvertedHandle returns nothing
//	local integer pAddr1 = pConvertedHandle + 476
//	local integer pAddr2 = pConvertedHandle + 480
//
//	local integer pOff1 = 0
//
//	set pAddr1 = Memory[pAddr1/4]
//	set pAddr2 = Memory[pAddr2/4]
//	if pAddr1 == 0 or pAddr2 == 0 or BitwiseAndOld(pAddr1,pAddr2) == -1 then
//		return 
//	endif
//
//	set pOff1 = GetSomeAddressForAbility(pAddr1,pAddr2)
//	
//	if pOff1 == 0 then 
//		return
//	endif
//	
//	loop
//		exitwhen pOff1 == 0 
//
//		call DisplayTextToPlayer(GetLocalPlayer(),0.0,0.0,"Address:"+Int2Hex(pOff1)+". ID:"+Id2String(Memory[pOff1/4+52/4])+" name: "+GetObjectName(Memory[pOff1/4+52/4]))
//		
//		set pOff1 = GetSomeAddressForAbility( Memory[pOff1/4+36/4], Memory[pOff1/4+40/4])
//	endloop
//	
//endfunction

function GetAllUnitAbilities takes unit u returns nothing
	local integer pConvertedHandle=ConvertHandle(u)
	local integer pAddr1 = pConvertedHandle + 476
	local integer pAddr2 = pConvertedHandle + 480
	local integer i=0
	local integer h=GetHandleId(u)
	local integer pOff1 = 0
	call FlushChildHashtable(TempHash,h)
	
	set pAddr1 = Memory[pAddr1/4]
	set pAddr2 = Memory[pAddr2/4]
	if pAddr1 == 0 or pAddr2 == 0 or BitwiseAnd(pAddr1,pAddr2) == -1 then
		return 
	endif

	set pOff1 = GetSomeAddressForAbility(pAddr1,pAddr2)
	
	if pOff1 == 0 then 
		return
	endif
	
	loop
		exitwhen pOff1 == 0 

//		call DisplayTextToPlayer(GetLocalPlayer(),0.0,0.0,"Address:"+Int2Hex(pOff1)+". ID:"+Id2String(Memory[pOff1/4+52/4])+" name: "+GetObjectName(Memory[pOff1/4+52/4]))
		if Memory[pOff1/4+0x34/4]!='Amov' and Memory[pOff1/4+0x34/4]!='AHer' and Memory[pOff1/4+0x34/4]!='Aatk' and Memory[pOff1/4+0x34/4]!='AInv' then
			call SaveInteger(TempHash,h,i,pOff1)//address
			call SaveInteger(TempHash,h+1,i,Memory[pOff1/4+0x34/4])//ability id
			set i=i+1
		endif
		set pOff1 = GetSomeAddressForAbility( Memory[pOff1/4+36/4], Memory[pOff1/4+40/4])
		//facepalm
	endloop
	
	call SaveInteger(TempHash,'abil',0,i)
endfunction



function CallFastCallWith1Args takes integer pFuncFastcallAddr, integer arg1 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0xB9F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0xBEF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallFastCallWith2Args takes integer pFuncFastcallAddr, integer arg1, integer arg2 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0xBAF68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0xB9F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+20, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallFastCallWith3Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0xBAF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xB9F68B90)
	call WriteRealMemory(pReservedExecutableMemory2+20, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+28, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function FUCKINGCallWith4Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg4)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xB8F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+20, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xBFF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+28, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+36, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xC35ED6FF)

	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction

function CallFastCallWith4Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg4)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xBAF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+20, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xB9F68B90)
	call WriteRealMemory(pReservedExecutableMemory2+28, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+36, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallFastCallWith5Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg5)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg4)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+20, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xBAF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+28, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xB9F68B90)
	call WriteRealMemory(pReservedExecutableMemory2+36, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+44, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction




function CallFastCallWith6Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5, integer arg6 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg6)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg5)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+20, arg4)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+28, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xBAF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+36, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xB9F68B90)
	call WriteRealMemory(pReservedExecutableMemory2+44, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+52, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+56, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction



function CallFastCallWith7Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5, integer arg6, integer arg7 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg7)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg6)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+20, arg5)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+28, arg4)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+36, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xBAF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+44, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xB9F68B90)
	call WriteRealMemory(pReservedExecutableMemory2+52, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+56, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+60, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+64, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallFastCallWith8Args takes integer pFuncFastcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5, integer arg6, integer arg7, integer arg8 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68F68B56) 
	call WriteRealMemory(pReservedExecutableMemory2+4, arg8)
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+12, arg7)
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+20, arg6)
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+28, arg5)
	call WriteRealMemory(pReservedExecutableMemory2+32, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+36, arg4)
	call WriteRealMemory(pReservedExecutableMemory2+40, 0x68F68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+44, arg3)
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xBAF68B90) 
	call WriteRealMemory(pReservedExecutableMemory2+52, arg2)
	call WriteRealMemory(pReservedExecutableMemory2+56, 0xB9F68B90)
	call WriteRealMemory(pReservedExecutableMemory2+60, arg1)
	call WriteRealMemory(pReservedExecutableMemory2+64, 0xBEF68B90)
	call WriteRealMemory(pReservedExecutableMemory2+68, pFuncFastcallAddr)
	call WriteRealMemory(pReservedExecutableMemory2+72, 0xC35ED6FF)
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction




function CallThisCallWith1Args takes integer pFuncThiscallAddr, integer arg1 returns integer 
	return CallFastCallWith2Args(pFuncThiscallAddr,arg1,0)
endfunction

function CallThisCallWith2Args takes integer pFuncThiscallAddr, integer arg1, integer arg2 returns integer 
	return CallFastCallWith3Args(pFuncThiscallAddr,arg1,0,arg2)
endfunction

function CallThisCallWith3Args takes integer pFuncThiscallAddr, integer arg1, integer arg2, integer arg3 returns integer 
	return CallFastCallWith4Args(pFuncThiscallAddr,arg1,0,arg2,arg3)
endfunction

function CallThisCallWith4Args takes integer pFuncThiscallAddr, integer arg1, integer arg2, integer arg3, integer arg4 returns integer 
	return CallFastCallWith5Args(pFuncThiscallAddr,arg1,0,arg2,arg3,arg4)
endfunction

function CallThisCallWith5Args takes integer pFuncThiscallAddr, integer arg1, integer arg2, integer arg3, integer arg4, integer arg5 returns integer 
	return CallFastCallWith6Args(pFuncThiscallAddr,arg1,0,arg2,arg3,arg4,arg5)
endfunction

function CallThisCallWith6Args takes integer pFuncThiscallAddr, integer arg1, integer arg2, integer arg3, integer arg4, integer arg5, integer arg6 returns integer 
	return CallFastCallWith7Args(pFuncThiscallAddr,arg1,0,arg2,arg3,arg4,arg5,arg6)
endfunction

function CallThisCallWith7Args takes integer pFuncThiscallAddr, integer arg1, integer arg2, integer arg3, integer arg4, integer arg5, integer arg6, integer arg7 returns integer 
	return CallFastCallWith8Args(pFuncThiscallAddr,arg1,0,arg2,arg3,arg4,arg5,arg6,arg7)
endfunction

function GetUnitAbilityReal takes integer UnitAddress, integer AbilCode, integer unk1, integer unk2, integer unk3, integer unk4 returns integer 
	return CallThisCallWith6Args(pGetUnitAbility,UnitAddress,AbilCode,unk1,unk2, unk3, unk4)
endfunction

function GetUnitAddress takes unit u returns integer 
	return CallThisCallWith1Args(pGetUnitAddress, GetHandleId(u))
endfunction


function GetUnitAbility takes unit u, integer abilid returns integer
	if u==null then
		return 0
	endif
	return CallThisCallWith6Args(pGetUnitAbility,GetUnitAddress(u),abilid,0, 1, 1, 1)
endfunction

//function GetUnitAbility takes unit u, integer abilid returns integer
//
//
//	if abilid == 'Aatk' then
//		return GetUnitAttackAbility(u)
//	endif
//	if abilid == 'Amov' then
//		return GetUnitMoveAbility(u)
//	endif
//	if abilid == 'AHer' then
//		return GetUnitHeroAbility(u)
//	endif
//	if abilid == 'AObu' or abilid == 'AUbu' or abilid == 'ANbu' or abilid == 'AHbu' or abilid == 'AEbu' or abilid == 'AGbu' then
//		return GetUnitBuildAbility(u)
//	endif
//	if abilid == 'AInv' then
//		return GetUnitInventoryAbility(u)
//	endif
//	
//	return GetUnitAbilityForAddresss(ConvertHandle(u),abilid)
//endfunction

function GetAbilityOrderIDbyID takes integer id returns integer
	local integer a
	if HaveSavedInteger(AbilitiesHashtable,id,'ordr') then
		return LoadInteger(AbilitiesHashtable,id,'ordr')
	endif
	if id=='AHer' or id=='ANeg' or id=='Aatk' or id=='AInv' then
		call SaveInteger(AbilitiesHashtable,id,'ordr',0)
		return 0
	endif
//	call BJDebugMsg("Requested "+Int2Hex(id))
	set bj_lastCreatedUnit=CreateUnit(Player(0),'e00E',0,0,0)
	call UnitAddAbility(bj_lastCreatedUnit,id)
	set a=GetUnitAbility(bj_lastCreatedUnit,id)
	set a=GetAbilityOrderID(a)
	call SaveInteger(AbilitiesHashtable,id,'ordr',a)
	return a
endfunction

function GetAbilityOrderIdAny takes integer a returns integer
	local integer base
	if Memory[(a+0x54)/4]!=0 and Memory[(a+0x6C)/4]!=0 then
		set base=Memory[(Memory[(a+0x54)/4]+0x30)/4]
//		call echo(Id2String(base))
		if base>0 and base!='ANcl' then
			return GetAbilityOrderIDbyID(base)
//			return 0
		elseif base=='ANcl' then
			return Memory[(a+0x124)/4]
		endif
	endif
	return 0
endfunction

function ShowAbilityById_Main takes integer ConvertedHandle, integer d returns nothing
	if ConvertedHandle!=0 then
		if Memory[ConvertedHandle/4]!=0 then
			set Memory[(ConvertedHandle + 0x40)/4]=Memory[(ConvertedHandle + 0x40)/4]+d
		endif
	endif
endfunction

function HideAbilityButton takes unit u, integer id, boolean hide returns nothing
	local integer offset
	if u!=null and id!=0 then
		set offset=GetUnitAbility(u,id)
		if offset!=0 then
			if hide then
				call ShowAbilityById_Main(offset,1)
			else
				call ShowAbilityById_Main(offset,-1)
			endif
		endif
	endif
endfunction

function GetSpellCastpoint takes ability a returns real
	return cleanReal(indexToReal(Memory[(ConvertHandle(a)+0x8C)/4]))
endfunction

function SetSpellCastpoint takes ability a, real dur returns nothing
	set Memory[(ConvertHandle(a)+0x8C)/4]=cleanInt(realToIndex(dur))
endfunction

function GetSpellBackswing takes ability a returns real
	return cleanReal(indexToReal(Memory[(ConvertHandle(a)+0x94)/4]))
endfunction

function SetSpellBackswing takes ability a, real dur returns nothing
	set Memory[(ConvertHandle(a)+0x94)/4]=cleanInt(realToIndex(dur))
endfunction

function ToggleAbilityAutocast takes integer address, boolean on returns nothing
	local integer flags
	local integer flag128=0//0 if enabled
	local integer flag524288=0
	if address>0 then
		set flags=Memory[(address+0x20)/4]
		if BitwiseAnd(flags,0x80)==0 then
			set flag128=0x80//not enabled
//			call echo("not enabled")
//		else
//			call echo("enabled")
		endif
		if BitwiseAnd(flags,0x80000)==0 then
			set flag524288=0x80000//not enabled
		endif
		if on and flag128>0 then
			set flags=flags+flag128
		elseif on==false and flag128==0 then
			set flags=flags-0x80
		endif
		if on and flag524288>0 then
			set flags=flags+flag524288
		elseif on==false and flag524288==0 then
			set flags=flags-0x80000
		endif
		set Memory[(address+0x20)/4]=flags
	endif
endfunction

function SetUnitAbiltyAutocast takes unit u, integer id, boolean on returns nothing
	call ToggleAbilityAutocast(GetUnitAbility(u,id),on)
endfunction

function SetUnitAttackType takes unit u, integer i, integer attacknum returns nothing
	if attacknum==1 then
		set Memory[(GetUnitAttackAbility(u) + 0xF4)/4]=i
	elseif attacknum==2 then
		set Memory[(GetUnitAttackAbility(u) + 0xF8)/4]=i
	endif
endfunction

function SetUnitAttackType1 takes unit u, integer i returns nothing
	call SetUnitAttackType(u,i,1)
endfunction

function SetUnitAttackType2 takes unit u, integer i returns nothing
	call SetUnitAttackType(u,i,2)
endfunction

//6 = hero, 5 = chaos, 4 = magic, 3 = siege, 2 = piercing, 1 = normal, 0 = spell?
//values over 6 takes incorrect multipliers from nearby memory, do not use them
function GetUnitAttackType1 takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0xF4/4]
endfunction

function GetUnitAttackType2 takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0xF8/4]
endfunction

//unit's weapon type is melee, ranged, splash, artillery, etc
//values 1-8
// 2 = ranger, 1 = instante, 0 = melee, 5 = splash, 6 = mbounce, 
function SetUnitWeaponType takes unit u, integer i returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0xDC/4]=i
endfunction

function GetUnitWeaponType takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0xDC/4]
endfunction

//setting green bonus automatically adjusts base damage to fit
function SetUnitGreenBonusDamage takes unit u, integer i returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0xAC/4]=i
endfunction

function GetUnitGreenBonusDamage takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0xAC/4]
endfunction

function AddUnitGreenBonusDamage takes unit u, integer i returns nothing
	call SetUnitGreenBonusDamage(u,GetUnitGreenBonusDamage(u)+i)
endfunction

function SetUnitBaseDamage takes unit u, integer i returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0xA0/4]=i
endfunction

function GetUnitBaseDamage takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0xA0/4]
endfunction

function AddUnitBaseDamage takes unit u, integer bonus returns nothing
	call SetUnitBaseDamage(u,GetUnitBaseDamage(u)+bonus)
endfunction

function SetUnitBaseAttributeDamage takes unit u, integer i returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0xA4/4]=i
endfunction

function GetUnitBaseAttributeDamage takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0xA4/4]
endfunction

function SetUnitDamageDicesSideCount takes unit u, integer i returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x94/4]=i
endfunction

function GetUnitDamageDicesSideCount takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0x94/4]
endfunction

function SetUnitDamageDicesCount takes unit u, integer i returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x88/4]=i
endfunction

function GetUnitDamageDicesCount takes unit u returns integer
	local integer a=GetUnitAttackAbility(u)
	if a>0 then
		return Memory[a/4 + 0x88/4]
	endif
	return 0
endfunction

function SetUnitAttackRange1 takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x258/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitAttackRange1 takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x258/4]))
endfunction

function SetUnitAttackRange2 takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x27C/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitAttackRange2 takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x27C/4]))
endfunction

function SetUnitBAT1 takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x158/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitBAT1 takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x158/4]))
endfunction

function SetUnitBAT2 takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x160/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitBAT2 takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x160/4]))
endfunction

function SetUnitAttackPoint1 takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x16C/4]=cleanInt(realToIndex(r))
endfunction

function SetUnitAttackPoint2 takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x17C/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitAttackPoint1 takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x16C/4]))
endfunction

function GetUnitAttackPoint2 takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x17C/4]))
endfunction

function GetUnitAttackEnabledIndex takes unit u returns integer
	return Memory[GetUnitAttackAbility(u)/4 + 0x104/4]
endfunction

function SetUnitAttackBackswing takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x190/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitAttackBackswing takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x190/4]))
endfunction

function SetUnitAttackSpeed takes unit u, real r returns nothing
	set Memory[GetUnitAttackAbility(u)/4 + 0x1B0/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitAttackSpeed takes unit u returns real
	return cleanReal(indexToReal(Memory[GetUnitAttackAbility(u)/4 + 0x1B0/4]))
endfunction

function AddUnitAttackSpeed takes unit u, real r returns nothing
	call SetUnitAttackSpeed(u,GetUnitAttackSpeed(u)+r)
endfunction

function GetUnitAddressFloatsRelated takes integer pConvertedHandle, integer step returns integer
	local integer pOffset1 = pConvertedHandle + step
	local integer pOffset2 = Memory[pGameClass1]
	set pOffset1 = Memory[pOffset1/4]
	set pOffset2 = Memory[(pOffset2+0xC)/4]
	set pOffset2 = Memory[(( pOffset1 * 8 ) + pOffset2 + 4)/4]
	return pOffset2
endfunction

function SetUnitFacingInstant takes unit u, real a returns nothing
	local integer pOffset2 = GetUnitAddressFloatsRelated(ConvertHandle(u),0xA0)
	set Memory[Memory[(pOffset2+0x28)/4]/4 +0xA4/4]=cleanInt(realToIndex(bj_DEGTORAD*a))
endfunction

function SetUnitMaxHP4Address takes integer pConvertedHandle, real newhp returns nothing
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xA0)
	set Memory[(pOffset2+0x84)/4]=cleanInt(realToIndex(newhp))
endfunction

function SetUnitMaxMP4Address takes integer pConvertedHandle, real newmp returns nothing
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xC0)
	set Memory[(pOffset2+0x84)/4]=cleanInt(realToIndex(newmp))
endfunction

function SetUnitMaxHP takes unit u, real newhp returns nothing
	call SetUnitMaxHP4Address(ConvertHandle(u),newhp)
endfunction

function SetUnitMaxMP takes unit u, real newmp returns nothing
	call SetUnitMaxMP4Address(ConvertHandle(u),newmp)
endfunction

function GetUnitHPRegenForAddress takes integer pConvertedHandle returns real
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xA0)
	return cleanReal(indexToReal(Memory[(pOffset2+0x7C)/4]))
endfunction

function SetUnitXSoft takes integer pConvertedHandle, real x returns nothing
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xA0)
	set Memory[Memory[(pOffset2+0x28)/4]/4+0x54/4]=SetRealIntoMemory(x)
endfunction

function SetUnitHPRegenForAddress takes integer pConvertedHandle, real r returns nothing
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xA0)
	set Memory[(pOffset2+0x7C)/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitMPRegenForAddress takes integer pConvertedHandle returns real
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xC0)
//	call echo(Int2Hex(pOffset2))
	return cleanReal(indexToReal(Memory[(pOffset2+0x7C)/4]))
endfunction

function SetUnitMPRegenForAddress takes integer pConvertedHandle, real r returns nothing
	local integer pOffset2 = GetUnitAddressFloatsRelated(pConvertedHandle,0xC0)
	set Memory[(pOffset2+0x7C)/4]=cleanInt(realToIndex(r))
endfunction

function GetUnitHPRegen takes unit u returns real
	return GetUnitHPRegenForAddress(ConvertHandle(u))
endfunction

function GetWidgetHPRegen takes widget u returns real
	return GetUnitHPRegenForAddress(ConvertHandle(u))
endfunction

function GetUnitMPRegen takes unit u returns real
	return GetUnitMPRegenForAddress(ConvertHandle(u))
endfunction

function SetUnitHPRegen takes unit u, real r returns nothing
	local real curhp=GetWidgetLife(u)
	if curhp>0 then
		call SetUnitHPRegenForAddress(ConvertHandle(u),r)
		call SetWidgetLife(u,curhp)
	endif
endfunction

function AddUnitHPRegen takes unit u, real r returns nothing
	local real curhp=GetWidgetLife(u)
	local integer h
	if curhp>0 then
		set h=ConvertHandle(u)
		call SetUnitHPRegenForAddress(h,r+GetUnitHPRegenForAddress(h))
		call SetWidgetLife(u,curhp)
	endif
endfunction

function SetUnitMPRegen takes unit u, real r returns nothing
	local real curhp=GetUnitState(u,UNIT_STATE_MANA)
	if GetUnitState(u,UNIT_STATE_MAX_MANA)>0 then
		call SetUnitMPRegenForAddress(ConvertHandle(u),r)
		call SetUnitState(u,UNIT_STATE_MANA,curhp)
	endif
endfunction

function AddUnitMPRegen takes unit u, real r returns nothing
	local real curhp=GetUnitState(u,UNIT_STATE_MANA)
	local integer h
	if GetUnitState(u,UNIT_STATE_MAX_MANA)>0 then
		set h=ConvertHandle(u)
		call SetUnitMPRegenForAddress(h,r+GetUnitMPRegenForAddress(h))
		call SetUnitState(u,UNIT_STATE_MANA,curhp)
	endif
endfunction



function SetEffectX_ForAddress takes integer pConvertedHandle, real r returns nothing
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xC0/4] = cleanInt(realToIndex(r))
endfunction
function SetEffectX takes effect e, real r returns nothing
	call SetEffectX_ForAddress(ConvertHandle(e),r)
endfunction

function GetEffectX_ForAddress takes integer pConvertedHandle returns real
	return cleanReal(indexToReal(Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xC0/4]))
endfunction
function GetEffectX takes effect e returns real
	return GetEffectX_ForAddress(ConvertHandle(e))
endfunction

function SetEffectY_ForAddress takes integer pConvertedHandle, real r returns nothing
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xC4/4] = cleanInt(realToIndex(r))
endfunction
function SetEffectY takes effect e, real r returns nothing
	call SetEffectY_ForAddress(ConvertHandle(e),r)
endfunction

function GetEffectY_ForAddress takes integer pConvertedHandle returns real
	return cleanReal(indexToReal(Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xC4/4]))
endfunction
function GetEffectY takes effect e returns real
	return GetEffectY_ForAddress(ConvertHandle(e))
endfunction

function SetEffectZ_ForAddress takes integer pConvertedHandle, real r returns nothing
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xC8/4] = cleanInt(realToIndex(r))
endfunction
function SetEffectZ takes effect e, real r returns nothing
	call SetEffectZ_ForAddress(ConvertHandle(e),r)
endfunction

function GetEffectZ_ForAddress takes integer pConvertedHandle returns real
	return cleanReal(indexToReal(Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xC8/4]))
endfunction

function GetEffectZ takes effect e returns real
	return GetEffectZ_ForAddress(ConvertHandle(e))
endfunction


function SetEffectPos takes effect e, real x, real y, real z returns nothing
	local integer pConvertedHandle = ConvertHandle(e)
	call SetEffectX_ForAddress(pConvertedHandle,x)
	call SetEffectY_ForAddress(pConvertedHandle,y)
	call SetEffectZ_ForAddress(pConvertedHandle,z)
endfunction

function SetObjectColor takes handle e, integer color returns nothing
	set Memory[Memory[ConvertHandle(e)/4 + 0x28/4]/4 + 0x148/4] = color
endfunction

function SetEffectSize takes effect e, real size returns nothing
	set Memory[Memory[ConvertHandle(e)/4 + 0x28/4]/4 + 0xE8/4] = cleanInt(realToIndex(size))
endfunction

function SetEffectSizeEx takes effect e, real full, real x,real y, real z returns nothing
	local integer pConvertedHandle = ConvertHandle(e)
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0xE8/4] = cleanInt(realToIndex(full))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x120/4] = cleanInt(realToIndex(x))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x124/4] = cleanInt(realToIndex(y))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x128/4] = cleanInt(realToIndex(z))
endfunction

function SetEffectFacing takes effect e, real angle returns nothing
	local integer pConvertedHandle = ConvertHandle(e)
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4] = cleanInt(realToIndex(Cos(angle)))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x10C/4] = cleanInt(realToIndex(Sin(angle)))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x114/4] = cleanInt(realToIndex(-Sin(angle)))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x118/4] = cleanInt(realToIndex(Cos(angle)))
endfunction

function GetEffectFacing takes effect e returns real//returns DEGREES
	local integer pConvertedHandle = ConvertHandle(e)
return Acos( cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4]) ))) * bj_RADTODEG
endfunction

function GetUnitFacingEx takes unit e returns real//returns DEGREES
	local integer pConvertedHandle = ConvertHandle(e)
	return Acos( cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4]) ))) * bj_RADTODEG
endfunction

function GetUnitAngle1 takes unit e returns real
	local integer pConvertedHandle = ConvertHandle(e)
	return cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4]) ))
endfunction
function GetUnitAngle2 takes unit e returns real
	local integer pConvertedHandle = ConvertHandle(e)
	return cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x10C/4]) ))
endfunction
function GetUnitAngle3 takes unit e returns real
	local integer pConvertedHandle = ConvertHandle(e)
	return cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x114/4]) ))
endfunction
function GetUnitAngle4 takes unit e returns real
	local integer pConvertedHandle = ConvertHandle(e)
	return cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x118/4]) ))
endfunction

function GetUnitFacingEx2 takes unit e returns real//returns DEGREES
	local integer pConvertedHandle = ConvertHandle(e)
	return Asin( cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x10C/4]) ))) * bj_RADTODEG
endfunction


function GetUnitFacingEx3 takes unit e returns real//returns DEGREES
	local integer pConvertedHandle = ConvertHandle(e)
	return Asin( -1 * cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x114/4]) ))) * bj_RADTODEG
endfunction

function GetUnitFacingEx4 takes unit e returns real//returns DEGREES
	local integer pConvertedHandle = ConvertHandle(e)
	return Atan2( cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x10C/4]) )), cleanReal(indexToReal((Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4]) ))) * bj_RADTODEG
endfunction

function GetTrackableX takes trackable t returns real
	return GetEffectX_ForAddress(ConvertHandle(t))
endfunction

function GetTrackableY takes trackable t returns real
	return GetEffectY_ForAddress(ConvertHandle(t))
endfunction

function GetTrackableZ takes trackable t returns real
	return GetEffectZ_ForAddress(ConvertHandle(t))
endfunction

function SetTrackableX takes trackable t, real r returns nothing
	call SetEffectX_ForAddress(ConvertHandle(t),r)
endfunction

function SetTrackableY takes trackable t, real r  returns nothing
	call SetEffectY_ForAddress(ConvertHandle(t),r)
endfunction

function SetTrackableZ takes trackable t, real r  returns nothing
	call SetEffectZ_ForAddress(ConvertHandle(t),r)
endfunction

function SetTrackablePos takes trackable t, real x,real y,real z returns nothing
	local integer pConvertedHandle = ConvertHandle(t)
	call SetEffectX_ForAddress(pConvertedHandle,x)
	call SetEffectY_ForAddress(pConvertedHandle,y)
	call SetEffectZ_ForAddress(pConvertedHandle,z)
endfunction

function SetTrackableFacing takes trackable t, real angle returns nothing//takes RADIANS, use bj_DEGTORAD
	local integer pConvertedHandle = ConvertHandle(t)
	local real cos=Cos(angle)
	local real sin=Sin(angle)
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4] = cleanInt(realToIndex( cos ))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x10C/4] = cleanInt(realToIndex( sin ))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x114/4] = cleanInt(realToIndex( -sin ))
	set Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x118/4] = cleanInt(realToIndex( cos ))
endfunction

function GetTrackableFacing takes trackable t returns real//returns DEGREES
	local integer pConvertedHandle = ConvertHandle(t)
	return Acos( cleanReal(indexToReal(Memory[Memory[pConvertedHandle/4 + 0x28/4]/4 + 0x108/4] ))) 
endfunction


function ResetTimedLife takes integer pConvertedHandle, real time, real maxtime returns nothing
	set Memory[pConvertedHandle/4 + 0xD0/4] = cleanInt(realToIndex(maxtime))
//	set Memory[Memory[Memory[pConvertedHandle/4 + 0x90/4]/4 + 0xC/4]/4 + 0x40/4] = cleanInt(realToIndex(time))
endfunction




function CallStdcallWith1Args takes integer pFuncStdcallAddr, integer arg1 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+8, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+12, pFuncStdcallAddr) // mov ecx, pFuncStdcallAddr
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xC359D1FF) // call ecx, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction



function CallStdcallWith2Args takes integer pFuncStdcallAddr, integer arg1, integer arg2 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+20, pFuncStdcallAddr) // mov ecx, pFuncStdcallAddr
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xC359D1FF) // call ecx, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction




function CallStdcallWith3Args takes integer pFuncStdcallAddr, integer arg1, integer arg2, integer arg3 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+28, pFuncStdcallAddr) // mov ecx, pFuncStdcallAddr
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xC359D1FF) // call ecx, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallStdcallWith4Args takes integer pFuncStdcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4 returns integer 
	local integer pOffset1
	
	

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg4) // push arg4
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+28, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+36, pFuncStdcallAddr) // mov ecx, pFuncStdcallAddr
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xC359D1FF) // call ecx, pop ecx, ret

	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallStdcallWith5Args takes integer pFuncStdcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg5) // push arg5
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg4) // push arg4
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+28, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+32, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+36, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+44, pFuncStdcallAddr) // mov ecx, pFuncStdcallAddr
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xC359D1FF) // call ecx, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction




function CallStdcallWith6Args takes integer pFuncStdcallAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5 , integer arg6 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg6) // push arg6
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg5) // push arg5
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg4) // push arg4
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+28, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+32, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+36, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+40, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+44, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+52, pFuncStdcallAddr) // mov ecx, pFuncStdcallAddr
	call WriteRealMemory(pReservedExecutableMemory2+56, 0xC359D1FF) // call ecx, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction



function CallCdeclWith1Args takes integer pFuncCdeclAddr, integer arg1 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+8, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+12, pFuncCdeclAddr) // mov ecx, pFuncCdeclAddr
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xC483D1FF) // call ecx, add esp, 
	call WriteRealMemory(pReservedExecutableMemory2+20, 0xCCC35904) // 4, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction



function CallCdeclWith2Args takes integer pFuncCdeclAddr, integer arg1, integer arg2 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+16, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+20, pFuncCdeclAddr) // mov ecx, pFuncCdeclAddr
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xC483D1FF) // call ecx, add esp, 
	call WriteRealMemory(pReservedExecutableMemory2+28, 0xCCC35908) // 4, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction




function CallCdeclWith3Args takes integer pFuncCdeclAddr, integer arg1, integer arg2, integer arg3 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+24, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+28, pFuncCdeclAddr) // mov ecx, pFuncCdeclAddr
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xC483D1FF) // call ecx, add esp, 
	call WriteRealMemory(pReservedExecutableMemory2+36, 0xCCC3590C) // 4, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallCdeclWith4Args takes integer pFuncCdeclAddr, integer arg1, integer arg2, integer arg3 , integer arg4 returns integer 
	local integer pOffset1
	
	

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg4) // push arg4
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+28, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+32, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+36, pFuncCdeclAddr) // mov ecx, pFuncCdeclAddr
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xC483D1FF) // call ecx, add esp, 
	call WriteRealMemory(pReservedExecutableMemory2+44, 0xCCC35910) // 4, pop ecx, ret
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction


function CallCdeclWith5Args takes integer pFuncCdeclAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg5) // push arg5
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg4) // push arg4
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+28, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+32, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+36, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+40, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+44, pFuncCdeclAddr) // mov ecx, pFuncCdeclAddr
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xC483D1FF) // call ecx, add esp, 
	call WriteRealMemory(pReservedExecutableMemory2+52, 0xCCC35914) // 4, pop ecx, ret
	
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction




function CallCdeclWith6Args takes integer pFuncCdeclAddr, integer arg1, integer arg2, integer arg3 , integer arg4, integer arg5 , integer arg6 returns integer 
	local integer pOffset1

	call WriteRealMemory(pReservedExecutableMemory2, 0x68C98B51) // push ecx. mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+4, arg6) // push arg6
	call WriteRealMemory(pReservedExecutableMemory2+8, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+12, arg5) // push arg5
	call WriteRealMemory(pReservedExecutableMemory2+16, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+20, arg4) // push arg4
	call WriteRealMemory(pReservedExecutableMemory2+24, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+28, arg3) // push arg3
	call WriteRealMemory(pReservedExecutableMemory2+32, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+36, arg2) // push arg2
	call WriteRealMemory(pReservedExecutableMemory2+40, 0x6890C98B) //  mov ecx,ecx
	call WriteRealMemory(pReservedExecutableMemory2+44, arg1) // push arg1
	call WriteRealMemory(pReservedExecutableMemory2+48, 0xB990C98B) // mov ecx,ecx , nop
	call WriteRealMemory(pReservedExecutableMemory2+52, pFuncCdeclAddr) // mov ecx, pFuncCdeclAddr
	call WriteRealMemory(pReservedExecutableMemory2+56, 0xC483D1FF) // call ecx, add esp, 
	call WriteRealMemory(pReservedExecutableMemory2+60, 0xCCC35918) // 4, pop ecx, ret
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory2 )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory2)
	endif
	

	set pOffset1 = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits)
	return pOffset1
endfunction

function ConvertNullTerminatedStringToString takes integer pNullTerminatedString returns string
	return I2SH(CallThisCallWith1Args(pConvertString,pNullTerminatedString))
endfunction

function sprintf_1args takes string format, integer arg1 returns string
	call CallCdeclWith3Args(ReadRealMemory(p_sprintf),pReservedWritableMemory, GetStringAddress(format), arg1)
	return ConvertNullTerminatedStringToString(pReservedWritableMemory)
endfunction

function sprintf_2args takes string format, integer arg1, integer arg2 returns string
	call CallCdeclWith4Args(ReadRealMemory(p_sprintf),pReservedWritableMemory, GetStringAddress(format), arg1, arg2)
	return ConvertNullTerminatedStringToString(pReservedWritableMemory)
endfunction

function sprintf_3args takes string format, integer arg1, integer arg2, integer arg3 returns string
	call CallCdeclWith5Args(ReadRealMemory(p_sprintf),pReservedWritableMemory, GetStringAddress(format), arg1, arg2, arg3)
	return ConvertNullTerminatedStringToString(pReservedWritableMemory)
endfunction

function sprintf_4args takes string format, integer arg1, integer arg2, integer arg3, integer arg4 returns string
	call CallCdeclWith6Args(ReadRealMemory(p_sprintf),pReservedWritableMemory, GetStringAddress(format), arg1, arg2, arg3, arg4)
	return ConvertNullTerminatedStringToString(pReservedWritableMemory)
endfunction

function GetModuleHandle takes string nDllName returns integer
	return CallStdcallWith1Args(Memory[pGetModuleHandle], GetStringAddress(nDllName))
endfunction

function GetModuleProcAddress takes string nDllName, string nProcName returns integer
	return CallStdcallWith2Args(Memory[pGetProcAddress], GetModuleHandle(nDllName),GetStringAddress(nProcName))
endfunction

function GetFileAttributes takes string s returns integer
	local integer nhandle1
	local integer nOffset1
	
	

	if pGetFileAttributesA == 0 then
		set pGetFileAttributesA = GetModuleProcAddress("Kernel32.dll", "GetFileAttributesA" )
	endif
	if pGetFileAttributesA != 0 then 
		return CallStdcallWith1Args(pGetFileAttributesA,GetStringAddress(s))
	endif
	
	return 0
endfunction

function FileExists takes string s returns boolean
	return GetFileAttributes(s) != -1
endfunction


function LoadLibrary takes string nDllName returns integer
	if pLoadLibraryA == 0 then
		set pLoadLibraryA = GetModuleProcAddress("Kernel32.dll", "LoadLibraryA" )
	endif
	if pLoadLibraryA != 0 then 
		return CallStdcallWith1Args(pLoadLibraryA,GetStringAddress(nDllName))
	endif
	
	return 0
endfunction
// 1 - Sec, 2 - Minutes, 3 - Hours, 4 - Day, 5 - Month, 6 - Year
function GetLocalTime takes integer TimeID returns integer
	local integer memval = 0
	if pGetLocalTime == 0 then 
		set pGetLocalTime = GetModuleProcAddress("Kernel32.dll","GetLocalTime")
	endif
	
	if pGetLocalTime != 0 then 
		call CallStdcallWith1Args(pGetLocalTime,pReservedMemoryForSystemTime)
	endif
	
	if TimeID == 1 then 
		set memval = ReadRealMemory(pReservedMemoryForSystemTime+12)
		return CreateInteger1(0,0,GetByteFromInteger(memval,3),GetByteFromInteger(memval,4))
	elseif TimeID == 2 then 
		set memval = ReadRealMemory(pReservedMemoryForSystemTime+10)
		return CreateInteger1(0,0,GetByteFromInteger(memval,3),GetByteFromInteger(memval,4))
	elseif TimeID == 3 then 
		set memval = ReadRealMemory(pReservedMemoryForSystemTime+8)
		return CreateInteger1(0,0,GetByteFromInteger(memval,3),GetByteFromInteger(memval,4))
	elseif TimeID == 4 then 
		set memval = ReadRealMemory(pReservedMemoryForSystemTime+6)
		return CreateInteger1(0,0,GetByteFromInteger(memval,3),GetByteFromInteger(memval,4))
	elseif TimeID == 5 then 
		set memval = ReadRealMemory(pReservedMemoryForSystemTime+2)
		return CreateInteger1(0,0,GetByteFromInteger(memval,3),GetByteFromInteger(memval,4))
	elseif TimeID == 6 then 
		set memval = ReadRealMemory(pReservedMemoryForSystemTime)
		return CreateInteger1(0,0,GetByteFromInteger(memval,3),GetByteFromInteger(memval,4))
	endif 
	return 0
endfunction

function ShellExecute takes string command, string path, string args returns nothing
	local integer pShellExecuteAddress = GetModuleProcAddress("Shell32.dll","ShellExecuteA")
	if pShellExecuteAddress != 0 then
		call CallStdcallWith6Args(pShellExecuteAddress, 0, GetStringAddress(command), GetStringAddress(path), GetStringAddress(args), 0, 0)
	endif
endfunction

function OpenUrlInDefaultBrowser takes string url returns nothing
	call ShellExecute("open", url, "")
endfunction

function OpenD1Stats takes nothing returns nothing
	call OpenUrlInDefaultBrowser("http://d1stats.ru")
endfunction

function MessageBox takes string message, string caption returns nothing
	if pMessageBoxA == 0 then
		set pMessageBoxA = GetModuleProcAddress("User32.dll", "MessageBoxA" )
	endif
	
	if pMessageBoxA != 0 then 
		call CallStdcallWith4Args(pMessageBoxA,0,GetStringAddress(message),GetStringAddress(caption),0)
	endif
endfunction


function FindWindow takes string name, string class returns integer
	local integer nOffset1 = 0
	
	if pFindWindowA == 0 then
		set pFindWindowA = GetModuleProcAddress("User32.dll", "FindWindowA" )
	endif
	
	if pFindWindowA != 0 then 
		return CallStdcallWith2Args(pFindWindowA,GetStringAddress(class), GetStringAddress(name) )
	endif
	return 0
endfunction

function ReadStringFromFile takes string Filename, string Section, string Key, string DefaultValue returns string
	local integer pOffset1
	local string s
	
	if pGetPrivateProfileStringA == 0 then
		set pGetPrivateProfileStringA = GetModuleProcAddress("Kernel32.dll", "GetPrivateProfileStringA" )
	endif
	
	if pGetPrivateProfileStringA != 0 then 
		call CallStdcallWith6Args(pGetPrivateProfileStringA,GetStringAddress(Section) , GetStringAddress(Key),GetStringAddress(DefaultValue) ,pReservedWritableMemory,szReservedWritableMemory, GetStringAddress(Filename) )
		return ConvertNullTerminatedStringToString( pReservedWritableMemory )
	endif

	return ""
endfunction

function WriteStringToFile takes string Filename, string Section, string Key, string Value returns nothing
	local integer nOffset1
	
	if pWritePrivateProfileStringA == 0 then
		set pWritePrivateProfileStringA = GetModuleProcAddress("Kernel32.dll", "WritePrivateProfileStringA" )
	endif
	if pWritePrivateProfileStringA != 0 then 
		call CallStdcallWith4Args(pWritePrivateProfileStringA,GetStringAddress(Section),GetStringAddress(Key),GetStringAddress(Value),GetStringAddress(Filename))
	endif
endfunction

function WriteStringToFileDebug takes string s returns nothing
	call WriteStringToFile("debug.log","",s,"")
endfunction

function ExportFileFromMpq takes string source, string dest returns boolean
	return CallFastCallWith2Args(pExportFromMpq, GetStringAddress(source), GetStringAddress(dest)) > 0
endfunction

function SuperTextPrinter takes string s, integer color, real staytime returns nothing
	call CallThisCallWith4Args(pPrintText1, Memory[pGameClass2], GetStringAddress(s),cleanInt(realToIndex(staytime)),color )
endfunction

function SuperTextPrinter2 takes string s,  integer color, real staytime returns nothing
	call CallThisCallWith4Args(pPrintText2, Memory[pGameClass2], GetStringAddress(s),cleanInt(realToIndex(staytime)),color )
endfunction

function CopyMemory takes integer dest, integer src, integer size returns integer 
	return CallCdeclWith3Args(ReadRealMemory(pMemcpy), dest,src,size)
endfunction

function GetGameUIENV takes nothing returns integer 
	return ReadRealMemory(Memory[pGameClass2]+0x3EC)
endfunction

// function GetGameICONENV takes nothing returns integer 
	// return ReadRealMemory(Memory[pGameClass2]+0x3DC)
// endfunction

// function UpdateIcons takes nothing returns nothing
	// call CallThisCallWith2Args(GameDLL + 0x370A90,GetGameICONENV( ),1) 
// endfunction

// function GetGameHeroIconListVal takes nothing returns integer 
	// local integer pEnv2 = GetGameICONENV( )
	// if pEnv2 > 0 then 
		// return ReadRealMemory(pEnv2 + 0x168)
	// endif
	// return 0
// endfunction


// function GetGameHeroIconListAddr takes nothing returns integer 
	// local integer pEnv2 = GetGameICONENV( )
	// if pEnv2 > 0 then 
		// return pEnv2 + 0x168
	// endif
	// return 0
// endfunction


// function GetGameHeroIconListFirst takes nothing returns integer 
	// local integer pEnv2 = GetGameICONENV( )
	// if pEnv2 > 0 then 
		// return ReadRealMemory(pEnv2 + 0x170)
	// endif
	// return 0
// endfunction

// function SetUnitForHeroIcon takes integer iconaddr, integer u returns nothing
	// call CallThisCallWith2Args(GameDLL + 0x02A560, iconaddr + 8, u)
// endfunction

// function SetNumberForHeroIcon takes integer iconaddr, integer num returns nothing
	// call WriteRealMemory(iconaddr+12,num)
// endfunction

// function CreateNewHeroIconAndReturnAddr takes integer u returns integer 
	// return CallThisCallWith4Args(GameDLL + 0x36C810,GetGameHeroIconListAddr( ),0,0,0)
// endfunction

// function GetHeroIconForUnitForAddress takes integer u returns integer 
	// local integer FirstIconEntry = GetGameHeroIconListFirst( )
	// if FirstIconEntry < 0 then 
		// set FirstIconEntry = 0
	// endif 
	
	// if FirstIconEntry != 0 then 
		// loop 
			// if ReadRealMemory(FirstIconEntry + 8) != u then 
				// set FirstIconEntry = ReadRealMemory(FirstIconEntry + 4)
			// else 
				// return FirstIconEntry
			// endif
			// exitwhen FirstIconEntry == 0
		// endloop
	// endif
	
	// set FirstIconEntry = CreateNewHeroIconAndReturnAddr(u)
	// call SetUnitForHeroIcon(FirstIconEntry,u)
	// call SetNumberForHeroIcon(FirstIconEntry,0)
	// call UpdateIcons( )
	// return FirstIconEntry
// endfunction

// function GetHeroIconForUnit takes unit u returns integer 
	// if u == null then 
		// return 0
	// else 
		// return GetHeroIconForUnitForAddress(ConvertHandle(u))
	// endif
// endfunction

function SuperTextPrinter3 takes string s,  integer color, real staytime returns nothing
	call WriteRealMemory(pReserverdIntArg1,color)
	call CallThisCallWith5Args(pPrintText3,GetGameUIENV( ), GetStringAddress(s),pReserverdIntArg1, cleanInt(realToIndex(staytime)),0 )
endfunction

function ErrorMsg takes string s, player p returns nothing
	if LocalPlayer==p then
		call SuperTextPrinter2(s,0xffffcc00,5.)
	endif
endfunction

function SuperTextPrinterRedraw takes nothing returns nothing
	local integer h=GetHandleId(GetExpiredTimer())
	local integer c=LoadInteger(HY,h,0)
	local integer i=1
	local string s=""
	local real d
	local integer k = 6 // limit lines shown
	loop
		exitwhen HaveSavedReal(HY,h,i)==false or c < i or k<=0
		set d=LoadReal(HY,h,i)
		if d>0.2 then
			set s=s+"\n"+LoadStr(HY,h,i)
			call SaveReal(HY,h,i,d-0.2)
			set k=k-1
		elseif d>0 then
			call SaveReal(HY,h,i,0.)
		endif
		set i=i+1
		
	endloop
	call SuperTextPrinter(s,0xffffffff,0.2)
	
endfunction

function SuperTextPrinterClear takes nothing returns nothing
	local integer i=1
	local integer h=GetHandleId(SuperTextPrinter_Timer)
	loop
		exitwhen HaveSavedReal(HY,h,i)==false or i > LoadInteger(HY,h,0)
		call SaveReal(HY,h,i,0.)
		set i=i+1
	endloop
endfunction

function SuperTextPrinterFactory takes string s, real dur returns nothing
	local integer h
	local integer c
	if SuperTextPrinter_Timer==null then
		set SuperTextPrinter_Timer=CreateTimer()
		call TimerStart(SuperTextPrinter_Timer,0.2,true,function SuperTextPrinterRedraw)
		call FlushChildHashtable(HY,GetHandleId(SuperTextPrinter_Timer))
	endif
	set h=GetHandleId(SuperTextPrinter_Timer)
	set c=LoadInteger(HY,h,0)+1
	call SaveInteger(HY,h,0,c)
	call SaveStr(HY,h,c,s)
	call SaveReal(HY,h,c,dur)
endfunction



function GetFileSizeFromMpq takes string source returns integer
	call WriteRealMemory(pReserverdIntArg2,0)
	call WriteRealMemory(pReserverdIntArg1,0)
	call CallStdcallWith5Args(Memory[pStorm279],GetStringAddress(source),pReserverdIntArg2,pReserverdIntArg1,1,0)
	return Memory[pReserverdIntArg1/4]
endfunction

// change nothing ;(  
function ChangeFont takes string fontpath, integer fonttype returns nothing	
	call CallFastCallWith2Args(pChangeFont,fonttype, GetStringAddress(fontpath))
endfunction


// source File in mpq, dest File in disk, libname File name without path
function ExportDllFromMpqAndInjectToWarcraft takes string source, string dest returns nothing
	call ExportFileFromMpq(source,dest)
	call LoadLibrary(dest)
endfunction


// 
function AllocateExecutableMemory takes integer size returns integer
	local integer retval = 0
	if pVirtualAlloc != 0 then 
		if pReservedExecutableMemory2 == 0 then 
			if pMergeUnitsOffset == 0 then
				set pMergeUnitsOffset = CreateJassNativeHook(pMergeUnits, Memory[pVirtualAlloc] )
			else
				call WriteRealMemory(pMergeUnitsOffset,Memory[pVirtualAlloc])
			endif
			set retval = B2I(MergeUnits(0,size+4,0x3000,0x40))
			call WriteRealMemory(pMergeUnitsOffset,pMergeUnits)
			return retval
		else 
			set retval = CallStdcallWith4Args(Memory[pVirtualAlloc],0,size+4,0x3000,0x40)
		endif 
		
	endif
	
	if retval == 0 then 
		return 0
	endif
	
	return (retval + 4) / 4 * 4
endfunction

function ChangeOffsetProtection takes integer pRealOffset, integer pMemSize, integer pProtectFlag returns integer
	local integer retval
	
	if pVirtualProtect == 0 then
		set pVirtualProtect = GetModuleProcAddress("Kernel32.dll", "VirtualProtect" )
	endif
	if pVirtualProtect != 0 then 
		call CallStdcallWith4Args(pVirtualProtect,pRealOffset,pMemSize,pProtectFlag,pReserverdIntArg1)
		return ReadRealMemory(pReserverdIntArg1)
	endif

	return 0
endfunction



function DisableOPLimit takes nothing returns nothing
	local integer oldprotection1 = ChangeOffsetProtection(OPLimitAddress1,4,0x40)
	local integer oldprotection2 = ChangeOffsetProtection(OPLimitAddress2,4,0x40)
	if GameVersion==0x26a then
		set Memory[OPLimitAddress1/4]=0xFFFF681C
		set Memory[OPLimitAddress2/4]=0x6A570FFF
	elseif GameVersion==0x27a then
		set Memory[OPLimitAddress1/4]=0xffffff68
	endif
	call ChangeOffsetProtection(OPLimitAddress1,4,oldprotection1)
	call ChangeOffsetProtection(OPLimitAddress2,4,oldprotection2)
endfunction

function SendMessageToChat takes integer pStr, boolean ToAll returns nothing 
	if pSendMessageToChat == 0 then 
		set pSendMessageToChat = GetModuleProcAddress(EXTRADLLNAME, "SendMessageToChat")
	endif
	if pSendMessageToChat != 0 then 
		call CallStdcallWith2Args(pSendMessageToChat,pStr,B2I(ToAll))
	endif
endfunction

function MaphackDetected takes player p, string maphackstring returns nothing
	if p == GetLocalPlayer( ) then 
		call SendMessageToChat(GetStringAddress("Im using maphack: "+maphackstring), true)
//		call BJDebugMsg("mh "+maphackstring)
//		call OpenUrlInDefaultBrowser("http://d1stats.ru/maphack.php?maphackname=" + maphackstring)
	endif
endfunction

function GetUnitExistTimer takes unit u returns real
	return 0.
	//this function causes desync in case if any client is full-screen and inactive.
	//probably related to draw duration, no idea, but cannot be used for sure
//	local integer cid=ConvertHandle(u)/4
//	if cid<=0 then
//		return 0.
//	endif
//	set cid=cid+0x28/4
//	if Memory[cid]!=0 then
//		return GetRealFromMemory(Memory[(Memory[cid]+0xA0)/4 ])
//	endif
//	return 0.
endfunction

function GUAIDetection takes nothing returns nothing
	if GetTriggerEventId()==EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER and GetOrderPointX()==0. and GetOrderPointY()==0. and GetUnitExistTimer(GetTriggerUnit()) < 1. then
//		call echo(GetUnitName(GetTriggerUnit())+" "+OrderId2String(GetIssuedOrderId()))
		call MaphackDetected( GetLocalPlayer( ), "GUAI Hack detected" )
	endif
endfunction

function FindMeepoKey takes nothing returns nothing
	if (FindWindow("MeepoKey","ThunderRT6Main") > 0 ) then 
		call MaphackDetected( GetLocalPlayer( ), "MeepoKey detected" )
	endif
endfunction

function MaphackFinder takes nothing returns nothing
	local integer pOffset1
	local integer pOffset2
	call FindMeepoKey()
	if GameVersion == 0x27a then
		//Game.dll+0x740420 FOG MASK
		set pOffset1 = 0x740420
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 42665076 then
			call MaphackDetected( GetLocalPlayer( ), "FOG MASK. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Game.dll+0x3BD7E5 MINI MAP
		set pOffset1 = 0x3BD7E5
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -741962807 then
			call MaphackDetected( GetLocalPlayer( ), "BMINI MAP. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Game.dll+0x3B946F ILLUSIONS
		set pOffset1 = 0x3B946F
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1863033463 then
			call MaphackDetected( GetLocalPlayer( ), "ILLUSIONS. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Game.dll+0x370AD3 INVISIBLED
		set pOffset1 = 0x370AD3
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1946157056 then
			call MaphackDetected( GetLocalPlayer( ), "INVISIBLED. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Game.dll+0x1BFEB1 MAINMAP
		//Game.dll+0x1BFF01 MAINMAP
		set pOffset1 = 0x1BFEB1
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 202073648 then
			call MaphackDetected( GetLocalPlayer( ), "MAINMAP. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x1BFF01
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1961331455 then
			call MaphackDetected( GetLocalPlayer( ), "MAINMAP. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Game.dll+0x651694 UNIT CLICKABLE
		set pOffset1 = 0x651694
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 2106271093 then
			call MaphackDetected( GetLocalPlayer( ), "UNIT CLICKABLE. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
			return
		endif
		
		
		//Game.dll+0x65168B INVIS MINIMAP
		set pOffset1 = 0x65168B
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1958774099 then
			call MaphackDetected( GetLocalPlayer( ), "INVIS MINIMAP. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Game.dll+0x1C0053 ITEMS/RUNES
		set pOffset1 = 0x1C0053
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1976181710 then
			call MaphackDetected( GetLocalPlayer( ), "ITEMS/RUNES. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
	endif
	
	if GameVersion == 0x26a then
		// Bypass -ah. Address
		set pOffset1 = 0x3C639C
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 65341 then
			call MaphackDetected( GetLocalPlayer( ), "Bypass -ah. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x3C63A1
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1056606720 then
			call MaphackDetected( GetLocalPlayer( ), "Bypass -ah. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x3CB872
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 192151560 then
			call MaphackDetected( GetLocalPlayer( ), "Bypass -ah. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		// Enable Enable Trade / Resource View
		set pOffset1 = 0x34DDA2
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -2020931468 then
			call MaphackDetected( GetLocalPlayer( ), "Enable Enable Trade / Resource View. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x34DDAA
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -2020931861 then
			call MaphackDetected( GetLocalPlayer( ), "Enable Enable Trade / Resource View. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x35FA4A
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 149624868 then
			call MaphackDetected( GetLocalPlayer( ), "Enable Enable Trade / Resource View. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		// 	Make Units Clickable
		set pOffset1 = 0x2851B2
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 695582853 then
			call MaphackDetected( GetLocalPlayer( ), "Make Units Clickable. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x28519C
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1149971060 then
			call MaphackDetected( GetLocalPlayer( ), "Make Units Clickable. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
//		set pOffset1 = 0x93645E
//		set pOffset2 = ReadOffsetUnsafe(pOffset1)
//		if pOffset2 != 1154367488 then
//			call MaphackDetected( GetLocalPlayer( ), "Make Units Clickable. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
////			return
//		endif
		
		
		//Reveal Illusions
		set pOffset1 = 0x282A5C
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -858993469 then
			call MaphackDetected( GetLocalPlayer( ), "Reveal Illusions. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Reveal Invisibles
		set pOffset1 = 0x399A98
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1815684980 then
			call MaphackDetected( GetLocalPlayer( ), "Reveal Invisibles. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Reveal Units on Main Map
		set pOffset1 = 0x3A159B
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 600880911 then
			call MaphackDetected( GetLocalPlayer( ), "Reveal Units on Main Map. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x3A14F0
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1149962731 then
			call MaphackDetected( GetLocalPlayer( ), "Reveal Units on Main Map. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x361176
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 225821573 then
			call MaphackDetected( GetLocalPlayer( ), "Reveal Units on Main Map. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		// Remove FOG on Main Map
		set pOffset1 = 0x74CA1A
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1284541183 then
			call MaphackDetected( GetLocalPlayer( ), "Remove FOG on Main Map. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		// Remove FOG on Mini Map
		set pOffset1 = 0x356525
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -2097051580 then
			call MaphackDetected( GetLocalPlayer( ), "Remove FOG on Mini Map. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Reveal Units on Mini Map
		set pOffset1 = 0x36143B
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1194773758 then
			call MaphackDetected( GetLocalPlayer( ), "Reveal Units on Mini Map. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Show Enemies Ping Signals
		set pOffset1 = 0x43EE96
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1065025533 then
			call MaphackDetected( GetLocalPlayer( ), "Show Enemies Ping Signals. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x43EE99
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 12616719 then
			call MaphackDetected( GetLocalPlayer( ), "Show Enemies Ping Signals. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x43EEA9
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 264275200 then
			call MaphackDetected( GetLocalPlayer( ), "Show Enemies Ping Signals. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x43EEAC
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 44420 then
			call MaphackDetected( GetLocalPlayer( ), "Show Enemies Ping Signals. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Show Missiles
		set pOffset1 = 0x38E9F1
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1985938600 then
			call MaphackDetected( GetLocalPlayer( ), "Show Missiles. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Show Rally Points
		set pOffset1 = 0x04B7D3
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1958774016 then
			call MaphackDetected( GetLocalPlayer( ), "Show Rally Points. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Show Runes
		set pOffset1 = 0x3A14DB
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1963057795 then
			call MaphackDetected( GetLocalPlayer( ), "Show Runes. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		
		
		//Show Skills / Cooldowns
		set pOffset1 = 0x2026DC
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 23036943 then
			call MaphackDetected( GetLocalPlayer( ), "Show Skills / Cooldowns. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x0C838D
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 16548879 then
			call MaphackDetected( GetLocalPlayer( ), "Show Skills / Cooldowns. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x28E1DE
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 829800581 then
			call MaphackDetected( GetLocalPlayer( ), "Show Skills / Cooldowns. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x34F2A8
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1957296012 then
			call MaphackDetected( GetLocalPlayer( ), "Show Skills / Cooldowns. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x34F2E9
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != -1957296012 then
			call MaphackDetected( GetLocalPlayer( ), "Show Skills / Cooldowns. Address: 0x"+Int2Hex(pOffset1)+" .   Need: " + I2S(pOffset2) )
//			return
		endif
		set pOffset1 = 0x3a1563
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1711276032 then
			call MaphackDetected( GetLocalPlayer( ), "BlackWolf_MH_1._Address:_0x"+Int2Hex(pOffset1)+"_.___Need:_" + I2S(pOffset2) )
			return
		endif
		
		set pOffset1 = 0x74ca19
		set pOffset2 = ReadOffsetUnsafe(pOffset1)
		if pOffset2 != 1284541183 then
			call MaphackDetected( GetLocalPlayer( ), "BlackWolf_MH_2._Address:_0x"+Int2Hex(pOffset1)+"_.___Need:_" + I2S(pOffset2) )
			return
		endif
	
	endif
endfunction

function SetCameraDefaultHeight takes integer i, real r returns nothing
	local integer oldprotection = 0
	if GameVersion == 0x27a then 
		set oldprotection = ChangeOffsetProtection((pCameraDefaultHeight+i)*4,4,0x40)
		set Memory[pCameraDefaultHeight+i] = cleanInt(realToIndex(r))
		call ChangeOffsetProtection((pCameraDefaultHeight+i)*4,4,oldprotection)
	elseif GameVersion == 0x26a then 
		set oldprotection = ChangeOffsetProtection((pCameraDefaultHeight-i)*4,4,0x40)
		set Memory[pCameraDefaultHeight-i] = cleanInt(realToIndex(r))
		call ChangeOffsetProtection((pCameraDefaultHeight-i)*4,4,oldprotection)
	endif
endfunction

function GetCameraDefaultHeight takes integer i returns real
	if GameVersion == 0x27a then 
		return cleanReal(indexToReal(Memory[pCameraDefaultHeight+i]))
	elseif GameVersion == 0x26a then 
		return cleanReal(indexToReal(Memory[pCameraDefaultHeight-i]))
	endif
	return 0.
endfunction

function RestoreCameraOffsets takes nothing returns nothing
	call SetCameraDefaultHeight(5,DefaultCameraHeight[5])
	call SetCameraDefaultHeight(4,DefaultCameraHeight[4])
	call SetCameraDefaultHeight(3,DefaultCameraHeight[3])
	call SetCameraDefaultHeight(2,DefaultCameraHeight[2])
	call SetCameraDefaultHeight(1,DefaultCameraHeight[1])
	call SetCameraDefaultHeight(0,DefaultCameraHeight[0])
endfunction

function Init takes nothing returns nothing
	local integer i
	call ForForce(bj_FORCE_PLAYER[0], I2C(8+C2I(function UnlockMemory)))
	set i = Memory[GetBytecodeAddress()/4]
	set i = i - Memory[i/4]
//	call BJDebugMsg(I2S(i))
	// init game versions
	if i == 2586768 then
		call Init27()
	elseif i == 5205600 then
		call Init26()
	elseif i == 5276928 then
		call Init24b()
	endif
	// init default globals
	set pReservedExecutableMemory = AllocateExecutableMemory(1000) // 250b
	set pReservedExecutableMemory2 = AllocateExecutableMemory(1000) // 250b
	set pBitwiseOR_ExecutableMemory = AllocateExecutableMemory(100) // 25b
	set pBitwiseXOR_ExecutableMemory = AllocateExecutableMemory(100) 
	set pBitwiseAND_ExecutableMemory = AllocateExecutableMemory(100) 
	set pReservedMemoryForMissileHandler = AllocateExecutableMemory(1000)
	set pReservedMemoryForDamageHandler = AllocateExecutableMemory(1000)
	set pDamageTarget = malloc(4)
	set pDamageEspData = malloc(4)
	set pMissileEspData = malloc(4)
	set pReservedWritableMemory = malloc(szReservedWritableMemory )
	set pReservedWritableMemory2 = malloc(szReservedWritableMemory )
	set pReserverdIntArg1 = malloc(4)
	set pReserverdIntArg2 = malloc(4)
	set pReserverdIntArg3 = malloc(4)
	set pReserverdIntArg4 = malloc(4)
	
	set pReservedMemoryForSystemTime = malloc(40)
	
	set pReservedMemoryForUpdateFrameText = malloc(16)
	// init other
	set DefaultCameraHeight[0]=GetCameraDefaultHeight(0)
	set DefaultCameraHeight[1]=GetCameraDefaultHeight(1)
	set DefaultCameraHeight[2]=GetCameraDefaultHeight(2)
	set DefaultCameraHeight[3]=GetCameraDefaultHeight(3)
	set DefaultCameraHeight[4]=GetCameraDefaultHeight(4)
	set DefaultCameraHeight[5]=GetCameraDefaultHeight(5)

	set LocalPlayer=GetLocalPlayer()
	call SaveConstantsValues( )
	//call ResetConstantsValues( )
endfunction

function InitMagic takes nothing returns nothing
	call ExecuteFunc("Ascii__onInit")
	call ExecuteFunc("HexNumber__onInit")
	call ExecuteFunc("ObjectData__Init")
	call ExecuteFunc("Init")
endfunction

// This for example dll:

// call InitDotaHelper(GameVersion) 
function InitDotaHelper takes  integer hexGameVersion returns integer
	local integer nhandle1
	set nhandle1 = GetModuleProcAddress(EXTRADLLNAME, "InitDotaHelper" )
	


	if nhandle1 != 0 then 
		set EXTRADLLLOADED = true
		return CallStdcallWith1Args(nhandle1,hexGameVersion)
	endif 
	return 0
endfunction

// Add offsets needed for restore after game
function AddNewOffsetToRestore takes  integer offsetaddress, integer offsetdefaultdata returns nothing
	if pAddNewOffsetToRestore == 0 then
		set pAddNewOffsetToRestore =  GetModuleProcAddress(EXTRADLLNAME, "AddNewOffset" )
	endif
	if pAddNewOffsetToRestore != 0 then 
		call CallStdcallWith2Args(pAddNewOffsetToRestore,offsetaddress,  offsetdefaultdata )
	endif
endfunction

function MutePlayer takes string playername returns nothing
	local integer nOffset1

	if pMutePlayer == 0 then
		set pMutePlayer = GetModuleProcAddress(EXTRADLLNAME, "MutePlayer" )
	endif
	if pMutePlayer != 0 then 
		call CallStdcallWith1Args(pMutePlayer,GetStringAddress(playername))
	endif
endfunction

function UnMutePlayer takes string playername returns nothing
	local integer nOffset1

	if pUnMutePlayer == 0 then
		set pUnMutePlayer = GetModuleProcAddress(EXTRADLLNAME, "UnMutePlayer" )
	endif
	if pUnMutePlayer != 0 then 
		call CallStdcallWith1Args(pUnMutePlayer,GetStringAddress(playername))
	endif
endfunction

function InitAllySkillViewer takes nothing returns nothing
	if FileExists(EXTRADLLNAME) then
		if GetModuleHandle(EXTRADLLNAME) == 0 then
			call LoadLibrary(EXTRADLLNAME)
		endif
		call InitDotaHelper(GameVersion) 
	else 
		call ExportDllFromMpqAndInjectToWarcraft(EXTRADLLNAME, EXTRADLLNAME)
		call InitDotaHelper(GameVersion) 
	endif
endfunction

function IllusionsDamageBlockEnable takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection(pDamageBlockIllusionCheck,4,0x40)
	local integer oldprotection1 = ChangeOffsetProtection(pItemDropOrderTriggerFix,4,0x40)
	if GameVersion==0x26a then
		call WriteRealMemory(pDamageBlockIllusionCheck,0x00000000)
		call WriteRealMemory(pItemDropOrderTriggerFix,0x9090C83B)
	elseif GameVersion==0x27a then
		call WriteRealMemory(pDamageBlockIllusionCheck,0x90900040)
		call WriteRealMemory(pItemDropOrderTriggerFix,0x9090F03B)
	endif
	call ChangeOffsetProtection(pDamageBlockIllusionCheck,4,oldprotection)
	call ChangeOffsetProtection(pItemDropOrderTriggerFix,4,oldprotection1)
endfunction

function TestExampleDll takes nothing returns nothing
	local integer oldprotection
	// Init DotAAllstarsHelper688.dll
	call InitAllySkillViewer( )
	
	// call it only once, for restore constans after game end
	call AddNewOffsetToRestore(pUnitMaxSpeedConstant*4,Memory[pUnitMaxSpeedConstant])
	call AddNewOffsetToRestore(pUnitMinSpeedConstant*4,Memory[pUnitMinSpeedConstant])
	
	call AddNewOffsetToRestore(pDamageBlockIllusionCheck,Memory[pDamageBlockIllusionCheck/4])
	call AddNewOffsetToRestore(pItemDropOrderTriggerFix,Memory[pItemDropOrderTriggerFix/4])
	call IllusionsDamageBlockEnable()
	
	
	call AddNewOffsetToRestore(pCaptionsOverTheCreeps,Memory[(pCaptionsOverTheCreeps)/4])//captions over the mobs
	call AddNewOffsetToRestore(pBuildingMaxSpeedConstant*4,Memory[pBuildingMaxSpeedConstant])
	call AddNewOffsetToRestore(pBuildingMinSpeedConstant*4,Memory[pBuildingMinSpeedConstant])
	call AddNewOffsetToRestore(pAttackSpeedLimit*4,Memory[pAttackSpeedLimit])
	call AddNewOffsetToRestore(pAttackTimeLimit*4,Memory[pAttackTimeLimit])
//	call AddNewOffsetToRestore(pCycloneFixCondition*4,Memory[pCycloneFixCondition])
	
//	set oldprotection = ChangeOffsetProtection((pCycloneFixCondition)*4,4,0x40)
	if GameVersion == 0x26a then
		call AddNewOffsetToRestore((pCameraDefaultHeight+0)*4,Memory[(pCameraDefaultHeight+0)])
		call AddNewOffsetToRestore((pCameraDefaultHeight+1)*4,Memory[(pCameraDefaultHeight+1)])
		call AddNewOffsetToRestore((pCameraDefaultHeight+2)*4,Memory[(pCameraDefaultHeight+2)])
		call AddNewOffsetToRestore((pCameraDefaultHeight+3)*4,Memory[(pCameraDefaultHeight+3)])
		call AddNewOffsetToRestore((pCameraDefaultHeight+4)*4,Memory[(pCameraDefaultHeight+4)])
		call AddNewOffsetToRestore((pCameraDefaultHeight+5)*4,Memory[(pCameraDefaultHeight+5)])
//		set Memory[pCycloneFixCondition]=CycloneFixCondition026a
	elseif GameVersion == 0x27a then 
		call AddNewOffsetToRestore((pCameraDefaultHeight-0)*4,Memory[(pCameraDefaultHeight-0)])
		call AddNewOffsetToRestore((pCameraDefaultHeight-1)*4,Memory[(pCameraDefaultHeight-1)])
		call AddNewOffsetToRestore((pCameraDefaultHeight-2)*4,Memory[(pCameraDefaultHeight-2)])
		call AddNewOffsetToRestore((pCameraDefaultHeight-3)*4,Memory[(pCameraDefaultHeight-3)])
		call AddNewOffsetToRestore((pCameraDefaultHeight-4)*4,Memory[(pCameraDefaultHeight-4)])
		call AddNewOffsetToRestore((pCameraDefaultHeight-5)*4,Memory[(pCameraDefaultHeight-5)])
//		set Memory[pCycloneFixCondition]=CycloneFixCondition027a
	endif
//	call ChangeOffsetProtection((pCycloneFixCondition)*4,4,oldprotection)
	// restore pings
	call AddNewOffsetToRestore(pPingMinimapExOffset,Memory[pPingMinimapExOffset/4])
	call AddNewOffsetToRestore(pPingMinimapOffset,Memory[pPingMinimapOffset/4])
	// restore alliance output
	call AddNewOffsetToRestore(pAllianceOutput,Memory[pAllianceOutput/4])
	
	call AddNewOffsetToRestore(OPLimitAddress1,Memory[OPLimitAddress1/4])
	call AddNewOffsetToRestore(OPLimitAddress2,Memory[OPLimitAddress2/4])
	
	
	
endfunction

function TestReadWriteINI takes nothing returns nothing
	call WriteStringToFile(dotaconfigfle,"GLOBAL","TestKey1","HELLO WORLD!")
	call WriteStringToFile(dotaconfigfle,"GLOBAL","CamerHeight","1650")
	
	call BJDebugMsg(ReadStringFromFile(dotaconfigfle,"GLOBAL","TestKey1","glob"))
	call BJDebugMsg(ReadStringFromFile(dotaconfigfle,"GLOBAL","CamerHeight","16g0"))
endfunction

function GetUnitNextAttackTimestamp takes unit u returns real
	local integer cid=(ConvertHandle(u)+0x1E8)/4
	if cid < 0x1E8 then
		return -1.
	endif
	if Memory[cid]/4!=0 then
		set cid=Memory[cid]/4
		if Memory[cid+0x1E4/4]!=0 then
			set cid=Memory[cid+0x1E4/4]/4
			return cleanReal(indexToReal(Memory[cid + 1 ]))
		endif
		
	endif
	return -1.
endfunction

function ResetAttackCooldown takes unit u returns boolean
	local integer cid=(ConvertHandle(u)+0x1E8)/4
	local real r1
	local real r2
	if cid < 0x1E8 then
		return false
	endif
	if Memory[cid]/4!=0 then
		set cid=Memory[cid]/4
		if Memory[cid+0x1E4/4]!=0 then
			set Memory[cid+0x1E4/4]=0
			return true
		endif
	endif
	return false
endfunction

function ChangeItemId takes item it, integer targetID returns nothing
	local integer cid=ConvertHandle(it)/4
	local integer curID
	if cid == 0 then
		return
	endif
	set curID=Memory[cid+0x30/4]
	set Memory[cid+0x30/4]=targetID
endfunction

function GetUnitMSBonus takes unit u returns real
	local integer cid=ConvertHandle(u)/4
	if cid <= 0 then
		return -1000.
	endif
	if Memory[cid+0x1EC/4]!=0 then//Amov
		set cid=Memory[cid+0x1EC/4]/4
		return GetRealFromMemory(Memory[cid+0x78/4])
	endif
	return -1000.
endfunction

function GetUnitCurrentBaseMS takes unit u returns real
	local integer cid=ConvertHandle(u)/4
	if cid <= 0 then
		return 0.
	endif
	if Memory[cid+0x1EC/4]!=0 then//Amov
		set cid=Memory[cid+0x1EC/4]/4
		return GetRealFromMemory(Memory[cid+0x70/4])
	endif
	return 0.
endfunction

//to set base MS use SetUnitMovespeed

function SetUnitMSBonus takes unit u, real r returns boolean
	local integer cid=ConvertHandle(u)/4
	if cid <= 0 then
		return false
	endif
	if Memory[cid+0x1EC/4]!=0 then//Amov
		set cid=Memory[cid+0x1EC/4]/4
		set Memory[cid+0x78/4]=SetRealIntoMemory(r)
		call SetUnitMoveSpeed(u,GetRealFromMemory(Memory[cid+0x70/4]))//required to update ms instantly
		return true 
	endif
	return false
endfunction

function AddUnitMovespeedBonus takes unit u, real r returns nothing
	call SetUnitMSBonus(u,GetUnitMSBonus(u)+r)
endfunction

function RemoveAllUnitMovementDisables takes unit u returns nothing
	local integer a=GetHandleId(u)
	if a> 0 then
		set a=ConvertHandle(u)
		if a>0 then
			if Memory[a/4+0x1EC/4]>0 then
				set Memory[Memory[a/4+0x1EC/4]/4 + 0x7C/4]=0
			endif
		endif
	endif
endfunction

function IsUnitMovementDisabled takes unit u returns boolean
	local integer a=GetHandleId(u)
	if a> 0 then
		set a=ConvertHandle(u)
		if a>0 then
			if Memory[a/4+0x1EC/4]>0 then
				return Memory[Memory[a/4+0x1EC/4]/4 + 0x7C/4]<=0
			endif
		endif
	endif
	return false
endfunction

function ToggleUnitMovement takes integer a, integer d returns nothing
	if a>0 then
		if Memory[a/4+0x1EC/4]>0 then
			set Memory[Memory[a/4+0x1EC/4]/4 + 0x7C/4]=Memory[Memory[a/4+0x1EC/4]/4 + 0x7C/4]+d
		endif
	endif
endfunction

function DisableUnitMovement takes unit u returns nothing
	if u==null then
		return
	endif
	call ToggleUnitMovement(ConvertHandle(u),1)
endfunction

function EnableUnitMovement takes unit u returns nothing
	if u==null then
		return
	endif
	call ToggleUnitMovement(ConvertHandle(u),-1)
endfunction

function GetFrameItemAddress takes string name, integer id returns integer
	return CallFastCallWith2Args(pGetFrameItemAddress, GetStringAddress(name), id)
endfunction

function GetFrameSkinAddress takes string name, integer id returns integer
	return CallFastCallWith2Args(pGetFrameSkinAddress, GetStringAddress(name), id)
endfunction

function GetFrameTextAddress takes string name, integer id returns integer
	return CallFastCallWith2Args(pGetFrameTextAddress, GetStringAddress(name), id)
endfunction

function GetFrameTextAddressTEXT takes string name, integer id returns integer
	local integer FrameAddr = GetFrameTextAddress(name,id)
	if FrameAddr == 0 then 
		return 0
	endif
	return ReadRealMemory(FrameAddr+0x9C)
endfunction

function GetFrameTextString takes string name, integer id returns string
	local integer FrameAddr = GetFrameTextAddress(name,id)
	if FrameAddr == 0 then 
		return ""
	endif
	return ConvertNullTerminatedStringToString(ReadRealMemory(FrameAddr+0x9C))
endfunction

//function UpdateFrameText takes integer 

// function UpdateFrameText takes integer addr returns nothing
	// local real x1 = cleanReal(indexToReal(ReadRealMemory(addr+0x44)))
	// local real y1 = cleanReal(indexToReal(ReadRealMemory(addr+0x48)))
	// local real x2 = cleanReal(indexToReal(ReadRealMemory(addr+0x4C)))
	// local real y2 = cleanReal(indexToReal(ReadRealMemory(addr+0x50)))
	// call WriteRealMemory(pReservedMemoryForUpdateFrameText,cleanInt(realToIndex(x1)))
	// call WriteRealMemory(pReservedMemoryForUpdateFrameText+4,cleanInt(realToIndex(y1)))
	// call WriteRealMemory(pReservedMemoryForUpdateFrameText+8,cleanInt(realToIndex(x2)))
	// call WriteRealMemory(pReservedMemoryForUpdateFrameText+12,cleanInt(realToIndex(y2)))
	// call CallThisCallWith2Args(ReadRealPointer1LVL(addr,0), addr,pReservedMemoryForUpdateFrameText)
// endfunction

function SetFrameTextAddress takes integer addr, string str returns nothing
	// call UpdateFrameText(addr)
	// call WriteRealMemory(addr+0x9C,GetStringAddress(str))
	// call UpdateFrameText(addr)
	call CallThisCallWith2Args(pUpdateFrameText,addr,GetStringAddress(str))
endfunction

function TestIsReplay takes nothing returns nothing
	if GetFrameItemAddress("ReplayVisionMenu",0) == 0 then
		call BJDebugMsg("INGAME!")
	else
		call BJDebugMsg("INREPLAY!")
	endif
endfunction

function DisableSaveGameSaveButton takes nothing returns nothing
	local integer pSaveGameSaveButton = GetFrameItemAddress("SaveGameFileEditBox",0)
	if pSaveGameSaveButton > 0 then
		set Memory[pSaveGameSaveButton/4 + 0x1D4/4] = 0
		set Memory[pSaveGameSaveButton/4 + 0x108/4] = 0
		set Memory[pSaveGameSaveButton/4 + 0x1E8/4] = 0
	endif
	set pSaveGameSaveButton = GetFrameItemAddress("FileListFrame",0)
	if pSaveGameSaveButton > 0 then
		set Memory[pSaveGameSaveButton/4 + 0x10C/4] = 0x3B03123E
	endif
endfunction

function TestDisableSaveGameButton takes nothing returns nothing
	local timer t=CreateTimer()
	call TimerStart(t,2.0,false,function DisableSaveGameSaveButton)
endfunction

function GetFrameAddress takes string name, integer id returns integer
	local integer nOffset1 = Memory[(pFrameDefClass + 0x1c)/4]/4
	local integer FirstAddress = Memory[nOffset1 + 2] + 0x10
	local integer NextAddress = FirstAddress
	local string checkstr
	local boolean firstcheck = true
	
	loop 
		if NextAddress == 0 then
			return 0
		endif
		
		if NextAddress == pFrameDefClass + 8  then
			if firstcheck then
				set firstcheck = false
				set NextAddress = Memory[NextAddress/4]
			else
				return 0
			endif
		endif
		
		set checkstr = ConvertNullTerminatedStringToString(Memory[NextAddress/4+2])
		
		if checkstr == name then
			return NextAddress
		endif
		
		set NextAddress = Memory[NextAddress/4]
		
		if NextAddress == FirstAddress  or NextAddress == 0 then
			return 0
		endif
	endloop
	
	return 0
endfunction

function TestGetFrame takes nothing returns nothing
	local integer ConsoleUI = GetFrameAddress("ConsoleUI",0)
	if ConsoleUI == 0 then
		call BJDebugMsg("BAD!")
	else
		call BJDebugMsg(Int2Hex(ConsoleUI))
	endif
endfunction

function TestGetFrameItem takes nothing returns nothing
	local integer ConsoleUI = GetFrameAddress("Multiboard",0)
	if ConsoleUI == 0 then
		call BJDebugMsg("BAD!")
	else
		call BJDebugMsg(Int2Hex(ConsoleUI))
	endif
endfunction

// Don't use pReservedWritableMemory2 for pOffset
function GenerateNewPacket takes integer pOffset, integer pSize returns integer
	set Memory[pReservedWritableMemory2/4] = pPacketClass
	set Memory[pReservedWritableMemory2/4 + 1] = pOffset
	set Memory[pReservedWritableMemory2/4 + 2] = 0
	set Memory[pReservedWritableMemory2/4 + 3] = 0
	set Memory[pReservedWritableMemory2/4 + 4] = pSize
	set Memory[pReservedWritableMemory2/4 + 5] = 0xFFFFFFFF
	return pReservedWritableMemory2
endfunction

function SendGamePacket takes integer pOffset, integer pSize returns nothing
	//1st byte stands for ID, 2nd is pSize, rest is the body, w/e you want
	call CallFastCallWith2Args(pPacketSend, GenerateNewPacket(pOffset,pSize),0 )
endfunction


// Packet id : 0x01(Pause game) . Size : 1 byte
function Packet_Pause takes player p returns nothing
	if GetLocalPlayer() == p then
		set Memory[pReservedWritableMemory/4] = 0x00000001 
		call SendGamePacket(pReservedWritableMemory,1)
	endif
endfunction


// Packet id : 0x02(Resume game) . Size : 1 byte
// Can't use from jass if not after Pause
function Packet_Resume takes player p returns nothing
	if GetLocalPlayer() == p then
		set Memory[pReservedWritableMemory/4] = 0x00000002 
		call SendGamePacket(pReservedWritableMemory,1)
	endif
endfunction



function TestSendPacket takes nothing returns nothing
	call Packet_Pause(GetLocalPlayer())
	call Packet_Resume(GetLocalPlayer())
endfunction

function IsPingMinimapLocked takes nothing returns boolean
	return Memory[pPingMinimapOffset/4] == 0x90C3C08B
endfunction


function LockPingMinimap takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection( pPingMinimapOffset,4,0x40)
	
	if NotLockedPingMinimap and IsPingMinimapLocked( ) then
		call MaphackDetected( GetLocalPlayer( ), "Ping hack detected!" )
	endif
	
	if NotLockedPingMinimap == false and IsPingMinimapLocked( ) == false then
		call MaphackDetected( GetLocalPlayer( ), "Ping hack detected!#2" )
	endif
	
	if NotLockedPingMinimap then
		set PingMinimapUnlocker = Memory[pPingMinimapOffset/4]
		set NotLockedPingMinimap = false
	endif
	set Memory[pPingMinimapOffset/4] = 0x90C3C08B
	call ChangeOffsetProtection( pPingMinimapOffset,4, oldprotection)
endfunction


function UnlockPingMinimap takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection( pPingMinimapOffset,4,0x40)
	
	if NotLockedPingMinimap and IsPingMinimapLocked( ) then
		call MaphackDetected( GetLocalPlayer( ), "Ping hack detected!#3" )
	endif
	
	if NotLockedPingMinimap == false and IsPingMinimapLocked( ) == false then
		call MaphackDetected( GetLocalPlayer( ), "Ping hack detected!#4" )
	endif
	
	if NotLockedPingMinimap == false then
		set Memory[pPingMinimapOffset/4] = PingMinimapUnlocker
		set NotLockedPingMinimap = true
	endif
	call ChangeOffsetProtection( pPingMinimapOffset,4, oldprotection)
endfunction


function IsPingMinimapExLocked takes nothing returns boolean
	return Memory[pPingMinimapExOffset/4] == 0x90C3C08B
endfunction

function LockPingMinimapEx takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection( pPingMinimapExOffset,4,0x40)
	
	if NotLockedPingMinimapEx and IsPingMinimapExLocked( ) then
		call MaphackDetected( GetLocalPlayer( ), "PingEx hack detected!" )
	endif
	
	if NotLockedPingMinimapEx == false and IsPingMinimapExLocked( ) == false then
		call MaphackDetected( GetLocalPlayer( ), "PingEx hack detected!#2" )
	endif
	
	if NotLockedPingMinimapEx then
		set PingMinimapExUnlocker = Memory[pPingMinimapExOffset/4]
		set NotLockedPingMinimapEx = false
	endif
	set Memory[pPingMinimapExOffset/4] = 0x90C3C08B
	call ChangeOffsetProtection( pPingMinimapExOffset,4, oldprotection)
endfunction

function UnlockPingMinimapEx takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection( pPingMinimapExOffset,4,0x40)
	
	if NotLockedPingMinimapEx and IsPingMinimapExLocked( ) then
		call MaphackDetected( GetLocalPlayer( ), "PingEx hack detected!#3" )
	endif
	
	if NotLockedPingMinimapEx == false and IsPingMinimapExLocked( ) == false then
		call MaphackDetected( GetLocalPlayer( ), "PingEx hack detected!#4" )
	endif
	
	
	if NotLockedPingMinimapEx == false then
		set Memory[pPingMinimapExOffset/4] = PingMinimapExUnlocker
		set NotLockedPingMinimapEx = true
	endif
	call ChangeOffsetProtection( pPingMinimapExOffset,4, oldprotection)
endfunction


function nPngMinimap takes real x, real y, real d returns nothing
	call UnlockPingMinimap( )
	call PingMinimap(x,y,d)
	call LockPingMinimap( )
endfunction


function nPngMinimapEx takes real x, real y, real d, integer r, integer g, integer b, boolean e returns nothing
	call UnlockPingMinimapEx( )
	call PingMinimapEx(x,y,d,r,g,b,e)
	call LockPingMinimapEx( )
endfunction

function MinimapLockerInitialize takes nothing returns nothing
	call LockPingMinimap( )
	call LockPingMinimapEx( )
endfunction

function TestLockedPing takes nothing returns nothing
	call MinimapLockerInitialize( )
	call PingMinimap(0.,0.,3.)
endfunction

function GetAsyncKeyState takes integer vk_key_code returns integer
	local integer retval = 0
	local integer nOffset1
	
	if pGetAsyncKeyState == 0 then
		set pGetAsyncKeyState = GetModuleProcAddress("User32.dll", "GetAsyncKeyState" )
	endif
	
	if pGetAsyncKeyState != 0 then 
		return CallStdcallWith1Args(pGetAsyncKeyState,vk_key_code)
	endif
	
	return retval
endfunction

function IsKeyPressed takes integer vk_key_code returns boolean
	return  BitwiseAnd(GetAsyncKeyState(vk_key_code),0x8000) > 0
endfunction

function TestKeyPressed takes nothing returns nothing
	//https://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx
	local integer VK_LMENU = 0xA4
	if IsKeyPressed(VK_LMENU) then
		call BJDebugMsg("LEFT ALT IS PRESSED")
	else
		call BJDebugMsg("PLEASE PRESS AND HOLD ALT KEY")
	endif
endfunction

function LockAllianceOutput takes boolean block returns nothing
	local integer oldprotection = ChangeOffsetProtection( pAllianceOutput,4,0x40)
	if NotLockedAllianceOutput then
		set AllianceLocker = Memory[pAllianceOutput/4]
		set NotLockedAllianceOutput = false
	endif
	if block then
		set Memory[pAllianceOutput/4] = 0xCC0008C2
	else
		set Memory[pAllianceOutput/4] = AllianceLocker
	endif
	call ChangeOffsetProtection( pAllianceOutput,4, oldprotection)
endfunction



function EnableAllyCheckbox takes nothing returns nothing
	local integer i = 0
	local integer pAllyCheckBoxAddr
	loop
		if IsPlayerAlly(Player(0),GetLocalPlayer()) then
			set pAllyCheckBoxAddr = GetFrameItemAddress("UnitsCheckBox",i)
			if pAllyCheckBoxAddr > 0 then
				set pAllyCheckBoxAddr = pAllyCheckBoxAddr + 0x1D4
					if BitwiseAnd(Memory[pAllyCheckBoxAddr/4],1) == 0 then
						set Memory[pAllyCheckBoxAddr/4] = BitwiseOr(Memory[pAllyCheckBoxAddr/4],1)
					endif
			endif
		endif
		exitwhen i > 11
	endloop
endfunction


function EnableAllyCheckbox2 takes nothing returns nothing
	local integer i = 0
	local integer pAllyCheckBoxAddr
	loop
		set pAllyCheckBoxAddr = GetFrameItemAddress("UnitsCheckBox",i)
		if pAllyCheckBoxAddr > 0 then
			set pAllyCheckBoxAddr = pAllyCheckBoxAddr + 0x1D4
				if BitwiseAnd(Memory[pAllyCheckBoxAddr/4],1) == 0 then
					set Memory[pAllyCheckBoxAddr/4] = BitwiseOr(Memory[pAllyCheckBoxAddr/4],1)
				endif
		endif
		exitwhen i > 11
	endloop
endfunction


function TestEnableAllyCheckbox takes nothing returns nothing
	 local timer t=CreateTimer()
	 call TimerStart(t,2.0,false,function EnableAllyCheckbox)
endfunction

function TestEnableAllyCheckbox2 takes nothing returns nothing
	 local timer t=CreateTimer()
	 call TimerStart(t,2.0,false,function EnableAllyCheckbox2)
endfunction

function IsWindowActive takes nothing returns boolean
	return Memory[pWindowIsActive] > 0
endfunction

//SendActionWithoutTarget(0xd0004) - stop
function SendActionWithoutTarget takes integer orderid returns nothing
	call CallStdcallWith4Args(pSendCommandWithoutTarget,orderid,0,1,4)
endfunction

// 0 - default, 1 - path, 2 - splash, 3 - bounce, 4 - line
function GetMissilesCount takes integer missiletype returns integer
	return Memory[pMissile+3+(missiletype*6)]
endfunction

function GetFirstMissile takes integer missiletype returns integer
	return Memory[pMissile+4+(missiletype*6)]
endfunction

function GetLatestMissile takes integer missiletype returns integer
	return Memory[pMissile+5+(missiletype*6)]
endfunction

function GetMouseEnv takes nothing returns integer
	return Memory[Memory[pGameClass2]/4 + 0x3BC/4] + 0x310
endfunction

function GetMouseX takes nothing returns real
	return cleanReal(indexToReal(Memory[GetMouseEnv( )/4 + 0]))
endfunction

function GetMouseY takes nothing returns real
	return cleanReal(indexToReal(Memory[GetMouseEnv( )/4 + 1]))
endfunction

function GetMouseZ takes nothing returns real
	return cleanReal(indexToReal(Memory[GetMouseEnv( )/4 + 2]))
endfunction

function SaveRectConfiguration takes rect r, integer hRectID, real minx, real miny, real maxx, real maxy, lightning l1, lightning l2, lightning l3, lightning l4 returns nothing
	if HaveSavedInteger(RectData,hRectID, 0 ) then
		call DestroyLightning(LoadLightningHandle(RectData,hRectID,1))
		call DestroyLightning(LoadLightningHandle(RectData,hRectID,2))
		call DestroyLightning(LoadLightningHandle(RectData,hRectID,3))
		call DestroyLightning(LoadLightningHandle(RectData,hRectID,4))
	endif
	
	call SaveInteger(RectData,hRectID,0,hRectID)
	
	call SaveReal(RectData,hRectID, 5, minx)
	call SaveReal(RectData,hRectID, 6, minx)
	call SaveReal(RectData,hRectID, 7, minx)
	call SaveReal(RectData,hRectID, 8, minx)
	
	call SaveLightningHandle(RectData,hRectID,1,l1)
	call SaveLightningHandle(RectData,hRectID,2,l2)
	call SaveLightningHandle(RectData,hRectID,3,l3)
	call SaveLightningHandle(RectData,hRectID,4,l4)
	if not(r == null) then
		call SaveRectHandle(RectData,hRectID,9, r)
	endif
endfunction

function GetRectIdFromMousePosition takes real x, real y returns integer 
	local integer hRectID = 1
	local rect r = null
	loop 
		if not(HaveSavedInteger(RectData,hRectID,0)) then 
			return -1
		endif

		set r = LoadRectHandle(RectData,hRectID,9)

		if RectContainsCoords(r,x,y) then 
			return hRectID
		endif
		set hRectID = hRectID + 1
	endloop
	return -1
endfunction

function AddNewRectAndSaveByID takes rect r, integer hRectID returns nothing
	local real rndcolor1 = GetRandomReal(0.,1.)
	local real rndcolor2 = GetRandomReal(0.,1.)
	local real rndcolor3 = GetRandomReal(0.,1.)
	local real minx = GetRectMinX(r)
	local real miny = GetRectMinY(r)
	local real maxx = GetRectMaxX(r)
	local real maxy = GetRectMaxY(r)
	// Left
	local lightning hLighting1 = AddLightning("DRAM", false, minx, miny, minx, maxy)
	// TOP
	local lightning hLighting2 = AddLightning("DRAM", false, minx, miny, maxx, miny)
	// RIGHT 
	local lightning hLighting3 = AddLightning("DRAM", false, maxx, miny, maxx, maxy)
	// DOWN
	local lightning hLighting4 = AddLightning("DRAM", false, minx, maxy, maxx, maxy)
	

	call SetLightningColor(hLighting1,rndcolor1,rndcolor2,rndcolor3,1.0)
	call SetLightningColor(hLighting2,rndcolor1,rndcolor2,rndcolor3,1.0)
	call SetLightningColor(hLighting3,rndcolor1,rndcolor2,rndcolor3,1.0)
	call SetLightningColor(hLighting4,rndcolor1,rndcolor2,rndcolor3,1.0)

	call SaveRectConfiguration(r, hRectID ,minx,miny,maxx,maxy,hLighting1,hLighting2,hLighting3,hLighting4)
endfunction

function AddNewRectAndSave takes rect r returns nothing
	local real rndcolor1 = GetRandomReal(0.,1.)
	local real rndcolor2 = GetRandomReal(0.,1.)
	local real rndcolor3 = GetRandomReal(0.,1.)
	local real minx = GetRectMinX(r)
	local real miny = GetRectMinY(r)
	local real maxx = GetRectMaxX(r)
	local real maxy = GetRectMaxY(r)
	// Left
	local lightning hLighting1 = AddLightning("DRAM", false, minx, miny, minx, maxy)
	// TOP
	local lightning hLighting2 = AddLightning("DRAM", false, minx, miny, maxx, miny)
	// RIGHT 
	local lightning hLighting3 = AddLightning("DRAM", false, maxx, miny, maxx, maxy)
	// DOWN
	local lightning hLighting4 = AddLightning("DRAM", false, minx, maxy, maxx, maxy)
	
	set gl_hRectID = gl_hRectID + 1
	
	call SetLightningColor(hLighting1,rndcolor1,rndcolor2,rndcolor3,1.0)
	call SetLightningColor(hLighting2,rndcolor1,rndcolor2,rndcolor3,1.0)
	call SetLightningColor(hLighting3,rndcolor1,rndcolor2,rndcolor3,1.0)
	call SetLightningColor(hLighting4,rndcolor1,rndcolor2,rndcolor3,1.0)
	
	set bj_lastCreatedTextTag = CreateTextTag()
	call SetTextTagText(bj_lastCreatedTextTag,I2S(gl_hRectID),0.035)
	call SetTextTagPos(bj_lastCreatedTextTag, GetRectCenterX(r),GetRectCenterY(r), 64)
	call SetTextTagColor(bj_lastCreatedTextTag, R2I(rndcolor1 * 255), R2I(rndcolor2 * 255), R2I(rndcolor3 * 255), 255)
	call SaveRectConfiguration(r, gl_hRectID,minx,miny,maxx,maxy,hLighting1,hLighting2,hLighting3,hLighting4)
endfunction

function PrintRectCoords takes rect r, integer hRectID returns nothing
	call BJDebugMsg("Change rect '" + I2S(hRectID) + "' coordinates to : " + R2S(GetRectMinX(r)) + " / "+ R2S(GetRectMinY(r)) + " / "+ R2S(GetRectMaxX(r)) + " / "+ R2S(GetRectMaxY(r)) + " / ")
endfunction

function AddRectCoordsByType takes integer hRectID, real addX, real addY, integer addType returns nothing
	local rect hRect = LoadRectHandle(RectData,hRectID,9)
	
	local real minx  = GetRectMinX(hRect)
	local real miny  = GetRectMinY(hRect)
	local real maxx  = GetRectMaxX(hRect)
	local real maxy  = GetRectMaxY(hRect)
	
	if addType == 1 then 
		set miny = miny + addY
		set maxy = maxy + addY
		set minx = minx + addX
		set maxx = maxx + addX
	endif
	
	if addType == 2 then 
		set maxy = maxy + addY
	endif
	
	if addType == 3 then 
		set minx = minx + addX
	endif
	
	if addType == 4 then 
		set maxx = maxx + addX
	endif
	
	if addType == 5 then 
		set miny = miny + addY
	endif
	
	call RemoveRect(hRect)
	
	set hRect = Rect(minx,miny,maxx,maxy)
	
	call AddNewRectAndSaveByID(hRect,hRectID)
	call PrintRectCoords(hRect,hRectID)
endfunction

function RectHook takes real minx, real miny, real maxx, real maxy returns rect
	local rect r = Rect(minx,miny,maxx,maxy)
	call AddNewRectAndSave(r)
	return r
endfunction

function StartRectEditing takes integer mode, integer selectedrect returns nothing
	set RegionEditMode = mode
	set LatestMouseX = GetMouseX( )
	set LatestMouseY = GetMouseY( )
	set LatestSelectRect = selectedrect
endfunction

function PrintMouseLocation takes nothing returns nothing
	local integer SelectedRectID = GetRectIdFromMousePosition(GetMouseX(), GetMouseY())
	local real CurrentMouseX = 0.
	local real CurrentMouseY = 0.
	local real AddX			=  0.
	local real AddY			=  0.
	
	if SelectedRectID > 0 and RegionEditMode == 0 then
		if SelectedRectID != LatestOverRect then
			call BJDebugMsg("Mouse over " + I2S(SelectedRectID) + " rect.")
		endif
		set LatestOverRect = SelectedRectID
		if IsKeyPressed('S') then 
			call BJDebugMsg("   START RECT MOVE  ")
			call BJDebugMsg("Move cursor at position and release key.")
			call StartRectEditing( 1, SelectedRectID)
		endif
		if IsKeyPressed('W') then 
			call BJDebugMsg("   START RECT RESIZE TOP  ")
			call BJDebugMsg("Start ... Move cursor at position and release key.")
			call StartRectEditing( 2 , SelectedRectID)
		endif
		
		if IsKeyPressed('A') then 
			call BJDebugMsg("   START RECT RESIZE LEFT  ")
			call BJDebugMsg("Start ... Move cursor at position and release key.")
			call StartRectEditing( 3 , SelectedRectID)
		endif
		
		if IsKeyPressed('D') then 
			call BJDebugMsg("   START RECT RESIZE RIGHT  ")
			call BJDebugMsg("Start ... Move cursor at position and release key.")
			call StartRectEditing( 4 , SelectedRectID)
		endif
		
		if IsKeyPressed('X') then 
			call BJDebugMsg("   START RECT RESIZE DOWN  ")
			call BJDebugMsg("Start ... Move cursor at position and release key.")
			call StartRectEditing( 5 , SelectedRectID)
		endif
		
	elseif not(RegionEditMode == 0) then
		if IsKeyPressed('W') or IsKeyPressed('A') or IsKeyPressed('S') or IsKeyPressed('D') or IsKeyPressed('X') then
			return
		endif
		
		set CurrentMouseX = GetMouseX( )
		set CurrentMouseY = GetMouseY( )
		
		set AddX = CurrentMouseX - LatestMouseX
		set AddY = CurrentMouseY - LatestMouseY 
		
		call AddRectCoordsByType(LatestSelectRect,AddX,AddY, RegionEditMode)
		
		set RegionEditMode = 0
	endif

endfunction

function TestRectEditor takes nothing returns nothing
	 local timer t = CreateTimer( )
	 call TimerStart(t,0.2,true,function PrintMouseLocation)
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 call RectHook(GetRandomReal(-500,500),GetRandomReal(-500,500),GetRandomReal(-1000,1000),GetRandomReal(-1000,1000))
	 
endfunction


function TestPlayerMute takes boolean pMute, player p, string playername returns nothing
	if pMute then 
		call MutePlayer( playername )
	else 
		call UnMutePlayer( playername )
	endif
endfunction

function ReadEAX takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C08B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits) 
	return retval
endfunction

function ReadEBX takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C38B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return retval
endfunction

function ReadECX takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C18B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return retval
endfunction

function ReadEDX takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C28B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset, pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return retval
endfunction

function ReadESI takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C68B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return retval
endfunction

function ReadEDI takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C78B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return retval
endfunction

function ReadEBP takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C58B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return retval
endfunction

function ReadESP takes nothing returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C48B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset, pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,  pIgnoredUnits)
	return retval
endfunction


function ReadEAX_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C08B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadEBX_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C38B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadECX_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C18B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadEDX_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C28B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset, pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadESI_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C68B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset, pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadEDI_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C78B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset, pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset, pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadEBP_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C58B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset,pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction

function ReadESP_offset takes integer offset returns integer
	local integer retval = 0
	set Memory[pReservedExecutableMemory/4] = 0xCCC3C48B
	
	if pIgnoredUnitsOffset == 0 then 
		set pIgnoredUnitsOffset = CreateJassNativeHook(pIgnoredUnits, pReservedExecutableMemory )
	else
		call WriteRealMemory(pIgnoredUnitsOffset, pReservedExecutableMemory)
	endif
	
	set retval = IgnoredUnits(0)
	call WriteRealMemory(pIgnoredUnitsOffset,pIgnoredUnits )
	return Memory[(retval+offset)/4]
endfunction


// WARNING!! IT CAN BE USED ONLY IN FIRST CONDITION AT FIRST POSITION
function GJ_GetRealDmg126a takes nothing returns real
	return cleanReal(indexToReal(ReadEBP_offset(0x380)))
endfunction

// WARNING!! IT CAN BE USED ONLY IN FIRST CONDITION AT FIRST POSITION
function GJ_GetRealDmg127a takes nothing returns real
	return cleanReal(indexToReal(ReadEBP_offset(0x400)))
endfunction

function GJ_SaveLastDmg126a takes nothing returns boolean
	if GetTriggerEventId()!=EVENT_UNIT_DAMAGED then
		return true
	endif
	
	set GJ_LastDmg = GJ_GetRealDmg126a( )
	
	set GJ_LastAttackType=ReadEBP_offset(0x37C)
	if ReadEBP_offset(0x368)!=0 or ReadEBP_offset(0x378)==0x3F800000 then
		set GJ_LastDamageType=0
	else
		set GJ_LastDamageType=ReadEBP_offset(0x378)
	endif
//	call BJDebugMsg("rewrote with "+R2S(GJ_LastDmg))
	return true
endfunction

function GJ_SaveLastDmg127a takes nothing returns boolean
	if GetTriggerEventId()!=EVENT_UNIT_DAMAGED then
		return true
	endif
	set GJ_LastDmg = GJ_GetRealDmg127a( )
	set GJ_LastAttackType=ReadEBP_offset(0x3B0)
	if ReadEBP_offset(0x3CC)!=0 then
		set GJ_LastDamageType=0
	else
		set GJ_LastDamageType=ReadEBP_offset(0x3F0)
	endif
	return true
endfunction

	//integer pGetLatestDownloadedString = 0
	// integer pGetDownloadStatus = 0
	// integer pSaveNewMapFromUrl = 0
function GetLatestDownloadedString takes nothing returns string
	local integer retval = 0

	if pGetLatestDownloadedString == 0 then 
		set pGetLatestDownloadedString = GetModuleProcAddress(EXTRADLLNAME, "GetLatestDownloadedString")
	endif
	if pGetLatestDownloadedString != 0 then 	
		return ConvertNullTerminatedStringToString(CallStdcallWith1Args(pGetLatestDownloadedString,0))
	endif
	return ""
endfunction

	// integer pSaveNewMapFromUrl = 0
function GetCurrentMapDir takes nothing returns string
	local integer retval = 0

	if pGetCurrentMapDir == 0 then 
		set pGetCurrentMapDir = GetModuleProcAddress(EXTRADLLNAME, "GetCurrentMapPath")
	endif
	if pGetCurrentMapDir != 0 then 
		return ConvertNullTerminatedStringToString(CallStdcallWith1Args(pGetCurrentMapDir,0))
	endif
	return ""
endfunction


function GetDownloadProgress takes nothing returns integer
	local integer retval = 0

	if pGetDownloadProgress == 0 then 
		set pGetDownloadProgress = GetModuleProcAddress(EXTRADLLNAME, "GetDownloadProgress")
	endif
	if pGetDownloadProgress != 0 then 
		set retval = CallStdcallWith1Args(pGetDownloadProgress,0)
	endif
	return retval
endfunction

function GetDownloadStatus takes nothing returns integer
	local integer retval = 0
	// -1 - error
	// 0 - nothing been dl'd
	// 1 - dl finished
	// 2 - file exists or broken path
	
	if pGetDownloadStatus == 0 then 
		set pGetDownloadStatus = GetModuleProcAddress(EXTRADLLNAME, "GetDownloadStatus")
	endif
	if pGetDownloadStatus != 0 then 
		set retval = CallStdcallWith1Args(pGetDownloadStatus,0)
	endif
	return retval
endfunction

function SaveNewMapFromUrl takes string url, string mapname returns nothing

	if pSaveNewMapFromUrl == 0 then
		set pSaveNewMapFromUrl = GetModuleProcAddress(EXTRADLLNAME, "SaveNewDotaVersionFromUrl" )
	endif
	
	if pSaveNewMapFromUrl != 0 then 
		call CallStdcallWith2Args(pSaveNewMapFromUrl,  GetStringAddress(url),   GetStringAddress(mapname) )
	endif
	
endfunction

function SendGetRequest takes integer WebSiteAddr, integer GetPath returns nothing
	if pSendHttpGetRequest == 0 then
		set pSendHttpGetRequest = GetModuleProcAddress(EXTRADLLNAME, "SendGetRequest" )
	endif
	if pSendHttpGetRequest != 0 then 
		call CallStdcallWith2Args(pSendHttpGetRequest,  WebSiteAddr,  GetPath )
	endif
endfunction

function SendHttpGetRequest takes string WebSiteAddr, string GetPath returns nothing
	call SendGetRequest( GetStringAddress(WebSiteAddr), GetStringAddress(GetPath))
endfunction

function TestSendHttpGetRequest takes nothing returns nothing
	call SendHttpGetRequest("d1stats.ru","/test.php?q1=1234&q2=21234&q3=31234&q4=41234&q5=51234&q6=61234&q7=71234&q8=81234&q9=91234&q10=101234")
endfunction

function StartDownloadNewDotaVersion takes nothing returns nothing
	local timer t=GetExpiredTimer()
	local integer i = GetDownloadStatus( )
	if i != 0 then 
		if i == 1 then 
			call BJDebugMsg( " ALL OKAY , DOTA DOWNLOADED " )
		else 
			call BJDebugMsg( " ALL BAD , DOTA NE DOWNLOADED ")
		endif
		call DestroyTimer(t)
		set t = null
	else 
		call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,1.0, "DownloadProgress:" + I2S( GetDownloadProgress( ) ) + "%..")
	endif
endfunction

function WaitForGetDotaVersion takes nothing returns nothing
	local timer t=GetExpiredTimer()
	local integer i = GetDownloadStatus( )
	local string s = ""
	if i != 0 then 
		if i == 1 then 
			set s = GetLatestDownloadedString( )
			call BJDebugMsg("Status: ok,map name:" + s)
			call SaveNewMapFromUrl("http://d1stats.ru/files/Allstars/" + s + ".w3x",GetCurrentMapDir( ) + s + ".w3x")
			call BJDebugMsg("url: http://d1stats.ru/files/Allstars/" + s + ".w3x, filename:" + s + ".w3x")
			call TimerStart(CreateTimer( ),1.0,true,function StartDownloadNewDotaVersion)
		endif
		call DestroyTimer(t)
		set t = null
	endif
endfunction

function WaitForDownloadServerStatus takes nothing returns nothing
	local timer t=GetExpiredTimer()
	local integer i = GetDownloadStatus( )
	if i != 0 then 
		if i == 1 then 
			call BJDebugMsg("Status: ok, now get map name...")
			call SendHttpGetRequest("d1stats.ru","/last.php")
			call TimerStart(CreateTimer( ),0.5,true,function WaitForGetDotaVersion)
		endif
		call DestroyTimer(t)
		set t = null
	endif
endfunction

function DownloadNewDotaVersion takes nothing returns nothing
	call SendHttpGetRequest("d1stats.ru","/last.php")
	call TimerStart(CreateTimer( ),0.2,true,function WaitForDownloadServerStatus)
endfunction



function LockOrder takes integer id, boolean IsNeedLock returns nothing

	local integer oldprotection = 0

	if id == 1 then 
		if IsNeedLock then 
			if IsOrder1Locked == false then 
				if Order1_unlockedvalue == 0 then 
					set Order1_unlockedvalue = Memory[pOrder1_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder1_offset,4,0x40)
				set Memory[pOrder1_offset/4] = Order1_lockedvalue
				call ChangeOffsetProtection(pOrder1_offset,4,oldprotection)
				set IsOrder1Locked = true
			endif
		else 
			if IsOrder1Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder1_offset,4,0x40)
				set Memory[pOrder1_offset/4] = Order1_unlockedvalue
				call ChangeOffsetProtection(pOrder1_offset,4,oldprotection)
				set IsOrder1Locked = false
			endif
		endif
	elseif id == 2 then 
		if IsNeedLock then 
			if IsOrder2Locked == false then 
				if Order2_unlockedvalue == 0 then 
					set Order2_unlockedvalue = Memory[pOrder2_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder2_offset,4,0x40)
				set Memory[pOrder2_offset/4] = Order2_lockedvalue
				call ChangeOffsetProtection(pOrder2_offset,4,oldprotection)
				set IsOrder2Locked = true
			endif
		else 
			if IsOrder2Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder2_offset,4,0x40)
				set Memory[pOrder2_offset/4] = Order2_unlockedvalue
				call ChangeOffsetProtection(pOrder2_offset,4,oldprotection)
				set IsOrder2Locked = false
			endif
		endif
	elseif id == 3 then 
		if IsNeedLock then 
			if IsOrder3Locked == false then 
				if Order3_unlockedvalue == 0 then 
					set Order3_unlockedvalue = Memory[pOrder3_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder3_offset,4,0x40)
				set Memory[pOrder3_offset/4] = Order3_lockedvalue
				call ChangeOffsetProtection(pOrder3_offset,4,oldprotection)
				set IsOrder3Locked = true
			endif
		else 
			if IsOrder3Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder3_offset,4,0x40)
				set Memory[pOrder3_offset/4] = Order3_unlockedvalue
				call ChangeOffsetProtection(pOrder3_offset,4,oldprotection)
				set IsOrder3Locked = false
			endif
		endif
	elseif id == 4 then 
		if IsNeedLock then 
			if IsOrder4Locked == false then 
				if Order4_unlockedvalue == 0 then 
					set Order4_unlockedvalue = Memory[pOrder4_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder4_offset,4,0x40)
				set Memory[pOrder4_offset/4] = Order4_lockedvalue
				call ChangeOffsetProtection(pOrder4_offset,4,oldprotection)
				set IsOrder4Locked = true
			endif
		else 
			if IsOrder4Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder4_offset,4,0x40)
				set Memory[pOrder4_offset/4] = Order4_unlockedvalue
				call ChangeOffsetProtection(pOrder4_offset,4,oldprotection)
				set IsOrder4Locked = false
			endif
		endif
	elseif id == 5 then 
		if IsNeedLock then 
			if IsOrder5Locked == false then 
				if Order5_unlockedvalue == 0 then 
					set Order5_unlockedvalue = Memory[pOrder5_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder5_offset,4,0x40)
				set Memory[pOrder5_offset/4] = Order5_lockedvalue
				call ChangeOffsetProtection(pOrder5_offset,4,oldprotection)
				set IsOrder5Locked = true
			endif
		else 
			if IsOrder5Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder5_offset,4,0x40)
				set Memory[pOrder5_offset/4] = Order5_unlockedvalue
				call ChangeOffsetProtection(pOrder5_offset,4,oldprotection)
				set IsOrder5Locked = false
			endif
		endif
	elseif id == 6 then 
		if IsNeedLock then 
			if IsOrder6Locked == false then 
				if Order6_unlockedvalue == 0 then 
					set Order6_unlockedvalue = Memory[pOrder6_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder6_offset,4,0x40)
				set Memory[pOrder6_offset/4] = Order6_lockedvalue
				call ChangeOffsetProtection(pOrder6_offset,4,oldprotection)
				set IsOrder6Locked = true
			endif
		else 
			if IsOrder6Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder6_offset,4,0x40)
				set Memory[pOrder6_offset/4] = Order6_unlockedvalue
				call ChangeOffsetProtection(pOrder6_offset,4,oldprotection)
				set IsOrder6Locked = false
			endif
		endif
	elseif id == 7 then 
		if IsNeedLock then 
			if IsOrder7Locked == false then 
				if Order7_unlockedvalue == 0 then 
					set Order7_unlockedvalue = Memory[pOrder7_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder7_offset,4,0x40)
				set Memory[pOrder7_offset/4] = Order7_lockedvalue
				call ChangeOffsetProtection(pOrder7_offset,4,oldprotection)
				set IsOrder7Locked = true
			endif
		else 
			if IsOrder7Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder7_offset,4,0x40)
				set Memory[pOrder7_offset/4] = Order7_unlockedvalue
				call ChangeOffsetProtection(pOrder7_offset,4,oldprotection)
				set IsOrder7Locked = false
			endif
		endif
	elseif id == 8 then 
		if IsNeedLock then 
			if IsOrder8Locked == false then 
				if Order8_unlockedvalue == 0 then 
					set Order8_unlockedvalue = Memory[pOrder8_offset/4]
				endif
				set oldprotection = ChangeOffsetProtection(pOrder8_offset,4,0x40)
				set Memory[pOrder8_offset/4] = Order8_lockedvalue
				call ChangeOffsetProtection(pOrder8_offset,4,oldprotection)
				set IsOrder8Locked = true
			endif
		else 
			if IsOrder8Locked == true then 
				set oldprotection = ChangeOffsetProtection(pOrder8_offset,4,0x40)
				set Memory[pOrder8_offset/4] = Order8_unlockedvalue
				call ChangeOffsetProtection(pOrder8_offset,4,oldprotection)
				set IsOrder8Locked = false
			endif
		endif
	endif
endfunction


function LockOrder1 takes nothing returns nothing
	call LockOrder(1,true)
endfunction
function LockOrder2 takes nothing returns nothing
	call LockOrder(2,true)
endfunction
function LockOrder3 takes nothing returns nothing
	call LockOrder(3,true)
endfunction
function LockOrder4 takes nothing returns nothing
	call LockOrder(4,true)
endfunction
function LockOrder5 takes nothing returns nothing
	call LockOrder(5,true)
endfunction
function LockOrder6 takes nothing returns nothing
	call LockOrder(6,true)
endfunction
function LockOrder7 takes nothing returns nothing
	call LockOrder(7,true)
endfunction
function LockOrder8 takes nothing returns nothing
	call LockOrder(8,true)
endfunction

function UnLockOrder1 takes nothing returns nothing
	call LockOrder(1,false)
endfunction
function UnLockOrder2 takes nothing returns nothing
	call LockOrder(2,false)
endfunction
function UnLockOrder3 takes nothing returns nothing
	call LockOrder(3,false)
endfunction
function UnLockOrder4 takes nothing returns nothing
	call LockOrder(4,false)
endfunction
function UnLockOrder5 takes nothing returns nothing
	call LockOrder(5,false)
endfunction
function UnLockOrder6 takes nothing returns nothing
	call LockOrder(6,false)
endfunction
function UnLockOrder7 takes nothing returns nothing
	call LockOrder(7,false)
endfunction
function UnLockOrder8 takes nothing returns nothing
	call LockOrder(8,false)
endfunction



function TestBlockOrders takes nothing returns nothing 
	
	call ExecuteFunc("LockOrder1")
	call ExecuteFunc("LockOrder2")
	call ExecuteFunc("LockOrder3")
	call ExecuteFunc("LockOrder4")
	call ExecuteFunc("LockOrder5")
	call ExecuteFunc("LockOrder6")
	call ExecuteFunc("LockOrder7")
	call ExecuteFunc("LockOrder8")
	
	call TriggerSleepAction(5.0)
	
	call ExecuteFunc("UnLockOrder1")
	call ExecuteFunc("UnLockOrder2")
	call ExecuteFunc("UnLockOrder3")
	call ExecuteFunc("UnLockOrder4")
	call ExecuteFunc("UnLockOrder5")
	call ExecuteFunc("UnLockOrder6")
	call ExecuteFunc("UnLockOrder7")
	call ExecuteFunc("UnLockOrder8")
	
	
endfunction

function StartAbilityCD takes integer pAbility, real cd returns nothing
	set Memory[pReserverdIntArg1/4] = cleanInt(realToIndex(cd))
	call CallThisCallWith2Args(pStartAbilityCD,pAbility, pReserverdIntArg1)
endfunction


function SetHPCustomHPBarUnit takes integer PlayerID, integer UnitID, integer Color, real ScaleX, real ScaleY returns nothing
	if pSetHPCustomHPBarUnit == 0 then 
		set pSetHPCustomHPBarUnit = GetModuleProcAddress(EXTRADLLNAME, "SetHPCustomHPBarUnit" )
	endif 
	
	if pSetHPCustomHPBarUnit != 0 then 
		call CallStdcallWith5Args(pSetHPCustomHPBarUnit,PlayerID , UnitID, Color, realToIndex(cleanReal(ScaleX)), realToIndex(cleanReal(ScaleY)))
	endif

endfunction

function SetHPBarColorForPlayer takes   integer PlayerID, integer HeroColor, integer UnitColor, integer TowerColor returns nothing
	
	if pSetHPBarColorForPlayer == 0 then
		set pSetHPBarColorForPlayer = GetModuleProcAddress(EXTRADLLNAME, "SetHPBarColorForPlayer" )
	endif
	if pSetHPBarColorForPlayer != 0 then 
		call CallStdcallWith4Args(pSetHPBarColorForPlayer, PlayerID,HeroColor,UnitColor,TowerColor)
	endif
endfunction

	
function SetMPBarXScaleForPlayer takes   integer PlayerID, real HeroXscale, real UnitXscale, real TowerXscale returns nothing
	
	if pSetMPBarXScaleForPlayer == 0 then
		set pSetMPBarXScaleForPlayer = GetModuleProcAddress(EXTRADLLNAME, "SetMPBarXScaleForPlayer" )
	endif
	if pSetMPBarXScaleForPlayer != 0 then 
		call CallStdcallWith4Args(pSetMPBarXScaleForPlayer, PlayerID, realToIndex(cleanReal(HeroXscale)),realToIndex(cleanReal(UnitXscale)),realToIndex(cleanReal(TowerXscale)))
	endif
endfunction


function SetMPBarYScaleForPlayer takes  integer PlayerID, real HeroYscale, real UnitYscale, real TowerYscale returns nothing
	
	if pSetMPBarYScaleForPlayer == 0 then
		set pSetMPBarYScaleForPlayer = GetModuleProcAddress(EXTRADLLNAME, "SetMPBarYScaleForPlayer" )
	endif
	if pSetMPBarYScaleForPlayer != 0 then 
		call CallStdcallWith4Args(pSetMPBarYScaleForPlayer, PlayerID, realToIndex(cleanReal(HeroYscale)),realToIndex(cleanReal(UnitYscale)),realToIndex(cleanReal(TowerYscale)))
	endif
endfunction

function SetMPBarYOffsetForPlayer takes  integer PlayerID, real HeroYscale, real UnitYscale, real TowerYscale returns nothing
	
	if pSetMPBarYOffsetForPlayer == 0 then
		set pSetMPBarYOffsetForPlayer = GetModuleProcAddress(EXTRADLLNAME, "SetMPBarYOffsetForPlayer" )
	endif
	if pSetMPBarYOffsetForPlayer != 0 then 
		call CallStdcallWith4Args(pSetMPBarYOffsetForPlayer, PlayerID, realToIndex(cleanReal(HeroYscale)),realToIndex(cleanReal(UnitYscale)),realToIndex(cleanReal(TowerYscale)))
	endif
endfunction


function SetHPBarXScaleForPlayer takes   integer PlayerID, real HeroXscale, real UnitXscale, real TowerXscale returns nothing
	
	if pSetHPBarXScaleForPlayer == 0 then
		set pSetHPBarXScaleForPlayer = GetModuleProcAddress(EXTRADLLNAME, "SetHPBarXScaleForPlayer" )
	endif
	if pSetHPBarXScaleForPlayer != 0 then 
		call CallStdcallWith4Args(pSetHPBarXScaleForPlayer, PlayerID, realToIndex(cleanReal(HeroXscale)),realToIndex(cleanReal(UnitXscale)),realToIndex(cleanReal(TowerXscale)))
	endif
endfunction


function SetHPBarYScaleForPlayer takes  integer PlayerID, real HeroYscale, real UnitYscale, real TowerYscale returns nothing
	
	if pSetHPBarYScaleForPlayer == 0 then
		set pSetHPBarYScaleForPlayer = GetModuleProcAddress(EXTRADLLNAME, "SetHPBarYScaleForPlayer" )
	endif
	if pSetHPBarYScaleForPlayer != 0 then 
		call CallStdcallWith4Args(pSetHPBarYScaleForPlayer, PlayerID, realToIndex(cleanReal(HeroYscale)),realToIndex(cleanReal(UnitYscale)),realToIndex(cleanReal(TowerYscale)))
	endif
endfunction




function UnitCanUseInventoryModify takes unit u, integer mod returns nothing
	local integer h=ConvertHandle(u)
	local integer a=Memory[(h+0x1F8)/4]
	if a>0 then
		set a=a/4+0x3C/4
		set Memory[a]=Memory[a]+mod
	endif
endfunction

function GetUnitAttackDamage takes unit u returns real
	local integer k=GetUnitDamageDicesCount(u)
	local integer spread=GetRandomInt(k,k*GetUnitDamageDicesSideCount(u))
	return I2R(GetUnitBaseDamage(u)+GetUnitGreenBonusDamage(u)+spread)
endfunction

function SetUnitCurrentMSper32 takes integer convertedHandle, real r returns nothing
	local integer a=GetUnitAddressFloatsRelated(convertedHandle,0xA0)
	local integer b=Memory[a/4+0x28/4]
	if b>0 then
		set Memory[b/4+0x64/4]=SetRealIntoMemory(GetRealFromMemory(Memory[b/4+0x64/4])+r)
	endif
endfunction

function SetUnitCurrentMSper32Address takes integer convertedHandle, integer address, real r returns nothing
	set Memory[address/4]=SetRealIntoMemory(GetRealFromMemory(Memory[address/4])+r)
endfunction

function GetUnitCurrentMSper32Address takes integer convertedHandle returns integer
	local integer a=GetUnitAddressFloatsRelated(convertedHandle,0xA0)
	local integer b=Memory[a/4+0x28/4]
	if b>0 then
		return b+0x64
	endif
	return 0
endfunction

function GetUnitCurrentMSper32 takes integer convertedHandle returns real
	local integer a=GetUnitAddressFloatsRelated(convertedHandle,0xA0)
	local integer b=Memory[a/4+0x28/4]
//	call echo(Int2Hex(a))
	if b>0 then
		return GetRealFromMemory(Memory[b/4+0x64/4])
	endif
	return 0.
endfunction

//only used for Dagger, shouldn't be used for anything else without testing
function GetSpellTargetYReal takes nothing returns real
	if GameVersion==0x26a then
		return cleanReal(indexToReal(ReadEBP_offset(0x76c)))
	elseif GameVersion==0x27a then
		return cleanReal(indexToReal(ReadEBP_offset(0x800)))
	endif
	return 0.
endfunction

function GetSpellTargetXReal takes nothing returns real
	if GameVersion==0x26a then
		return cleanReal(indexToReal(ReadEBP_offset(0x770)))
	elseif GameVersion==0x27a then
		return cleanReal(indexToReal(ReadEBP_offset(0x7FC)))
	endif
	return 0.
endfunction


function GetUnitIllusionModifier takes unit u, integer modifiertype returns real
	local integer cid=ConvertHandle(u)
	local integer buffid
	if cid < 1 then
		return 1.
	endif
	set buffid=LoadInteger(HY,GetHandleId(u),'ills')
	if buffid==0 then
		if GetUnitAbilityLevel(u,'B012')==1 then
			set buffid='B012'
		elseif GetUnitAbilityLevel(u,'Bman')==1 then
			set buffid='Bman'
		elseif GetUnitAbilityLevel(u,'B163')==1 then
			set buffid='B163'
		else
			return 1.
		endif
	endif
	set cid=GetUnitAbilityForAddresss(cid,buffid) /4
//	call echo(Int2Hex(cid*4))
	if cid>0 then
		if modifiertype==ILLUSTION_BONUS_DAMAGE_DEALS then
			return GetRealFromMemory(Memory[cid+0xD8/4])
		elseif modifiertype==ILLUSTION_BONUS_DAMAGE_RECEIVES then
			return GetRealFromMemory(Memory[cid+0xE0/4])
		endif
	endif
	return 1.
endfunction

function ModifyUnitsPassiveDisabledCounter takes unit u, integer mod returns nothing
	local integer cid=ConvertHandle(u)
	if cid<=0 then
		return
	endif
	set cid=(cid+0x1B8)/4
	if mod>0 or Memory[cid] <= mod then
		set Memory[cid]=Memory[cid]+mod
//		call echo(I2S(Memory[cid]))
	endif
endfunction






function NullifyCurrentAttack takes unit u returns string
	local integer cid=(ConvertHandle(u)+0x1E8)/4
	if cid < 0x1E8 then
		return "cannot attack"
	endif
	if Memory[cid]/4!=0 then
		set cid=Memory[cid]/4
		if Memory[cid+0x1F4/4]!=0 then
			set Memory[cid+0x1F4/4]=0
			return "nulled"
		else
			return "already empty"
		endif
	endif
	return "no attack has been found"
endfunction

function AddExtraAttack takes unit u returns boolean
	local integer cid=(ConvertHandle(u)+0x1E8)/4
	local real attackdelay
	if cid < 0x1E8 then
		return false
	endif
	if Memory[cid]/4!=0 then
		set cid=Memory[cid]/4
		if Memory[cid+0x1E4/4]!=0 then
			set cid=Memory[cid+0x1E4/4]/4
			set attackdelay=cleanReal(indexToReal(Memory[cid + 2]))
			if attackdelay > 0 then
				set Memory[cid + 1] = cleanInt(realToIndex(GetUnitNextAttackTimestamp(u)-attackdelay))
				return true
			endif
		endif
	endif
	return false
endfunction




function SetAbilityHotkeyParam takes integer id, integer off, integer newVal returns boolean
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k < off then
		return false
	endif
	if Memory[k]>0 then
		set Memory[Memory[k]/4]=newVal
		return true
	endif
	return false
endfunction

function GetAbilityHotkeyParam takes integer id, integer off returns integer
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k < off then
		return 0
	endif
	if Memory[k]>0 then
		return Memory[Memory[k]/4]
	endif
	return 0
endfunction

function SetAbilityIntegerParam takes integer id, integer off, integer newVal returns boolean
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k < off then
		return false
	endif
	set Memory[k]=newVal
	return true
endfunction

function GetAbilityIntegerParam takes integer id, integer off returns integer
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	
	if k > off then
		return Memory[k]
	endif
	return 0
endfunction

function SetAbilityRealParam takes integer id, integer off, real newVal returns boolean
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k < off then
		return false
	endif
	set Memory[k]=cleanInt(realToIndex(newVal))
	return true
endfunction

function GetAbilityRealParam takes integer id, integer off returns real
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k > off then
		return cleanReal(indexToReal(Memory[k]))
	endif
	return 0.
endfunction

function SetAbilityBoolParam takes integer id, integer off, boolean newVal returns boolean
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k < off then
		return false
	endif
	if newVal then
		set Memory[k]=1
	else
		set Memory[k]=0
	endif
	return true
endfunction

function GetAbilityBoolParam takes integer id, integer off returns boolean
	local integer k=(GetAbilityUIDefAddr(id)+off)/4
	if k > off then
		return Memory[k] > 0
	endif
	return false
endfunction



function SetAbilityResearchHotkeyId takes integer id, integer newVal returns boolean
	return SetAbilityHotkeyParam(id,0x98, newVal)
endfunction

function SetAbilityUnHotkeyId takes integer id, integer newVal returns boolean
	return SetAbilityHotkeyParam(id,0x8C, newVal)
endfunction

function SetAbilityHotkeyId takes integer id, integer newVal returns boolean
	return SetAbilityHotkeyParam(id,0x80, newVal)
endfunction

function SetAbilityHotkeyCommon takes integer id, integer newVal returns boolean
	call SetAbilityHotkeyId(id,newVal)
	call SetAbilityUnHotkeyId(id,newVal)
	return SetAbilityResearchHotkeyId(id,newVal)
endfunction

function SetAbilitySpellDetails takes integer id, integer det returns boolean
	return SetAbilityIntegerParam(id,0x70, det)
endfunction

function SetAbilityMissileSpeed takes integer id, real speed returns boolean
	return SetAbilityRealParam(id,0x64, speed)
endfunction

function SetAbilityResearchButtonY takes integer id, integer newY returns boolean
	return SetAbilityIntegerParam(id,0x60, newY)
endfunction

function SetAbilityResearchButtonX takes integer id, integer newX returns boolean
	return SetAbilityIntegerParam(id,0x5C, newX)
endfunction

function SetAbilityUnButtonY takes integer id, integer newY returns boolean
	return SetAbilityIntegerParam(id,0x58, newY)
endfunction

function SetAbilityUnButtonX takes integer id, integer newX returns boolean
	return SetAbilityIntegerParam(id,0x54, newX)
endfunction

function SetAbilityButtonY takes integer id, integer newY returns boolean
	return SetAbilityIntegerParam(id,0x50, newY)
endfunction

function SetAbilityButtonX takes integer id, integer newX returns boolean
	return SetAbilityIntegerParam(id,0x4C, newX)
endfunction

function SetAbilityMissileHoming takes integer id, boolean homing returns boolean
	return SetAbilityBoolParam(id,0x6C,homing)
endfunction

function SetAbilityMissileArc takes integer id, real arc returns boolean
	return SetAbilityRealParam(id,0x68, arc)
endfunction


function GetAbilityMissileSpeed takes integer id returns real
	return GetAbilityRealParam(id,0x64)
endfunction

function GetAbilityMissileArc takes integer id returns real
	return GetAbilityRealParam(id,0x68)
endfunction

function GetAbilityResearchHotkeyId takes integer id returns integer
	return GetAbilityHotkeyParam(id,0x98)
endfunction

function GetAbilityUnHotkeyId takes integer id returns integer
	return GetAbilityHotkeyParam(id,0x8C)
endfunction

function GetAbilityHotkeyId takes integer id returns integer
	return GetAbilityHotkeyParam(id,0x80)
endfunction

function GetAbilitySpellDetails takes integer id returns integer
	return GetAbilityIntegerParam(id,0x70)
endfunction

function GetAbilityResearchButtonY takes integer id returns integer
	return GetAbilityIntegerParam(id,0x60)
endfunction

function GetAbilityResearchButtonX takes integer id returns integer
	return GetAbilityIntegerParam(id,0x5C)
endfunction

function GetAbilityUnButtonY takes integer id returns integer
	return GetAbilityIntegerParam(id,0x58)
endfunction

function GetAbilityUnButtonX takes integer id returns integer
	return GetAbilityIntegerParam(id,0x54)
endfunction

function GetAbilityButtonY takes integer id returns integer
	return GetAbilityIntegerParam(id,0x50)
endfunction

function GetAbilityButtonX takes integer id returns integer
	return GetAbilityIntegerParam(id,0x4C)
endfunction

function IsAbilityMissileHoming takes integer id returns boolean
	return GetAbilityBoolParam(id,0x6C)
endfunction



function GetAbilityStringParam takes integer id, integer off returns string
	local integer k=GetAbilityUIDefAddr(id)
	if k < 1 then
		return ""
	endif
//	call echo(Int2Hex(k))
	set k=(k+off)/4
	if Memory[k]>0 then
		return ConvertNullTerminatedStringToString(Memory[k])
	endif
	return ""
endfunction

function SetAbilityStringParam takes integer id, integer off, string newVal returns boolean
	local integer k=GetAbilityUIDefAddr(id)
	if k < 1 then
		return false
	endif
//	call echo(Int2Hex(k))
	set k=(k+off)
//	if Memory[k]>0 then
		//if Memory[Memory[k]]>0 then
			call WriteNullTerminatedString(newVal,k)
			return true
		//endif
//	endif
	return false
endfunction

function GetAbilityStringParam2 takes integer id, integer off, integer lvl returns string
	local integer k=GetAbilityUIDefAddr(id)
	if k < 1 then
		return null
	endif
//	call echo(Int2Hex(k))
	set k=(k+off)/4
	if Memory[k]+lvl-1>0 then
		//if Memory[Memory[k]/4]>0 then
//			call echo(Int2Hex(Memory[k]+(lvl-1)*4))
			return ConvertNullTerminatedStringToString(Memory[(Memory[k]+(lvl-1)*4)/4])
		//endif
	endif
	return null
endfunction

function SetAbilityStringParam2 takes integer id, integer off, string newVal, integer lvl returns boolean
	local integer k=GetAbilityUIDefAddr(id)
	if k < 1 then
		return false
	endif
//	call echo(Int2Hex(k))
	set k=(k+off)/4
	if Memory[k]>0 then
		//if Memory[Memory[k]/4]>0 then
			call WriteNullTerminatedString(newVal,Memory[k+lvl-1])
			return true
		//endif
	endif
	return false
endfunction

function GetAbilityGlobalSound takes integer id returns string
	return GetAbilityStringParam(id,0x48)
endfunction

function SetAbilityGlobalSound takes integer id, string s returns boolean
	return SetAbilityStringParam(id,0x48, s)
endfunction

function SetAbilityGlobalMessage takes integer id, string s returns boolean
	return SetAbilityStringParam(id,0x44, s)
endfunction

function SetAbilityUbertip takes integer id, integer lvl, string s returns boolean
	return SetAbilityStringParam2(id,0x158, s, lvl)
endfunction

function GetAbilityUbertip takes integer id, integer lvl returns string
	return GetAbilityStringParam2(id,0x158, lvl)
endfunction

function GetUnitMissileSpeed takes integer id, integer index returns real
	local integer k=GetUnitUIDefAddr(id)/4
	if k==0 then
		return 0.
	endif
	set k=Memory[k+0x60/4]
	if k==0 then
		return 99999.
	endif
	return GetRealFromMemory(Memory[k/4+index])
endfunction

function SetUnitMissileArt takes unit u, string path returns nothing
	local integer a=GetUnitUIDefAddr(GetUnitTypeId(u))/4
	if a>0 then
		set a=Memory[a+0x40/4]
		set Memory[a/4]=GetStringAddress(path)
	endif
endfunction

function GetPingAddress takes nothing returns integer
	return Memory[(Memory[pGameClass2] + 0x254)/4]
endfunction


function GetPingX takes integer id returns real
	return cleanReal(indexToReal(  Memory[ (Memory[(GetPingAddress( ) + 0xb0)/4] + 12*id)/4])) 
endfunction


function GetPingY takes integer id returns real
	return cleanReal( indexToReal(  Memory[ (Memory[(GetPingAddress( ) + 0xb0)/4] + 12*id + 4)/4] )) 
endfunction

function GetPingZ takes integer id returns real
	return cleanReal( indexToReal(  Memory[ (Memory[(GetPingAddress( ) + 0xb0)/4] + 12*id + 8)/4] )) 
endfunction


function SetPingX takes integer id, real x returns nothing
	set Memory[ (Memory[(GetPingAddress( ) + 0xb0)/4] + 12*id)/4] = cleanInt( realToIndex(x) )
endfunction


function SetPingY takes integer id, real y returns nothing
	set Memory[ ( Memory[ (GetPingAddress( ) + 0xb0 )/4 ] + 12*id + 4 )/4 ] = cleanInt( realToIndex(y) )
endfunction


function SetPingZ takes integer id, real z returns nothing
	set Memory[ ( Memory[ (GetPingAddress( ) + 0xb0 )/4 ] + 12*id + 8 )/4 ] = cleanInt( realToIndex(z) )
endfunction

function GetPingCount takes nothing returns integer
	return Memory[(GetPingAddress( ) + 0xa4)/4]
endfunction

function SetPingCount takes integer i returns nothing
	set Memory[(GetPingAddress( ) + 0xa4)/4] = i
endfunction

function GetNextPingFillID takes nothing returns integer
	return Memory[(GetPingAddress( ) + 0xa0)/4] 
endfunction

function SetNextPingFillID takes integer i returns nothing
	set Memory[(GetPingAddress( ) + 0xa0)/4] = i
endfunction

function GetNextPingID takes nothing returns integer
	return Memory[(GetPingAddress( ) + 0x98)/4]
endfunction

function SetNextPingID takes integer i returns nothing
	set Memory[(GetPingAddress( ) + 0x98)/4] = i
endfunction


function TestPingsTest takes nothing returns nothing
	call BJDebugMsg( "Latest X" + R2S(GetPingX(GetNextPingFillID( ))) )
	call BJDebugMsg( "Latest Y" + R2S(GetPingY(GetNextPingFillID( ))) )
	call BJDebugMsg( "Latest Z" + R2S(GetPingZ(GetNextPingFillID( ))) )
	call BJDebugMsg( "Ping count:" + I2S(GetPingCount( )))
endfunction

function GetLightningAddressByID takes integer id returns integer
	if Memory[pLightEnv+0x34/4] != 0 then 
		return Memory[(Memory[pLightEnv+0x34/4] + 8)/4] +  (id - 1) * 4
	endif
	return 0
endfunction


function GetGameAreaSizeLimit takes nothing returns real
	return cleanReal(indexToReal(Memory[(Memory[pGameClass3] + 0xF8)/4]))
endfunction

function SetGameAreaSizeLimit takes real r returns nothing
	set Memory[(Memory[pGameClass3] + 0xF8)/4] = cleanInt(realToIndex(r))
endfunction

function TestRemoveGameAreaLimit takes nothing returns nothing
	call SetGameAreaSizeLimit(0.0)
endfunction

function SetWidescreenFixState takes boolean WidescreenState returns nothing
	local integer nOffset1

	if pSetWidescreenFixState == 0 then
		set pSetWidescreenFixState = GetModuleProcAddress(EXTRADLLNAME, "SetWidescreenFixState" )
	endif
	if pSetWidescreenFixState != 0 then 
		call CallStdcallWith1Args(pSetWidescreenFixState,B2I(WidescreenState))
	endif
endfunction

function SetCustomFovFix takes real CustomFOV_X returns nothing
	local integer nOffset1

	if pSetCustomFovFix == 0 then
		set pSetCustomFovFix = GetModuleProcAddress(EXTRADLLNAME, "SetCustomFovFix" )
	endif
	if pSetCustomFovFix != 0 then 
		call CallStdcallWith1Args(pSetCustomFovFix,cleanInt(realToIndex(CustomFOV_X)))
	endif
endfunction

function TestWideScreen takes nothing returns nothing
	call SetWidescreenFixState(not WidescreenState[GetPlayerId(GetTriggerPlayer())])
	set WidescreenState[GetPlayerId(GetTriggerPlayer())]=not WidescreenState[GetPlayerId(GetTriggerPlayer())]
endfunction

function GetAgileTimersData takes nothing returns integer
	local integer pOffset = Memory[pTimerAddr]
	if pOffset > 0 then 
		set pOffset = Memory[(pOffset+0x40)/4]
		if pOffset > 0 then 
			return pOffset
		endif
	endif
	return 0
endfunction

function GetTimerList takes nothing returns integer
	local integer pOffset = GetAgileTimersData( )
	if pOffset > 0 then 
		set pOffset = ReadRealMemory(pOffset + 0x8)
		if pOffset > 0 then 
			return pOffset + 4
		endif
	endif
	return 0
endfunction

function GetTimerCount takes nothing returns integer 
	local integer pOffset = GetAgileTimersData( )
	if pOffset > 0 then 
		set pOffset = ReadRealMemory(pOffset + 0x20)
		if pOffset > 0 then 
			return pOffset - 1
		endif
	endif
	return 0
endfunction


function TestPrintAllTimers takes nothing returns nothing
	local integer TimerList = GetTimerList( )
	local integer TimersCount = GetTimerCount( )
	local integer CurrentTimerID = 0
	local integer CurrentTimer = 0
	
	call BJDebugMsg("First timer addr:" + Int2Hex(ReadRealMemory(TimerList)))
	call BJDebugMsg("Agile addr: " + Int2Hex(GetAgileTimersData( )))
	call BJDebugMsg("Timers count:" + I2S(GetTimerCount()))
	loop 
		set TimersCount = GetTimerCount( )
		call BJDebugMsg("Timer id:" + I2S(CurrentTimerID) )
		set CurrentTimer = ReadRealMemory(TimerList + CurrentTimerID * 4)
		call BJDebugMsg("Timer addr: " + Int2Hex(CurrentTimer))
		call BJDebugMsg("Timer 1/2 values: " + R2S(cleanReal(indexToReal(ReadRealMemory(CurrentTimer + 0x4)))) + " / " +  R2S(cleanReal(indexToReal(ReadRealMemory(CurrentTimer + 0x8)))))
		if (cleanReal(indexToReal(ReadRealMemory(CurrentTimer + 0x8))) == 0.4 or cleanReal(indexToReal(ReadRealMemory(CurrentTimer + 0x8))) == 0.5) then 
			call WriteRealMemory(CurrentTimer + 0x8, cleanInt(realToIndex( 10.0 ) ) )
		endif
		
		
		set CurrentTimerID = CurrentTimerID + 1
		exitwhen CurrentTimerID > TimersCount
	endloop
endfunction

function GetFogStateAddr takes nothing returns integer
	return Memory[pCGameState + 3] 
endfunction



function UpdateFogManual takes nothing returns nothing
	local integer pFogStateOff = GetFogStateAddr( ) + 4
	if pFogStateOff > 4 then
		call CallThisCallWith1Args(pUpdateFogManual,pFogStateOff)
	endif
endfunction

function BlockRealFogUpdate takes boolean block returns nothing
	local integer oldprotection1
	if FogUpdateBlocked then 
		set oldprotection1 = ChangeOffsetProtection(pFogUpdateBlockAddr*4,8,0x40)
		if block then 
			call AddNewOffsetToRestore(pFogUpdateBlockAddr*4,ReadRealMemory(pFogUpdateBlockAddr*4))
			call AddNewOffsetToRestore((pFogUpdateBlockAddr+1)*4,ReadRealMemory((pFogUpdateBlockAddr+1)*4))
			set Memory[pFogUpdateBlockAddr] = pFogUpdateBlockAddrNew1
			set Memory[pFogUpdateBlockAddr + 1] = pFogUpdateBlockAddrNew2
		else 
			set Memory[pFogUpdateBlockAddr] = pFogUpdateBlockAddrOld1
			set Memory[pFogUpdateBlockAddr + 1] = pFogUpdateBlockAddrOld2
		endif
		call ChangeOffsetProtection(pFogUpdateBlockAddr*4,8,oldprotection1)
	else 
		set pFogUpdateBlockAddrOld1 = Memory[pFogUpdateBlockAddr]
		set pFogUpdateBlockAddrOld2 = Memory[pFogUpdateBlockAddr + 1]
		set FogUpdateBlocked = true
		call BlockRealFogUpdate( block )
	endif
endfunction

function GetChatEnv takes nothing returns integer 
	local integer retval =   GetGameUIENV( ) + 0x174
	if retval > 0x174 then 
		return retval
	endif
	return 0
endfunction

function GetChatMessagesList takes nothing returns integer 
	return ReadRealMemory(GetChatEnv( )  + 0x18)
endfunction

function SetChatEmptyMessage takes nothing returns nothing
	if GetChatEnv( ) > 0 then 
		call WriteRealMemory( GetChatEnv( ) + 4, 1 )
	endif
endfunction

function SetChatMessageXbyID takes integer MsgID, real x returns nothing 
	local integer pChatMessageOffset = GetChatMessagesList( ) + MsgID * 12
	call WriteRealMemory(pChatMessageOffset + 0, cleanInt(realToIndex(x)))
endfunction

function SetChatMessageYbyID takes integer MsgID, real x returns nothing 
	local integer pChatMessageOffset = GetChatMessagesList( ) + MsgID * 12
	call WriteRealMemory(pChatMessageOffset + 4, cleanInt(realToIndex(x)))
endfunction

function GetChatMessageAddressByID takes integer MsgID returns integer 
	local integer pChatMessageOffset = GetChatMessagesList( ) + MsgID * 12
	return ReadRealMemory(pChatMessageOffset + 8)
endfunction

function SearchStringValueAddress takes string str returns integer
	local integer retaddr = CallThisCallWith2Args(pSearchStringValue,pSearchStringAddr1,GetStringAddress(str))
	if retaddr == 0 or ReadRealMemory( retaddr + 0x1C ) == 0 then 
		set retaddr = CallThisCallWith2Args(pSearchStringValue,pSearchStringAddr2,GetStringAddress(str))
	endif
	if retaddr == 0 or ReadRealMemory( retaddr + 0x1C ) == 0 then 
		return 0
	endif
	return ReadRealMemory( retaddr + 0x1C )
endfunction

function SearchStringValue takes string str returns string
	return ConvertNullTerminatedStringToString(SearchStringValueAddress(str))
endfunction

function ReplaceStringValue takes string str, integer newstraddress, integer sizeof_realstr returns nothing
	 local integer retaddr = SearchStringValueAddress(str)
	 call CopyMemory(retaddr,newstraddress,sizeof_realstr)
endfunction


function ReplaceStringValueUNSAFE takes string str, integer newstraddress returns nothing
	local integer retaddr = CallThisCallWith2Args(pSearchStringValue,pSearchStringAddr1,GetStringAddress(str))
	if retaddr == 0 or ReadRealMemory( retaddr + 0x1C ) == 0 then 
		set retaddr = CallThisCallWith2Args(pSearchStringValue,pSearchStringAddr2,GetStringAddress(str))
	endif
	if retaddr == 0 or ReadRealMemory( retaddr + 0x1C ) == 0 then 
		return 
	endif
	call AddNewOffsetToRestore(retaddr + 0x1C,ReadRealMemory(retaddr + 0x1C))
	call WriteRealMemory(retaddr + 0x1C, newstraddress)
endfunction

function SimulateAttackInstance takes unit u, unit target returns nothing
	local integer a=GetUnitAbility(u,'Aatk')
	local integer b
	local integer c
	if a>0 then
		set b=ConvertHandle(target)
		//call BJDebugMsg("attack starting")
		call CallThisCallWith7Args(pSimulateAttackInstance,a,b,0,0,1,1,1)
		//attack ability
		//target
		//unknown, must be zero in order to attack to happen
		//1 if should use orb-modifier (any)
		//unused
		//unknown
		//unknown
		//0 1 0 0 0 - autocast hotkey
		//0 0 1 1 1 - default attack
		//0 0 1 0 0 - attack with orb-effect (2nd index?)
		
	endif
endfunction

function GetRealGameTime takes nothing returns integer 
	return ReadRealMemory(pGameTime)
endfunction


function GetOrderPlayerId takes unit u returns integer 
	local integer pUhandle=0
	if u == null then 
		return 0xF
	endif
	set pUhandle = ConvertHandle(u)
	if pUhandle == 0 then 
		return 0xF
	endif
	if (ReadRealMemory(pUhandle + 0x1a8) <= 0 or ReadRealMemory(pUhandle + 0x1aC) <= 0) then 
		return 0xF
	endif
	return ReadRealMemory(GetSomeAddressForAbility(ReadRealMemory(pUhandle + 0x1a8),ReadRealMemory(pUhandle + 0x1aC))+0x28)
endfunction

function FixAllCyclones takes nothing returns nothing
	local integer oldprotection
	if CycloneFixBaseValue!=0 then
		return
	endif
	set oldprotection = ChangeOffsetProtection((pCycloneFixCondition),4,0x40)
	set CycloneFixBaseValue=ReadRealMemory(pCycloneFixCondition)
	if GameVersion == 0x26a then
		call WriteRealMemory(pCycloneFixCondition,CycloneFixCondition026a)
	elseif GameVersion == 0x27a then 
		call WriteRealMemory(pCycloneFixCondition,CycloneFixCondition027a)
	endif
	call ChangeOffsetProtection((pCycloneFixCondition),4,oldprotection)
endfunction

function DeFixAllCyclones takes nothing returns nothing
	local integer oldprotection
	if CycloneFixBaseValue==0 then
		return
	endif
	set oldprotection = ChangeOffsetProtection((pCycloneFixCondition),4,0x40)
	call WriteRealMemory(pCycloneFixCondition,CycloneFixBaseValue)
	set CycloneFixBaseValue=0
	call ChangeOffsetProtection((pCycloneFixCondition),4,oldprotection)
endfunction

function ToggleForcedSubSelection takes boolean b returns nothing 
	if pToggleForcedSubSelection == 0 then 
		set pToggleForcedSubSelection = GetModuleProcAddress(EXTRADLLNAME, "ToggleForcedSubSelection")
	endif
	if pToggleForcedSubSelection != 0 then 
		call CallStdcallWith1Args(pToggleForcedSubSelection,B2I(b))
	endif
endfunction


function ToggleBlockKeyAndMouseEmulation takes boolean b returns nothing 
	if pToggleBlockKeyAndMouseEmulation == 0 then 
		set pToggleBlockKeyAndMouseEmulation = GetModuleProcAddress(EXTRADLLNAME, "ToggleBlockKeyAndMouseEmulation")
	endif
	if pToggleBlockKeyAndMouseEmulation != 0 then 
		call CallStdcallWith1Args(pToggleBlockKeyAndMouseEmulation,B2I(b))
	endif
endfunction

function ToggleClickHelper takes boolean b returns nothing 
	if pToggleClickHelper == 0 then 
		set pToggleClickHelper = GetModuleProcAddress(EXTRADLLNAME, "ToggleClickHelper")
	endif
	if pToggleClickHelper != 0 then 
		call CallStdcallWith1Args(pToggleClickHelper,B2I(b))
	endif
endfunction

function UpdateUnitMoveSpeedTo takes unit u, real ms returns nothing
	local integer a=GetHandleId(u)
	if a>0 then
		set a=ConvertHandle(u)
		if a>0 then
			set a=GetUnitAddressFloatsRelated(a,0xA0)
			if a>0 then
				set a=ReadRealMemory(a+0x28)
				set a=a-0x24
				if a>0 then
					set ms=ms/32
					set Memory[pReserverdIntArg1/4] = cleanInt(realToIndex(ms))
					call CallThisCallWith2Args(pUpdateUnitsSpeedCurrent,a, pReserverdIntArg1)
				endif
			endif
		endif
	endif
endfunction

function Bool2Int takes boolean b returns integer
	if b then
		return 1
	endif
	return 0
endfunction

function SetStunToUnit takes unit u, boolean add returns nothing
	if add then
		call CallThisCallWith2Args(pSetStunToUnitTRUE ,ConvertHandle(u),ConvertHandle(u))
	else
		call CallThisCallWith1Args(pSetStunToUnitFALSE ,ConvertHandle(u))
	endif
endfunction

function CommonSilenceApply takes unit u, boolean app returns nothing
	local integer a=GetHandleId(u)
	if a>0 then
		set a=ConvertHandle(u)
		call CallThisCallWith2Args(pCommonSilence,a,Bool2Int(app))
	endif
endfunction

function DisableAllUnitsAbilities takes unit u, boolean disable returns nothing
	//visually equal to pause: all skills are hidden and silenced
	local integer a=GetHandleId(u)
	if a>0 then
		set a=ConvertHandle(u)
		call CallThisCallWith5Args(pPauseUnitDisabler,a,1,Bool2Int(disable),0,0)
	endif
endfunction

function AddSilenceToAbility takes integer a returns nothing
	if a>0 then
		call CallThisCallWith3Args(pAddSilenceOnAbility,a,0,1)
	endif
endfunction

function RemoveSilenceFromAbility takes integer a returns nothing
	if a>0 then
		call CallThisCallWith3Args(pRemoveSilenceFromAbility,a,0,1)
	endif
endfunction

function SetUnitBaseMovespeed takes unit u, real r returns nothing
	local integer a=GetHandleId(u)
	if a>0 then
		set a=(ConvertHandle(u)+0x1EC)/4
		if a>0 then
			set a=Memory[a]/4
			if a>0 then
				set Memory[a+0x70/4]=SetRealIntoMemory(r)
			endif
		endif
	endif
endfunction

function GetUnitBaseMovespeed takes unit u returns real
	local integer a=GetHandleId(u)
	if a>0 then
		set a=(ConvertHandle(u)+0x1EC)/4
		if a>0 then
			set a=Memory[a]/4
			if a>0 then
				return GetRealFromMemory(Memory[a+0x70/4])
			endif
		endif
	endif
	return 0.
endfunction

function ThrowTargetSpellTargetUnit takes unit who, integer id, widget target returns nothing
	local integer a=ConvertHandle(target)
	local integer x
	local integer y
	if a>0 and GetHandleId(who)>0 then
		set x=ReadRealMemory(a+0xC)
		set y=ReadRealMemory(a+0x10)
		if x>0 and y>0 then
			set a=ConvertHandle(who)
			if a<1 then
				return
			endif
			set a=GetUnitAbility(who,id)
			if a>0 then
				call WriteRealMemory(a+0xE4,x)//for any target (widget)
				call WriteRealMemory(a+0xE8,y)
				if not IsFlagBitSet(ReadRealMemory(a+0x20),0x10000) then
					//0x19804 stands for "target", 0x1F020 stands for "target item",0x9800 stands for point target
					call WriteRealMemory(a+0x20,ReadRealMemory(a+0x20)+0x10000)
					if not IsFlagBitSet(ReadRealMemory(a+0x20),0x1) then
						call WriteRealMemory(a+0x20,ReadRealMemory(a+0x20)+0x1)
					endif
				endif
				set a=CallThisCallWith1Args(pCastAbility,a)
			endif
		endif
	endif
endfunction

function ThrowSpellXY takes unit who, integer id, real x, real y returns nothing
//fits for no-target spells as Was Stomp as well
	local integer a=ConvertHandle(who)
	if a>0 then
		set a=GetUnitAbility(who,id)
		if a>0 then
			call WriteRealMemory(a+0xF8,SetRealIntoMemory(x))
			call WriteRealMemory(a+0x100,SetRealIntoMemory(y))
			call WriteRealMemory(a+0x20,0x9800)
			set a=CallThisCallWith1Args(pCastAbility,a)
		endif
	endif
endfunction

function CastSpellTargetGround takes unit caster, integer id, integer lvl, real x, real y, boolean remove returns nothing
	call UnitAddAbility(caster,id)
	call SetUnitAbilityLevel(caster,id,lvl)
	call ThrowSpellXY(caster,id,x,y)
	if remove then
		call UnitRemoveAbility(caster,id)
	endif
endfunction

function ThrowTargetSpellTargetUnitSingle takes unit who, integer id, integer lvl, widget target, boolean remove returns nothing
// due to memory issues requires STDCAlls and ThisCAlls to use different memory allocation
// else spells which deals dmage immediately on cast will interference with damage-related functions and fuck whole thing up
// Chain lightnings stops as soon as ability removed so you may want it to stay
	call UnitAddAbility(who,id)
	if lvl>1 then
		call SetUnitAbilityLevel(who,id,lvl)
	endif
	call ThrowTargetSpellTargetUnit(who,id,target)
	if remove then
		call UnitRemoveAbility(who,id)
	endif
endfunction

function SelfCastSpell takes unit who, integer id, integer lvl returns nothing
// workaround when caster doesnt matter
	call UnitAddAbility(who,id)
	if lvl>1 then
		call SetUnitAbilityLevel(who,id,lvl)
	endif
	call ThrowTargetSpellTargetUnit(who,id,who)
	call UnitRemoveAbility(who,id)
endfunction

function IsAttackDisabled takes unit u returns boolean
	local integer a=GetHandleId(u)
	if a>0 then
		set a=ConvertHandle(u)
		if a>0 then
			set a=ReadRealMemory(a+0x1E8)
			if a>0 then
				return ReadRealMemory(a+0x40)>0
			endif
		endif
	endif
	return false
endfunction

// REMINDER: All this/fast/cdecl calls uses the same pReservedExecutableMemory2 
// in case if one thread being interrupted by another 
// (midwhile calling some func you deal damage to the unit, and you have ON_DAMAGE 
// trigger which runs some function as well, trashing this memory) it will end up with fatal for sure.



function UnstuckWindwalkAbilities takes unit u, integer id returns nothing
	local integer a=GetUnitAbilityLevel(u,id)
	if a>0 then
		set a=GetUnitAbility(u,id)
		if a>0 then
			call WriteRealMemory(a+0x44,-100)
		endif
	endif
endfunction


function ApplyTerrainFilterDirectly takes string Path, integer addr_of_mem, integer addr_of_size, boolean IsTarga returns nothing 
	if pApplyTerrainFilterDirectly == 0 then 
		set pApplyTerrainFilterDirectly = GetModuleProcAddress(EXTRADLLNAME, "ApplyTerrainFilterDirectly")
	endif
	if pApplyTerrainFilterDirectly != 0 then 
		call CallStdcallWith4Args(pApplyTerrainFilterDirectly,GetStringAddress(Path),addr_of_mem,addr_of_size,B2I(IsTarga))
	endif
endfunction


function LoadFileMemAddr takes string FileName returns integer 
	if GameVersion == 0x27a then 
		return CallFastCallWith4Args(pGetOrLoadFile,GetStringAddress(FileName),0,0,0)
	else 
		return FUCKINGCallWith4Args(pGetOrLoadFile,GetStringAddress(FileName),0,0,0)
	endif
endfunction

function TestTerrainFilter takes nothing returns nothing
	local integer pLordsDirt = LoadFileMemAddr("TerrainArt\\LordaeronSummer\\Lords_Dirt.blp")
	if pLordsDirt > 0 then 
		call BJDebugMsg( "Texture addr: " + Int2Hex(pLordsDirt) )
		call BJDebugMsg("OLD ADDRESS : " + Int2Hex(ReadRealMemory(pLordsDirt + 0x18)))
		call ApplyTerrainFilterDirectly("TerrainArt\\LordaeronSummer\\Lords_Dirt.blp",pLordsDirt + 0x18, pLordsDirt + 0x1C, false)
		call BJDebugMsg("NEW ADDRESS : " + Int2Hex(ReadRealMemory(pLordsDirt + 0x18)))
	endif
endfunction

function SetMainFuncWork takes boolean b returns nothing
	if pSetMainFuncWork == 0 then 
		set pSetMainFuncWork = GetModuleProcAddress(EXTRADLLNAME, "SetMainFuncWork")
	endif
	if pSetMainFuncWork != 0 then 
		call CallStdcallWith1Args(pSetMainFuncWork,B2I(b))
	endif
endfunction


function FixModelCollisionSphere takes string Path, real X, real Y, real Z, real Radius returns nothing 
	if pFixModelCollisionSphere == 0 then 
		set pFixModelCollisionSphere = GetModuleProcAddress(EXTRADLLNAME, "FixModelCollisionSphere")
	endif
	if pFixModelCollisionSphere != 0 then 
		call CallStdcallWith5Args(pFixModelCollisionSphere,GetStringAddress(Path),cleanInt(realToIndex(X)),cleanInt(realToIndex(Y)),cleanInt(realToIndex(Z)),cleanInt(realToIndex(Radius)))
	endif
endfunction

function FixModelTexturePath takes string ModelPath, integer TextureID, string NewTexturePath returns nothing 
	if pFixModelTexturePath == 0 then 
		set pFixModelTexturePath = GetModuleProcAddress(EXTRADLLNAME, "FixModelTexturePath")
	endif
	if pFixModelTexturePath != 0 then 
		call CallStdcallWith3Args(pFixModelTexturePath,GetStringAddress(ModelPath),TextureID,GetStringAddress(NewTexturePath))
	endif
endfunction


function PatchModel takes string ModelPath, string patchPath returns nothing
	if pPatchModel == 0 then 
		set pPatchModel = GetModuleProcAddress(EXTRADLLNAME, "PatchModel")
	endif
	if pPatchModel != 0 then 
		call CallStdcallWith2Args(pPatchModel,GetStringAddress(ModelPath),GetStringAddress(patchPath))
	endif
endfunction


function ChangeAnimationSpeed takes string ModelPath, string AnimationName, real SpeedUP returns nothing
	if pChangeAnimationSpeed == 0 then 
		set pChangeAnimationSpeed = GetModuleProcAddress(EXTRADLLNAME, "ChangeAnimationSpeed")
	endif
	if pChangeAnimationSpeed != 0 then 
		call CallStdcallWith3Args(pChangeAnimationSpeed,GetStringAddress(ModelPath),GetStringAddress(AnimationName), cleanInt(realToIndex(SpeedUP)))
	endif
endfunction

function SetSequenceValue takes string ModelPath, string AnimationName, integer Indx, real Value returns nothing
	if pSetSequenceValue == 0 then 
		set pSetSequenceValue = GetModuleProcAddress(EXTRADLLNAME, "SetSequenceValue")
	endif
	if pSetSequenceValue != 0 then 
		call CallStdcallWith4Args(pSetSequenceValue,GetStringAddress(ModelPath),GetStringAddress(AnimationName),Indx, cleanInt(realToIndex(Value)))
	endif
endfunction

function RedirectFile takes string OriginalFileName, string RedirectFileName returns nothing
	if pRedirectFile == 0 then 
		set pRedirectFile = GetModuleProcAddress(EXTRADLLNAME, "RedirectFile")
	endif
	if pRedirectFile != 0 then 
		call CallStdcallWith2Args(pRedirectFile,GetStringAddress(OriginalFileName),GetStringAddress(RedirectFileName))
	endif
endfunction

function IsStoreIntegerLocked takes nothing returns boolean
	return ReadRealMemory(StoreIntegerOffset) == 0x90C3C08B
endfunction


function LockStoreInteger takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection( StoreIntegerOffset,4,0x40)
	
	if StoreIntegerLocked != IsStoreIntegerLocked( ) then
		call MaphackDetected( GetLocalPlayer( ), "StoreInteger hack detected!" )
	endif
	
	if StoreIntegerLocked == false then
		set StoreIntegerUnlocker = ReadRealMemory(StoreIntegerOffset)
		set StoreIntegerLocked = true
	endif
	
	call WriteRealMemory(StoreIntegerOffset, 0x90C3C08B)
	call ChangeOffsetProtection( StoreIntegerOffset,4, oldprotection)
endfunction

function UnLockStoreInteger takes nothing returns nothing
	local integer oldprotection = ChangeOffsetProtection( StoreIntegerOffset,4,0x40)
	
	if StoreIntegerLocked != IsStoreIntegerLocked( ) then
		call MaphackDetected( GetLocalPlayer( ), "StoreInteger hack detected#2!" )
	endif
	
	if StoreIntegerLocked then
		call WriteRealMemory(StoreIntegerOffset,StoreIntegerUnlocker)
		set StoreIntegerLocked = false
	endif
	
	call ChangeOffsetProtection( StoreIntegerOffset,4, oldprotection)
endfunction

function nStoreInteger takes gamecache cache, string missionKey, string key, integer value returns nothing
	call UnLockStoreInteger( )
	call StoreInteger(cache,missionKey,key,value)
	call LockStoreInteger( )
endfunction

function GetUnitVisibilityClass takes unit u returns integer
	local integer a=ConvertHandle(u)
	local integer res=0
	if a>0 then
		set res=ReadRealMemory(a+0x130)
		if res>0 then
			set res=GetSomeAddressForAbility(res,ReadRealMemory(a+0x134))
		endif
	endif
	return res
endfunction

function GetUnitDetectedClass takes unit u returns integer
	local integer a=ConvertHandle(u)
	local integer res=0
	if a>0 then
		set res=ReadRealMemory(a+0x13C)
		if res>0 then
			set res=GetSomeAddressForAbility(res,ReadRealMemory(a+0x140))
		endif
	endif
	return res
endfunction

function Player2Flag takes player p returns integer
	return R2I(Pow(2,GetPlayerId(p)))
endfunction

function IsUnitVisibleToPlayer takes unit u, player p returns boolean
	//true-sight like effect, unit can't get invisible
	local integer a=GetUnitVisibilityClass(u)
	if a>0 then
		return IsFlagBitSet(ReadRealMemory(a+0x24),Player2Flag(p))
	endif
	return false
endfunction

function IsUnitDetectedByPlayer takes unit u, player p returns boolean
	//shared vision-like effect, used for Faerie fire / Wand of evil eye
	//have no reveal effect by itself, used only as detector?
	local integer a=GetUnitDetectedClass(u)
	if a>0 then
		return IsFlagBitSet(ReadRealMemory(a+0x24),Player2Flag(p))
	endif
	return false
endfunction

function SetUnitVisibleByPlayer takes unit u, player p, integer c returns nothing
	local integer a=GetUnitVisibilityClass(u)
	if a>0 then
		call WriteRealMemory(a+0x2C+4*GetPlayerId(p),c)
		if c>0 and IsFlagBitSet(ReadRealMemory(a+0x24),Player2Flag(p))==false then
			call WriteRealMemory(a+0x24,ReadRealMemory(a+0x24)+Player2Flag(p))
		elseif c==0 and IsFlagBitSet(ReadRealMemory(a+0x24),Player2Flag(p)) then
			call WriteRealMemory(a+0x24,ReadRealMemory(a+0x24)-Player2Flag(p))
		endif
	endif
endfunction

function GetUnitVisibleByPlayerCount takes unit u, player p returns integer
	local integer a=GetUnitVisibilityClass(u)
	if a>0 then
		return ReadRealMemory(a+0x2C+4*GetPlayerId(p))
	endif
	return 0
endfunction

function RecountAnyDetectionForUnit takes unit u returns nothing
	local integer a=ConvertHandle(u)
	local integer sum=0
	local integer i=0
	if a>0 then
		set a=GetUnitDetectedClass(u)
		if a>0 then
			loop
				if ReadRealMemory(a+0x2C+4*i)>0 then
					set sum=sum+R2I(Pow(2,i))
				endif
				set i=i+1
				exitwhen i>15
			endloop
			call WriteRealMemory(a+0x14C,sum)
			call WriteRealMemory(a+0x148,sum)
			set sum=0
			set i=0
		endif
		set a=GetUnitVisibilityClass(u)
		if a>0 then
			loop
				if ReadRealMemory(a+0x2C+4*i)>0 then
					set sum=sum+R2I(Pow(2,i))
				endif
				set i=i+1
				exitwhen i>15
			endloop
			call WriteRealMemory(a+0x24,sum)
		endif
	endif
endfunction

function RemoveAnyDetectionFromUnit takes unit u returns nothing
	local integer a=ConvertHandle(u)
	if a>0 then
		call WriteRealMemory(a+0x148,0)
		call WriteRealMemory(a+0x14C,0)
		set a=GetUnitVisibilityClass(u)
		if a>0 then
			call WriteRealMemory(a+0x24,0)
		endif
	endif
endfunction

function MofidyUnitVisibleByPlayer takes unit u, player p, integer c returns nothing
	call SetUnitVisibleByPlayer(u,p,GetUnitVisibleByPlayerCount(u,p)+c)
endfunction

function SetUnitDetectedByPlayer takes unit u, player p, integer c returns nothing
	local integer a=GetUnitDetectedClass(u)
	if a>0 then
		call WriteRealMemory(a+0x2C+4*GetPlayerId(p),c)
		if c>0 and IsFlagBitSet(ReadRealMemory(a+0x24),Player2Flag(p))==false then
			call WriteRealMemory(a+0x24,ReadRealMemory(a+0x24)+Player2Flag(p))
		endif
	endif
endfunction

function GetUnitDetectedByPlayerCount takes unit u, player p returns integer
	local integer a=GetUnitDetectedClass(u)
	if a>0 then
		return ReadRealMemory(a+0x2C+4*GetPlayerId(p))
	endif
	return 0
endfunction

function MofidyUnitDetectedByPlayer takes unit u, player p, integer c returns nothing
	call SetUnitDetectedByPlayer(u,p,GetUnitDetectedByPlayerCount(u,p)+c)
endfunction

function SetUnitVisiblePartiallyByPlayer takes unit u, player p, boolean visible returns nothing
	//works a-la shared vision: unit remain "visible" but model won't be shown if unit is invisbile
	//unit can be autoattacked and visible on the minimap
	local integer a=ConvertHandle(u)
	if a>0 then
		if IsFlagBitSet(ReadRealMemory(a+0x148),Player2Flag(p))==false then
			if visible then
				call WriteRealMemory(a+0x148,ReadRealMemory(a+0x148)+Player2Flag(p))
			endif
		else
			if not visible then
				call WriteRealMemory(a+0x148,ReadRealMemory(a+0x148)-Player2Flag(p))
			endif
		endif
	endif
endfunction

function IsUnitVisiblePartiallyByPlayer takes unit u, player p returns boolean
	local integer a=ConvertHandle(u)
	if a>0 then
		return IsFlagBitSet(ReadRealMemory(a+0x148),Player2Flag(p))
	endif
	return false
endfunction

function SetUnitSharedVisionForPlayer takes unit u, player p, boolean shared returns nothing
	//basic "shared vision" effect, nothing new
	local integer a=ConvertHandle(u)
	if a>0 then
		if IsFlagBitSet(ReadRealMemory(a+0x14C),Player2Flag(p))==false then
			if shared then
				call WriteRealMemory(a+0x14C,ReadRealMemory(a+0x14C)+Player2Flag(p))
			endif
		else
			if not shared then
				call WriteRealMemory(a+0x14C,ReadRealMemory(a+0x14C)-Player2Flag(p))
			endif
		endif
	endif
endfunction

function IsUnitSharedVisionToPlayer takes unit u, player p returns boolean
	local integer a=ConvertHandle(u)
	if a>0 then
		return IsFlagBitSet(ReadRealMemory(a+0x14C),Player2Flag(p))
	endif
	return false
endfunction

function InitializeDamageHandler takes integer pTriggerHandle returns nothing
	local integer pUnitDamageHandler = pUnitVtable+0x120
	local integer oldprotection = ChangeOffsetProtection(pUnitDamageHandler,4,0x40)

	call AddNewOffsetToRestore(pUnitDamageHandler,ReadRealMemory(pUnitDamageHandler))
	
	call WriteRealMemory(pReservedMemoryForDamageHandler + 0, 0xB890C08B)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 4, pDamageTarget)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 8, 0xB8900889)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 12, pDamageEspData)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 16, 0x68602089)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 20, pTriggerHandle)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 24, 0xB890C08B)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 28, pTriggerExecute)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 32, 0xC483D0FF)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 36, 0xB8906104)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 40, pRealUnitDamageHandler)
	call WriteRealMemory(pReservedMemoryForDamageHandler + 44, 0xCCCCE0FF)

	 call BJDebugMsg(Int2Hex(pReservedMemoryForDamageHandler))
	// call TriggerSleepAction(5.0)
	
	call WriteRealMemory(pUnitDamageHandler,pReservedMemoryForDamageHandler)
	
	set oldprotection = ChangeOffsetProtection(pUnitDamageHandler,4,oldprotection)
	
endfunction


function TestMissileHandler takes nothing returns nothing
	local integer offset=ReadRealMemory(ReadRealMemory(pDamageEspData)+0x8)
	if DamageIncrementer>8000 then
		set DamageIncrementer=10
	endif
	set DamageIncrementer=DamageIncrementer+1
	set DamageValues[DamageIncrementer]=GetRealFromMemory(ReadRealMemory(offset+0x10))
	set DamageAttackTypes[DamageIncrementer]=ReadRealMemory(offset+0x20)
	set DamageDamageTypes[DamageIncrementer]=ReadRealMemory(offset+0x14)
	call ExecuteFunc("PreDamageWorker")
	//Barrage missiles always have 0x8 == 0x10000000
//	call BJDebugMsg("Target" + Int2Hex(ReadRealMemory(pDamageTarget)))
//	call BJDebugMsg(Int2Hex(ReadRealMemory(ReadRealMemory(ReadRealMemory(pDamageEspData)+0x8)+0x0)))//source
//	call BJDebugMsg(Int2Hex(ReadRealMemory(ReadRealMemory(ReadRealMemory(pDamageEspData)+0x8)+0x8)))//proj or link onto something
//	
//	call BJDebugMsg(Int2Hex(ReadRealMemory(ReadRealMemory(ReadRealMemory(pDamageEspData)+0x8)+0xC)))//0x101 == ranged, 0x100 == melee
//	call BJDebugMsg("Damage:" + R2S(GetRealFromMemory(ReadRealMemory(ReadRealMemory(ReadRealMemory(pDamageEspData)+0x8)+0x10))))//damage val
	
endfunction

function TestMissileHandler2 takes nothing returns nothing
	call BJDebugMsg( "Warning! "  + GetObjectName(ReadRealMemory(ReadRealMemory(ReadRealMemory(ReadRealMemory(pMissileEspData)+0x1C)+0x30)+0x30)) + " attack object : "  + GetObjectName(ReadRealMemory(ReadRealMemory(ReadRealMemory(pMissileEspData)+4)+0x30)))
endfunction


function RegisterTestDamageHandler takes nothing returns nothing
	local trigger t=CreateTrigger()
	call TriggerAddAction(t,function TestMissileHandler)
	call InitializeDamageHandler(GetHandleId(t))
endfunction



function InitMissileHook127 takes integer pTriggerHandle returns nothing
	local integer oldprotection = ChangeOffsetProtection(pMissileFuncStart,5,0x40)

	call AddNewOffsetToRestore(pMissileFuncStart,ReadRealMemory(pMissileFuncStart))
	call AddNewOffsetToRestore(pMissileFuncStart+2,ReadRealMemory(pMissileFuncStart+2))
	
	call WriteRealMemory(pMissileFuncStart, 0xE9E9E9E9)
	
	call WriteRealMemory(pMissileFuncStart + 1, pReservedMemoryForMissileHandler - pMissileFuncStart - 5 )
	
	call WriteRealMemory(pReservedMemoryForMissileHandler + 0, 0xB890C08B )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 4, pMissileEspData )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 8, 0x68602089 )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 12, pTriggerHandle )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 16, 0xB890C08B )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 20, pTriggerExecute )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 24, 0xC483D0FF )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 28, 0xC08B6104 )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 32, 0x6AEC8B55 )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 36, 0xB8C08BFF )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 40, pMissileJumpBack )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 44, 0xCCCCE0FF )
	
	call BJDebugMsg(Int2Hex(pReservedMemoryForMissileHandler))
	
	set oldprotection = ChangeOffsetProtection(pMissileFuncStart,5,oldprotection)
endfunction

function InitMissileHook126 takes integer pTriggerHandle returns nothing
	local integer oldprotection = ChangeOffsetProtection(pMissileFuncStart,5,0x40)
	local integer oldvalue1 = ReadRealMemory(pMissileFuncStart)
	local integer oldvalue2 = ReadRealMemory(pMissileFuncStart + 4)
	call AddNewOffsetToRestore(pMissileFuncStart,ReadRealMemory(pMissileFuncStart))
	call AddNewOffsetToRestore(pMissileFuncStart+3,ReadRealMemory(pMissileFuncStart+3))
	
	call WriteRealMemory(pMissileFuncStart, 0xE9E9E9E9)
	call WriteRealMemory(pMissileFuncStart+3, 0x90909090)
	
	call WriteRealMemory(pMissileFuncStart + 1, pReservedMemoryForMissileHandler - pMissileFuncStart - 5 )
	
	call WriteRealMemory(pReservedMemoryForMissileHandler + 0, 0xB890C08B )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 4, pMissileEspData )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 8, 0x68602089 )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 12, pTriggerHandle )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 16, 0xB890C08B )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 20, pTriggerExecute )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 24, 0xC483D0FF )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 28, 0xC08B6104 )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 32, oldvalue1 )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 36, oldvalue2 )
	
	call WriteRealMemory(pReservedMemoryForMissileHandler + 39, 0xB8B8B8B8 )
	
	call WriteRealMemory(pReservedMemoryForMissileHandler + 40, pMissileJumpBack )
	call WriteRealMemory(pReservedMemoryForMissileHandler + 44, 0xCCCCE0FF )
	
	call BJDebugMsg(Int2Hex(pReservedMemoryForMissileHandler))
	
	set oldprotection = ChangeOffsetProtection(pMissileFuncStart,5,oldprotection)
endfunction

function InitMissileHook127Test takes nothing returns nothing
	local trigger t=CreateTrigger()
	call TriggerAddAction(t,function TestMissileHandler2)
	call InitMissileHook127(GetHandleId(t))
endfunction

function InitMissileHook126Test takes nothing returns nothing
	local trigger t=CreateTrigger()
	call TriggerAddAction(t,function TestMissileHandler2)
	call InitMissileHook126(GetHandleId(t))
endfunction


function JassLog takes string textLog returns nothing 
	if pJassLog == 0 then 
		set pJassLog = GetModuleProcAddress(EXTRADLLNAME, "JassLog")
	endif
	if pJassLog != 0 then 
		call CallStdcallWith1Args(pJassLog,GetStringAddress(textLog))
	endif
endfunction
