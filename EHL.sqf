//////Enhanced High&Low Script Ver2.0 by Rodeostar42//////    ///adviced by Halal///


///Location index///
_mediterranean = ["Altis","Stratis","bozcaada"];
_middleeast = ["Takistan","Zargabad","pja310","Shapur_BAF"];
_winter_maps = ["Chernarus_winter","utes_winter","ThirskW","anim_helvantis_v2"];
_euro = ["Panthera3","Chernarus","Chernarus_Summer","Woodland_ACR","ProvingGrounds_PMC","utes","Bornholm","Thirsk"];
_equator = ["pja305","Sara_dbe1","SaraLite","Sara","Porto","Intro","IslaDuala3","Mog","lingor3"];
_Southern = ["abramia","australia"];


if (!isDedicated) then {

   if (worldName in _mediterranean) then {

   nul=[] execVM "EHL\mediterranean.sqf";

   hint parseText format["<t size='1' color=""#1E90FF"">mediterranean here %1 Test OK</t>"];
};


if (worldName in _middleeast) then {

   nul=[] execVM "EHL\middleeast.sqf";

   hint parseText format["<t size='1' color=""#1E90FF"">middleeast here %1 Test OK</t>"];
};


if (worldName in _winter_maps) then {

   nul=[] execVM "EHL\winter_maps.sqf";

   hint parseText format["<t size='1' color=""#1E90FF"">winter_maps here %1 Test OK</t>"];
};


if (worldName in _euro) then {

   nul=[] execVM "EHL\euro.sqf";

   hint parseText format["<t size='1' color=""#1E90FF"">euro here %1 Test OK</t>"];
};


if (worldName in _equator) then {

   nul=[] execVM "EHL\equator.sqf";

   hint parseText format["<t size='1' color=""#1E90FF"">equator here %1 Test OK</t>"];
};


if (worldName in _Southern) then {

   nul=[] execVM "EHL\Southern.sqf";

   hint parseText format["<t size='1' color=""#1E90FF"">Southern here %1 Test OK</t>"];
};

   while {true} do {

_unit = player;
_uniform = uniform player;
_gear = [

///Head gear///
///ARMA3///
"H_PilotHelmetFighter_B",
"H_PilotHelmetFighter_I",
"H_PilotHelmetFighter_O",
///RHS///
"RHS_jetpilot_usaf",
"rhs_zsh7a",
///USAF///
"USAF_SFS_Pilot_H",
///CUP///
"USAF_SFS_Pilot_F35_Down",
"USAF_SFS_Pilot_F35_Up",
"USAF_SFS_Pilot_H_Up",
"USAF_SFS_Pilot_H_Down",
"USAF_SFS_Pilot_N"
];

if ((headgear player in _gear)&&(vehicle player == player)) then
      {

         player setFatigue 1;
      };

      sleep 1;


///Oxygen Enhanced ///

if (( vehicle player) isKindOf "Air" && ((getPosVisual (vehicle player) select 2) > 3000)&&(!(headgear player in _gear))) then {

      hint parseText format["<t size='1' color=""#FFFFFF"">We're in high altitude.jump from here?  %1 It must be equipped with oxygen helmet</t>"];
         };
            sleep 0.1;

if ((vehicle player == player)&&(!(headgear player in _gear))&&(( getPosASL (vehicle  player) select 2) > 3000 ))then {

   hint parseText format["<t size='1' color=""#FF0000"">Danger!! %1 Low oxygen concentration</t>"];

   dethcount = 0;

   private ["_black"];
   _black = ppEffectCreate ["ColorCorrections", 1500];
   _black  ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
   _black  ppEffectCommit 10;
   _black  ppEffectEnable TRUE;

   private ["_bl"];
   _bl = ppEffectCreate ["DynamicBlur", 10];
   _bl ppEffectEnable true;
   _bl ppEffectAdjust [3];
   _bl ppEffectCommit 20;

   while {dethcount < 15} do{

if ((headgear player in _gear)or( getPosASL (vehicle  player) select 2) < 2990 )  then {

   hint parseText format["<t size='1' color=""#FFFFFF"">Oxygen concentration is normal %1 Status OK</t>"];

   ppEffectDestroy _black;
   ppEffectDestroy _bl;

   dethcount = 15;
};

   sleep 1;
   dethcount = dethcount + 1;
};

if ((vehicle player == player)&&(!(headgear player in _gear))&&(( getPosASL (vehicle  player) select 2) > 3000 ) )then {
   player setDamage 1;
};
   sleep 1;
};

};

};



