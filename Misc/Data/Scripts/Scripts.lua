--- define lua functions 
function NoOp(self, source)
end


function kill(self) -- Kill unit self.
	ExecuteAction("NAMED_KILL", self);
end

function RadiateUncontrollableFear( self )
	ObjectBroadcastEventToEnemies( self, "BeUncontrollablyAfraid", 350 )
end

function RadiateGateDamageFear(self)
	ObjectBroadcastEventToAllies(self, "BeAfraidOfGateDamaged", 200)
end

function OnNeutralGarrisonableBuildingCreated(self)
	ObjectHideSubObjectPermanently( self, "ARMOR", true )
end

function OnGDITechCenterCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Boost", true )
	ObjectHideSubObjectPermanently( self, "UG_Mortar", true )
	ObjectHideSubObjectPermanently( self, "B_MortarRound_1", true )
	ObjectHideSubObjectPermanently( self, "UG_Rail", true )
	ObjectHideSubObjectPermanently( self, "UG_Scan", true )
end

function OnGDIMedicalBayCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Armor", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector01", true )
	ObjectHideSubObjectPermanently( self, "UG_Injector", true )
end

function OnGDIPowerPlantCreated(self)
	ObjectHideSubObjectPermanently( self, "Turbines", true )
	ObjectHideSubObjectPermanently( self, "TurbineGlows", true )
end

function OnGDIZoneTrooperCreated(self)
	ObjectHideSubObjectPermanently( self, "UGSCANNER", true )
	ObjectHideSubObjectPermanently( self, "UGJUMP", true )
	ObjectHideSubObjectPermanently( self, "UGINJECTOR", true )
end

function OnGDIPredatorCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
end

function OnGDIMammothCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAIL_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
end

function OnGDIJuggernaughtCreated(self)
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_03", true )
	
end

function OnGDIWatchTowerCreated(self)
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
end

function OnGDIFirehawkCreated(self)
	-- bomb load by default.
	ObjectGrantUpgrade( self, "Upgrade_SelectLoad_02" )
	ObjectHideSubObjectPermanently( self, "Plane04", true )
end

function OnGDIPitbullCreated(self)
	ObjectHideSubObjectPermanently( self, "MortorTube", true )
end

function OnGDIOrcaCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_PROBE", true )
end

function OnGDISniperSquadCreated(self)
	ObjectSetObjectStatus( self, "CAN_SPOT_FOR_BOMBARD" )
end

function OnGDIOrcaClipEmpty(self)
	ObjectHideSubObjectPermanently( self, "MISSILE01", true )
end

function OnGDIOrcaClipFull(self)
	ObjectHideSubObjectPermanently( self, "MISSILE01", false )
end

function OnGDIV35Ox_SummonedForVehicleCreated(self)
	ObjectHideSubObjectPermanently( self, "LOADREF", true )
end

function OnNODShredderCreated(self)

end

function OnNODRaiderTankCreated(self)
	ObjectHideSubObjectPermanently( self, "Gun_Upgrade", true )
	ObjectHideSubObjectPermanently( self, "Turret2_Gun", true )
	ObjectHideSubObjectPermanently( self, "Turret2", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "DOZERBLADE", true )
end

function OnNODAvatarCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end

function OnNODAvatarGenericEvent(self, data)

	local str = tostring( data )

	if str == "upgrades_copied" then
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_VETERAN" );
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_ELITE" );
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_HEROIC" );
	end
end

function OnNODScorpionBuggyCreated(self)
	ObjectHideSubObjectPermanently( self, "EMP", true )
end

function OnNODVenomCreated(self)
	ObjectHideSubObjectPermanently( self, "SigGen", true )
end

function OnNODTechAssembleyPlantCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_EMP", true )
	ObjectHideSubObjectPermanently( self, "UG_Lasers", true )
	ObjectHideSubObjectPermanently( self, "UG_SigGen", true )
	ObjectHideSubObjectPermanently( self, "UG_DozerBlades", true )
end

function OnNODSecretShrineCreated(self)
	ObjectHideSubObjectPermanently( self, "GLOWS", true )	
	ObjectHideSubObjectPermanently( self, "ConfUpgrd", true )
end

function OnNODSecretShrinePowerOutage(self)	
	if ObjectHasUpgrade( self, "Upgrade_NODConfessorUpgrade" ) == 1 then
		ObjectHideSubObjectPermanently( self, "GLOWS", true )	
	end
end

function OnNODSecretShrinePowerRestored(self)		 
	if ObjectHasUpgrade( self, "Upgrade_NODConfessorUpgrade" ) == 1 then
		ObjectHideSubObjectPermanently( self, "GLOWS", false )	
	end
end


function OnAlliedAntiVehicleInfantryGenericEvent(self, data)
	local str = tostring( data )

	if str == "laser_on" then
		ObjectHideSubObjectPermanently( self, "FX_LASER", false )
	elseif str == "laser_off" then
		ObjectHideSubObjectPermanently( self, "FX_LASER", true )
	end
end

function OnAlliedBarracksCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_02", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_03", true )
end

function OnAlliedConstructionYardCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_02", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_03", true )
end

function onCreatedControlPointFunctions(self)
	ObjectHideSubObjectPermanently( self, "TB_CP_ALN", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_GDI", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_NOD", true )
	ObjectHideSubObjectPermanently( self, "LIGHTSF01", true )
	ObjectHideSubObjectPermanently( self, "100", false)
	ObjectHideSubObjectPermanently( self, "75", false)
	ObjectHideSubObjectPermanently( self, "50", false)
	ObjectHideSubObjectPermanently( self, "25", false )
end

function onBuildingPowerOutage(self)
	ObjectHideSubObjectPermanently( self, "LIGHTS", true )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS05", true )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS", true )
	ObjectHideSubObjectPermanently( self, "FXGLOWS", true )
	ObjectHideSubObjectPermanently( self, "FLASHINGLIGHTS", true )
	ObjectHideSubObjectPermanently( self, "MESH01", true )
	ObjectHideSubObjectPermanently( self, "POWERPLANTGLOWS", true )
	ObjectHideSubObjectPermanently( self, "LIGHTL", true )
	ObjectHideSubObjectPermanently( self, "LIGHTR", true )
	ObjectHideSubObjectPermanently( self, "LIGHTS1", true )
	ObjectHideSubObjectPermanently( self, "NBCHEMICALPTE1", true )
	ObjectHideSubObjectPermanently( self, "LINKS", true )
	ObjectHideSubObjectPermanently( self, "MESH28", true )
	ObjectHideSubObjectPermanently( self, "TURBINEGLOWS", true )
	ObjectHideSubObjectPermanently( self, "GLOWS", true )
end

function onBuildingPowerRestored(self)
	ObjectHideSubObjectPermanently( self, "LIGHTS", false )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS05", false )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS", false )
	ObjectHideSubObjectPermanently( self, "FXGLOWS", false )
	ObjectHideSubObjectPermanently( self, "FLASHINGLIGHTS", false )
	ObjectHideSubObjectPermanently( self, "MESH01", false )
	ObjectHideSubObjectPermanently( self, "POWERPLANTGLOWS", false )
	ObjectHideSubObjectPermanently( self, "LIGHTL", false )
	ObjectHideSubObjectPermanently( self, "LIGHTR", false )
	ObjectHideSubObjectPermanently( self, "LIGHTS1", false )
	ObjectHideSubObjectPermanently( self, "NBCHEMICALPTE1", false )
	ObjectHideSubObjectPermanently( self, "LINKS", false )
	ObjectHideSubObjectPermanently( self, "MESH28", false )
	ObjectHideSubObjectPermanently( self, "TURBINEGLOWS", false )
	ObjectHideSubObjectPermanently( self, "GLOWS", false )
end







function OnGenericJapanBuildingCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_02", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_03", true )
end

function OnNeutralGarrisonableBuildingGenericEvent(self,data)
end

function onCreatedGDIOrcaAirstrike(self)
	ObjectForbidPlayerCommands( self, true )
end

function onCreatedAlienMCVUnpacking(self)
	ObjectForbidPlayerCommands( self, true )
end

function MakeMeAlert(self)
	ObjectEnterAlertState(self)
end

