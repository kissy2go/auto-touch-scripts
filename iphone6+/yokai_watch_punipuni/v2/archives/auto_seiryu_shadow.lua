--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

-- puni.setSpeed(puni.SPEED_HIGH)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    puni.useSPMove({3})
  end
  puni.playSuriSuri()
end

puni.endPlay()

puni.chargeHitodama()

puni.tapIfColor(1078, 1265, {16759125})
puni.autoPlay()
