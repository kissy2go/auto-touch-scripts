-- 2018-04-01 スナックワールドコラボイベント

--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ANYTIME)

while puni.inPlay() do
  puni.useSPMove({1, 2, 4, 5})
  puni.playTapTap()
end

puni.endPlay()

puni.chargeHitodama()

puni.findTap({{16766685,0,0}, {13330526,0,84}, {13436961,-96,184}, {11272215,93,181}}, 0, {470, 810, 260, 240}) -- ビネガー・カーン
puni.autoPlay()
