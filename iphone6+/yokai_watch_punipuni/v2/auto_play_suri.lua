--adaptResolution(1242, 2208);
--adaptOrientation(ORIENTATION_TYPE.PORTRAIT);

puni = require 'puni'

puni.setSpeed(puni.SPEED_HIGH)

while puni.inPlay() do
  puni.playSuriSuri()
end

puni.endPlay()
