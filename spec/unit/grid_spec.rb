describe Grid do

  let(:test_generation_one) { [instance_double('cell one', coordinates: [0,0])] }
  let(:test_generation_two) { [instance_double('cell two', coordinates: [1,1])] }
  let(:mock_rule_one)       { class_double('RuleOne') }
  let(:mock_rule_two)       { class_double('RuleTwo') }

  describe ':new' do
    it 'Sets the current generation of cells to match the input' do
      test_grid = described_class.new(test_generation_one)
      expect(test_grid.current_generation).to eq(test_generation_one)
    end
  end


  describe '#tick' do
    it 'Returns the updated grid status, based on the rules given' do
      test_grid = described_class.new([])
      allow(mock_rule_one).to receive(:evaluate_next_generation_cells)
        .and_return(test_generation_one)
      allow(mock_rule_two).to receive(:evaluate_next_generation_cells)
        .and_return(test_generation_two)
      expect(test_grid.tick([mock_rule_one, mock_rule_two]))
        .to eq(test_generation_one + test_generation_two)
    end
  end
end
