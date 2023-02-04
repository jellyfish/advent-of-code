# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day6
    def initialize
    end

    def part1
      # input_file.readlines.each do |line|
      # end
      "TODO"
    end

    def part2
      "TODO"
    end

    private

    def input_file
      FileManager.input_file(2022, 6)
    end
  end
end

day = Year2022::Day6.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
Printer.frame('Part 2') { day.part2 }
