#Understands its location in the grid

class Cell
  def initialize(x, y) 
    @x, @y = x, y
  end

  def coordinates
    [@x, @y]
  end

  def neighbours
    [Cell.new(@x + 1, @y),
     Cell.new(@x + 1, @y - 1),
     Cell.new(@x, @y - 1),
     Cell.new(@x - 1, @y - 1),
     Cell.new(@x - 1, @y),
     Cell.new(@x - 1, @y + 1),
     Cell.new(@x, @y + 1),
     Cell.new(@x + 1, @y + 1)]
  end

  def has_n_neighbours?(n, current_generation)##########################################TEST ME
    current_generation.select { |other_cell| other_cell.neighbours.include?(self) }.count == n
  end

  def ==(other_cell)##########################################TEST ME
    other_cell.coordinates == self.coordinates  
  end

end
