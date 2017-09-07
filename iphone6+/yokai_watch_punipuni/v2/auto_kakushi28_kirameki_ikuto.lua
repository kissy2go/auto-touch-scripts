--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    if puni.hasFeverHalfEnded() then
      puni.useSPMove({1, 2, 3, 4, 5})
    else
      puni.useSPMove({1, 2, 3, 4})
    end

    puni.playSuriSuri()
  else
    puni.playSuriSuri()
  end
end

puni.endPlay()

puni.chargeHitodama()

puni.findTap({{16759125,0,0}, {16764847,-48,-5}, {4338744,-43,28}, {4276806,-16,42}, {4338744,6,26}, {6972500,-5,54}, {6972244,29,66}}, 0, nil)
puni.autoPlay()

puni.findTap({{16706200,0,0}, {16700239,-9,34}, {2302755,20,7}, {16775390,27,14}, {2302755,40,-2}, {16705419,71,14}, {2302755,88,12}, {16706451,108,4}, {16706977,108,-22}}, 0, nil)
