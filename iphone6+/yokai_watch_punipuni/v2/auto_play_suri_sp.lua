--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    puni.useSPMove({1, 5, 2, 4, 3})
  end
  puni.playSuriSuri()
end

puni.endPlay()
