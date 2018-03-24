--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_SLOW)
puni.setSPMoveMode(puni.SPMOVE_MODE_ANYTIME)

while puni.inPlay() do
  if puni.readyToSPMove() then
    puni.useSPMove({3, 4})
  end
  puni.playTapTap()
end

puni.endPlay()

puni.runApp()

puni.chargeHitodama()

puni.tapIfColor(727, 1120, {15341363})
puni.autoPlay()
