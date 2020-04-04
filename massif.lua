engine.name = "ResonatorBank"


function init()
  
  params:add_control("amp", "amp", controlspec.new(0.0, 1.0, "lin", 0.01, .05))
  params:set_action("amp", function(v) engine.amp(v) end)

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
  
  redraw()
end

function redraw()
  screen.clear()
  screen.move(64, 32)
  screen.text_center(". .. ...... . .. .... .. .... . ....... ")
  screen.update()
end
