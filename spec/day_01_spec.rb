# frozen_string_literal: true

require 'rspec'
require '../lib/day_01'

RSpec.describe 'DayOne' do
  @data = []

  before(:all) do
    file = File.open('spec/day_01_data.txt')
    @data = file.readlines.map(&:chomp).map(&:to_i)
  end

  it 'calculates the product of 2' do
    data = [2010, 67, 10, 56, 993]
    result = DayOne.calculate_product_with_two(data)
    expect(result).to be(2010 * 10)
  end

  it 'calculates the product of 3' do
    data = [2014, 5, 7, 4, 99, 1223, 889, 50, 1]
    result = DayOne.calculate_product_with_three(data)
    expect(result).to be(2014 * 5)
  end

  it 'solves the riddle #1' do
    puts DayOne.calculate_product_with_two(@data)
  end

  it 'solves the riddle #2' do
    puts DayOne.calculate_product_with_three(@data)
  end
end

