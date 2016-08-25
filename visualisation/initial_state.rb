require_relative '../lib/cell'

POWDER           = [Cell.new(-20,-20), Cell.new(-21,-20), Cell.new(-22,-20),Cell.new(-19,-19), Cell.new(-20,-19), Cell.new(-20,-18)]
GLIDER           = [Cell.new(0,0), Cell.new(1,-1), Cell.new(1,-2),Cell.new(0,-2), Cell.new(-1,-2)]
SMALL_EXPLODER   = [Cell.new(10,10), Cell.new(10,11), Cell.new(11,10),Cell.new(9,10), Cell.new(9,9), Cell.new(11,9), Cell.new(10,8)]
LIGHTWEIGHT_SHIP = [Cell.new(20,20), Cell.new(23,20), Cell.new(20,22),Cell.new(21,23), Cell.new(22,23), Cell.new(23,23), Cell.new(24,23), Cell.new(24,22), Cell.new(24,21)]

INITIAL_STATE  = GLIDER + SMALL_EXPLODER + LIGHTWEIGHT_SHIP + POWDER
