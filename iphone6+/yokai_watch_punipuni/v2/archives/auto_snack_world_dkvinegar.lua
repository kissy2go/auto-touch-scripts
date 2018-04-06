-- 2018-04-01 スナックワールドコラボイベント
-- 隠しボスの DK ビネガー周回

--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() and puni.hasFeverHalfEnded() then
    puni.useSPMove({1, 3, 4})
  end

  puni.playSuriSuri()
end

puni.endPlay()

puni.becomeFriends()
puni.chargeHitodama()

puni.findTap({{16761034,0,0}, {9131061,0,37}, {16759125,1,80}}, 0, {900, 1060, 60, 110}) -- DK ビネガー
puni.autoPlay()
