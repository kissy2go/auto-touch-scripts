--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_NORMAL)
puni.setSPMoveMode(puni.SPMOVE_MODE_ONLY_IN_FEVER)

while puni.inPlay() do
  while puni.readyToSPMove() do
    --while puni.find({{8734213,0,0}, {16737878,8,12}, {16742263,8,6}, {16748944,11,1}, {4917770,422,74}, {5573901,436,74}, {4983306,423,80}, {5573901,429,83}}, 0, nil) do
    while puni.find({{4917770,0,0}, {5573901,1,9}, {4327432,3,21}, {4852234,7,15}}, 0, nil) do
      puni.useSPMove({1, 5, 2, 4, 3})
      puni.playTapTap()
    end

    puni.useSPMove({1, 5, 2, 4})
    puni.playSuriSuri()
  end

  puni.playSuriSuri()
end

puni.endPlay()


function dropTournament()
  tap(182.65, 1611.29)
  usleep(1000000.00);

  tap(434.92, 771.20)
  usleep(1000000.00);

  tap(922.04, 1676.96)

  usleep(10000.00);
end


-- トーナメントエントリー or 索敵
puni.findTap({{4438783,0,0}, {106751,-59,-6}, {2302755,2,19}, {10083071,-16,64}, {14086399,-8,55}, {10083071,3,66}, {2532809,0,83}}, 0, nil);

if puni.canPlay() then
  usleep(10000.00)

  -- ヨップ君
  if puni.find({{16777215,0,0}, {16777215,27,1}, {16777215,31,15}, {16777215,1,16}, {16777215,29,33}, {16777215,0,34}, {16777215,52,11}, {16777215,55,17}, {16777215,62,36}, {16777215,65,10}, {16249595,82,11}, {9851856,44,29}}, 0, nil) then
    dropTournament()
  end

  -- ガラクタリアン
  if puni.find({{5585207,0,0}, {5322293,14,-2}, {5059892,27,-2}, {16514814,15,6}, {16580350,33,3}, {4402731,38,-2}}, 0, nil) then
    dropTournament()
  end

  -- キモナシ先生
  if puni.find({{12477739,0,0}, {16749887,-13,42}, {14843192,-14,64}, {16766811,-5,24}, {12149290,21,29}}, 0, nil) then
    dropTournament()
  end

  -- インジャネーノ
  if puni.find({{1708568,0,0}, {1708568,-1,4}, {1708568,0,12}, {1773592,64,0}, {1773592,63,7}, {1773592,62,15}}, 0, nil) then
    dropTournament()
  end

  -- おのぼり黒トン

  -- 国宝・影正

  puni.startPlay()
end


-- ひとだま購入
if puni.find({{2302755,0,0}, {2302755,17,21}, {2302755,17,39}, {2302755,35,0}, {16706718,-3,33}, {16703075,30,35}, {16706460,39,34}, {16699984,21,70}}, 0, nil) then
  touchDown(2, 936.54, 1290.68);
  usleep(66699.12);
  touchUp(2, 936.54, 1290.68);
  usleep(1700432.42);

  touchDown(7, 871.78, 1202.82);
  usleep(66620.33);
  touchUp(7, 871.78, 1202.82);
  usleep(1304078.83);

  touchDown(2, 949.11, 1290.68);
  usleep(62787.71);
  touchUp(2, 949.11, 1290.68);
  usleep(2867817.67);

  touchDown(1, 601.16, 2058.38);
  usleep(65891.46);
  touchUp(1, 601.16, 2058.38);

  usleep(10000.00);
end


-- トーナメント入場
puni.findTap({{16699725,0,0}, {2302755,19,3}, {16765512,36,9}, {2302755,39,-26}, {16706452,64,-23}, {2302755,85,-20}, {15460307,82,-4}}, 0, nil);


-- お宝発見
puni.findTap({{2302755,0,0}, {13549048,52,-6}, {11572726,20,29}, {11572726,61,21}, {13614840,91,-7}}, 0, nil);



-- 優勝したときの会話とご褒美獲得 or 挑戦者と会話
puni.findTap({{16709086,0,0}, {16706235,19,2}, {16766048,16,15}, {16706751,29,1}}, 0, nil);
puni.findTap({{2302755,0,0}, {16771219,19,-9}, {16699713,48,18}, {2302755,63,-10}, {16771220,97,-10}, {16766032,-19,17}}, 0, nil);



-- 挑戦者の挑戦を受けない
puni.findTap({{11572982,0,0}, {2302755,23,4}, {13746426,38,-30}, {13482490,74,-40}, {11506933,76,11}, {2302755,87,-14}}, 0, nil);

-- 挑戦者の挑戦を受ける
--puni.findTap({{16699968,0,0}, {2302755,14,-9}, {16772787,30,-22}, {2302755,51,-13}, {16705160,68,-17}, {16766286,73,15}}, 0, nil);
