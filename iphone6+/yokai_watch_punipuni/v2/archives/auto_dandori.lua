--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

-- puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    if puni.hasFeverHalfEnded() then
      puni.useSPMove({1, 5, 2, 4, 3})
      --puni.useSPMove({1, 2, 4, 3, 5})
    else
      --puni.useSPMove({1, 5, 2, 4})
      --puni.useSPMove({1, 2, 4, 3})
      puni.useSPMove({1, 5, 2, 4, 3})
    end
    puni.playSuriSuri()
  else
    puni.playSuriSuri()
  end
end

puni.endPlay()

puni.runApp()

puni.chargeHitodama()

puni.tapIfColor(727, 1120, {15341363})
puni.autoPlay()
