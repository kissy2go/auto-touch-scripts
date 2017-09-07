local puni = {}

function puni.findTap(colors, count, region)
  local coordinate = findColors(colors, count, region);

  for i, v in pairs(coordinate) do
    tap(v[1], v[2]);
    usleep(1000000.00);
    return
    --log("x:" .. v[1] .. "y:" .. v[2]);
  end
end

function puni.isFound(colors, count, region)
  local coordinate = findColors(colors, count, region);

  for i, v in pairs(coordinate) do
    return true
  end

  return false;
end

function puni.findStage(coordinate)
  for i, v in pairs(coordinate) do
    tap(v[1], v[2]);
    usleep(1000000.00);
    --log("x:" .. v[1] .. "y:" .. v[2]);
  end
end

function puni.enterBattle()
  --local result = findColors({{16706980,0,0}, {16707241,11,11}, {2302755,27,20}, {16699983,62,57}, {2500134,84,25}, {16706460,109,17}, {4013373,122,42}}, 0, nil);
  local result = findColors({{16774609,0,0}, {2302755,89,44}, {16701266,20,89}, {16700487,120,85}, {13355194,143,49}, {2302755,223,57}, {2960428,268,53}}, 0, nil);

  for i, v in pairs(result) do
    -- tap(v[1], v[2])

    math.randomseed(os.time())
    --local x = math.random(615.66, 1095.05)
    --local y = math.random(1550.44, 1660.51)
    local x = math.random(806.06, 1127.91)
    local y = math.random(1552.37, 1673.08)
    tap(x, y)

    usleep(1000000.00);
    --log("x:" .. v[1] .. "y:" .. v[2]);
  end
end

function puni.win()
  puni.findTap({{16771224,0,0}, {2302755,7,8}, {16703072,18,18}, {2302755,36,15}, {16769133,47,7}, {2302755,59,10}, {16772518,98,-12}}, 0, nil);
end

function puni.continue()
  puni.findTap({{15525583,0,0}, {16768307,-590,-611}, {16438574,-613,-572}, {16765491,-562,-606}, {2302755,-534,-588}, {16637233,-458,-561}, {16570928,-358,-583}, {9535530,-220,-570}, {2302755,-224,-601}, {2302755,-277,-586}, {15781936,-148,-596}, {15716651,-154,-558}, {8811816,-113,-577}, {14530608,-49,-574}, {8614953,-12,-589}}, 0, nil);
end

function puni.noContinue()
  puni.findTap({{15590652,0,0}, {14471163,62,-43}, {13153274,42,12}, {11507190,57,40}, {15459068,86,12}, {14273786,138,-33}, {6249574,164,-7}, {15854589,123,29}, {6117733,179,20}, {11572982,218,18}, {9307152,117,-223}, {16776688,125,-260}, {16715783,158,-229}, {16259605,124,-197}, {16715783,181,-210}, {16715783,179,-197}}, 0, nil);
end

function puni.inBattle()
  if puni.isFound({{16772778,0,0}, {15327690,8,10}, {2302755,16,14}, {16775134,27,16}, {2302755,39,14}, {16700238,58,41}}, 0, nil) then
    return true
  end

  if puni.isFound({{6709060,0,0}, {6708539,0,16}, {921102,13,19}, {6709843,24,21}, {921102,37,19}, {6707497,51,26}, {6706207,59,43}}, 0, nil) then
    return true
  end

  return false
end

function puni.inFever()
  return puni.isFound({{16739692,0,0}, {16746359,2,-5}, {16753057,5,-10}, {16759735,8,-12}, {16748173,-4,4}}, 0, nil);
end

function puni.killerMove(inFever)
  if (inFever and not puni.inFever()) then
    return
  end

  tap(148.83, 777.93);
  usleep(100000);

  tap(1066.06, 789.52);
  usleep(100000);

  tap(389.49, 741.24);
  usleep(100000);

  tap(933.64, 672.68);
  usleep(100000);

  tap(613.72, 646.64);
  usleep(100000);
end

