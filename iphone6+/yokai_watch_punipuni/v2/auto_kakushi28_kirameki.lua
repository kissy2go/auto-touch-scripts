--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

-- puni.setSpeed(puni.SPEED_NORMAL)
-- puni.setSpeed(puni.SPEED_SLOW)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    if puni.hasFeverHalfEnded() then
      -- puni.useSPMove({1, 5, 2, 4, 3})
      -- puni.useSPMove({1, 5, 4, 3, 2})
      -- puni.useSPMove({1, 4, 5, 2, 3})
      puni.useSPMove({1, 4, 3, 2, 5})
    else
      -- puni.useSPMove({1, 5, 2, 4})
      -- puni.useSPMove({1, 5, 4})
      puni.useSPMove({1, 4})
    end
    puni.playSuriSuri()
  else
    puni.playSuriSuri()
  end
end

puni.endPlay()

puni.chargeHitodama()

-- puni.findTap({{16759125,0,0}, {16764847,-48,-5}, {4338744,-43,28}, {4276806,-16,42}, {4338744,6,26}, {6972500,-5,54}, {6972244,29,66}}, 0, nil)
puni.tapIfColor(378, 1664, {16759125})
puni.autoPlay()
