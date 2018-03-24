--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

--puni.setSpeed(puni.SPEED_SLOW)
puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  if puni.readyToSPMove() then
    -- ブシニャン劉邦 (イサマシ染め)
    --puni.useSPMove({1, 5, 2, 4, 3})
    --puni.playTapTap()

    -- 福禄寿+ドグ (Yマネパ)
    --if puni.hasFeverHalfEnded() then
    --  puni.useSPMove({1, 5, 4, 3, 2})
    --else
    --  puni.useSPMove({1, 5, 4})
    --end
    --puni.playSuriSuri()

    -- 福禄寿 (ポカポカ染め)
    --if puni.hasFeverHalfEnded() then
    --  puni.useSPMove({1, 5, 2, 4, 3})
    --else
    --  puni.useSPMove({1, 5, 2, 4})
    --end

    -- ゴーケツ染め
    --puni.useSPMove({1, 5, 2, 4, 3})

    puni.useSPMove({1, 5, 3, 4, 2})

    puni.playSuriSuri()
  else
    puni.playSuriSuri()
  end
end

puni.doContinue(false)

puni.endPlay()

DROP_TOURNAMENT = true
function dropTournament()
  if not DROP_TOURNAMENT then
    return
  end

  tap(182.65, 1611.29)
  usleep(1000000.00);

  -- スクロールする
  touchDown(4, 829.26, 1395.94);
  usleep(49444.29);
  touchMove(4, 823.46, 1368.92);
  usleep(16734.46);
  touchMove(4, 823.46, 1349.61);
  usleep(16721.42);
  touchMove(4, 823.46, 1326.43);
  usleep(16551.83);
  touchMove(4, 823.46, 1281.05);
  usleep(16758.42);
  touchMove(4, 826.36, 1235.67);
  usleep(16862.12);
  touchMove(4, 830.22, 1185.43);
  usleep(16732.29);
  touchMove(4, 833.12, 1131.36);
  usleep(16487.75);
  touchMove(4, 838.92, 1076.34);
  usleep(17029.38);
  touchMove(4, 844.72, 1019.37);
  usleep(16300.96);
  touchMove(4, 850.52, 952.73);
  usleep(16797.83);
  touchMove(4, 854.39, 902.53);
  usleep(16642.71);
  touchMove(4, 859.22, 846.50);
  usleep(16808.58);
  touchMove(4, 865.98, 781.81);
  usleep(16491.79);
  touchMove(4, 870.82, 728.71);
  usleep(16992.79);
  touchMove(4, 880.48, 660.15);
  usleep(16349.83);
  touchMove(4, 891.11, 598.36);
  usleep(16808.33);
  touchMove(4, 899.81, 535.59);
  usleep(16734.92);
  touchMove(4, 906.58, 484.42);
  usleep(16402.50);
  touchMove(4, 912.38, 431.28);
  usleep(16656.58);
  touchMove(4, 919.14, 381.08);
  usleep(16851.71);
  touchMove(4, 924.94, 328.93);
  usleep(16487.00);
  touchMove(4, 938.47, 264.24);
  usleep(16798.71);
  touchMove(4, 957.80, 190.86);
  usleep(16888.12);
  touchMove(4, 995.50, 74.96);
  usleep(16252.75);
  touchUp(4, 1001.30, 69.20);
  usleep(1000000.00);

  tap(923.01, 808.86);
  usleep(1000000.00);

  tap(922.04, 1676.96)

  usleep(10000.00);
end


-- トーナメントエントリー or 索敵
puni.findTap({{4438783,0,0}, {1909037,-3,32}, {5799323,-2,39}, {14086399,-11,47}, {10083071,-2,59}}, 0, nil) -- エントリー
puni.findTap({{4438783,0,0}, {5799323,3,32}, {7833499,-11,32}, {10083071,-3,49}, {2532809,-3,60}}, 0, nil) -- 索敵

-- ドリームマッチ
puni.findTap({{11572982,0,0}, {2302755,40,12}, {11572982,50,31}, {11572982,30,29}}, 0, {130, 2000, 100, 100}) -- 手持ちを変えない
puni.findTap({{16426497,0,0}, {230906,-8,55}, {16777215,-9,65}, {3187699,-8,73}, {5012117,-8,82}}, 0, nil) -- 索敵
puni.findTap({{16229378,0,0}, {3187699,-1,10}, {232441,-5,53}, {1269626,-9,82}}, 0, nil) -- 索敵

function canDreamMatchPlay()
  return puni.colorIs(930, 2041, {16702552})
end

