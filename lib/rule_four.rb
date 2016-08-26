#Understands how to update the next generation of alive cells based on rule 4:
#Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

class RuleFour

  def self.evaluate_next_generation_cells(grid)
    current_generation  = grid.current_generation
    potential_new_cells = []

    current_generation.each do |cell|
      potential_new_cells << cell.neighbours
    end

    potential_new_cells.flatten!
    potential_new_cells = remove_duplicate_cells(potential_new_cells)
    potential_new_cells = remove_already_surviving_cells(potential_new_cells, grid)

    select_cells_with_three_neighbours(potential_new_cells, grid)
  end

  private

  def self.select_cells_with_three_neighbours(potential_new_cells, grid)
    unique_cells = remove_duplicate_cells(potential_new_cells)
    unique_cells.select { |cell| cell.has_n_neighbours?(3, grid.current_generation) }
  end

  def self.remove_duplicate_cells(potential_new_cells)
    potential_new_cells.uniq { |cell| cell.coordinates }
  end

  def self.remove_already_surviving_cells(potential_new_cells, grid)
    potential_new_cells.delete_if { |cell| grid.next_generation.flatten.include? (cell) }
  end

end
