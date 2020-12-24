class DayTwo
  def self.check_password_for_ranges(rule)
    parts = rule.match(/^(?<from>\d+)-(?<to>\d+) (?<char>.): (?<password>.*)/)
    count = parts[:password].count parts[:char]

    count.between?(parts[:from].to_i, parts[:to].to_i)
  end

  def self.check_password_for_places(rule)
    parts = rule.match(/^(?<first>\d+)-(?<last>\d+) (?<char>.): (?<password>.*)/)
    (parts[:password][parts[:first].to_i - 1] == parts[:char]) ^
      (parts[:password][parts[:last].to_i - 1] == parts[:char])
  end
end
