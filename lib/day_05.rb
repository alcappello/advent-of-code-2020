class DayFive

  def self.get_row(sample)
    get_position(sample[0..6], 'F')
  end

  def self.get_column(sample)
    get_position(sample[7..9], 'L')
  end

  def self.get_position(sample, char)
    len = sample.length
    low = 1
    high = 2**len
    (len - 1).times do |i|
      diff = (high - low + 1) / 2
      if sample[i] == char
        high -= diff
      else
        low += diff
      end
    end

    sample[len - 1] == char ? low - 1 : high - 1
  end

  def self.get_ticket(sample)
    row = get_row(sample)
    col = get_column(sample)
    row * 8 + col
  end

end
