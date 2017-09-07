--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    if puni.find({{8734213,0,0}, {16737878,8,12}, {16742263,8,6}, {16748944,11,1}, {4917770,422,74}, {5573901,436,74}, {4983306,423,80}, {5573901,429,83}}, 0, nil) then
      puni.useSPMove({1, 5, 2, 4, 3})
    else
      puni.useSPMove({1, 5, 2, 4})
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
