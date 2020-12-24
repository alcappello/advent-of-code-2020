class DayFour

  def self.validate(passport)
    passport.key?('ecl') &&
      passport.key?('eyr') &&
      passport.key?('hcl') &&
      passport.key?('byr') &&
      passport.key?('iyr') &&
      passport.key?('pid') &&
      passport.key?('hgt')
  end

  def self.check_values(passport)
    passport['byr'].to_i.between?(1920, 2002) &&
      passport['iyr'].to_i.between?(2010, 2020) &&
      passport['eyr'].to_i.between?(2020, 2030) &&
      /\d{9}/.match?(passport['pid']) &&
      /^(amb|blu|brn|gry|grn|hzl|oth)$/.match?(passport['ecl']) &&
      /^#[0-9a-f]{6}$/.match?(passport['hcl']) &&
      (/^(1[5-8][0-9]|19[0-3])cm$/.match?(passport['hgt']) ||
        /^(59|6[0-9]|7[0-6])in$/.match?(passport['hgt']))

  end

  def self.split_input(string)
    scanner = /(?<ecl>ecl:[^\n\s]*)|(?<pid>pid:[^\n\s]*)|(?<eyr>eyr[^\n\s]*)|(?<hcl>hcl[^\n\s]*)|
               (?<byr>byr[^\n\s]*)|(?<iyr>iyr[^\n\s]*)|(?<cid>cid[^\n\s]*)|(?<hgt>hgt[^\n\s]*)/x
    string.scan(scanner).flat_map(&:compact).map { |x| [x[0..2], x[4..x.length - 1]] }.to_h
  end
end
