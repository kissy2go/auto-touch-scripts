--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_SLOW)
puni.setSPMoveMode(puni.SPMOVE_MODE_ANYTIME)

while puni.inPlay() do
  if puni.readyToSPMove() then
    puni.useSPMove({1, 5, 2, 3})
    --puni.useSPMove({1, 5, 3})
  end
  puni.playTapTap()
end

puni.endPlay()

puni.runApp()

puni.chargeHitodama()

puni.tapIfColor(727, 1120, {15341363})
puni.autoPlay()
