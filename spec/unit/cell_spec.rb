describe Cell do

  let(:test_cell)               { described_class.new(0,0) }
  let(:other_cell)              { described_class.new(1,0) }
  let(:test_current_generation) { [Cell.new(1,1)] }


  describe '#coordinates' do
    it 'returns an array of [x, y] coordinates' do
      test_cell = described_class.new(0, 1)
      expect(test_cell.coordinates).to eq([0, 1])
    end
  end


  describe '#neighbours' do
    it 'returns an array of all neighbouring cells' do
      test_cell = described_class.new(0, 0)
      expect(test_cell.neighbours).to eq([Cell.new(1,0), 
                                          Cell.new(1,-1),
                                          Cell.new(0,-1),
                                          Cell.new(-1,-1),
                                          Cell.new(-1,0),
                                          Cell.new(-1,1),
                                          Cell.new(0,1),
                                          Cell.new(1,1)])
    end
  end


  describe '#has_n_neighbours' do
    context 'when the input of #has_n_neighbours matches the n of neighbours' do
      it 'returns true' do
        expect(test_cell.has_n_neighbours?(1, test_current_generation)).to eq(true)
      end
    end

    context 'when the input of #has_n_neighbours does not match the n of neighbours' do
      it 'returns false' do
        expect(test_cell.has_n_neighbours?(2, test_current_generation)).to eq(false)
      end
    end
  end


  describe '#==' do

    context 'when the coordinates of the other cell are different' do 
      it 'returns false' do
        expect(test_cell == other_cell).to eq(false)
      end
    end

    context 'when the coordinates of the other cell are not different' do 
      it 'returns true' do
        expect(test_cell == test_cell).to eq(true)
      end
    end

  end
end
