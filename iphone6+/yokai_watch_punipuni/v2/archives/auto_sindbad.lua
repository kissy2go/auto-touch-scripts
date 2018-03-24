--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

-- puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    if puni.hasFeverHalfEnded() then
      puni.useSPMove({1, 5, 4, 2, 3})
    else
      puni.useSPMove({5, 2, 4})
    end
    puni.playSuriSuri()
  else
    puni.playSuriSuri()
  end
end

puni.endPlay()

puni.chargeHitodama()

puni.tapIfColor(838, 1165, {16759125})
getColor(838, 1165);
puni.autoPlay()
