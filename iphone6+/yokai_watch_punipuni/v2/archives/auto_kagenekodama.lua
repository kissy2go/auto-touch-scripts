--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

-- puni.setSpeed(puni.SPEED_HIGH)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  -- if not puni.readyToSPMove() then
  --   puni.useSPMove({1, 5, 2, 4, 3})
  -- end

  -- puni.playSuriSuri()

  -- puni.useSPMove({5, 4, 2})
  puni.playTapTap()
end

puni.endPlay()

puni.chargeHitodama()

-- puni.tapIfColor(616, 1410, {5592411})
puni.tapIfColor(655, 1511, {5592411})
puni.autoPlay()
