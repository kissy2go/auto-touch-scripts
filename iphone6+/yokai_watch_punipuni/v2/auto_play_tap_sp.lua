--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ANYTIME)

while puni.inPlay() do
  if puni.readyToSPMove() then
    puni.useSPMove({1, 5, 2, 4, 3})
  end
  puni.playTapTap()
end

puni.endPlay()
