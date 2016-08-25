#Understands how to update the next generation of alive cells based on rule 4:
#Any live cell with two or three live neighbours lives on to the next generation.

class RuleFour

  def self.evaluate_next_generation_cells(grid)
    current_generation = grid.current_generation
    next_generation    = []

    current_generation.each do |cell|
      next_generation << cell.neighbours
    end

    next_generation.flatten(1).uniq { |cell| cell.coordinates }.select { |cell| cell.has_n_neighbours?(3, current_generation) }
  end

end
