#Understands how to update the next generation of alive cells based on rule 4:
#Any live cell with two or three live neighbours lives on to the next generation.

class RuleFour

  def self.evaluate_next_generation_cells(grid)
    current_generation = grid.current_generation
    next_generation    = []

    current_generation.each do |cell|
      next_generation << neighbours(cell) 
    end

    next_generation.flatten(1).uniq.select { |cell| has_three_neighbours?(cell, current_generation) }
  end

  private

  def self.has_three_neighbours?(cell, current_generation)
    cell_neighbours = neighbours(cell)
    current_generation.select { |cell| cell_neighbours.include?(cell) }.count == 3
  end

#consider extracting a Cell class that understands who its neighbours are
#also refactor into a more elegant solution?
  def self.neighbours(cell)
    x = cell[0]
    y = cell[1]
    [[x + 1, y],
     [x + 1, y - 1],
     [x, y - 1],
     [x - 1, y - 1],
     [x - 1, y],
     [x -1, y + 1],
     [x, y + 1],
     [x + 1, y + 1]]
  end

end
