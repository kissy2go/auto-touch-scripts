--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ANYTIME)

while puni.inPlay() do
  puni.playTapTap()
end

puni.endPlay()
