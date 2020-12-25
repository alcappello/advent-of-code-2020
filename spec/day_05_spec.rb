# frozen_string_literal: true

require 'rspec'
require '../lib/day_05'

describe DayFive do
  @data = []

  before(:all) do
    file = File.open('spec/day_05_data.txt')
    @data = file.readlines.map(&:chomp)
  end

  context 'First Riddle' do
    it 'gets the row' do
      sample = 'FBFBBFFRLR'
      expect(DayFive.get_row(sample)).to eq(44)
    end

    it 'gets the column' do
      sample = 'FBFBBFFRLR'
      expect(DayFive.get_column(sample)).to eq(5)
    end

    it 'gets the right ticket number' do
      sample = 'FBFBBFFRLR'
      expect(DayFive.get_ticket(sample)).to eq(357)
    end

    it 'solves the riddle #1' do
      max = 0
      @data.each do |x|
        ticket = DayFive.get_ticket(x)
        max = ticket if ticket > max
      end
      puts max
    end
  end

  context 'Second Riddle' do
    it 'solves the riddle #2' do
      tickets = []
      @data.each do |x|
        tickets << DayFive.get_ticket(x)
      end
      tickets = tickets.sort
      (1..(tickets.length - 1)).each do |i|
        puts tickets[i] - 1 if tickets[i] != tickets[i-1] + 1
      end
    end

  end
end
