describe Cell do

  it '#coordinates returns an array of [x, y] coordinates' do
    test_cell = described_class.new(0, 1)
    expect(test_cell.coordinates).to eq([0, 1])
  end

  it '#neighbours returns an array of all neighbouring cells' do
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
