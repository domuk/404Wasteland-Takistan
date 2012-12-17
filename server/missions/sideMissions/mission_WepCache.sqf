//	@file Version: 1.0
//	@file Name: mission_WepCache.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

//Side Mission Colour = #4BC9B0 - Turquoise 
//Main Mission Colour = #52bf90 - Light blue
//Fail Mission Colour = #FF1717 - Light red
//Fail Mission Colour = #17FF41 - Light green
//Sub Colour = #FFF - White

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_playerPresent","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_picture","_vehicleName","_rad","_centerPos","_missionTimeOut","_missionDelayTime","_missionTriggerRadius","_missionPlayerRadius","_flatAreas","_randomArea","_hint","_startTime","_currTime","_result","_box","_box2"];

//Mission Initialization.
_rad=20000;
_missionType = "Supply Drop";
_mainTextColour = "#4BC9B0";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 30;
_missionDelayTime = 10;
_missionPlayerRadius = 50;
_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_flatAreas = nearestLocations [_centerPos, ["FlatArea"], _rad];
_randomPos = getpos (_flatAreas select random (count _flatAreas -1));

if(str(mainMissionPos) == str(_randomPos)) then
{
	_flatAreas = _flatAreas - _randomPos;    
};
_randomPos = getpos (_flatAreas select random (count _flatAreas -1));
sideMissionPos = str(_randomPos);

//Tell everyone their will be a mission soon.
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", _missionDelayTime, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

//Wait till the mission is ready to be ran.
diag_log format["WASTELAND SERVER - Mission Waiting to run"];
_startTime = currentTime;
waitUntil
{ 
    _currTime = currentTime;
    _result = [_currTime, _startTime, _missionDelayTime] call compareTime;
    (_result == 1)
};
diag_log format["WASTELAND SERVER - Mission Resumed"];
_result = 0;

//Add marker to client marker array.
clientMissionMarkers set [count clientMissionMarkers,["WeaponCache_Marker",_randomPos,"Supply Drop"]];
publicVariable "clientMissionMarkers";

_box = createVehicle ["RULaunchersBox",[(_randomPos select 0), (_randomPos select 1),0],[], 0, "NONE"];
[_box] execVM "server\missions\customWeaponCrates\makeBasicLaunchers.sqf";

_box2 = createVehicle ["RUSpecialWeaponsBox",[(_randomPos select 0), (_randomPos select 1) - 10,0],[], 0, "NONE"];
[_box2] execVM "server\missions\customWeaponCrates\makeBasicWeapons.sqf";

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>A supply drop has been spotted near the marker</t>", _missionType,  _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

CivGrpS = createGroup civilian;
[CivGrpS,_randomPos]execVM "server\missions\createUnits\smallGroup.sqf";

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
_startTime = currentTime;
waitUntil
{ 
    sleep 1; 
	_playerPresent = false;
    _currTime = currentTime;
    _result = [_currTime, _startTime, _missionTimeOut] call compareTime;
    {if((isPlayer _x) AND (_x distance _box <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpS);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _box) == 1)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box;
    deleteVehicle _box2;
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1</t><br/><t align='center' color='%3'>Objective failed, better luck next time</t>", _missionType, _failTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else {
	//Mission Complete.
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>The ammo caches have been collected well done team</t>", _missionType, _successTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Mission Finished"];
};

//Remove marker from client marker array.
{
    if(_x select 0 == "WeaponCache_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
sideMissionRunning = false;