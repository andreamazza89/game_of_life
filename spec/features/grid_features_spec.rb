describe 'Grid features' do

  context 'When the grid has no alive cells' do
    it '#tick returns an empty array (no alive cells still)' do
      test_grid = Grid.new([])
      rules     = [RuleTwo, RuleFour]
      
      expect(test_grid.tick(rules)).to eq([])
    end
  end

end
