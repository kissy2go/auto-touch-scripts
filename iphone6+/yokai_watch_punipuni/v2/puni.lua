local puni = {}

--
-- Consts
--

puni.SPEED_NORMAL = 0
puni.SPEED_HIGH   = 1

puni.SPMOVE_MODE_ANYTIME       = 0
puni.SPMOVE_MODE_ONLY_IN_FEVER = 1

--
-- Local variables
--

puni.intervalMillis       = 5000.00
puni.actionIntervalMillis = 1500.00
puni.spMoveMode           = puni.SPMOVE_MODE_ONLY_IN_FEVER

puni.spMove = {}
puni.spMove[1] = function()
  tap(148.83, 777.93)
end
puni.spMove[5] = function()
  tap(1066.06, 789.52)
end
puni.spMove[2] = function()
  tap(389.49, 741.24)
end
puni.spMove[4] = function()
  tap(933.64, 672.68)
end
puni.spMove[3] = function()
  tap(613.72, 646.64)
end

--
-- Configurations
--

function puni.setSpeed(speed)
  if speed == puni.SPEED_NORMAL then
    puni.setIntervalMillis(5000.00)
    puni.setActionIntervalMillis(2500.00)
  elseif speed == puni.SPEED_HIGH then
    puni.setIntervalMillis(5000.00)
    puni.setActionIntervalMillis(1500.00)
  end
end

function puni.setIntervalMillis(intervalMillis)
  puni.intervalMillis = intervalMillis
end

function puni.setActionIntervalMillis(actionIntervalMillis)
  puni.actionIntervalMillis = actionIntervalMillis
end

function puni.setSPMoveMode(mode)
  puni.spMoveMode = mode
end

--
-- Public functions
--

function puni.usleep(sleepMillis)
  usleep(sleepMillis or puni.intervalMillis)
end

function puni.findTap(colors, count, region)
  local coordinate = findColors(colors, count, region);

  for i, v in pairs(coordinate) do
    puni.usleep()
    tap(v[1], v[2])
    puni.usleep()
    return
    --log("x:" .. v[1] .. "y:" .. v[2]);
  end
end

function puni.randomTap(rangeX, rangeY)
  math.randomseed(os.time())

  local x = math.random(rangeX[1], rangeX[2])
  local y = math.random(rangeY[1], rangeY[2])
  tap(x, y)

  puni.usleep()
end

function puni.find(colors, count, region)
  local coordinate = findColors(colors, count, region);

  for i, v in pairs(coordinate) do
    return true
  end

  return false;
end

function puni.canPlay()
  return puni.find({{16774609,0,0}, {2302755,89,44}, {16701266,20,89}, {16700487,120,85}, {13355194,143,49}, {2302755,223,57}, {2960428,268,53}}, 0, nil)
end

function puni.startPlay()
  puni.randomTap({806.06, 1127.91}, {1552.37, 1673.08})
end

function puni.endPlay()
  puni.findTap({{16771224,0,0}, {2302755,7,8}, {16703072,18,18}, {2302755,36,15}, {16769133,47,7}, {2302755,59,10}, {16772518,98,-12}}, 0, nil)

  -- Fallback
  puni.findTap({{16700238,0,0}, {2302755,30,-3}, {2302755,54,-3}, {16699188,71,1}, {16774872,63,1}, {16771217,42,-20}, {2302755,86,-23}}, 0, nil)
end

function puni.autoPlay()
  if puni.canPlay() then
    puni.startPlay()
  end
end

function puni.inPlay()
  if os.difftime(os.time(), puni.lastPlayingAt) < 10 then
    return true
  end

  if puni.find({{16772778,0,0}, {15327690,8,10}, {2302755,16,14}, {16775134,27,16}, {2302755,39,14}, {16700238,58,41}}, 0, nil) then
    puni.lastPlayingAt = os.time()
    return true
  end

  if puni.find({{6709060,0,0}, {6708539,0,16}, {921102,13,19}, {6709843,24,21}, {921102,37,19}, {6707497,51,26}, {6706207,59,43}}, 0, nil) then
    puni.lastPlayingAt = os.time()
    return true
  end

  return false
end

