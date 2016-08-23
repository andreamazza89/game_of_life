describe RuleTwo, ':evaluate_next_generation_cells' do

  let(:mock_grid) { instance_double('Grid') }
  let(:rule_two)  { described_class }

  context 'When none of the cells in the current generation fit the rule' do
    it 'returns an empty array, example 0' do
      allow(mock_grid).to receive(:current_generation) { [] }
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([])
    end

    it 'returns an empty array, example 1' do
      allow(mock_grid).to receive(:current_generation) { [[0,0], [1,0] ] }
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([])
    end
  end

  context 'When some of the cells in the current generation fit the rule' do
    it 'returns an array of cells that fit the rule, example 0' do
      allow(mock_grid).to receive(:current_generation) { [[0, 0], [1, 1], [-1, -1]] }
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([[0,0]])
    end

    it 'returns an array of cells that fit the rule, example 1' do
      allow(mock_grid).to receive(:current_generation) { [[0, 0], [1, 1], [-1, -1], [0, -1]] }
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([[0,0],[-1,-1],[0,-1]])
    end

    it 'returns an array of cells that fit the rule, example 2' do
      allow(mock_grid).to receive(:current_generation) { [[0, 0], [-1, 1], [1, -1], [0, -2]] }
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([[0,0],[1,-1]])
    end
  end
end
