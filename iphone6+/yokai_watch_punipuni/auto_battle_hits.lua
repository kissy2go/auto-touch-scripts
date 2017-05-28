--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

while puni.inBattle() do
  puni.battleWithHits()
  puni.battleWithHits()
end
