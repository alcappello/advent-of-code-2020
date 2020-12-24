class DayThree

  def self.count_the_trees(map, slope_x, slope_y)
    sum = 0
    position = 0

    map = map.drop(slope_y)

    map.each_with_index do |row, i|
      next if i % slope_y != 0

      position = (position + slope_x) % row.length
      sum += 1 if row[position] == '#'
    end

    sum
  end
end
