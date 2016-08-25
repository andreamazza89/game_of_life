#Understands how to update the next generation of alive cells based on rule 2:
#Any live cell with two or three live neighbours lives on to the next generation.

class RuleTwo

  def self.evaluate_next_generation_cells(grid)
    current_generation = grid.current_generation
    current_generation.select { |cell| cell.has_n_neighbours?(2, current_generation) || 
                                       cell.has_n_neighbours?(3, current_generation) }
  end

end
