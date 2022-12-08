# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day1
    class Elf
      include Comparable

      attr_accessor :calories
      attr_reader :id

      def initialize(id, calories: 0)
        @id = id
        @calories = calories
      end

      def add_calories(cals)
        @calories += cals
      end

      def <=>(other)
        @calories <=> other.calories
      end

      def ==(other)
        (@id == other.id) && (@calories == other.calories)
      end

      def to_s
        "Elf: #{@id} -- #{@calories} calories"
      end
    end

    def elves
      return @elves if defined?(@elves)

      @elves = []
      current_index = 1
      current_elf = Elf.new(current_index)
      input_file.readlines.each do |line|
        if line == "\n"
          @elves << current_elf
          current_index += 1
          current_elf = Elf.new(current_index)
          next
        end
        current_elf.add_calories(line.to_i)
      end
      @elves << current_elf
    end

    def part1
      elves.max.to_s
    end

    def part2
      elves.sort.reverse[0..2].map(&:calories).sum.to_s
    end

    def input_file
      FileManager.input_file(2022, 1)
    end
  end
end

day = Year2022::Day1.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
Printer.frame('Part 2') { day.part2 }
