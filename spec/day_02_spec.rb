# frozen_string_literal: true

require 'rspec'
require '../lib/day_02'

RSpec.describe 'DayTwo' do
  @data = []

  before(:all) do
    file = File.open('spec/day_02_data.txt')
    @data = file.readlines.map(&:chomp)
  end

  context 'ranges' do
    it 'checks a correct password' do
      result = DayTwo.check_password_for_ranges('1-5 a: apple')
      expect(result).to be(true)
    end

    it 'checks a wrong password' do
      result = DayTwo.check_password_for_ranges('1-4 r: potato')
      expect(result).to be(false)
    end
  end

  context 'places' do
    it 'checks a correct password' do
      result = DayTwo.check_password_for_places('1-5 a: apple')
      expect(result).to be(true)
    end

    it 'checks a wrong password' do
      result = DayTwo.check_password_for_places('1-4 t: potato')
      expect(result).to be(false)
    end
  end

  it 'solves the riddle #1' do
    count = 0
    @data.each { |x| count += DayTwo.check_password_for_ranges(x) ? 1 : 0 }
    puts count
  end

  it 'solves the riddle #2' do
    count = 0
    @data.each { |x| count += DayTwo.check_password_for_places(x) ? 1 : 0 }
    puts count
  end
end
