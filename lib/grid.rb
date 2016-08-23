#Understands how to update the current generation of alive cells based on 
#the rules provided
class Grid

  attr_reader :current_generation
  
  def initialize(alive_cells)
    @current_generation = alive_cells
  end

  def tick(rules)
    next_generation = []

    rules.each do |rule|
      next_generation << rule.evaluate_next_generation_cells(self)
    end

    @current_generation = next_generation.flatten(1)
  end
end
