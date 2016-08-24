describe Grid do

  let(:mock_rule_two)         { class_double('RuleTwo') }
  let(:mock_rule_four)        { class_double('RuleFour') }
  let(:sample_generation_one) { [[55,3],[44,3]] }
  let(:sample_generation_two) { [[2,2]] }

  describe ':new' do
    it 'Sets the current generation of cells to match the input' do
      test_grid = described_class.new(sample_generation_one)

      expect(test_grid.current_generation).to eq(sample_generation_one)
    end
  end


  describe '#tick' do
    it 'Returns the updated grid status, based on the rules given' do

      test_grid = described_class.new([])
      allow(mock_rule_two).to receive(:evaluate_next_generation_cells)
        .and_return(sample_generation_one)
      allow(mock_rule_four).to receive(:evaluate_next_generation_cells) 
        .and_return(sample_generation_two)

      expect(test_grid.tick([mock_rule_two, mock_rule_four]))
        .to eq(sample_generation_one + sample_generation_two)
    end
  end
end