function puni.inFever()
  if os.difftime(os.time(), puni.lastFeverAt) < 5 then
    return true
  end

  if puni.find({{16739692,0,0}, {16746359,2,-5}, {16753057,5,-10}, {16759735,8,-12}, {16748173,-4,4}}, 0, nil) then
    puni.lastFeverAt = os.time()
    return true
  end

  return false
end

function puni.hasFeverHalfEnded()
  --if os.difftime(os.time(), puni.lastFeverHalfEndedAt) < 5 then
  --  return true
  --end

  if not puni.find({{6156031,0,0}, {6156031,-6,3}, {6156031,-6,6}, {5631743,-2,5}, {6614783,-1,10}}, 0, nil) then
    --puni.lastFeverHalfEndedAt = os.time()
    return true
  end

  return false
end

function puni.readyToSPMove()
  if puni.spMoveMode == puni.SPMOVE_MODE_ONLY_IN_FEVER then
    if not puni.inFever() then
      return false
    end
  end

  return true
end

function puni.useSPMove(indexes)
  for _, i in pairs(indexes) do
    puni.spMove[i]()
    puni.usleep()
  end
end

function puni.chargeHitodama()
  if puni.find({{2302755,0,0}, {2302755,17,21}, {2302755,17,39}, {2302755,35,0}, {16706718,-3,33}, {16703075,30,35}, {16706460,39,34}, {16699984,21,70}}, 0, nil) then
    tap(936.54, 1290.68)
    usleep(1700432.42)

    tap(871.78, 1202.82)
    usleep(1304078.83)

    tap(949.11, 1290.68)
    usleep(2867817.67)

    tap(601.16, 2058.38)
    usleep(10000.00);
  end
end

function puni.playSuriSuri()
  touchDown(3, 377.89, 1218.28);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 421.38, 1253.99);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 464.88, 1291.66);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 493.87, 1320.64);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 514.17, 1341.86);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 527.70, 1359.25);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 539.30, 1373.73);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 550.90, 1393.04);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(3, 574.10, 1434.58);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(5, 1078.62, 1163.23);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 1063.16, 1160.33);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 1053.49, 1160.33);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 1036.09, 1161.31);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 999.37, 1177.72);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 926.88, 1210.53);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 859.22, 1242.40);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 819.59, 1263.66);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 789.63, 1280.07);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 767.40, 1292.64);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 751.94, 1303.25);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 741.30, 1315.82);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 726.81, 1329.33);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(5, 721.01, 1335.12);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(4, 450.38, 1567.83);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 460.05, 1560.11);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 460.05, 1539.83);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 460.05, 1506.04);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 460.05, 1473.19);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 458.11, 1434.58);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 454.25, 1407.53);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 449.41, 1377.61);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 442.65, 1351.53);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 432.98, 1329.33);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 425.25, 1310.97);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 417.52, 1296.48);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 405.92, 1288.76);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 394.32, 1281.99);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 373.06, 1273.30);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(4, 321.83, 1250.15);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(6, 773.20, 1784.13);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 753.87, 1758.05);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 748.07, 1727.16);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 740.34, 1691.44);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 733.57, 1647.98);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 731.64, 1611.29);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 731.64, 1571.70);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 731.64, 1542.73);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 731.64, 1511.83);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 731.64, 1484.78);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 732.60, 1466.45);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 737.44, 1445.19);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 744.20, 1426.83);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 773.20, 1389.20);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(6, 779.00, 1383.40);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(7, 399.15, 1794.74);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 399.15, 1785.11);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 399.15, 1769.64);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 399.15, 1747.44);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 398.19, 1720.38);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 393.36, 1684.67);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 384.66, 1639.29);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 379.82, 1608.39);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 370.16, 1585.21);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 353.73, 1565.91);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 331.50, 1552.37);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 269.64, 1515.68);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 165.26, 1444.22);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(7, 159.46, 1438.42);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(8, 850.52, 1259.79);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 823.46, 1276.20);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 809.93, 1288.76);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 791.56, 1305.17);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 765.47, 1326.43);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 744.20, 1341.86);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 718.11, 1357.33);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 694.91, 1370.84);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 679.45, 1379.53);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 667.85, 1387.24);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(8, 663.02, 1395.94);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(8, 657.22, 1401.73);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(1, 382.72, 1957.94);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 403.99, 1951.17);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 419.45, 1940.56);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 428.15, 1925.09);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 435.88, 1902.89);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 444.58, 1867.18);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 448.45, 1815.02);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 450.38, 1766.74);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 450.38, 1727.16);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 450.38, 1686.59);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 450.38, 1653.78);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 441.68, 1632.52);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 424.28, 1616.11);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 398.19, 1596.80);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 334.40, 1554.32);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(1, 328.60, 1548.52);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(9, 683.31, 2020.71);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 668.81, 2000.43);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 662.05, 1977.25);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 658.18, 1948.27);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 655.28, 1914.48);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 655.28, 1878.77);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 655.28, 1851.71);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 655.28, 1822.74);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 655.28, 1795.72);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 655.28, 1764.82);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 668.81, 1725.24);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 713.27, 1663.41);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(9, 719.07, 1657.62);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(2, 521.90, 2040.99);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 526.74, 2031.32);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 526.74, 2014.91);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 526.74, 1986.92);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 514.17, 1926.07);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 496.77, 1865.22);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 475.51, 1819.84);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 433.95, 1768.66);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 385.62, 1726.18);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 342.13, 1698.18);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 267.71, 1655.70);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 199.08, 1628.68);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 171.06, 1628.68);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(2, 143.03, 1648.92);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(3, 919.14, 1966.63);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 920.11, 1949.25);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 929.78, 1933.79);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 952.01, 1897.10);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 979.07, 1859.43);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 999.37, 1827.59);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1016.76, 1804.41);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1029.33, 1786.05);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1043.83, 1765.77);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1056.39, 1749.36);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1067.99, 1738.75);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1081.52, 1730.05);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(3, 1123.08, 1702.06);
  puni.usleep(puni.actionIntervalMillis)

  touchDown(2, 90.83, 1646.03);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 135.29, 1657.62);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 160.42, 1681.77);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 194.25, 1714.59);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 221.31, 1738.75);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 241.61, 1759.03);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 264.81, 1782.21);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 281.24, 1807.31);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 294.77, 1829.51);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 307.34, 1850.77);
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 324.73, 1891.30);
  puni.usleep(puni.actionIntervalMillis)
  touchUp(2, 347.93, 1926.07);
  puni.usleep(puni.actionIntervalMillis)
