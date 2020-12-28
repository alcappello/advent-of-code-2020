require 'rspec'
require '../lib/day_09'

describe DayNine do
  @data = []

  before(:all) do
    file = File.open('spec/day_09_data.txt')
    @data = file.readlines.map(&:chomp)
  end

  context 'First Riddle' do
    it 'checks if n is a sum within the preamble' do
      n = 25
      preamble = [1, 5, 20, 45, 21]
      valid = DayNine.checksum(n, preamble)

      expect(valid).to be(true)
    end

    it 'validates a sequence to the end' do
      sequence = [1, 5, 20, 45, 21, 25, 50, 46, 46, 75, 125]
      result = DayNine.validate(sequence, 5)
      expect(result).to eq(125)
    end

    it 'validates a sequence with an error' do
      sequence = [1, 5, 20, 45, 21, 25, 50, 99, 46, 75, 125]
      result = DayNine.validate(sequence, 5)
      expect(result).to eq(99)
    end

    it 'solves riddle #1' do
      p DayNine.validate(@data)
    end
  end

  context 'Second Riddle' do
    it 'finds the first sequence that sums up to the given number' do
      sequence = [1, 5, 20, 45, 21, 25, 50, 99, 46, 75, 125]
      result = DayNine.find_sum_sequence(195, sequence)
      expect(result).to eq([21, 25, 50, 99])
    end

    it 'solves riddle #2' do
      result = DayNine.find_sum_sequence(14_360_655, @data).map(&:to_i).sort
      p result[0] + result[-1]
    end
  end
end
