class DayOne
  def self.calculate_product_with_two(data)
    data.each do |x|
      data.each { |y| return x * y if x + y == 2020 }
    end
  end

  def self.calculate_product_with_three(data)
    data.each do |x|
      data.each do |y|
        data.each { |z| return x * y * z if x + y + z == 2020 }
      end
    end
  end
end