function BecomeUncontrollablyAfraid(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterUncontrollableCowerState(self, other)
end

function RadiateTerror(self, other)
	ObjectBroadcastEventToEnemies(self, "BeTerrified", 180)
end
	
function RadiateTerrorEx(self, other, terrorRange)
	ObjectBroadcastEventToEnemies(self, "BeTerrified", terrorRange)
end
	

function BecomeTerrified(self, other)
	ObjectEnterRunAwayPanicState(self, other)
end

function BecomeAfraidOfGateDamaged(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterCowerState(self,other)
end


function ChantForUnit(self) -- Used by units to broadcast the chant event to their own side.
	ObjectBroadcastEventToAllies(self, "BeginChanting", 9999)
end

function StopChantForUnit(self) -- Used by units to stop the chant event to their own side.
	ObjectBroadcastEventToAllies(self, "StopChanting", 9999)
end

function SpyMoving(self, other)
	print(ObjectDescription(self).." spying movement of "..ObjectDescription(other));
end

function OnGarrisonableCreated(self)
	ObjectHideSubObjectPermanently( self, "GARRISON01", true )
	ObjectHideSubObjectPermanently( self, "GARRISON02", true )
end

function OnRubbleDropshipCreated(self)
	ObjectHideSubObjectPermanently( self, "Loadref", true )
end

function OnSovietAntiVehicleVehicleTech1Created(self)
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_WHEEL_02", true )
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_WHEEL_01", true )
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_CENTER", true )
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_HOLD", true )	
	ObjectHideSubObjectPermanently( self, "JT8_JGFS_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT11_Titan_BarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "AT11_Titan_BaseSkin", true )
	ObjectHideSubObjectPermanently( self, "AT12_Titan_MissleSkin", true )	
	ObjectHideSubObjectPermanently( self, "AT12_Titan_Missle_BaseSkin", true )		
	ObjectHideSubObjectPermanently( self, "AT10_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT9_AAVS_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT8_BaseSkin", true )
	ObjectHideSubObjectPermanently( self, "AT8_TurretSkin", true )
	ObjectHideSubObjectPermanently( self, "AT7_AFTSkin", true )	
	ObjectHideSubObjectPermanently( self, "AT6_AAVSkin", true )
	ObjectHideSubObjectPermanently( self, "AT5_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT4_AASV_BASE", true )
	ObjectHideSubObjectPermanently( self, "AT3_AAVV1", true )	
	ObjectHideSubObjectPermanently( self, "AT2_IFVSkin", true )
	ObjectHideSubObjectPermanently( self, "AT1_MagSkin", true )
	ObjectHideSubObjectPermanently( self, "AT1_BarrleSkin", true )	
	ObjectHideSubObjectPermanently( self, "AT1_TurretSkin", true )
	ObjectHideSubObjectPermanently( self, "AT1_MinigunSkin", true )
	ObjectHideSubObjectPermanently( self, "JT7_JASS_Skin", true )
	ObjectHideSubObjectPermanently( self, "JT6_JAVV3_Skin", true )	
	ObjectHideSubObjectPermanently( self, "JT5_JWaveForce_Skin", true )		
	ObjectHideSubObjectPermanently( self, "JT4_JSV_AixSkin", true )	
	ObjectHideSubObjectPermanently( self, "JT4_JSV_F_ArmSkin", true )
	ObjectHideSubObjectPermanently( self, "JT4_JSV_HandSkin", true )
	ObjectHideSubObjectPermanently( self, "JT4_JSV_UpArmSkin", true )	
	ObjectHideSubObjectPermanently( self, "JT4_JSV_WeaponSkin", true )		
	ObjectHideSubObjectPermanently( self, "JT3_JAVV1_Skin", true )	
	ObjectHideSubObjectPermanently( self, "JT2_JAVV2_Skin", true )	
	ObjectHideSubObjectPermanently( self, "JT1_JAIV1_Skin", true )
	ObjectHideSubObjectPermanently( self, "T10_Moto_BarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "T10_Moto_baseSkin", true )	
	ObjectHideSubObjectPermanently( self, "T11_SBDG_Base", true )	
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_PIPE", true )	
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_SHELL", true )
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_BARRLE", true )
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T8_SAVV3_BARRLE_CENTER", true )	
	ObjectHideSubObjectPermanently( self, "T8_SAVV3_BARRLE", true )
	ObjectHideSubObjectPermanently( self, "T8_SAVV3_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T7_V4_ROCKET", true )
	ObjectHideSubObjectPermanently( self, "T7_V4_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T7_V4_Barrle", true )
	ObjectHideSubObjectPermanently( self, "T7_V4_Hold", true )
	ObjectHideSubObjectPermanently( self, "T7_V4_Hold2", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_08", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_07", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_06", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_05", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_04", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_03", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_02", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_01", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_PITCH", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_TURRET", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T5_TESLA_BARRLE", true )	
	ObjectHideSubObjectPermanently( self, "T5_TESLA_BASE", true )		
	ObjectHideSubObjectPermanently( self, "T3_HT_BARRLE", true )	
	ObjectHideSubObjectPermanently( self, "T3_HT_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_BARRLE02", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_BARRLE01", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_PITCH", true )
	ObjectHideSubObjectPermanently( self, "T2_FLAK_TURRET", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_PIPE", true )
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_BARRLE", true )	
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_TURRET", true )		
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_BASE", true )
	
	ObjectHideSubObjectPermanently( self, "SAVV1_SecTurret", true )	
	ObjectHideSubObjectPermanently( self, "SAVV1_SecBarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "SAVV1_SecTURRET_AddSkin", true )

	ObjectHideSubObjectPermanently( self, "SAVV1_ThrTurret", true )	
	ObjectHideSubObjectPermanently( self, "SAVV1_ThrBarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "SAVV1_ThrTURRET_AddSkin", true )

	
end

function OnAlliedInfantryFightingCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end

function OnAlliedBaseDefenseCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_Blaster_Rifles", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Engineer", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Flak", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_GoldenGun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_MachineGun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_MissileLauncher", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Natasha_Sniper", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Star", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Ninja_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Plasma", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Psyonic_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Shotgun", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Speakers", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tanya_Pistols", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tesla_Turret", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Tesla", true )
	ObjectHideSubObjectPermanently( self, "Upgrade_Turret", true )
	ObjectHideSubObjectPermanently( self, "Tanya", true )
end

function OnAlliedAntiAirVehicleTech1Created(self)
	ObjectHideSubObjectPermanently( self, "NEWSKIN_18_BLASTER_RIFLESBASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_18_BLASTER_RIFLES", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_16_GOLDENGUN_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_16_GOLDENGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_15_MACHINEGUNBARRLE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_15_MACHINEGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERBOW", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERMAIDEN_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERMAIDENSTRING", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERUNDER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_13_DESOLATOR", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_12_TESLA_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_12_TESLA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_BARRLESIT", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_COVER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_TURRECENTER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_SNIPER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_10_NINJA_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_10_NINJA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_10_NINJA_STAR", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_09_SHOTGUN02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_09_SHOTGUN01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_09_SHOTGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_08_SPEAKERS", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_HAND03", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_HAND02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_HAND01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_ARM", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_06_CRYO_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_06_CRYO", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_05_PSYONIC_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_05_PSYONIC", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_04_PLASMAIBASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_04_PLASMAINFANTRY", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_04_PLASMA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_02_MISSILETROOPER_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_02_MISSILETROOPER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_BARRLE01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_BARRLE02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_TURRECENTER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_BARRLESIT", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_GUN", true )	
	ObjectHideSubObjectPermanently( self, "NEWSKIN_03_FLAKBARRLE01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_03_FLAKBARRLE02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_03_FLAK", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_COVER", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPRTANYA", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHRTANYA", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIRERTANYA", true )		
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPLTANYA", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHLTANYA", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIRELTANYA", true )		
	ObjectHideSubObjectPermanently( self, "Weapon_FireC", true )
	ObjectHideSubObjectPermanently( self, "Weapon_FlashC", true )
	ObjectHideSubObjectPermanently( self, "Weapon_ImpC", true )		
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPAII", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHAII", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIREAII", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPSC", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHSC", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIRESC", true )	
	ObjectHideSubObjectPermanently( self, "16_AIGBARRLE", true )
	ObjectHideSubObjectPermanently( self, "16_AIGGUN", true )	
	ObjectHideSubObjectPermanently( self, "16_AIGBASE", true )		
	
end

function OnAlliedInfantryFightingCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end

function OnJapanAntiStructureShipCreated(self)
	ObjectHideSubObjectPermanently( self, "Upgrade_01", true )
end

-- this function expects an eventType of 'onDisguiseAs' and checks for various assetIDs, hiding the appropriate subObjects
function OnJapanLightTransportVehicleGenericEvent(self, eventType, data)
	local eTpye = tostring( eventType )
	
	if not eType == "onDisguiseAs" then
		return
	end
	
	local str = tostring( data )
	
	-- this is the assetID of an AlliedAntiAirVehicleTech1
	if str == "3137747290" then
	ObjectHideSubObjectPermanently( self, "NEWSKIN_18_BLASTER_RIFLESBASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_18_BLASTER_RIFLES", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_16_GOLDENGUN_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_16_GOLDENGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_15_MACHINEGUNBARRLE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_15_MACHINEGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERBOW", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERMAIDEN_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERMAIDENSTRING", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_14_ARCHERUNDER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_13_DESOLATOR", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_12_TESLA_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_12_TESLA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_BARRLESIT", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_COVER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_TURRECENTER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_11_NATASHA_SNIPER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_10_NINJA_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_10_NINJA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_10_NINJA_STAR", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_09_SHOTGUN02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_09_SHOTGUN01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_09_SHOTGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_08_SPEAKERS", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_HAND03", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_HAND02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_HAND01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER_ARM", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_07_ENGINEER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_06_CRYO_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_06_CRYO", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_05_PSYONIC_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_05_PSYONIC", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_04_PLASMAIBASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_04_PLASMAINFANTRY", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_04_PLASMA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_02_MISSILETROOPER_BASE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_02_MISSILETROOPER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_BARRLE01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_BARRLE02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_TURRECENTER", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_BARRLESIT", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_GUN", true )	
	ObjectHideSubObjectPermanently( self, "NEWSKIN_03_FLAKBARRLE01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_03_FLAKBARRLE02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_03_FLAK", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_17TANYA_COVER", true )
	-- this is the assetID of a SovietAntiVehicleVehicleTech1
	elseif str == "2494781707" then
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_WHEEL_02", true )
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_WHEEL_01", true )
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_CENTER", true )
	ObjectHideSubObjectPermanently( self, "T4_GRINDER_HOLD", true )	
	ObjectHideSubObjectPermanently( self, "JT8_JGFS_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT11_Titan_BarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "AT11_Titan_BaseSkin", true )
	ObjectHideSubObjectPermanently( self, "AT12_Titan_MissleSkin", true )	
	ObjectHideSubObjectPermanently( self, "AT12_Titan_Missle_BaseSkin", true )		
	ObjectHideSubObjectPermanently( self, "AT10_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT9_AAVS_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT8_BaseSkin", true )
	ObjectHideSubObjectPermanently( self, "AT8_TurretSkin", true )
	ObjectHideSubObjectPermanently( self, "AT7_AFTSkin", true )	
	ObjectHideSubObjectPermanently( self, "AT6_AAVSkin", true )
	ObjectHideSubObjectPermanently( self, "AT5_Skin", true )
	ObjectHideSubObjectPermanently( self, "AT4_AASV_BASE", true )
	ObjectHideSubObjectPermanently( self, "AT3_AAVV1", true )	
	ObjectHideSubObjectPermanently( self, "AT2_IFVSkin", true )
	ObjectHideSubObjectPermanently( self, "AT1_MagSkin", true )
	ObjectHideSubObjectPermanently( self, "AT1_BarrleSkin", true )	
	ObjectHideSubObjectPermanently( self, "AT1_TurretSkin", true )
	ObjectHideSubObjectPermanently( self, "AT1_MinigunSkin", true )
	ObjectHideSubObjectPermanently( self, "JT7_JASS_Skin", true )
	ObjectHideSubObjectPermanently( self, "JT6_JAVV3_Skin", true )	
	ObjectHideSubObjectPermanently( self, "JT5_JWaveForce_Skin", true )		
	ObjectHideSubObjectPermanently( self, "JT4_JSV_AixSkin", true )	
	ObjectHideSubObjectPermanently( self, "JT4_JSV_F_ArmSkin", true )
	ObjectHideSubObjectPermanently( self, "JT4_JSV_HandSkin", true )
	ObjectHideSubObjectPermanently( self, "JT4_JSV_UpArmSkin", true )	
	ObjectHideSubObjectPermanently( self, "JT4_JSV_WeaponSkin", true )		
	ObjectHideSubObjectPermanently( self, "JT3_JAVV1_Skin", true )	
	ObjectHideSubObjectPermanently( self, "JT2_JAVV2_Skin", true )	
	ObjectHideSubObjectPermanently( self, "JT1_JAIV1_Skin", true )
	ObjectHideSubObjectPermanently( self, "T10_Moto_BarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "T10_Moto_baseSkin", true )	
	ObjectHideSubObjectPermanently( self, "T11_SBDG_Base", true )	
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_PIPE", true )	
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_SHELL", true )
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_BARRLE", true )
	ObjectHideSubObjectPermanently( self, "T9_SAVV4_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T8_SAVV3_BARRLE_CENTER", true )	
	ObjectHideSubObjectPermanently( self, "T8_SAVV3_BARRLE", true )
	ObjectHideSubObjectPermanently( self, "T8_SAVV3_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T7_V4_ROCKET", true )
	ObjectHideSubObjectPermanently( self, "T7_V4_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T7_V4_Barrle", true )
	ObjectHideSubObjectPermanently( self, "T7_V4_Hold", true )
	ObjectHideSubObjectPermanently( self, "T7_V4_Hold2", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_08", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_07", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_06", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_05", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_04", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_03", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_02", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_M_01", true )	
	ObjectHideSubObjectPermanently( self, "T6_WALKER_PITCH", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_TURRET", true )
	ObjectHideSubObjectPermanently( self, "T6_WALKER_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T5_TESLA_BARRLE", true )	
	ObjectHideSubObjectPermanently( self, "T5_TESLA_BASE", true )		
	ObjectHideSubObjectPermanently( self, "T3_HT_BARRLE", true )	
	ObjectHideSubObjectPermanently( self, "T3_HT_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_BARRLE02", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_BARRLE01", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_PITCH", true )
	ObjectHideSubObjectPermanently( self, "T2_FLAK_TURRET", true )	
	ObjectHideSubObjectPermanently( self, "T2_FLAK_BASE", true )	
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_PIPE", true )
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_BARRLE", true )	
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_TURRET", true )		
	ObjectHideSubObjectPermanently( self, "T1_FLAMER_BASE", true )	
	ObjectHideSubObjectPermanently( self, "SAVV1_SecTurret", true )	
	ObjectHideSubObjectPermanently( self, "SAVV1_SecBarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "SAVV1_SecTURRET_AddSkin", true )
	ObjectHideSubObjectPermanently( self, "SAVV1_ThrTurret", true )	
	ObjectHideSubObjectPermanently( self, "SAVV1_ThrBarrleSkin", true )
	ObjectHideSubObjectPermanently( self, "SAVV1_ThrTURRET_AddSkin", true )
	end
end


function OnGenericConfig(self)
	ObjectGrantUpgrade( self, "Upgrade_ConfigTrigger" )
end

function OnGenericUpgrade(self)
	ObjectGrantUpgrade( self, "Upgrade_ConfigObjectTrigger01" )
end

function OnJapanAntiVehicleVehicleTech3VETERANReallyDamaged(self)
	ObjectCreateAndFireTempWeapon( self, "JapanAntiVehicleVehicleTech3DebrisWeapon_Verteran" )	
end

function OnJapanAntiVehicleVehicleTech3ReallyDamaged(self)
	ObjectCreateAndFireTempWeapon( self, "JapanAntiVehicleVehicleTech3DebrisWeapon" )	
end

function OnJapanAntiVehicleVehicleTech3Created(self)
	ObjectHideSubObjectPermanently( self, "MISSILEPOD_L", true )
	ObjectHideSubObjectPermanently( self, "MISSILECOVER_L", true )	
	ObjectHideSubObjectPermanently( self, "MWL01", true )
	ObjectHideSubObjectPermanently( self, "MWL02", true )	
	ObjectHideSubObjectPermanently( self, "MWL03", true )
	ObjectHideSubObjectPermanently( self, "MWL04", true )	
	ObjectHideSubObjectPermanently( self, "MWL05", true )
	ObjectHideSubObjectPermanently( self, "MWL06", true )	
	ObjectHideSubObjectPermanently( self, "MWL07", true )	
	ObjectHideSubObjectPermanently( self, "MWL08", true )
	ObjectHideSubObjectPermanently( self, "MWL09", true )		
	ObjectHideSubObjectPermanently( self, "MISSILEPOD_R", true )
	ObjectHideSubObjectPermanently( self, "MISSILECOVER_R", true )	
	ObjectHideSubObjectPermanently( self, "MWR01", true )
	ObjectHideSubObjectPermanently( self, "MWR02", true )	
	ObjectHideSubObjectPermanently( self, "MWR03", true )
	ObjectHideSubObjectPermanently( self, "MWR04", true )	
	ObjectHideSubObjectPermanently( self, "MWR05", true )
	ObjectHideSubObjectPermanently( self, "MWR06", true )	
	ObjectHideSubObjectPermanently( self, "MWR07", true )	
	ObjectHideSubObjectPermanently( self, "MWR08", true )
	ObjectHideSubObjectPermanently( self, "MWR09", true )		
end
function OnJapanAntiVehicleVehicleTech3RED(self)
	ObjectHideSubObjectPermanently( self, "MISSILEPOD_L", false )
	ObjectHideSubObjectPermanently( self, "MISSILECOVER_L", false )	
	ObjectHideSubObjectPermanently( self, "MWL01", false )
	ObjectHideSubObjectPermanently( self, "MWL02", false )	
	ObjectHideSubObjectPermanently( self, "MWL03", false )
	ObjectHideSubObjectPermanently( self, "MWL04", false )	
	ObjectHideSubObjectPermanently( self, "MWL05", false )
	ObjectHideSubObjectPermanently( self, "MWL06", false )	
	ObjectHideSubObjectPermanently( self, "MWL07", false )	
	ObjectHideSubObjectPermanently( self, "MWL08", false )
	ObjectHideSubObjectPermanently( self, "MWL09", false )		
	ObjectHideSubObjectPermanently( self, "MISSILEPOD_R", false )
	ObjectHideSubObjectPermanently( self, "MISSILECOVER_R", false )	
	ObjectHideSubObjectPermanently( self, "MWR01", false )
	ObjectHideSubObjectPermanently( self, "MWR02", false )	
	ObjectHideSubObjectPermanently( self, "MWR03", false )
	ObjectHideSubObjectPermanently( self, "MWR04", false )	
	ObjectHideSubObjectPermanently( self, "MWR05", false )
	ObjectHideSubObjectPermanently( self, "MWR06", false )	
	ObjectHideSubObjectPermanently( self, "MWR07", false )	
	ObjectHideSubObjectPermanently( self, "MWR08", false )
	ObjectHideSubObjectPermanently( self, "MWR09", false )		
end

function OnSubmarineSurfaced(self)
    ObjectDoSpecialPower( self, "SpecialPower_SwitchLocomotor" )
end

function OnBalloonBombSwitchLocomotor(self)
    ObjectDoSpecialPower( self, "SpecialPower_BalloonSwitchLocomotor" )
end


function OnSovietAntiGroundAircraftCreated(self)

	ObjectHideSubObjectPermanently( self, "NEWSKIN_DOGTURRE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_DOGORB", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_DESOLATORGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_DESOLATOR_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_NATASAGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_NATASA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TESLAGUNFX", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TELSA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TESLAGUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_FLAK_BARRLE02", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_FLAK_BARRLE01", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_FLAK_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_FLAK_GUN", true )	
	ObjectHideSubObjectPermanently( self, "NEWSKIN_ARCHER_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_ARCHER_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_AII_BARRLE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_AII_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_AII_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_NIJIA_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_NIJIA_STAR", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_NIJIA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_PSYONIC_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_PSYONIC_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_PLASMA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_PLASMA_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_MISSILE_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_MISSILE_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_CYO_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_CYO_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TANYA_TURRET", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TANYA_BARRLE_R", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TANYA_BARRLE_L", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_TANYA_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_MACHINEGUN_BARRLE", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_MACHINEGUN_GUN", true )
	ObjectHideSubObjectPermanently( self, "NEWSKIN_MACHINEGUN_TURRET", true )
	ObjectHideSubObjectPermanently( self, "Weapon_FireC", true )
	ObjectHideSubObjectPermanently( self, "Weapon_FlashC", true )
	ObjectHideSubObjectPermanently( self, "Weapon_ImpC", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPAII", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHAII", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIREAII", true )		
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPRTANYA", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHRTANYA", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIRERTANYA", true )		
	ObjectHideSubObjectPermanently( self, "WEAPON_IMPLTANYA", true )
	ObjectHideSubObjectPermanently( self, "WEAPON_FLASHLTANYA", true )	
	ObjectHideSubObjectPermanently( self, "WEAPON_FIRELTANYA", true )			
	
end

function OnSAVV4Created(self)

	ObjectHideSubObjectPermanently( self, "ARMOR_L_F_L1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_F_L2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_F_R1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_F_R2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_M_L1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_M_L2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_M_R1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_M_R2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_B_L1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_B_L2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_B_R1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_L_B_R2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_F_L1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_F_L2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_F_R1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_F_R2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_N_L1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_M_L2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_M_R1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_M_R2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_B_L1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_B_L2", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_B_R1", true )
	ObjectHideSubObjectPermanently( self, "ARMOR_R_B_R2", true )
end

function OnSAVV4DeployerLeave(self)
    ObjectDoSpecialPower( self, "SpecialPower_SwitchSDLocomotor" )
end

function OnCommandoLoaded(self)
    ObjectCreateAndFireTempWeapon( self, "CommandoRaderMarkerWeapon" )
end

function OnSovietWallCreated(self)
    ObjectGrantUpgrade( self, "Uprade_SovietWallDetector" )
end

function OnSovietWallSegment(self)
    ObjectRemoveUpgrade( self, "Uprade_SovietWallDetector" )
end

function OnSASSSurfaced(self)
    ObjectDoSpecialPower( self, "SpecialPower_SwitchLocomotor" )
end

function OnSovietCashUpgrade(self)
    ObjectCreateAndFireTempWeapon( self, "SovietWarInsuranceWeapon" )
end

function OnAFASTActive(self)
    ObjectDoSpecialPower( self, "SpecialPower_AFASwitchLocomotor" )
end

function OnSovietTransportAircraftCreated(self)
	ObjectGrantUpgrade( self, "Uprade_SUTAInitially" )
end

function OnSovietBomberAircraftCreated(self)
	ObjectHideSubObjectPermanently( self, "NEWSKIN", true )
	ObjectHideSubObjectPermanently( self, "BOMBS", true )		
end




function OnRemixBoss01Weapon01Launched(self)
	ObjectHideSubObjectPermanently( self, "bitbase01", true )
	ObjectHideSubObjectPermanently( self, "bit01", true )
	ObjectHideSubObjectPermanently( self, "bitbarrle01", true )
	ObjectHideSubObjectPermanently( self, "bitbody01", true )
	ObjectHideSubObjectPermanently( self, "bitarmor01", true )
	ObjectHideSubObjectPermanently( self, "bitarmor02", true )
	ObjectHideSubObjectPermanently( self, "bitarmor03", true )
	ObjectHideSubObjectPermanently( self, "bitarmor04", true )		
	ObjectHideSubObjectPermanently( self, "bitarmor05", true )
	ObjectHideSubObjectPermanently( self, "bitarmor06", true )
	ObjectHideSubObjectPermanently( self, "bitbodyback", true )
	ObjectHideSubObjectPermanently( self, "bitback01", true )
	ObjectHideSubObjectPermanently( self, "bitback01a", true )
	ObjectHideSubObjectPermanently( self, "bitback01b", true )	
	ObjectHideSubObjectPermanently( self, "bitback02", true )
	ObjectHideSubObjectPermanently( self, "bitback02a", true )
	ObjectHideSubObjectPermanently( self, "bitback02b", true )	
	ObjectHideSubObjectPermanently( self, "bitback03", true )
	ObjectHideSubObjectPermanently( self, "bitback03a", true )
	ObjectHideSubObjectPermanently( self, "bitback03b", true )	
	ObjectHideSubObjectPermanently( self, "bitback04", true )
	ObjectHideSubObjectPermanently( self, "bitback04a", true )
	ObjectHideSubObjectPermanently( self, "bitback04b", true )	
	ObjectHideSubObjectPermanently( self, "bitback05", true )
	ObjectHideSubObjectPermanently( self, "bitback05a", true )
	ObjectHideSubObjectPermanently( self, "bitback05b", true )							
	ObjectHideSubObjectPermanently( self, "bitback06", true )
	ObjectHideSubObjectPermanently( self, "bitback06a", true )
	ObjectHideSubObjectPermanently( self, "bitback06b", true )	
	ObjectHideSubObjectPermanently( self, "bitbodyfront01", true )	
	ExecuteAction("NAMED_STOP",self)	
end

function OnRemixBoss01Weapon02Launched(self)
	ObjectHideSubObjectPermanently( self, "bitbase04", true )
	ObjectHideSubObjectPermanently( self, "bit02", true )
	ObjectHideSubObjectPermanently( self, "bitbarrle02", true )
	ObjectHideSubObjectPermanently( self, "bitbody02", true )
	ObjectHideSubObjectPermanently( self, "bitarmor19", true )
	ObjectHideSubObjectPermanently( self, "bitarmor20", true )
	ObjectHideSubObjectPermanently( self, "bitarmor21", true )
	ObjectHideSubObjectPermanently( self, "bitarmor22", true )		
	ObjectHideSubObjectPermanently( self, "bitarmor23", true )
	ObjectHideSubObjectPermanently( self, "bitarmor24", true )
	ObjectHideSubObjectPermanently( self, "bitbodyback03", true )
	ObjectHideSubObjectPermanently( self, "bitback19", true )
	ObjectHideSubObjectPermanently( self, "bitback02a03", true )
	ObjectHideSubObjectPermanently( self, "bitback02b03", true )	
	ObjectHideSubObjectPermanently( self, "bitback20", true )
	ObjectHideSubObjectPermanently( self, "bitback03a03", true )
	ObjectHideSubObjectPermanently( self, "bitback03b03", true )	
	ObjectHideSubObjectPermanently( self, "bitback21", true )
	ObjectHideSubObjectPermanently( self, "bitback04a03", true )
	ObjectHideSubObjectPermanently( self, "bitback04b03", true )	
	ObjectHideSubObjectPermanently( self, "bitback22", true )
	ObjectHideSubObjectPermanently( self, "bitback01a03", true )
	ObjectHideSubObjectPermanently( self, "bitback01b03", true )	
	ObjectHideSubObjectPermanently( self, "bitback23", true )
	ObjectHideSubObjectPermanently( self, "bitback05a03", true )
	ObjectHideSubObjectPermanently( self, "bitback05b03", true )							
	ObjectHideSubObjectPermanently( self, "bitback24", true )
	ObjectHideSubObjectPermanently( self, "bitback06a03", true )
	ObjectHideSubObjectPermanently( self, "bitback06b03", true )	
	ObjectHideSubObjectPermanently( self, "bitbodyfront02", true )	
	ExecuteAction("NAMED_STOP",self)	
end

function OnRemixBoss01Weapon03Launched(self)
	ObjectHideSubObjectPermanently( self, "bitbase05", true )
	ObjectHideSubObjectPermanently( self, "bit05", true )
	ObjectHideSubObjectPermanently( self, "bitbarrle05", true )
	ObjectHideSubObjectPermanently( self, "bitbody05", true )
	ObjectHideSubObjectPermanently( self, "bitarmor25", true )
	ObjectHideSubObjectPermanently( self, "bitarmor26", true )
	ObjectHideSubObjectPermanently( self, "bitarmor27", true )
	ObjectHideSubObjectPermanently( self, "bitarmor28", true )		
	ObjectHideSubObjectPermanently( self, "bitarmor29", true )
	ObjectHideSubObjectPermanently( self, "bitarmor30", true )
	ObjectHideSubObjectPermanently( self, "bitbodyback04", true )
	ObjectHideSubObjectPermanently( self, "bitback25", true )
	ObjectHideSubObjectPermanently( self, "bitback03a04", true )
	ObjectHideSubObjectPermanently( self, "bitback03b04", true )	
	ObjectHideSubObjectPermanently( self, "bitback26", true )
	ObjectHideSubObjectPermanently( self, "bitback04b04", true )
	ObjectHideSubObjectPermanently( self, "bitback04a04", true )	
	ObjectHideSubObjectPermanently( self, "bitback27", true )
	ObjectHideSubObjectPermanently( self, "bitback05a04", true )
	ObjectHideSubObjectPermanently( self, "bitback05b04", true )	
	ObjectHideSubObjectPermanently( self, "bitback28", true )
	ObjectHideSubObjectPermanently( self, "bitback01a04", true )
	ObjectHideSubObjectPermanently( self, "bitback01b04", true )	
	ObjectHideSubObjectPermanently( self, "bitback29", true )
	ObjectHideSubObjectPermanently( self, "bitback02a04", true )
	ObjectHideSubObjectPermanently( self, "bitback02b04", true )		
	ObjectHideSubObjectPermanently( self, "bitback30", true )
	ObjectHideSubObjectPermanently( self, "bitback06a04", true )
	ObjectHideSubObjectPermanently( self, "bitback06b04", true )	
	ObjectHideSubObjectPermanently( self, "bitbodyfront03", true )
	ExecuteAction("NAMED_STOP",self)
end	


function OnRemixBoss01Out(self)
	ObjectHideSubObjectPermanently( self, "bitbase01", false )
	ObjectHideSubObjectPermanently( self, "bit01", false )
	ObjectHideSubObjectPermanently( self, "bitbarrle01", false )
	ObjectHideSubObjectPermanently( self, "bitbody01", false )
	ObjectHideSubObjectPermanently( self, "bitarmor01", false )
	ObjectHideSubObjectPermanently( self, "bitarmor02", false )
	ObjectHideSubObjectPermanently( self, "bitarmor03", false )
	ObjectHideSubObjectPermanently( self, "bitarmor04", false )		
	ObjectHideSubObjectPermanently( self, "bitarmor05", false )
	ObjectHideSubObjectPermanently( self, "bitarmor06", false )
	ObjectHideSubObjectPermanently( self, "bitbodyback", false )
	ObjectHideSubObjectPermanently( self, "bitback01", false )
	ObjectHideSubObjectPermanently( self, "bitback01a", false )
	ObjectHideSubObjectPermanently( self, "bitback01b", false )	
	ObjectHideSubObjectPermanently( self, "bitback02", false )
	ObjectHideSubObjectPermanently( self, "bitback02a", false )
	ObjectHideSubObjectPermanently( self, "bitback02b", false )	
	ObjectHideSubObjectPermanently( self, "bitback03", false )
	ObjectHideSubObjectPermanently( self, "bitback03a", false )
	ObjectHideSubObjectPermanently( self, "bitback03b", false )	
	ObjectHideSubObjectPermanently( self, "bitback04", false )
	ObjectHideSubObjectPermanently( self, "bitback04a", false )
	ObjectHideSubObjectPermanently( self, "bitback04b", false )	
	ObjectHideSubObjectPermanently( self, "bitback05", false )
	ObjectHideSubObjectPermanently( self, "bitback05a", false )
	ObjectHideSubObjectPermanently( self, "bitback05b", false )							
	ObjectHideSubObjectPermanently( self, "bitback06", false )
	ObjectHideSubObjectPermanently( self, "bitback06a", false )
	ObjectHideSubObjectPermanently( self, "bitback06b", false )	
	ObjectHideSubObjectPermanently( self, "bitbodyfront01", false )
	ObjectHideSubObjectPermanently( self, "bitbase04", false )
	ObjectHideSubObjectPermanently( self, "bit02", false )
	ObjectHideSubObjectPermanently( self, "bitbarrle02", false )
	ObjectHideSubObjectPermanently( self, "bitbody02", false )
	ObjectHideSubObjectPermanently( self, "bitarmor19", false )
	ObjectHideSubObjectPermanently( self, "bitarmor20", false )
	ObjectHideSubObjectPermanently( self, "bitarmor21", false )
	ObjectHideSubObjectPermanently( self, "bitarmor22", false )		
	ObjectHideSubObjectPermanently( self, "bitarmor23", false )
	ObjectHideSubObjectPermanently( self, "bitarmor24", false )
	ObjectHideSubObjectPermanently( self, "bitbodyback03", false )
	ObjectHideSubObjectPermanently( self, "bitback19", false )
	ObjectHideSubObjectPermanently( self, "bitback02a03", false )
	ObjectHideSubObjectPermanently( self, "bitback02b03", false )	
	ObjectHideSubObjectPermanently( self, "bitback20", false )
	ObjectHideSubObjectPermanently( self, "bitback03a03", false )
	ObjectHideSubObjectPermanently( self, "bitback03b03", false )	
	ObjectHideSubObjectPermanently( self, "bitback21", false )
	ObjectHideSubObjectPermanently( self, "bitback04a03", false )
	ObjectHideSubObjectPermanently( self, "bitback04b03", false )	
	ObjectHideSubObjectPermanently( self, "bitback22", false )
	ObjectHideSubObjectPermanently( self, "bitback01a03", false )
	ObjectHideSubObjectPermanently( self, "bitback01b03", false )	
	ObjectHideSubObjectPermanently( self, "bitback23", false )
	ObjectHideSubObjectPermanently( self, "bitback05a03", false )
	ObjectHideSubObjectPermanently( self, "bitback05b03", false )							
	ObjectHideSubObjectPermanently( self, "bitback24", false )
	ObjectHideSubObjectPermanently( self, "bitback06a03", false )
	ObjectHideSubObjectPermanently( self, "bitback06b03", false )	
	ObjectHideSubObjectPermanently( self, "bitbodyfront02", false )	
	ObjectHideSubObjectPermanently( self, "bitbase05", false )
	ObjectHideSubObjectPermanently( self, "bit05", false )
	ObjectHideSubObjectPermanently( self, "bitbarrle05", false )
	ObjectHideSubObjectPermanently( self, "bitbody05", false )
	ObjectHideSubObjectPermanently( self, "bitarmor25", false )
	ObjectHideSubObjectPermanently( self, "bitarmor26", false )
	ObjectHideSubObjectPermanently( self, "bitarmor27", false )
	ObjectHideSubObjectPermanently( self, "bitarmor28", false )		
	ObjectHideSubObjectPermanently( self, "bitarmor29", false )
	ObjectHideSubObjectPermanently( self, "bitarmor30", false )
	ObjectHideSubObjectPermanently( self, "bitbodyback04", false )
	ObjectHideSubObjectPermanently( self, "bitback25", false )
	ObjectHideSubObjectPermanently( self, "bitback03a04", false )
	ObjectHideSubObjectPermanently( self, "bitback03b04", false )	
	ObjectHideSubObjectPermanently( self, "bitback26", false )
	ObjectHideSubObjectPermanently( self, "bitback04b04", false )
	ObjectHideSubObjectPermanently( self, "bitback04a04", false )	
	ObjectHideSubObjectPermanently( self, "bitback27", false )
	ObjectHideSubObjectPermanently( self, "bitback05a04", false )
	ObjectHideSubObjectPermanently( self, "bitback05b04", false )	
	ObjectHideSubObjectPermanently( self, "bitback28", false )
	ObjectHideSubObjectPermanently( self, "bitback01a04", false )
	ObjectHideSubObjectPermanently( self, "bitback01b04", false )	
	ObjectHideSubObjectPermanently( self, "bitback29", false )
	ObjectHideSubObjectPermanently( self, "bitback02a04", false )
	ObjectHideSubObjectPermanently( self, "bitback02b04", false )		
	ObjectHideSubObjectPermanently( self, "bitback30", false )
	ObjectHideSubObjectPermanently( self, "bitback06a04", false )
	ObjectHideSubObjectPermanently( self, "bitback06b04", false )	
	ObjectHideSubObjectPermanently( self, "bitbodyfront03", false )
end

function OnRemixBoss01NoAmo(self)
    ObjectDoSpecialPower( self, "SpecialPower_RemixBoss01_Transform" )
end

function RemixBoss01OrbCreated(self)
	ObjectHideSubObjectPermanently( self, "SPHERE03", true )
	ObjectHideSubObjectPermanently( self, "SPHERE02", true )
end

function OnRemixBossDamaged(self)
	ObjectCreateAndFireTempWeapon( self, "RemixBossDamagedBuffWeapon" )
end

function OnRemixBossReallyDamaged(self)
	ObjectCreateAndFireTempWeapon( self, "RemixBossReallyDamagedBuffWeapon" )
end

function OnRemixBoss01Reset(self)
	ExecuteAction("NAMED_STOP",self)
end



function Remix_Car06TanyaCreated(self)
	ObjectHideSubObjectPermanently( self, "TANYA", true )
	ObjectGrantUpgrade(self,"Uprade_RemixCarNoDriver")	
end

function Remix_Car06TanyaLoaded(self)
	ObjectRemoveUpgrade(self,"Uprade_RemixCarNoDriver")	
end

function Remix_Car06TanyaUnLoaded(self)
	ObjectGrantUpgrade(self,"Uprade_RemixCarNoDriver")	
end

function Remix_Car07YurikoCreated(self)
	ObjectHideSubObjectPermanently( self, "YURIKO", true )
	ObjectGrantUpgrade(self,"Uprade_RemixCarNoDriver")	
end

function Remix_Car07YurikoLoaded(self)
	ObjectRemoveUpgrade(self,"Uprade_RemixCarNoDriver")	
end

function Remix_Car07YurikoUnLoaded(self)
	ObjectGrantUpgrade(self,"Uprade_RemixCarNoDriver")	
end


function Remix_Car08NatashaCreated(self)
	ObjectHideSubObjectPermanently( self, "NATASHA", true )
	ObjectHideSubObjectPermanently( self, "GUN", true )
	ObjectHideSubObjectPermanently( self, "GLASS", true )	
	ObjectGrantUpgrade(self,"Uprade_RemixCarNoDriver")	
end

function Remix_Car08NatashaLoaded(self)
	ObjectRemoveUpgrade(self,"Uprade_RemixCarNoDriver")	
    ObjectCreateAndFireTempWeapon( self, "CommandoRaderMarkerWeapon" )	
end

function Remix_08NatashaUnLoaded(self)
	ObjectRemoveUpgrade(self,"Upgrade_Veterancy_VETERAN")	
	ObjectRemoveUpgrade(self,"Upgrade_Veterancy_ELITE")	
	ObjectRemoveUpgrade(self,"Upgrade_Veterancy_HEROIC")	
	ObjectRemoveUpgrade(self,"Upgrade_CreationVeterancy_VETERAN")	
	ObjectRemoveUpgrade(self,"Upgrade_CreationVeterancy_ELITE")	
	ObjectRemoveUpgrade(self,"Upgrade_CreationVeterancy_HEROIC")		
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietNatashaMotoExperienceLevel_1")
	ObjectGrantUpgrade(self,"Uprade_RemixCarNoDriver")
end

function Remix_GetLvUpVeteran(self)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietNatashaMotoExperienceLevel_2")	
end

function Remix_GetLvUpElite(self)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietNatashaMotoExperienceLevel_3")		
end

function Remix_GetLvUpHeroic(self)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietNatashaMotoExperienceLevel_4")	
end

function OnSCT1MotoGetVeteran(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSCT1MotoSynWeaponLv1" )
end

function OnSCT1MotoGetElite(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSCT1MotoSynWeaponLv2" )
end

function OnSCT1MotoGetHeroic(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSCT1MotoSynWeaponLv3" )	
end


function JUASSPJMagnetized(self)
	ObjectHideSubObjectPermanently( self, "GROW", true )
end

function AlliedLegionnaireInfantryupgLand(self)
    ObjectCreateAndFireTempWeapon( self, "AlliedLegionnaireInfantryLandWeapon" )
end

function RemixWallDown(self)
    ObjectCreateAndFireTempWeapon( self, "NyFortWallUnBlockWeapon" )
end

function RemixWallUp(self)
    ObjectCreateAndFireTempWeapon( self, "NyFortWallBlockWeapon" )
end

function OnAlliedAIIRCReallyDamaged(self)
    ObjectDoSpecialPower( self, "SpecialPower_ToggleRiotShield" )
end

function OnRemixGhoulDamaged(self)
    ObjectCreateAndFireTempWeapon( self, "Remix_GhoulDamageWeapon" )
end

function OnRemixGhoulReallyDamaged(self)
    ObjectCreateAndFireTempWeapon( self, "Remix_GhoulReallyDamageWeapon" )
end

function OnRemixGhoulEnraged(self)
    ObjectCreateAndFireTempWeapon( self, "Remix_GhoulEnragedWeapon" )
end

function OnJPTransFormationTakeOff(self)
    ObjectCreateAndFireTempWeapon( self, "JPTransformationRefreshTargetWeapon" )
end

function OnSUTeslaUnCharged(self)
	ExecuteAction("NAMED_STOP",self)
end

function OnTeslaOverPower(self)
	ObjectCreateAndFireTempWeapon( self, "SovietTeslaOverPowerWeapon" )
end

function OnTitanCreated(self)
	ObjectHideSubObjectPermanently( self, "weaponbak_ltop", true )
	ObjectHideSubObjectPermanently( self, "weaponbak_l", true )
	ObjectHideSubObjectPermanently( self, "weaponRec_l", true )
end



function OnSurvivorPick1911(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSurvivorWeaponUnAttach44" )
end

function OnSurvivorPick44(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSurvivorWeaponUnAttach1911" )
end



function OnSurvivorPickHelmet1(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSurvivorWeaponUnAttachHelmet2" )
end

function OnSurvivorPickHelmet2(self)
	ObjectCreateAndFireTempWeapon( self, "RemixSurvivorWeaponUnAttachHelmet1" )
end

function OnSurvivorPickWaterUpgrade(self)
    ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorToggleWaterLocomotor" )
end

function OnSurvivorPickWaterUpgradeRemove(self)
    ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorToggleWaterLocomotor" )
end

function OnSurvivorCreated(self)
	ObjectHideSubObjectPermanently( self, "WATERE", true )
end


function OnSurvivorPickAmmo1(self)
	ObjectGrantUpgrade( self, "Uprade_SurvivorAmmo1" )
end

function OnSurvivorPickAmmo2(self)
	ObjectGrantUpgrade( self, "Uprade_SurvivorAmmo2" )
end

function OnSurvivorPickAmmo3(self)
	ObjectGrantUpgrade( self, "Uprade_SurvivorAmmo3" )
end

function OnSurvivorPickAmmo4(self)
	ObjectGrantUpgrade( self, "Uprade_SurvivorAmmo4" )
end



function OnSurvivorReload1911(self)
	if ObjectHasUpgrade( self, "Uprade_SurvivorAmmo4" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon4" )
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo4" ) 
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon1911" )		
	elseif 	ObjectHasUpgrade( self, "Uprade_SurvivorAmmo3" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon3" )
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo3" )
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )	
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon1911" )				
	elseif 	ObjectHasUpgrade( self, "Uprade_SurvivorAmmo2" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon2" )
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo2" )
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )	
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon1911" )				
	elseif 	ObjectHasUpgrade( self, "Uprade_SurvivorAmmo1" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon1" )	
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo1" )
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )	
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon1911" )				
	end		
end

function OnSurvivorReload44(self)
	if ObjectHasUpgrade( self, "Uprade_SurvivorAmmo4" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon4" )
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo4" ) 
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon44" )				
	elseif 	ObjectHasUpgrade( self, "Uprade_SurvivorAmmo3" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon3" )
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo3" )
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )	
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon44" )			
	elseif 	ObjectHasUpgrade( self, "Uprade_SurvivorAmmo2" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon2" )
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo2" )
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )	
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon44" )			
	elseif 	ObjectHasUpgrade( self, "Uprade_SurvivorAmmo1" ) == 1 then
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorRemoveAmmoShowtipWeapon1" )	
		ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmo1" )
		ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorReloadWeapon" )
		ObjectCreateAndFireTempWeapon( self, "RemixSurvivorReloadHoldWeapon44" )			
	end		
end

function OnSurvivorFiringA(self)
    ObjectCreateAndFireTempWeapon( self, "RemixSurvivorAmmoCountAttachWeapon1911" )
end

function OnSurvivorFiringB(self)
    ObjectCreateAndFireTempWeapon( self, "RemixSurvivorAmmoCountAttachWeapon44" )
end

function OnSurvivorPickFourLeaf(self)
	ObjectGrantUpgrade( self, "Uprade_SurvivorFourLeaf" )
end

function OnAmmoCounterCal1911(self)
    ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorAmmoCount1911" )
    ObjectCreateAndFireTempWeapon( self, "RemixSurvivorWeaponFireSound1911" )	
end

function OnAmmoCounterCal44(self)
    ObjectDoSpecialPower( self, "SpecialPower_RemixSurvivorAmmoCount44" )
    ObjectCreateAndFireTempWeapon( self, "RemixSurvivorWeaponFireSound44" )		
end

function OnAmmoCounterReload(self)
    ObjectCreateAndFireTempWeapon( self, "RemixSurvivorAmmoCountAttachReloadingCallWeapon" )
end

function OnSurvivorAmmoCounterReset(self)
    ObjectCreateAndFireTempWeapon( self, "RemixSurvivorInitAttachCounterWeapon" )
end

function OnRemixSurvivorAmmoShowTipSwithCreated(self)
	ObjectHideSubObjectPermanently( self, "Ammo19111", true )
	ObjectHideSubObjectPermanently( self, "Ammo19112", true )
	ObjectHideSubObjectPermanently( self, "Ammo19113", true )
	ObjectHideSubObjectPermanently( self, "Ammo19114", true )
	ObjectHideSubObjectPermanently( self, "Ammo441", true )
	ObjectHideSubObjectPermanently( self, "Ammo442", true )
	ObjectHideSubObjectPermanently( self, "Ammo443", true )
	ObjectHideSubObjectPermanently( self, "Ammo444", true )
end

function OnAmmoShowTipSwith1911(self)
    ObjectGrantUpgrade( self, "Uprade_SurvivorAmmoShowTip1911" )
	ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmoShowTip44" )	
end

function OnAmmoShowTipSwith44(self)
    ObjectGrantUpgrade( self, "Uprade_SurvivorAmmoShowTip44" )
	ObjectRemoveUpgrade( self, "Uprade_SurvivorAmmoShowTip1911" )	
end

function OnSovietWarningBeaconCreated(self)
	ExecuteAction( "OBJECT_CREATE_RADAR_EVENT",self,"Construction" )	
end

function OnJapanNanoFinish(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_UNIT",self,"Command_JapanNanoAttackSpecialPower")
end

function OnJapanNanoStart(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_KINDOF",self,"Command_AttackMove","STRUCTURE")	
end

function OnJapanNanoStart2(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_KINDOF",self,"Command_AttackMove","STRUCTURE")	
end

function OnJSVVet(self)
	ObjectHideSubObjectPermanently( self, "FXBLADE", true )
end

function OnHurricanUpgrade(self)
	ObjectGrantUpgrade( self, "Upgrade_HurricaneInitialize" )
end

function OnJAVVT3Running(self)
    ObjectCreateAndFireTempWeapon( self, "JAVV3RunNoCommandWeapon" )
end

function OnJNMHit1(self)
    ObjectCreateAndFireTempWeapon( self, "JNMHitWeapon1" )		
end

function OnJNMHit2(self)
    ObjectCreateAndFireTempWeapon( self, "JNMHitWeapon2" )		
end

function OnJNMHit3(self)
    ObjectCreateAndFireTempWeapon( self, "JNMHitWeapon3" )		
end
	
function OnABPPToggleMoeny(self)
    ObjectCreateAndFireTempWeapon( self, "AlliedPowerMoneyWeapon" )		
end


function OnJapanNijiaMachaTimerStart(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",self,"Command_JNMTimerUpgrade")	
end

function OnJapanIzumiTimerStart(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",self,"Command_JapanIzumiTimerUpgrade")	
end

function OnJapanIzumiTimerGo(self)
    ExecuteAction("NAMED_RECEIVE_UPGRADE",self,"Upgrade_JIzumiTimer")	
end



function OnJAVVT3RunningHitT1(self)
	ObjectCreateAndFireTempWeapon( self, "JAVV3CollideWeaponT1" )
end

function OnJAVVT3RunningHitT2(self)
	ObjectCreateAndFireTempWeapon( self, "JAVV3CollideWeaponT2" )
end

function OnJAVVT3RunningHitT3(self)
	ObjectCreateAndFireTempWeapon( self, "JAVV3CollideWeaponT3" )
end

function OnJAVVT3RunningHitT4(self)
	ObjectCreateAndFireTempWeapon( self, "JAVV3CollideWeaponSTRUCTURE" )
end

function OnRemixMissileVehicleDropCover(self)
	ObjectCreateAndFireTempWeapon( self, "RemixMissileVehicleDropCoverWeapon" )
end

function OnABAirfieldUpgA1(self)
	ObjectGrantUpgrade( self, "ABAirFieldUpgradeComA1" )
end

function OnABAirfieldUpgA2(self)
	ObjectGrantUpgrade( self, "ABAirFieldUpgradeComA2" )
end

function OnABAirfieldUpgA3(self)
	ObjectRemoveUpgrade(self,"ABAirFieldUpgradeComA1")
	ObjectRemoveUpgrade(self,"ABAirFieldUpgradeComA2")	
	ObjectGrantUpgrade( self, "ABAirFieldUpgradeComA3" )
end

function OnRZSUHAVIHit(self)
    ObjectCreateAndFireTempWeapon( self, "RZSUHAVIArmorDamageChooseWeapon" )		
end

function OnRZSUHAVIHit1(self)
    ObjectCreateAndFireTempWeapon( self, "RZSUHAVIHitWeapon1" )		
end

function OnRZSUHAVIHit2(self)
    ObjectCreateAndFireTempWeapon( self, "RZSUHAVIHitWeapon2" )		
end

function OnRZSUHAVIHit3(self)
    ObjectCreateAndFireTempWeapon( self, "RZSUHAVIHitWeapon3" )		
end

function OnRZSUHAVIArmmorOff(self)
    ObjectDoSpecialPower( self, "SpecialPower_RZSUHAVIArmChangeWeapon" )
end

function OnHeadShotChance1(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulHeadShotChooseWeapon1" )
end

function OnHeadShotChance2(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulHeadShotChooseWeapon2" )
end

function OnHeadShotChance3(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulHeadShotChooseWeapon3" )
end

function OnSUAVIHeadShotChance(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulSUAVIHeadShotChooseWeapon" )
end

function OnSUAVIHeadShotChanceCrawl(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulSUAVIHeadShotChooseWeaponCrawl" )
end

function OnSUAVIHatoff(self)
	ObjectGrantUpgrade( self, "Upgrade_RZSUAVIHatOff" )
end

function OnAUAIIHatRemove(self)
    ObjectDoSpecialPower( self, "SpecialPower_RemixZombiesAAIIArmorLow" )
	ObjectGrantUpgrade( self, "Upgrade_RZAUAIIHatOff" )	
end

function OnAUAIIHeadShotChance(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulAUAIIHeadShotChooseWeapon" )
end

function OnAUAIIHeadShotChanceCrawl(self)
    ObjectCreateAndFireTempWeapon( self, "RemixGhoulAUAIIHeadShotChooseWeaponCrawl" )
end

function OnSUHAVIArmOff1(self)
	ObjectGrantUpgrade( self, "Upgrade_RZSUHAVIShouderOff" )
end

function OnSUHAVIArmOff2(self)
	ObjectGrantUpgrade( self, "Upgrade_RZSUHAVIHelmetOff" )
end

function OnSUHAVIArmOff3(self)
	ObjectGrantUpgrade( self, "Upgrade_RZSUHAVIChestOff" )
end

function OnSUHAVIArmOff4(self)
	ObjectGrantUpgrade( self, "Upgrade_RZSUHAVIChestFOff" )
end

function OnSAVV4Block(self)
    ObjectCreateAndFireTempWeapon( self, "SAVV4BlockWeapon" )
end

function OnAlliedArtilleryVehicleBlock(self)
    ObjectCreateAndFireTempWeapon( self, "AlliedArtilleryVehicleBlockWeapon" )
end

function OnABAUnPowered(self)
	ExecuteAction("NAMED_STOP",self)
end

function OnPanicEnd(self)
    ObjectDoSpecialPower( self, "SpecialPower_AnimalChangeLocomotor" )
end

function OnAinmalPanic(self)
    ObjectDoSpecialPower( self, "SpecialPower_AnimalChangeLocomotor" )
end


function OnCivilianPanicEnd(self)
    ObjectDoSpecialPower( self, "SpecialPower_CivilianChangeLocomotor" )
end

function OnCivilianPanic(self)
    ObjectDoSpecialPower( self, "SpecialPower_CivilianChangeLocomotor" )
end

function OnBCStealthDetect(self)
	ObjectGrantUpgrade(self,"Uprade_BuildingStealthDetect")	
end

function OnSharkEnraged(self)
	ObjectCreateAndFireTempWeapon( self, "RESharkSpeedWeapon" )
end

function OnRepairDroneMoving(self)
	ObjectCreateAndFireTempWeapon( self, "RepairDroneMoveStateWeapon" )
end

function OnRepairDroneStop(self)
	ObjectCreateAndFireTempWeapon( self, "RepairDroneStopStateWeapon" )
end

function onSMCVTransToCY(self)
	ObjectCreateAndFireTempWeapon( self, "SovietConstructionYardAttachKillWeapon" )
end

function OnJUGFSAirDieStart(self)
	ObjectHideSubObjectPermanently( self, "BONE_D_01", true )
	ObjectHideSubObjectPermanently( self, "BONE_D_02", true )		
	ObjectHideSubObjectPermanently( self, "BONE_D_13", true )	
end

function OnJUGFSAirDieEnd(self)
	ObjectHideSubObjectPermanently( self, "BONE_D_12", true )
	ObjectHideSubObjectPermanently( self, "BONE_D_11", true )
	ObjectHideSubObjectPermanently( self, "BONE_D_10", true )	
	ObjectHideSubObjectPermanently( self, "BONE_D_05", true )	
	ObjectHideSubObjectPermanently( self, "BONE_D_16", true )	
	ObjectHideSubObjectPermanently( self, "BONE_D_17", true )		
end

function OnSANS2Surfaced(self)
    ObjectCreateAndFireTempWeapon( self, "SANS2SurfacedModelStateWeapon" )		
end

function OnAlliedAntiStructureShipCreated(self)
	ObjectHideSubObjectPermanently( self, "AASS_DOOR", true )
end

function SUAntiInfantryVehicleCreated(self)
	ObjectHideSubObjectPermanently( self, "OILCANS", true )
	ObjectHideSubObjectPermanently( self, "SUAIVVARMOR", true )
end

function SovietHeavyAntiVehicleInfantryCreated(self)
	ObjectHideSubObjectPermanently( self, "HEADCOVER", true )
end

function SovietScoutInfantryCreated(self)
	ObjectHideSubObjectPermanently( self, "ASHODERL", true )
	ObjectHideSubObjectPermanently( self, "ASHODERR", true )
	ObjectHideSubObjectPermanently( self, "AHEAD", true )
	ObjectHideSubObjectPermanently( self, "CLAWL", true )
	ObjectHideSubObjectPermanently( self, "CLAWR", true )
	ObjectHideSubObjectPermanently( self, "ABODY", true )
	ObjectHideSubObjectPermanently( self, "ANECK", true )	
end

function SovietAntiNavyShipTech1Created(self)
	ObjectHideSubObjectPermanently( self, "TORPEDO_REC02", true )
	ObjectHideSubObjectPermanently( self, "TORPEDO_REC01", true )
	ObjectHideSubObjectPermanently( self, "VETADD", true )
end

function SovietAntiNavyShipTech1Vet(self)
    ObjectDoSpecialPower( self, "SpecialPower_SANS1VetLocomotor" )
end

function SovietGrinderVehicleCreated(self)
	ObjectHideSubObjectPermanently( self, "BACKARM", true )
end

function OnSCT1InsideUpgradeLv1(self)
		ObjectCreateAndFireTempWeapon( self, "RemixSCT1SynWeaponLv1" )
end

function OnSCT1InsideUpgradeLv2(self)
		ObjectCreateAndFireTempWeapon( self, "RemixSCT1SynWeaponLv2" )
end

function OnSCT1InsideUpgradeLv3(self)
		ObjectCreateAndFireTempWeapon( self, "RemixSCT1SynWeaponLv3" )	
end

function OnSCT1GetMotoLv1(self)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietCommandoTech1ExperienceLevel_2")	
end

function OnSCT1GetMotoLv2(self)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietCommandoTech1ExperienceLevel_3")		
end

function OnSCT1GetMotoLv3(self)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",self,"SovietCommandoTech1ExperienceLevel_4")	
end

function OnSCT1MotoEvacuate(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",self,"Command_Evacuate")		
end

function OnSCT1IRONCURTAIN(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",self,"Command_Evacuate")
	ObjectCreateAndFireTempWeapon( self, "SUSCT1MotoDeath_IronCurtainEffectWeapon" )	
end

function OnSCT1MotoFROZEN(self)
    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",self,"Command_Evacuate")
	ObjectCreateAndFireTempWeapon( self, "SUSCT1MotoDeath_FrozenWeapon" )	
	ExecuteAction("NAMED_STOP",self)
end