function puni.battleWithSuri()
  touchDown(3, 377.89, 1218.28);
  usleep(33202.92);
  touchMove(3, 421.38, 1253.99);
  usleep(16601.21);
  touchMove(3, 464.88, 1291.66);
  usleep(16861.42);
  touchMove(3, 493.87, 1320.64);
  usleep(16551.75);
  touchMove(3, 514.17, 1341.86);
  usleep(16702.71);
  touchMove(3, 527.70, 1359.25);
  usleep(16617.25);
  touchMove(3, 539.30, 1373.73);
  usleep(16677.42);
  touchMove(3, 550.90, 1393.04);
  usleep(16575.21);
  touchUp(3, 574.10, 1434.58);
  usleep(83502.17);

  touchDown(5, 1078.62, 1163.23);
  usleep(33438.46);
  touchMove(5, 1063.16, 1160.33);
  usleep(16530.21);
  touchMove(5, 1053.49, 1160.33);
  usleep(16822.96);
  touchMove(5, 1036.09, 1161.31);
  usleep(16517.08);
  touchMove(5, 999.37, 1177.72);
  usleep(16620.38);
  touchMove(5, 926.88, 1210.53);
  usleep(16617.00);
  touchMove(5, 859.22, 1242.40);
  usleep(16852.42);
  touchMove(5, 819.59, 1263.66);
  usleep(16460.92);
  touchMove(5, 789.63, 1280.07);
  usleep(16768.79);
  touchMove(5, 767.40, 1292.64);
  usleep(16715.17);
  touchMove(5, 751.94, 1303.25);
  usleep(16602.29);
  touchMove(5, 741.30, 1315.82);
  usleep(16602.08);
  touchMove(5, 726.81, 1329.33);
  usleep(16705.46);
  touchUp(5, 721.01, 1335.12);
  usleep(83252.17);

  touchDown(4, 450.38, 1567.83);
  usleep(33459.42);
  touchMove(4, 460.05, 1560.11);
  usleep(16675.79);
  touchMove(4, 460.05, 1539.83);
  usleep(16642.08);
  touchMove(4, 460.05, 1506.04);
  usleep(16911.46);
  touchMove(4, 460.05, 1473.19);
  usleep(16394.08);
  touchMove(4, 458.11, 1434.58);
  usleep(16714.08);
  touchMove(4, 454.25, 1407.53);
  usleep(16805.21);
  touchMove(4, 449.41, 1377.61);
  usleep(16664.50);
  touchMove(4, 442.65, 1351.53);
  usleep(16587.88);
  touchMove(4, 432.98, 1329.33);
  usleep(16854.04);
  touchMove(4, 425.25, 1310.97);
  usleep(16403.33);
  touchMove(4, 417.52, 1296.48);
  usleep(16786.54);
  touchMove(4, 405.92, 1288.76);
  usleep(16657.42);
  touchMove(4, 394.32, 1281.99);
  usleep(16649.96);
  touchMove(4, 373.06, 1273.30);
  usleep(16503.00);
  touchUp(4, 321.83, 1250.15);
  usleep(33503.46);

  touchDown(6, 773.20, 1784.13);
  usleep(16661.00);
  touchMove(6, 753.87, 1758.05);
  usleep(16747.04);
  touchMove(6, 748.07, 1727.16);
  usleep(16616.58);
  touchMove(6, 740.34, 1691.44);
  usleep(16562.46);
  touchMove(6, 733.57, 1647.98);
  usleep(16862.42);
  touchMove(6, 731.64, 1611.29);
  usleep(16501.75);
  touchMove(6, 731.64, 1571.70);
  usleep(16763.42);
  touchMove(6, 731.64, 1542.73);
  usleep(16698.92);
  touchMove(6, 731.64, 1511.83);
  usleep(16649.50);
  touchMove(6, 731.64, 1484.78);
  usleep(16608.88);
  touchMove(6, 732.60, 1466.45);
  usleep(16833.92);
  touchMove(6, 737.44, 1445.19);
  usleep(16440.08);
  touchMove(6, 744.20, 1426.83);
  usleep(16741.88);
  touchMove(6, 773.20, 1389.20);
  usleep(16566.54);
  touchUp(6, 779.00, 1383.40);
  usleep(16745.79);

  touchDown(7, 399.15, 1794.74);
  usleep(33487.12);
  touchMove(7, 399.15, 1785.11);
  usleep(16433.21);
  touchMove(7, 399.15, 1769.64);
  usleep(16792.92);
  touchMove(7, 399.15, 1747.44);
  usleep(16648.12);
  touchMove(7, 398.19, 1720.38);
  usleep(16618.38);
  touchMove(7, 393.36, 1684.67);
  usleep(16645.17);
  touchMove(7, 384.66, 1639.29);
  usleep(16855.67);
  touchMove(7, 379.82, 1608.39);
  usleep(16483.08);
  touchMove(7, 370.16, 1585.21);
  usleep(16772.75);
  touchMove(7, 353.73, 1565.91);
  usleep(16728.79);
  touchMove(7, 331.50, 1552.37);
  usleep(16638.46);
  touchMove(7, 269.64, 1515.68);
  usleep(16481.58);
  touchMove(7, 165.26, 1444.22);
  usleep(16715.21);
  touchUp(7, 159.46, 1438.42);
  usleep(133403.71);

  touchDown(8, 850.52, 1259.79);
  usleep(83348.25);
  touchMove(8, 823.46, 1276.20);
  usleep(16784.38);
  touchMove(8, 809.93, 1288.76);
  usleep(16852.67);
  touchMove(8, 791.56, 1305.17);
  usleep(16476.54);
  touchMove(8, 765.47, 1326.43);
  usleep(16592.17);
  touchMove(8, 744.20, 1341.86);
  usleep(16766.67);
  touchMove(8, 718.11, 1357.33);
  usleep(16663.00);
  touchMove(8, 694.91, 1370.84);
  usleep(16658.21);
  touchMove(8, 679.45, 1379.53);
  usleep(16753.50);
  touchMove(8, 667.85, 1387.24);
  usleep(16833.12);
  touchMove(8, 663.02, 1395.94);
  usleep(16462.21);
  touchUp(8, 657.22, 1401.73);
  usleep(133403.71);

  touchDown(1, 382.72, 1957.94);
  usleep(16593.21);
  touchMove(1, 403.99, 1951.17);
  usleep(16620.29);
  touchMove(1, 419.45, 1940.56);
  usleep(16690.25);
  touchMove(1, 428.15, 1925.09);
  usleep(16758.67);
  touchMove(1, 435.88, 1902.89);
  usleep(16710.38);
  touchMove(1, 444.58, 1867.18);
  usleep(16480.25);
  touchMove(1, 448.45, 1815.02);
  usleep(16734.75);
  touchMove(1, 450.38, 1766.74);
  usleep(16629.50);
  touchMove(1, 450.38, 1727.16);
  usleep(16654.46);
  touchMove(1, 450.38, 1686.59);
  usleep(16766.46);
  touchMove(1, 450.38, 1653.78);
  usleep(16689.42);
  touchMove(1, 441.68, 1632.52);
  usleep(16544.08);
  touchMove(1, 424.28, 1616.11);
  usleep(16764.92);
  touchMove(1, 398.19, 1596.80);
  usleep(16624.08);
  touchMove(1, 334.40, 1554.32);
  usleep(16459.67);
  touchUp(1, 328.60, 1548.52);
  usleep(50160.08);

  touchDown(9, 683.31, 2020.71);
  usleep(33317.17);
  touchMove(9, 668.81, 2000.43);
  usleep(16651.00);
  touchMove(9, 662.05, 1977.25);
  usleep(16792.88);
  touchMove(9, 658.18, 1948.27);
  usleep(16705.71);
  touchMove(9, 655.28, 1914.48);
  usleep(16620.83);
  touchMove(9, 655.28, 1878.77);
  usleep(16634.12);
  touchMove(9, 655.28, 1851.71);
  usleep(16723.96);
  touchMove(9, 655.28, 1822.74);
  usleep(16626.62);
  touchMove(9, 655.28, 1795.72);
  usleep(16696.83);
  touchMove(9, 655.28, 1764.82);
  usleep(16733.25);
  touchMove(9, 668.81, 1725.24);
  usleep(16513.75);
  touchMove(9, 713.27, 1663.41);
  usleep(16590.00);
  touchUp(9, 719.07, 1657.62);
  usleep(33358.12);

  touchDown(2, 521.90, 2040.99);
  usleep(50091.42);
  touchMove(2, 526.74, 2031.32);
  usleep(16940.54);
  touchMove(2, 526.74, 2014.91);
  usleep(16398.46);
  touchMove(2, 526.74, 1986.92);
  usleep(16686.29);
  touchMove(2, 514.17, 1926.07);
  usleep(16816.29);
  touchMove(2, 496.77, 1865.22);
  usleep(16611.83);
  touchMove(2, 475.51, 1819.84);
  usleep(16595.62);
  touchMove(2, 433.95, 1768.66);
  usleep(16931.50);
  touchMove(2, 385.62, 1726.18);
  usleep(16384.58);
  touchMove(2, 342.13, 1698.18);
  usleep(16719.38);
  touchMove(2, 267.71, 1655.70);
  usleep(16808.79);
  touchMove(2, 199.08, 1628.68);
  usleep(16459.04);
  touchMove(2, 171.06, 1628.68);
  usleep(16702.62);
  touchUp(2, 143.03, 1648.92);
  usleep(33479.46);

  touchDown(3, 919.14, 1966.63);
  usleep(100243.04);
  touchMove(3, 920.11, 1949.25);
  usleep(16434.17);
  touchMove(3, 929.78, 1933.79);
  usleep(16765.25);
  touchMove(3, 952.01, 1897.10);
  usleep(16531.21);
  touchMove(3, 979.07, 1859.43);
  usleep(16733.58);
  touchMove(3, 999.37, 1827.59);
  usleep(16740.21);
  touchMove(3, 1016.76, 1804.41);
  usleep(16630.62);
  touchMove(3, 1029.33, 1786.05);
  usleep(16602.96);
  touchMove(3, 1043.83, 1765.77);
  usleep(16799.04);
  touchMove(3, 1056.39, 1749.36);
  usleep(16568.50);
  touchMove(3, 1067.99, 1738.75);
  usleep(16669.04);
  touchMove(3, 1081.52, 1730.05);
  usleep(16756.71);
  touchUp(3, 1123.08, 1702.06);
  usleep(49893.33);

  touchDown(2, 90.83, 1646.03);
  usleep(83268.29);
  touchMove(2, 135.29, 1657.62);
  usleep(16757.92);
  touchMove(2, 160.42, 1681.77);
  usleep(16682.21);
  touchMove(2, 194.25, 1714.59);
  usleep(16541.17);
  touchMove(2, 221.31, 1738.75);
  usleep(16864.54);
  touchMove(2, 241.61, 1759.03);
  usleep(16541.62);
  touchMove(2, 264.81, 1782.21);
  usleep(16785.33);
  touchMove(2, 281.24, 1807.31);
  usleep(16695.67);
  touchMove(2, 294.77, 1829.51);
  usleep(16639.46);
  touchMove(2, 307.34, 1850.77);
  usleep(16802.67);
  touchMove(2, 324.73, 1891.30);
  usleep(16866.25);
  touchUp(2, 347.93, 1926.07);
  usleep(16866.25);
