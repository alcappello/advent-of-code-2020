# frozen_string_literal: true

require 'rspec'
require '../lib/day_08'

describe DayEight do

  before(:all) do
    file = File.open('spec/day_08_data.txt')
    @data = file.readlines.map(&:chomp)
    @rules = []

    @rules << 'nop +0'
    @rules << 'acc +1'
    @rules << 'jmp +4'
    @rules << 'acc +3'
    @rules << 'jmp -3'
    @rules << 'acc -99'
    @rules << 'acc +1'
    @rules << 'acc +6'
  end

  context 'First Riddle' do
    it 'executes the rules' do

      result = DayEight.run(@rules)
      expect(result[0]).to be(8)
    end
    it 'solves the riddle #1' do
      p DayEight.run(@data)[0]
    end
  end

  context 'Second Riddle' do
    it 'stores all the executed rules' do
      result = DayEight.run(@rules)
      expect(result[1].length).to eq(5)
    end

    it 'checks that the stack is final' do
      stack = DayEight.run(@rules)[1]
      final = DayEight.final?(@rules, stack)
      expect(final).to be(true)
    end

    it 'checks that the stack is not final' do

    end

    it 'changes the rules backwards' do
      stack = DayEight.run(@rules)[1]
      new_rules = DayEight.update_rules(@rules, stack, 0)
      expect(new_rules[2].eql?('nop +4')).to be(true)
    end
    
    it 'solves the riddle #2' do
      solved = false
      step = 0
      result = DayEight.run(@data)

      until solved
        new_rules = DayEight.update_rules(@data, result[1], step)
        result = DayEight.run(new_rules)
        solved = DayEight.final?(new_rules, result[1])
        step += 1
      end

      p 'Final', result[0]

    end
  end
end
