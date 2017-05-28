--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

local KILLER_MOVE_ONLY_IN_FEVER = false

puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
while puni.inBattle() do
  puni.battleWithHits()
  puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
  puni.battleWithHits()
  puni.killerMove(KILLER_MOVE_ONLY_IN_FEVER)
end