end

function puni.battleWithHits()
  tap(377.89, 1790.90);
  usleep(100179.12);

  tap(309.27, 1705.90);
  usleep(100200.79);

  tap(407.85, 1486.70);
  usleep(83464.71);

  tap(690.08, 1296.48);
  usleep(83200.71);

  tap(925.91, 1304.23);
  usleep(83494.79);

  tap(813.79, 1642.19);
  usleep(100043.17);

  tap(630.15, 1933.79);
  usleep(83532.83);

  tap(476.48, 1914.48);
  usleep(100066.08);

  tap(701.68, 1656.67);
  usleep(83496.25);

  tap(878.55, 1675.98);
  usleep(83484.33);

  tap(704.58, 1871.02);
  usleep(83587.04);

  tap(402.05, 1803.43);
  usleep(120479.42);

  tap(209.72, 1619.98);
  usleep(66834.46);

  tap(151.73, 1473.19);
  usleep(83041.29);

  tap(296.70, 1329.33);
  usleep(99992.25);

  tap(601.16, 1309.05);
  usleep(83697.04);

  tap(896.91, 1286.84)
  usleep(83400.00);

  tap(1089.25, 1397.89);
  usleep(100022.67);

  tap(863.09, 1735.85);
  usleep(100019.46);

  tap(647.55, 1843.02);
  usleep(83609.46);

  tap(553.80, 1717.49);
  usleep(99910.42);

  tap(498.71, 1530.16);
  usleep(83221.04);

  tap(615.66, 1410.42);
  usleep(100146.46);

  tap(825.39, 1468.37);
  usleep(99965.04);

  tap(800.26, 1719.44);
  usleep(100141.21);

  tap(317.00, 1828.53);
  usleep(100364.38);

  tap(179.75, 1572.65);
  usleep(83676.29);

  tap(385.62, 1327.37);
  usleep(83662.75);

  tap(675.58, 1186.41);
  usleep(83145.62);

  tap(966.50, 1465.48);
  usleep(99880.25);

  tap(918.18, 1773.52);
  usleep(99965.50);

  tap(523.84, 1823.72);
  usleep(99853.58);

  tap(201.02, 1638.31);
  usleep(100296.67);

  tap(282.21, 1313.86);
  usleep(83554.92);

  tap(333.43, 1279.09);
  usleep(166605.83);
