# frozen_string_literal: true

require 'pry'

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day6
    class Buffer
      def initialize
        @buffer = {}
        @sequence = []
      end

      def add(letter)
        @buffer[letter] ||= 0
        @buffer[letter] += 1
        @sequence << letter
      end

      def remove_oldest
        letter_to_remove = @sequence.first
        @sequence.delete_at(0)
        @buffer[letter_to_remove] -= 1
        @buffer.delete(letter_to_remove) if @buffer[letter_to_remove] <= 0
      end

      def four_unique?
        @buffer.keys.size == 4
      end
    end

    def part1
      buffer = Buffer.new
      count = 0

      datastream.each_char do |char|
        buffer.add(char)
        count += 1

        return count if buffer.four_unique?

        buffer.remove_oldest unless count < 4
      end
      count
    end

    def part2
      "TODO"
    end

    private

    def datastream
      @datastream ||= input_file.readline
    end

    def input_file
      FileManager.input_file(2022, 6)
    end
  end
end

day = Year2022::Day6.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
# Printer.frame('Part 2') { day.part2 }