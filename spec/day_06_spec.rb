# frozen_string_literal: true

require 'rspec'
require '../lib/day_06'

describe DaySix do
  @data = []

  before(:all) do
    file = File.open('spec/day_06_data.txt')
    raw_data = file.readlines.map(&:chomp)
    accumulator = []
    data = []
    raw_data.each do |row|
      if row == ''
        data << accumulator
        accumulator = []
      else
        accumulator << row
      end
    end

    data << accumulator

    @data = data
  end

  context 'First Riddle' do
    it 'counts the unique answers' do
      texts = %w[adgbvno n twq]
      answers = DaySix.count_unique_answers(texts)
      expect(answers).to eq(10)
    end

    it 'solves the riddle #1' do
      puts @data.reduce(0) { |sum, elem| sum + DaySix.count_unique_answers(elem) }
    end
  end

  context 'Second Riddle' do
    it 'counts the common answers' do
      texts = %w[abc bcqw cebt]
      answers = DaySix.count_common_answers(texts)
      expect(answers).to eq(2)
    end

    it 'counts the common answers without duplicates' do
      texts = %w[abbc bbca bbbbac]
      answers = DaySix.count_common_answers(texts)
      expect(answers).to eq(3)
    end

    it 'solves the riddle #2' do
      puts @data.reduce(0) { |sum, elem| sum + DaySix.count_common_answers(elem) }
    end
  end
end
