describe 'Integration - grid has some alive cells ' do

  let(:test_cell) { Cell.new(0,0) }

  #Any live cell with two or three live neighbours lives on 
  #to the next generation.
  context 'Rule 2' do
    context 'when the grid contains 2 or 3 cells around the cell analysed' do

      it 'Grid#tick returns an array including the cell analysed (example 0)' do
        test_grid = Grid.new([test_cell, Cell.new(1,0), Cell.new(1,1)])
        rules     = [RuleTwo, RuleFour]
        expect(test_grid.tick(rules)).to include(test_cell)
      end

      it 'Grid#tick returns an array including the cell analysed (example 1)' do
        test_grid = Grid.new([test_cell, Cell.new(1,0), Cell.new(1,1), Cell.new(0,1)])
        rules     = [RuleTwo, RuleFour]
        expect(test_grid.tick(rules)).to include(test_cell)
      end

    end

    context 'when the grid does not contain 2 or 3 cells around the cell analysed' do

      it 'Grid#tick returns an array excluding the cell analysed (example 0)' do
        test_grid = Grid.new([test_cell, Cell.new(1,0), Cell.new(1,1), Cell.new(0,1), Cell.new(-1,-1)])
        rules     = [RuleTwo, RuleFour]
        expect(test_grid.tick(rules)).not_to include(test_cell)
      end

    end
  end


  #Any dead cell with exactly three live neighbours becomes a live cell, 
  #as if by reproduction.
  context 'Rule 4' do

    it 'Grid#tick returns an array including the cell analysed (example 0)' do
      test_grid = Grid.new([Cell.new(1,0), Cell.new(1,1), Cell.new(0,1)])
      rules     = [RuleTwo, RuleFour]
      expect(test_grid.tick(rules)).to include(test_cell)
    end

  end
end