end

function puni.playTapTap()
  tap(377.89, 1790.90);
  puni.usleep(puni.actionIntervalMillis)

  tap(309.27, 1705.90);
  puni.usleep(puni.actionIntervalMillis)

  tap(407.85, 1486.70);
  puni.usleep(puni.actionIntervalMillis)

  tap(690.08, 1296.48);
  puni.usleep(puni.actionIntervalMillis)

  tap(925.91, 1304.23);
  puni.usleep(puni.actionIntervalMillis)

  tap(813.79, 1642.19);
  puni.usleep(puni.actionIntervalMillis)

  tap(630.15, 1933.79);
  puni.usleep(puni.actionIntervalMillis)

  tap(476.48, 1914.48);
  puni.usleep(puni.actionIntervalMillis)

  tap(701.68, 1656.67);
  puni.usleep(puni.actionIntervalMillis)

  tap(878.55, 1675.98);
  puni.usleep(puni.actionIntervalMillis)

  tap(704.58, 1871.02);
  puni.usleep(puni.actionIntervalMillis)

  tap(402.05, 1803.43);
  puni.usleep(puni.actionIntervalMillis)

  tap(209.72, 1619.98);
  puni.usleep(puni.actionIntervalMillis)

  tap(151.73, 1473.19);
  puni.usleep(puni.actionIntervalMillis)

  tap(296.70, 1329.33);
  puni.usleep(puni.actionIntervalMillis)

  tap(601.16, 1309.05);
  puni.usleep(puni.actionIntervalMillis)

  tap(896.91, 1286.84)
  puni.usleep(puni.actionIntervalMillis)

  tap(1089.25, 1397.89);
  puni.usleep(puni.actionIntervalMillis)

  tap(863.09, 1735.85);
  puni.usleep(puni.actionIntervalMillis)

  tap(647.55, 1843.02);
  puni.usleep(puni.actionIntervalMillis)

  tap(553.80, 1717.49);
  puni.usleep(puni.actionIntervalMillis)

  tap(498.71, 1530.16);
  puni.usleep(puni.actionIntervalMillis)

  tap(615.66, 1410.42);
  puni.usleep(puni.actionIntervalMillis)

  tap(825.39, 1468.37);
  puni.usleep(puni.actionIntervalMillis)

  tap(800.26, 1719.44);
  puni.usleep(puni.actionIntervalMillis)

  tap(317.00, 1828.53);
  puni.usleep(puni.actionIntervalMillis)

  tap(179.75, 1572.65);
  puni.usleep(puni.actionIntervalMillis)

  tap(385.62, 1327.37);
  puni.usleep(puni.actionIntervalMillis)

  tap(675.58, 1186.41);
  puni.usleep(puni.actionIntervalMillis)

  tap(966.50, 1465.48);
  puni.usleep(puni.actionIntervalMillis)

  tap(918.18, 1773.52);
  puni.usleep(puni.actionIntervalMillis)

  tap(523.84, 1823.72);
  puni.usleep(puni.actionIntervalMillis)

  tap(201.02, 1638.31);
  puni.usleep(puni.actionIntervalMillis)

  tap(282.21, 1313.86);
  puni.usleep(puni.actionIntervalMillis)

  tap(333.43, 1279.09);
  puni.usleep(puni.actionIntervalMillis)
