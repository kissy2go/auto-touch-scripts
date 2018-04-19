-- //////////////////////////////
-- AutoTouch extensions
-- //////////////////////////////

function sleep(seconds)
  usleep(seconds * 1000000)
end

function msleep(mseconds)
  usleep(mseconds * 1000)
end

function isColor(color, count, region)
  local locations = findColor(color, count, region)
  for i, coord in pairs(locations) do
    return true
  end
  return false
end

function isColors(colors, count, region)
  local locations = findColors(colors, count, region)
  for i, coord in pairs(locations) do
    return true
  end
  return false
end

function tapColor(color, count, region)
  local locations = findColor(color, count, region)
  for i, coord in pairs(locations) do
    tap(coord[1], coord[2])
    return
  end
end

function tapColors(colors, count, region)
  local locations = findColors(colors, count, region)
  for i, coord in pairs(locations) do
    tap(coord[1], coord[2])
    return
  end
end

function randomTap(region)
  math.randomseed(os.time())

  local x = math.random(region[1], region[1] + region[3])
  local y = math.random(region[2], region[2] + region[4])

  tap(x, y)
end

-- //////////////////////////////
-- Logger
-- //////////////////////////////
local Logger = {}

function Logger.new(logging)
  logger = {}
  logger.logging = false
  setmetatable(logger, {__index = Logger})
  return logger
end

function Logger:log(content)
  if self.logging then log(content) end
end

-- //////////////////////////////
-- App
-- //////////////////////////////
local App = {}

App.IDENTIFIER = "com.Level5.YWP"

function App.state()
  return appState(App.IDENTIFIER)
end

function App.running()
  return App.state() == "ACTIVATED"
end

function App.run()
  if not (App.getAppState() == "NOT RUNNING") then
    return
  end

  appRun(App.APP_IDENTIFIER)
end

function App.new()
  obj = {}
  obj.logging = false
  obj.defaultIntervalSec = 0.5

  setmetatable(obj, {__index = App})

  return obj
end

function App:setLogging(logging)
  self.logging = logging
end

function App:log(message)
  log(message)
end

function App:setSpeed(speed)
  if speed < 0
  elseif speed == 0
  elseif 0 < speed
  end
end
