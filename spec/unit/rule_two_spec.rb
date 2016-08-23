#Understands how to update the next generation of alive cells based on rule 2:
#Any live cell with two or three live neighbours lives on to the next generation.

describe RuleTwo, '#evaluate_next_generation_cells' do

  let(:mock_grid) { instance_double('Grid') }
  let(:rule_two)  { described_class }

  context 'When none of the cells in the current generation fit the rule', focus: true do
    it 'returns an empty array, example 0' do
      allow(mock_grid).to receive(:current_generation) { [] }
      expect(rule_two.evaluate_next_generation_cells(mock_grid)).to eq([])
    end
  end

end
