--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

local KILLER_MOVE_ONLY_IN_FEVER = true

puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
while puni.inBattle() do
  puni.battleWithSuri()
  puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
  puni.battleWithSuri()
  puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
end
