--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

local KILLER_MOVE_ONLY_IN_FEVER = true

local SPMOVE_MODE_ANYTIME = 0
local SPMOVE_MODE_ONLY_IN_FEVER = 1

local spMoveMode = SPMOVE_MODE_ONLY_IN_FEVER

function setSPMoveMode(mode)
  spMoveMode = mode
end

function readyToSPMove()
  if spMoveMode == SPMOVE_MODE_ONLY_IN_FEVER then
    if (not puni.inFever()) then
      return false
    end
  end

  return true
end

local spMove = {}
spMove[1] = function()
  tap(148.83, 777.93);
end
spMove[5] = function()
  tap(1066.06, 789.52);
end
spMove[2] = function()
  tap(389.49, 741.24);
end
spMove[4] = function()
  tap(933.64, 672.68);
end
spMove[3] = function()
  tap(613.72, 646.64);
end

function useSPMove(indexes)
  if (not readyToSPMove()) then
    return
  end

  for _, i in pairs(indexes) do
    spMove[i]()
    usleep(100000);
  end
end

--puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
while puni.inBattle() do
  --if puni.isFound({{16742253,0,0}, {16737878,-2,5}, {16742251,5,2}, {4917770,352,71}, {4917770,354,77}, {5573901,363,79}, {5573901,364,71}}, 0, nil) then
  if puni.isFound({{8734213,0,0}, {16737878,8,12}, {16742263,8,6}, {16748944,11,1}, {4917770,422,74}, {5573901,436,74}, {4983306,423,80}, {5573901,429,83}}, 0, nil) then
    useSPMove({2, 1, 5, 4, 3});
  else
    useSPMove({1, 5, 2, 4});
  end

  puni.battleWithSuri()
end

puni.win()

puni.findTap({{16766306,0,0}, {16772291,5,-12}, {16709086,-16,-11}, {2302755,3,-26}, {2302755,2,27}}, 0, nil);

puni.findTap({{16765246,0,0}, {16771220,-29,-24}, {16771216,-25,-34}, {2894633,-17,-45}, {2302755,16,-25}, {16701007,-36,20}, {2302755,32,-15}, {16773319,21,-2}}, 0, nil);

puni.findTap({{16759125,0,0}, {16764847,-48,-5}, {4338744,-43,28}, {4276806,-16,42}, {4338744,6,26}, {6972500,-5,54}, {6972244,29,66}}, 0, nil);
puni.enterBattle()
