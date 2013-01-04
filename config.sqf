//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

//Admin menu access levels
moderators = ["32077894", //Krykiln
				"87053254", //Shaneyport
				"8626566", //Teacup
				"1279378", //Bane
				"3450176", //Derpy
				"73698182", //unDead
				"59344390", //Ian
				"38204230", //JellaFish
				"2771014", //MiniDude
                "91598150", //Rainforger
                "klauS"
               	]; 
            
administrators = ["18519302", //Venny
					"57199878", //Garey
                    "13472326", //Delite
					"bombeh"];

serverAdministrators = ["18836358", //Tom
					"19714694", //pulse
					"20243782", //Dom
					"32879878"]; //Ally
      
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\

//Client Vars
playerSetupComplete = false;
                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray = [
	["AK-74","AK_74",50,25],
	["AK-107 Kobra","AK_107_kobra",75,35],
	["AKM","AK_47_M",75,35],
    ["M16A4","M16A4",75,35],
    ["M4A1","M4A1",50,25],
    ["M4A1 CCO","M4A1_Aim",100,55],
    ["M1014","M1014",50,25],
    ["Saiga 12K","Saiga12K",100,55],
    ["M249","M249_EP1",250,120],
    ["Mk_48 Mod","Mk_48",250,140],
    ["M240","M240",250,120],
    ["Pecheneg","Pecheneg",250,100],
    ["RPG-7","RPG7V",300,130],
    ["SMAW","SMAW",300,175],
    ["Stinger","Stinger",1000,550],
    ["Javelin","Javelin",1500,750],
    ["Mk12 SPR","M4SPR",200,120],
    ["Mk17 Sniper","SCAR_H_LNG_Sniper",500,233],
    ["Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",750,455],
    ["M110 NV","M110_NVG_EP1",1000,666],
    ["Mk17 Sniper TWS","SCAR_H_STD_TWS_SD",1500,755],
    ["M107","m107",2000,850],
    ["M110 TWS","M110_TWS_EP1",2500,1000]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["30Rnd AK","30Rnd_545x39_AK",10],
	["AKM Mag","30Rnd_762x39_AK47",10],
	["30Rnd. STANAG","30Rnd_556x45_Stanag",10],
    ["30Rnd. STANAG SD","30Rnd_556x45_StanagSD",30],
    ["Mk17 Mag.","20Rnd_762x51_B_SCAR",25],
	["Mk17 SD Mag.","20Rnd_762x51_SB_SCAR",50],
	["10Rnd. M107","10Rnd_127x99_m107",50],
	["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",10],
	["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",10],
	["200Rnd. M249 Belt","200Rnd_556x45_M249",50],
	["100Rnd. M240","100Rnd_762x51_M240",25],
	["PKM Mag.","100Rnd_762x54_PK",25],
    ["PG-7V.","PG7V",85],
    ["SMAW-HEAA","SMAW_HEAA",100],
    ["Stinger Ammo","Stinger",225],
    ["Javelin Ammo","Javelin",250]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["Range Finder","Binocular_Vector",500],
	["NV Goggles","NVGoggles",100],
    ["GPS","ItemGPS", 90]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",3000,1500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]  
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_0",450,"Feruz Abad"],
		["Town_1",200,"Falar"],
		["Town_2",200,"Bastam"],
		["Town_3",600,"Rasman"],
		["Town_4",200,"Sagram"],			
		["Town_5",200,"Zavarak"],
		["Town_6",250,"Karachinar"],
		["Town_7",200,"Ravanay"],
		["Town_8",500,"Garmsar"],
		["Town_9",350,"Garmarud"],
		["Town_10",250,"Imarat"],
		["Town_11",200,"Timurkalay"],
		["Town_12",200,"Hazar Bagh"],
		["Town_13",300,"Chardarakht"],
		["Town_14",300,"Jaza"],
		["Town_15",200,"Loy Manara"],
		["Town_16",200,"Huzrutimam"],
		["Town_17",300,"Sultansafe"],
		["Town_18",300,"Chak Chak"],
		["Town_19",200,"Ahmaday"],
		["Town_20",200,"Landay"],
		["Town_21",300,"Sakhe Northside"],
		["Town_22",300,"Sakhe Southside"],
		["Town_23",200,"Shukurkalay"],
		["Town_24",300,"Chaman Southside"],
		["Town_25",300,"Chaman Northside"],
		["Town_26",200,"Jilavur"],
		["Town_27",200,"Khushab"],
		["Town_28",200,"Mulladost"],
		["Town_29",200,"Gospandi"],
		["Town_30",200,"Lalezar"],
		["Town_31",200,"Nagara"],
		["Town_32",300,"Nur"],
		["Town_33",300,"Nagara Oilfield"],
		["Town_34",200,"Shamali"],
		["Town_35",200,"Kakaru"],
		["Town_36",200,"Anar"]
];
cityLocations = [];