function startDreamMatchPlay()
  puni.randomTap({779, 1171}, {1969, 2130})
  puni.usleep(1000000)
  puni.randomTap({710, 1103}, {1226, 1385}) -- 手持ちにドリームマッチの妖怪が入っていなくてもプレイする
end

if puni.canPlay() or canDreamMatchPlay() then
  usleep(10000.00)

  -- 決勝戦
  -- if puni.find({{15990271,0,0}, {4328710,-80,37}, {6952458,-87,59}, {5116167,-50,47}, {16710908,-70,50}, {16777215,14,50}, {4985872,37,44}, {16156775,39,20}}, 0, nil) then
  --  dropTournament()
  -- end

  -- ヨップ君
  if puni.find({{16317451,0,0}, {16317451,0,1}, {16317451,1,1}, {16317451,1,0}}, 0, {587, 1118, 40, 54}) then
    dropTournament()
  end

  -- ガラクタリアン
  if puni.colorIn(621, 1397, 16777128, 16777128) then
    dropTournament()
  end

  -- キモナシ先生 (いくのだと必要かも)
  --if puni.find({{12477739,0,0}, {16749887,-13,42}, {14843192,-14,64}, {16766811,-5,24}, {12149290,21,29}}, 1, nil) then
  --  dropTournament()
  --end

  -- インジャネーノ
  if puni.find({{13283302,0,0}, {14338029,0,1}, {16777215,1,1}, {15524342,1,0}, {16777215,39,-18}, {16183548,40,-18}, {15326199,40,-19}, {16051707,39,-19}, {16051450,22,22}, {14402544,22,23}, {15194357,23,23}, {16711166,23,22}}, 0, {442, 1410, 50, 50}) then
    dropTournament()
  end

  -- おのぼり黒トン
  if puni.colorIn(851,1463, 11172739, 11172739) then
    dropTournament()
  end

  -- 国宝・影正
  if puni.find({{14073324,0,0}, {15985914,0,1}, {16777215,1,1}, {15062771,1,0}}, 0, {614, 1428, 14, 14}) then
    dropTournament()
  end

  -- デカニャン
  if puni.find({{16051707,0,0}, {16711167,0,1}, {16249596,1,0}, {16777215,1,1}, {16447485,-7,14}, {16579326,-7,15}, {16645374,-6,14}, {16711423,-6,15}, {16711423,36,14}, {16711167,37,14}, {15392502,37,13}, {15656184,36,13}, {16447741,32,1}, {16711167,32,2}, {16249852,33,1}, {16645118,33,2}, {16776959,2,39}, {16579326,1,39}, {16447485,1,38}, {16711423,2,38}}, 0, {489, 1409, 55, 55}) then
    dropTournament()
  end

  -- あやとりさま
  --if puni.colorIn(417, 1392, 14150000, 14220000) then
  --  dropTournament()
  --end

  puni.startPlay()
  startDreamMatchPlay()
end

-- 禁止されてる種族がいる
if puni.find({{13693436,0,0}, {10203834,0,1}, {6582388,0,2}, {5726565,1,2}, {3619645,2,2}, {5199706,2,1}, {6780025,2,0}, {11784152,1,0}, {8821151,1,1}}, 0, {288, 910, 4, 4}) then
  puni.randomTap({420, 800}, {1230, 1370})
  usleep(1000000.00)
  dropTournament()
end


-- ひとだま購入
puni.chargeHitodama()


-- トーナメント入場
--puni.findTap({{16699725,0,0}, {2302755,19,3}, {16765512,36,9}, {2302755,39,-26}, {16706452,64,-23}, {2302755,85,-20}, {15460307,82,-4}}, 1, nil);
puni.tapIfColor(598, 2063, {16699188})


-- お宝発見
puni.findTap({{2302755,0,0}, {13549048,52,-6}, {11572726,20,29}, {11572726,61,21}, {13614840,91,-7}}, 1, nil);



-- 優勝したときの会話とご褒美獲得 or 挑戦者と会話
puni.tapIfColor(1124, 1428, {16767338})
puni.tapIfColor(625, 1712, {16772780, 16704113})



-- 挑戦者の挑戦を受けない
--puni.findTap({{11572982,0,0}, {2302755,23,4}, {13746426,38,-30}, {13482490,74,-40}, {11506933,76,11}, {2302755,87,-14}}, 1, nil);

-- 挑戦者の挑戦を受ける
--puni.findTap({{16699968,0,0}, {2302755,14,-9}, {16772787,30,-22}, {2302755,51,-13}, {16705160,68,-17}, {16766286,73,15}}, 0, nil);

puni.runApp()
