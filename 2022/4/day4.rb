# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day4
    def initialize
    end

    def part1
      count_contained_ranges = 0
      input_file.readlines.each do |line|
        range1, range2 = line.strip.split(",")
        count_contained_ranges += 1 if range_contains_range?(range1, range2)
      end
      count_contained_ranges
    end

    def part2
      count_overlapping_ranges = 0
      input_file.readlines.each do |line|
        range1, range2 = line.strip.split(",")
        count_overlapping_ranges += 1 if range_overlaps?(range1, range2)
      end
      count_overlapping_ranges
    end

    def range_contains_range?(range1, range2)
      range1_lower, range1_upper = range1.split("-").map(&:to_i)
      range2_lower, range2_upper = range2.split("-").map(&:to_i)

      if range1_lower > range2_lower
        range1_upper <= range2_upper
      elsif range2_lower > range1_lower
        range2_upper <= range1_upper
      else
        # range1 and range2 have same lower value
        # always contained in this case. Either upper bound can be larger than the other (and one is contained)
        # or both have the same upper and this is also contained
        true
      end
    end

    def range_overlaps?(range1, range2)
      range1_lower, range1_upper = range1.split("-").map(&:to_i)
      range2_lower, range2_upper = range2.split("-").map(&:to_i)

      if range1_lower > range2_lower
        # range1 is the higher lower bound
        # if that higher lower bound is above the upper bound for range2, there is no overlap
        # in other words, if the lower bound is less than or equal to the upper bound of range2, there is overlap
        range1_lower <= range2_upper
      elsif range2_lower > range1_lower
        range2_lower <= range1_upper
      else
        return true
      end
    end

    private

    def input_file
      FileManager.input_file(2022, 4)
    end
  end
end

day = Year2022::Day4.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
Printer.frame('Part 2') { day.part2 }
