-- 2018/03/01-16 ニャン系妖怪ベル争奪戦

--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    puni.useSPMove({1, 2, 4, 5})
  end
  puni.playSuriSuri()
end

puni.endPlay()

-- ランキング結果画面で「OK」押下
puni.tapIfColor(954, 1495, {16772779})

-- 貢献度ランキング画面で「とじる」押下
puni.tapIfColor(190, 2090, {11440378})

puni.chargeHitodama()

puni.tapIfColor(628, 1072, {8782869}) -- ブシニャン (ロボニャン USA チームの場合)
puni.tapIfColor(630, 1137, {10423329}) -- ジバニャン (ブシニャンチームの場合)
puni.tapIfColor(629, 1339, {9963803}) -- ブシニャン (ジバニャンチームの場合)
puni.autoPlay()



-- デイリースタンプ
puni.tapIfColor(613, 1335, {11309306}) -- 報酬獲得の「とじる」押下
puni.tapIfColor(613, 2086, {11506679}) -- スタンプカードの「とじる」押下

puni.runApp()
