describe 'Integration - grid has some alive cells ' do

  let(:test_cell) { [0,0] }

  #Any live cell with fewer than two live neighbours dies, 
  #as if caused by under-population
  context 'Rule 1' do

    it '#tick returns an array excluding the cell analysed (example 0)' do
      test_grid = Grid.new([test_cell])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).not_to include(test_cell)
    end

    it '#tick returns an array excluding the cell analysed (example 1)' do
      test_grid = Grid.new([test_cell, [1,0]])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).not_to include(test_cell)
    end

  end


  #Any live cell with two or three live neighbours lives on 
  #to the next generation.
  context 'Rule 2' do

    it '#tick returns an array including the cell analysed (example 0)' do
      test_grid = Grid.new([test_cell, [1,0], [1,1]])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).to include(test_cell)
    end

    it '#tick returns an array excluding the cell analysed (example 1)' do
      test_grid = Grid.new([test_cell, [1,0], [1,1], [1,0]])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).to include(test_cell)
    end

  end


  #Any live cell with more than three live neighbours dies, 
  #as if by over-population.
  context 'Rule 3' do

    it '#tick returns an array excluding the cell analysed (example 0)' do
      test_grid = Grid.new([test_cell, [1,0], [1,1], [1,0], [-1,1]])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).not_to include(test_cell)
    end

    it '#tick returns an array excluding the cell analysed (example 1)' do
      test_grid = Grid.new([test_cell, [1,0], [1,1], [1,0], [-1,1], [-1, 0], [-1,-1], [-1,0], [-1,1]])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).not_to include(test_cell)
    end

  end
end
