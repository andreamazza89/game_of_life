#Understands how to update the next generation of alive cells based on the grid and rule 2:
#Any live cell with two or three live neighbours lives on to the next generation.

class RuleTwo

  def self.evaluate_next_generation_cells(grid)
    potential_new_cells = remove_already_surviving_cells(grid.current_generation.flatten, grid)
    potential_new_cells.select { |cell| cell.has_n_neighbours?(2, potential_new_cells) || 
                                        cell.has_n_neighbours?(3, potential_new_cells) }
  end

  private

  def self.remove_already_surviving_cells(potential_new_cells, grid)
    potential_new_cells.delete_if { |cell| grid.next_generation.flatten.include? (cell) }
  end

end
