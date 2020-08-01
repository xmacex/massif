--
-- 8 resonant peaks
--
-- be careful with the 
-- amp settings
--
-- use the param menu to 
-- map things to an external
-- controller
--

engine.name = "ResonatorBank"
local MusicUtil = require "musicutil"

local current_page = 1

local mode = 0 -- 0 = play, 1 = edit
local alt = false
local pitch_tune = false
local midi_tune = false

local dirty = true


function init()
  m = midi.connect()
  m.event = midi_event
  --params:add_control("amp", "amp", controlspec.new(0.0, 1.0, "lin", 0.01, .05))
  --params:set_action("amp", function(v) engine.amp(v) end)

  params:add_control("freq1", "freq1", controlspec.new(20, 10000, "lin", 1, math.random(20, 10000), "hz"))
  params:set_action("freq1", function(v) engine.freq1(v) end)

  params:add_control("freq2", "freq2", controlspec.new(20, 10000, "lin", 1, math.random(20, 10000), "hz"))
  params:set_action("freq2", function(v) engine.freq2(v) end)
  
  params:add_control("freq3", "freq3", controlspec.new(20, 10000, "lin", 1, math.random(200, 10000), "hz"))
  params:set_action("freq3", function(v) engine.freq3(v) end)
  
  params:add_control("freq4", "freq4", controlspec.new(20, 10000, "lin", 1, math.random(300, 10000), "hz"))
  params:set_action("freq4", function(v) engine.freq4(v) end)
  
  params:add_control("freq5", "freq5", controlspec.new(2000, 18000, "lin", 1, math.random(1000, 18000), "hz"))
  params:set_action("freq5", function(v) engine.freq5(v) end)
  
  params:add_control("freq6", "freq6", controlspec.new(2000, 18000, "lin", 1, math.random(2000, 18000), "hz"))
  params:set_action("freq6", function(v) engine.freq6(v) end)
  
  params:add_control("freq7", "freq7", controlspec.new(2000, 18000, "lin", 1, math.random(4000, 18000), "hz"))
  params:set_action("freq7", function(v) engine.freq7(v) end)
  
  params:add_control("freq8", "freq8", controlspec.new(2000, 18000, "lin", 1, math.random(8000, 18000), "hz"))
  params:set_action("freq8", function(v) engine.freq8(v) end)

  params:add_control("amp1", "amp1", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp1", function(v) engine.amp1(v) end)
  
  params:add_control("amp2", "amp2", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp2", function(v) engine.amp2(v) end)
  
  params:add_control("amp3", "amp3", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp3", function(v) engine.amp3(v) end)
  
  params:add_control("amp4", "amp4", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp4", function(v) engine.amp4(v) end)
  
  params:add_control("amp5", "amp5", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp5", function(v) engine.amp5(v) end)
  
  params:add_control("amp6", "amp6", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp6", function(v) engine.amp6(v) end)
  
  params:add_control("amp7", "amp7", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp7", function(v) engine.amp7(v) end)
  
  params:add_control("amp8", "amp8", controlspec.new(0, 1, "lin", 0.01, .2))
  params:set_action("amp8", function(v) engine.amp8(v) end)
  
  params:add_control("ring1", "ring1", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring1", function(v) engine.ring1(v) end) 
  
  params:add_control("ring2", "ring2", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring2", function(v) engine.ring2(v) end)
  
  params:add_control("ring3", "ring3", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring3", function(v) engine.ring3(v) end) 
  
  params:add_control("ring4", "ring4", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring4", function(v) engine.ring4(v) end) 
  
  params:add_control("ring5", "ring5", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring5", function(v) engine.ring5(v) end) 
  
  params:add_control("ring6", "ring6", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring6", function(v) engine.ring6(v) end) 
  
  params:add_control("ring7", "ring7", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring7", function(v) engine.ring7(v) end) 
  
  params:add_control("ring8", "ring8", controlspec.new(0, 5, "lin", 0.01, .10))
  params:set_action("ring8", function(v) engine.ring8(v) end)
  
  params:bang()
  
  local screen_metro = metro.init()
  screen_metro.time = 1/30
  screen_metro.event = function() redraw() end
  screen_metro:start()
  
  pitch_tracker = poll.set("pitch_in_l")
  pitch_tracker.callback = function(x)
    if x > 0 then
      if pitch_tune  == true then
        params:set("freq" .. current_page, x)
      end
    end
  end
end


function key(n, z)
  if n == 1 then alt = z == 1 and true or false end
  if mode == 1 and alt then
    if n == 2 then 
      pitch_tune = z == 1 and true or false 
      pitch_tracker:update()
    end
    if n == 3 then midi_tune = z == 1 and true or false end
  else
    if n == 2 and z == 1 then
      mode = 0
    elseif n == 3 and z == 1 then
      mode = 1
    end
  end
  dirty = true
end


function enc(n, d)
  if mode == 1 and alt then
    if n == 1 then
      current_page = util.clamp(current_page + d, 1, 8)
    end
  else
    if n == 1 then
      params:delta("freq" .. current_page, d)
    elseif n == 2 then
      params:delta("amp" .. current_page, d)
    elseif n == 3 then
      params:delta("ring" .. current_page, d)
    end
  end
  dirty = true
end


local function draw_edit()
  screen.display_png("/home/we/dust/code/massif/assets/massif.png", 0, 0)
  screen.level(0)
  screen.move(64, 16)
  screen.font_size(24)
  screen.font_face(1)
  screen.text_center(current_page)
  screen.move(64, 22)
  screen.text_center(".................")
  screen.font_size(13)
  screen.font_face(29)
  screen.move(15, 36)
  screen.text("freq: ")
  screen.move(115, 36)
  screen.text_right(params:get("freq" .. current_page) .. " hz")
  screen.move(15, 48)
  screen.text("amp: ")
  screen.move(115, 48)
  screen.text_right(params:get("amp" .. current_page))
  screen.move(15, 60)
  screen.text("ring: ")
  screen.move(115, 60)
  screen.text_right(params:get("ring" .. current_page))
end


local function draw_play()
  screen.display_png("/home/we/dust/code/massif/assets/massif-4.png", 0, 0)
  screen.level(0)
  screen.font_size(13)
  screen.move(120, 60)
  screen.text_right("massif")
end


function redraw()
  screen.aa(1)
  if dirty then
    screen.clear()
    if mode == 1 then
      draw_edit()
    elseif mode == 0 then
      draw_play()
    end
  end
  screen.update()
  dirty = false
end


function midi_event(data)
  if #data == 0 then return end
  local msg = midi.to_msg(data)

  -- Note off
  if msg.type == "note_off" then
    --note_off(msg.note)

    -- Note on
  elseif msg.type == "note_on" then
    --print("yes")
    --note_on(msg.note, msg.vel / 127)
    if midi_tune == true then
      params:set("freq" .. current_page, MusicUtil.note_num_to_freq(msg.note))
    else
      print("hi")
      engine.offset(MusicUtil.note_num_to_freq(msg.note))
    end
  end
end
