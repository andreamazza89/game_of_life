describe 'Integration - empty grid' do

  it '#tick returns an empty array (no alive cells)' do
    test_grid = Grid.new([])
    rules     = [RuleTwo, RuleFour]
    
    expect(test_grid.tick(rules)).to eq([])
  end

end
