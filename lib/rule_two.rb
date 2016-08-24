#Understands how to update the next generation of alive cells based on rule 2:
#Any live cell with two or three live neighbours lives on to the next generation.

class RuleTwo

  def self.evaluate_next_generation_cells(grid)
    current_generation = grid.current_generation
    current_generation.select { |cell| has_two_or_three_neighbours?(cell, current_generation) }
  end

  private

  def self.has_two_or_three_neighbours?(cell, current_generation)
    current_generation.select { |other_cell| other_cell.neighbours.include?(cell) }.count.between?(2,3)
  end

end
