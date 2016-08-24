describe RuleFour, ':evaluate_next_generation_cells' do

  let(:mock_grid)                   { instance_double('Grid') }
  let(:rule_four)                   { described_class }
  let(:test_generation_one)         { [[0, 0], [1, 0] ] }
  let(:generation_one_after_rule)   { [] }
  let(:test_generation_two)         { [[1, 0], [1, 1], [0, 1]] }
  let(:generation_two_after_rule)   { [[0,0]] }
  let(:test_generation_three)       { [[1, 0], [1, 1], [0, 1], [3, -1], [1, -2]] }
  let(:generation_three_after_rule) { [[2, 0], [2, -1], [0, 0]] }

  context 'When none of the cells in the current generation fit the rule' do

    it 'returns an empty array, example 0' do
      allow(mock_grid).to receive(:current_generation).and_return([])
      expect(rule_four.evaluate_next_generation_cells(mock_grid)).to eq([])
    end

    it 'returns an empty array, example 1' do
      allow(mock_grid).to receive(:current_generation).and_return(test_generation_one)
      expect(rule_four.evaluate_next_generation_cells(mock_grid)).to eq(generation_one_after_rule)
    end

  end

  context 'When some of the cells in the current generation fit the rule' do

    it 'returns an array of cells that fit the rule, example 0' do
      allow(mock_grid).to receive(:current_generation).and_return(test_generation_two)
      expect(rule_four.evaluate_next_generation_cells(mock_grid)).to eq(generation_two_after_rule)
    end

    it 'returns an array of cells that fit the rule, example 1' do
      allow(mock_grid).to receive(:current_generation).and_return(test_generation_three)
      expect(rule_four.evaluate_next_generation_cells(mock_grid)).to eq(generation_three_after_rule)
    end

  end
end
