# frozen_string_literal: true

require 'rspec'
require '../lib/day_07'

describe DaySeven do
  @data = []

  before(:all) do
    file = File.open('spec/day_07_data.txt')
    @data = file.readlines.map(&:chomp)
  end

  context 'First Riddle' do
    it 'finds out which bag is the container' do
      rule = 'striped coral bags contain 3 mirrored black bags, 5 wavy coral bags, 2 posh white bags.'
      bag = DaySeven.extract_container(rule)
      expect(bag.eql?('striped coral')).to be(true)
    end

    it 'finds what colors contain posh white bags' do
      rules = []
      color = 'posh white'

      rules << 'striped coral bags contain 3 mirrored black bags, 5 wavy coral bags, 2 posh white bags.'
      rules << 'wavy plum bags contain 4 posh white bags.'
      rules << 'clear beige bags contain 1 striped coral bag.'
      rules << 'posh orange bags contain 1 clear green bag.'

      colors = DaySeven.find_containing_colors(rules, color)
      expect(colors.length).to eq(3)
    end

    it 'solves the riddle #1' do
      p DaySeven.find_containing_colors(@data, 'shiny gold').length
    end
  end

  context 'Second Riddle' do
    it 'counts the bags inside a given color' do
      rules = []
      color = 'striped coral'

      rules << 'striped coral bags contain 3 mirrored black bags, 5 wavy plum bags, 2 posh white bags.'
      rules << 'wavy plum bags contain 4 posh white bags.'
      rules << 'clear beige bags contain 1 striped coral bag.'
      rules << 'posh orange bags contain 1 clear green bag.'

      bags = DaySeven.find_contained_bags(rules, color)
      expect(bags).to eq(3 + 5 + 5 * 4 + 2)
    end

    it 'solves the riddle #2' do
      p DaySeven.find_contained_bags(@data, 'shiny gold')
    end
  end
end
