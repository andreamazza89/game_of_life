describe Grid, ':new' do

  it 'Sets the current generation of cells to match the input' do
    test_grid = described_class.new([[55,3],[44,3]])

    expect(test_grid.current_generation).to eq([[55,3],[44,3]])
  end

end

describe Grid, '#tick' do

  let(:rule_two)  { class_double('RuleTwo') }
  let(:rule_four) { class_double('RuleFour') }

  it 'Returns the updated grid status, based on the rules given' do

    test_grid = described_class.new([])
    allow(rule_two).to receive(:evaluate_next_generation_cells) { [[55,3],[44,3]] }
    allow(rule_four).to receive(:evaluate_next_generation_cells) { [[2,2]] }

    expect(test_grid.tick([rule_two, rule_four])).to eq([[55,3],[44,3], [2,2]])
  end

end

