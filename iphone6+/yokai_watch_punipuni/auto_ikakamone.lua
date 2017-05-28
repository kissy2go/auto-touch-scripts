--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

local KILLER_MOVE_ONLY_IN_FEVER = true

puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
while puni.inBattle() do
  tap(331.50, 383.00)
  usleep(50000)
  --tap(899.81, 377.21)
  --usleep(50000)
  tap(607.92, 456.38)
  usleep(50000)
  puni.battleWithSuri()
  puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
  puni.battleWithSuri()
  puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
end

puni.win()

puni.findStage(
  findColors({{13436961,0,0}, {16777215,32,6}, {16777215,73,11}, {4202789,100,9}, {10551318,147,-1}, {3688529,31,55}, {3491408,113,60}}, 0, nil)
)
puni.enterBattle()
