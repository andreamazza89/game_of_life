describe Grid, '#tick' do

  context 'When the grid has no alive cells' do
    it 'Returns an empty array' do

      test_grid = described_class.new([])
      rule_one, rule_two = double('Rule')
      rules = [rule_one, rule_two]
      
      expect(test_grid.tick(rules)).to eq([])
    end
  end
end
