class DaySeven
  def self.extract_container(rule)
    /^(\w*\s\w*) bags contain /.match(rule)[1]
  end

  def self.find_containing_colors(rules, color)
    colors = rules.filter { |x| x.include?(color) }
                  .map { |x| extract_container(x) }
                  .filter { |x| x != color }
                  .uniq

    colors |= colors.map { |c| find_containing_colors(rules, c) }
    colors.flatten.uniq
  end

  def self.find_contained_bags(rules, color)
    count = 0
    rule_for_color = rules.filter { |x| x.include?(color) }
                          .filter { |x| extract_container(x) == color }[0]

    return 0 if rule_for_color.nil?

    bags = rule_for_color.scan(/(\d\s\w*\s\w*)/)
    bags.each do |b|
      amount = /^\d/.match(b[0]).to_s.to_i
      count += amount + amount * find_contained_bags(rules, /\s(\w*\s\w*)/.match(b[0])[1].to_s)
    end

    count
  end

end
