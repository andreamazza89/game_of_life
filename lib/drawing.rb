require 'drawille'

require_relative './grid'
require_relative './cell'
require_relative './rule_two'
require_relative './rule_four'

GLIDER = [Cell.new(0,0), Cell.new(1,-1), Cell.new(1,-2),Cell.new(0,-2), Cell.new(-1,-2)]
SMALL_EXPLODER = [Cell.new(10,10), Cell.new(10,11), Cell.new(11,10),Cell.new(9,10), Cell.new(9,9), Cell.new(11,9), Cell.new(10,8)]

canvas   = Drawille::Canvas.new
flipbook = Drawille::FlipBook.new
grid     = Grid.new(GLIDER + SMALL_EXPLODER)


50.times do
    canvas.clear
    grid.tick([RuleTwo,RuleFour]).each do |cell|
      next unless cell.coordinates[0].between?(-100,100) || cell.coordinates[1].between?(-100,100)
      canvas.set(cell.coordinates[0] + 100, 100 - cell.coordinates[1])
    end
    flipbook.snapshot canvas
end
  flipbook.play repeat: false, fps: 3