end

--
-- Ohajiki
--

function puni.inOhajiki()
  return puni.isFound({{8224125,0,0}, {16772263,19,-3}, {16771480,39,5}, {16766287,37,34}, {4473923,76,-9}, {16773304,108,-5}, {2445470,107,-53}}, 0, nil);
end

function puni.playOhajikiGoStraight()
  touchDown(4, 630.15, 1474.17);
  usleep(50571.96);
  touchMove(4, 630.15, 1446.17);
  usleep(16292.00);
  touchMove(4, 630.15, 1430.71);
  usleep(16899.58);
  touchMove(4, 630.15, 1412.38);
  usleep(16476.88);
  touchMove(4, 630.15, 1390.14);
  usleep(16738.96);
  touchMove(4, 630.15, 1359.25);
  usleep(16753.17);
  touchMove(4, 630.15, 1309.05);
  usleep(16607.17);
  touchMove(4, 630.15, 1210.53);
  usleep(16566.92);
  touchMove(4, 630.15, 1088.87);
  usleep(16736.75);
  touchMove(4, 630.15, 936.32);
  usleep(16749.83);
  touchMove(4, 630.15, 777.93);
  usleep(16675.62);
  touchMove(4, 630.15, 645.66);
  usleep(16549.92);
  touchUp(4, 630.15, 639.87);
  usleep(16549.92);
end

return puni
