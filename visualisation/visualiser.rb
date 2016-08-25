require 'drawille'

initial_state_path = ARGV[0]

require_relative '../lib/grid'
require_relative '../lib/rule_two'
require_relative '../lib/rule_four'

begin
  require_relative initial_state_path
rescue
  puts 'please enter a valid path to a valid initial state (see README)'
  exit
end

total_frames      = ARGV[1].nil? ? 50  : ARGV[1].to_i
frames_per_second = ARGV[2].nil? ? 10  : ARGV[2].to_i
canvas_size       = ARGV[3].nil? ? 200 : ARGV[3].to_i

canvas   = Drawille::Canvas.new
flipbook = Drawille::FlipBook.new
grid     = Grid.new(INITIAL_STATE.flatten(1))


def cartesian_to_raster(cell, canvas_size)
  [(cell.coordinates[0] + canvas_size/2), (canvas_size/2 - cell.coordinates[1])]
end

total_frames.times do
  canvas.clear

  grid.current_generation.each do |cell|
    raster_cell = cartesian_to_raster(cell, canvas_size)
    x = raster_cell[0]
    y = raster_cell[1]
    if x.between?(0,canvas_size) && y.between?(0,canvas_size)
      canvas.set(x,y)
    end
  end

  flipbook.snapshot canvas
  grid.tick([RuleTwo,RuleFour])

end

flipbook.play repeat: false, fps: frames_per_second
