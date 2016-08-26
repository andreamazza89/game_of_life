describe RuleTwo, ':evaluate_next_generation_cells' do

  let(:rule_two)                    { described_class }
  let(:mock_grid)                   { instance_double('Grid', next_generation: []) }

  let(:mock_cell_fits_rule)         { instance_double('Cell', has_n_neighbours?: true) }
  let(:mock_cell_doesnt_fit_rule)   { instance_double('Cell', has_n_neighbours?: false) }

  context 'when the grid is empty' do 
    it 'returns an empty array' do
      allow(mock_grid).to receive(:current_generation).and_return([])
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([])
    end
  end

  context 'when the grid has a cell that does not fit the rule' do
    it 'returns an empty array' do
      allow(mock_grid).to receive(:current_generation).and_return([mock_cell_doesnt_fit_rule])
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([])
    end
  end

  context 'when the grid has a cell that fits the rule' do
    it 'returns an array containing the cell' do
      allow(mock_grid).to receive(:current_generation).and_return([mock_cell_fits_rule])
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([mock_cell_fits_rule])
    end
  end

  context 'when grid#next_generation already contains a cell that fits the rule' do
    it 'returns an empty array' do
      allow(mock_grid).to receive(:current_generation).and_return([mock_cell_fits_rule])
      allow(mock_grid).to receive(:next_generation).and_return([mock_cell_fits_rule])
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([])
    end
  end
end
