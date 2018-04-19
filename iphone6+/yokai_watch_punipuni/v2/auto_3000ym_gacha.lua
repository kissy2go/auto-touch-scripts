--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

function gacha()
  touchDown(5, 691.04, 1596.80);
  usleep(16705.58);
  touchMove(5, 671.71, 1591.95);
  usleep(16648.83);
  touchMove(5, 638.85, 1591.95);
  usleep(16849.79);
  touchMove(5, 602.12, 1587.13);
  usleep(16579.21);
  touchMove(5, 561.53, 1578.44);
  usleep(16770.96);
  touchMove(5, 513.20, 1562.03);
  usleep(16481.92);
  touchMove(5, 463.91, 1539.83);
  usleep(16861.58);
  touchMove(5, 421.38, 1510.86);
  usleep(16461.25);
  touchMove(5, 389.49, 1473.19);
  usleep(16805.21);
  touchMove(5, 374.99, 1412.38);
  usleep(16694.42);
  touchMove(5, 381.76, 1337.04);
  usleep(16660.12);
  touchMove(5, 436.85, 1245.30);
  usleep(16565.88);
  touchMove(5, 504.51, 1168.05);
  usleep(16979.50);
  touchMove(5, 581.83, 1099.52);
  usleep(16348.38);
  touchMove(5, 662.05, 1044.47);
  usleep(16917.79);
  touchMove(5, 734.54, 1009.70);
  usleep(16520.67);
  touchMove(5, 807.03, 994.23);
  usleep(16795.67);
  touchMove(5, 859.22, 994.23);
  usleep(16407.54);
  touchMove(5, 900.78, 1041.57);
  usleep(16836.88);
  touchMove(5, 911.41, 1117.85);
  usleep(16519.08);
  touchMove(5, 908.51, 1225.02);
  usleep(16793.58);
  touchMove(5, 871.78, 1327.37);
  usleep(16649.21);
  touchMove(5, 816.69, 1416.22);
  usleep(16779.96);
  touchMove(5, 745.17, 1485.76);
  usleep(16446.79);
  touchMove(5, 663.98, 1539.83);
  usleep(16876.71);
  touchMove(5, 577.96, 1572.65);
  usleep(16435.08);
  touchMove(5, 504.51, 1584.24);
  usleep(16804.79);
  touchMove(5, 432.02, 1584.24);
  usleep(16699.17);
  touchMove(5, 370.16, 1559.14);
  usleep(16629.25);
  touchMove(5, 331.50, 1507.96);
  usleep(16642.92);
  touchMove(5, 317.97, 1434.58);
  usleep(16785.42);
  touchMove(5, 328.60, 1332.23);
  usleep(16534.25);
  touchMove(5, 381.76, 1238.56);
  usleep(16844.58);
  touchMove(5, 456.18, 1150.70);
  usleep(16527.12);
  touchMove(5, 542.20, 1082.13);
  usleep(16791.29);
  touchMove(5, 629.19, 1038.67);
  usleep(16569.08);
  touchMove(5, 705.54, 1018.39);
  usleep(16803.25);
  touchMove(5, 785.76, 1018.39);
  usleep(16522.21);
  touchMove(5, 850.52, 1040.59);
  usleep(16675.71);
  touchMove(5, 893.05, 1098.54);
  usleep(16776.38);
  touchMove(5, 908.51, 1176.74);
  usleep(16688.29);
  touchMove(5, 908.51, 1263.66);
  usleep(17016.08);
  touchMove(5, 872.75, 1365.04);
  usleep(16267.54);
  touchMove(5, 814.76, 1456.78);
  usleep(16563.46);
  touchMove(5, 743.24, 1541.75);
  usleep(16711.62);
  touchMove(5, 659.15, 1618.03);
  usleep(16568.25);
  touchMove(5, 567.33, 1688.55);
  usleep(16718.00);
  touchMove(5, 469.71, 1747.44);
  usleep(16840.08);
  touchMove(5, 376.92, 1790.90);
  usleep(16594.83);
  touchMove(5, 305.40, 1816.00);
  usleep(16429.46);
  touchUp(5, 233.88, 1823.72);
  usleep(1050267.12);

  tap(708.44, 1245.30)
  puni.usleep()
end

if puni.colorIs(711, 1511, {12517659}) then
  puni.randomTap({135, 1010}, {1355, 1530})
  puni.usleep(1500000)
end

if puni.colorIs(343, 2039, {118015}) then
  gacha()
end

if puni.colorIs(533, 1688, {16765008}) then
  puni.randomTap({419, 804}, {1602, 1758})
end

if puni.colorIs(536, 1833, {16699727}) then
  puni.randomTap({418, 803}, {1751, 1903})
end
