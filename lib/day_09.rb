# frozen_string_literal: true

class DayNine
  def self.checksum(n, preamble)
    preamble.each do |x|
      preamble.each do |y|
        return true if x.to_i + y.to_i == n.to_i
      end
    end

    false
  end

  def self.validate(sequence, preamble_length = 25)
    return false if sequence.length < preamble_length

    (preamble_length..sequence.length - 1).each do |i|
      next if checksum(sequence[i], sequence[i - preamble_length..i - 1])

      return sequence[i]
    end

    sequence[-1]
  end

  def self.find_sum_sequence(num, sequence)
    sequence.each_with_index do |x, i|
      count = 1
      until count + 1 == sequence.length
        sum = sequence[i..i + count].reduce(0) { |acc, el| acc + el.to_i }
        return sequence[i..i + count] if sum == num
        break if sum > num

        count += 1
      end

    end
  end
end