end

function puni.playChokusenKeshi()
  touchDown(5, 395.29, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 413.65, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 452.31, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 520.94, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 636.92, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 770.30, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 904.65, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(5, 1024.49, 1941.53)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(5, 1096.02, 1941.53)
  puni.usleep(puni.actionIntervalMillis)

  touchDown(7, 257.08, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 271.57, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 308.30, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 375.96, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 461.98, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 588.59, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 736.47, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 900.78, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 1060.26, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 1186.87, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(7, 1220.70, 1796.70)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(7, 1226.50, 1796.70)
  puni.usleep(puni.actionIntervalMillis)

  touchDown(2, 224.21, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 265.77, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 360.49, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 494.84, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 656.25, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 825.39, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 984.87, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 1104.72, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 1141.44, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(2, 1138.54, 1680.80)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(2, 1132.75, 1680.80)
  puni.usleep(puni.actionIntervalMillis)

  touchDown(3, 188.45, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 163.32, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 163.32, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 176.85, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 273.51, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 414.62, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 582.79, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 754.83, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 911.41, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1046.72, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1170.44, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1206.20, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1213.93, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(3, 1205.23, 1619.01)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(3, 1199.44, 1619.01)
  puni.usleep(puni.actionIntervalMillis)

  touchDown(6, 105.33, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 143.03, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 252.24, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 399.15, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 587.63, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 807.99, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 1036.09, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 1212.00, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 1236.16, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(6, 1241.94, 1439.40)
  puni.usleep(puni.actionIntervalMillis)

  touchDown(1, 174.92, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 172.02, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 184.59, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 273.51, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 423.32, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 625.32, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 859.22, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 1095.05, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(1, 1199.44, 1351.53)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(1, 1205.23, 1351.53)
  puni.usleep(puni.actionIntervalMillis)

  touchDown(9, 317.00, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 328.60, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 386.59, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 519.97, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 694.91, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 917.21, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(9, 1165.61, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(9, 1171.41, 1250.15)
  puni.usleep(puni.actionIntervalMillis)
end

function puni.playChokusenKeshi2()
  for i = 1, 10 do
  touchDown(6, 105.33, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 143.03, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 252.24, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 399.15, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 587.63, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 807.99, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 1036.09, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 1212.00, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(6, 1236.16, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(6, 1241.94, 1439.40)
  puni.usleep(puni.actionIntervalMillis)
  end
end

function puni.inOhajiki()
  return puni.find({{8224125,0,0}, {16772263,19,-3}, {16771480,39,5}, {16766287,37,34}, {4473923,76,-9}, {16773304,108,-5}, {2445470,107,-53}}, 0, nil);
end

function puni.playOhajiki()
  touchDown(4, 630.15, 1474.17)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1446.17)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1430.71)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1412.38)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1390.14)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1359.25)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1309.05)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1210.53)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 1088.87)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 936.32)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 777.93)
  puni.usleep(puni.actionIntervalMillis)
  touchMove(4, 630.15, 645.66)
  puni.usleep(puni.actionIntervalMillis)
  touchUp(4, 630.15, 639.87)
  puni.usleep(puni.actionIntervalMillis)
end

return puni
