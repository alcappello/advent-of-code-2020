# frozen_string_literal: true

require 'rspec'
require '../lib/day_04'

RSpec.describe DayFour do
  @data = []

  before(:all) do
    file = File.open('spec/day_04_data.txt')
    raw_data = file.readlines.map(&:chomp)
    accumulator = ''
    data = []
    raw_data.each do |row|
      if row == ''
        data << accumulator
        accumulator = ''
      else
        accumulator += " #{row}"
      end
    end
    data << accumulator

    @data = data
  end



  context 'First Riddle' do
    it 'splits a string into a valid object' do
      string = 'ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm'

      pass = DayFour.split_input(string)

      %w[ecl pid eyr hcl byr iyr cid hgt].each do |k|
        expect(pass).to have_key(k)
      end
    end

    it 'validates a real passport' do
      string = 'ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm'
      pass = DayFour.split_input(string)
      expect(DayFour.validate(pass)).to be(true)
    end

    it 'solves the riddle #1' do
      count = 0
      @data.each do |x|
        pass = DayFour.split_input(x)
        count += DayFour.validate(pass) ? 1 : 0
      end
      puts count
    end

  end
  context 'Second Riddle' do

    it 'solves the riddle #2' do
      count = 0
      @data.each do |x|
        pass = DayFour.split_input(x)
        next unless DayFour.validate(pass)

        count += DayFour.check_values(pass) ? 1 : 0
      end
      puts count
    end
  end
end
