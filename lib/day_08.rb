class DayEight
  def self.run(rules)
    pos = 0
    value = 0
    visited = []
    until visited.include?(pos) || pos == rules.length
      visited << pos
      rule = /^(?<step>nop|acc|jmp)\s(?<amount>[+|-]\d*)/.match(rules[pos])

      case rule[:step]
      when 'nop'
        pos += 1
      when 'acc'
        value += rule[:amount].to_i
        pos += 1
      else
        pos += rule[:amount].to_i
      end
    end
    [value, visited]
  end

  def self.final?(rules, stack)
    stack[stack.length - 1] == rules.length - 1
  end

  def self.update_rules(rules, stack, step)
    new_rules = rules[0..-1]
    current_step = 0
    
    stack.reverse.each do |s|
      if rules[s].include?('nop') && (current_step == step)
        new_rules[s] = rules[s].sub('nop', 'jmp')
        return new_rules
      elsif rules[s].include?('jmp') && (current_step == step)
        new_rules[s] = rules[s].sub('jmp', 'nop')
        return new_rules
      else
        current_step += 1 unless rules[s].include?('acc')
      end
    end

    new_rules
  end
end
