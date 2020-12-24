# frozen_string_literal: true

require 'rspec'
require '../lib/day_03'

RSpec.describe 'DayThree' do
  @data = []

  before(:all) do
    file = File.open('spec/day_03_data.txt')
    @data = file.readlines.map(&:chomp)
  end

  context 'First Riddle' do
    it 'counts the trees' do
      map = %w[..#..#... .#....#.. #..#..#.. .######## ......... #.#.#.#.#]
      result = DayThree.count_the_trees(map, 3, 1)
      expect(result).to eq(2)
    end

    it 'counts in a tight forest' do
      map = %w[#### #### #### #### #### #### ####]
      result = DayThree.count_the_trees(map, 3, 1)
      expect(result).to eq(6)
    end

    it 'counts in the desert' do
      map = %w[... ... ... ... ... ...]
      result = DayThree.count_the_trees(map, 3, 1)
      expect(result).to eq(0)
    end

    it 'solves the riddle #1' do
      puts DayThree.count_the_trees(@data, 3, 1)
    end
  end

  context 'Second Riddle' do
    it 'solves the riddle #2' do
      count = 1
      count *= DayThree.count_the_trees(@data, 1, 1)
      count *= DayThree.count_the_trees(@data, 3, 1)
      count *= DayThree.count_the_trees(@data, 5, 1)
      count *= DayThree.count_the_trees(@data, 7, 1)
      count *= DayThree.count_the_trees(@data, 1, 2)


      puts count
    end
  end
end
