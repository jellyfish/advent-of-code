# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day3
    def part1
      cumulative_priority_of_duplicate_items = 0
      input_file.readlines.each do |line|
        item = identify_duplicated_item(line.strip)
        cumulative_priority_of_duplicate_items += priority[item]
      end
      cumulative_priority_of_duplicate_items
    end

    def part2
      cumulative_priority_of_badges = 0

      group = []
      input_file.readlines.each do |line|
        if group.size == 3
          common_item = group[0] & group[1] & group[2]
          if common_item.size != 1
            raise <<~MSG
              unexpected common items amount: #{common_item.size}
              current_elf: #{line}
            MSG
          end
          cumulative_priority_of_badges += priority[common_item[0]]
          group = []
        end

        group << inventory(line.strip)
      end

      common_item = group[0] & group[1] & group[2]
      cumulative_priority_of_badges += priority[common_item[0]]
      cumulative_priority_of_badges
    end

    private

    def priority
      @priority if defined?(@priority)

      @priority = {}
      ('a'..'z').each_with_index { |elem, i| @priority[elem] = i + 1 }
      ('A'..'Z').each_with_index { |elem, i| @priority[elem] = i + 27 }
      @priority
    end

    def identify_duplicated_item(input)
      compartment_1 = {}
      compartment_2 = {}
      compartment_size = input.size / 2
      reversed = input.reverse

      compartment_size.times do |i|
        compartment_1_item = input[i]
        compartment_2_item = reversed[i]

        return compartment_1_item if compartment_1_item == compartment_2_item # optimization
        return compartment_1_item if compartment_2.keys.include?(compartment_1_item)
        return compartment_2_item if compartment_1.keys.include?(compartment_2_item)

        compartment_1[compartment_1_item] ||= 0
        compartment_1[compartment_1_item] += 1

        compartment_2[compartment_2_item] ||= 0
        compartment_2[compartment_2_item] += 1
      end
    end

    def inventory(input)
      compartment_1 = {}
      compartment_2 = {}
      compartment_size = input.size / 2
      reversed = input.reverse

      compartment_size.times do |i|
        compartment_1_item = input[i]
        compartment_2_item = reversed[i]

        compartment_1[compartment_1_item] ||= 0
        compartment_1[compartment_1_item] += 1

        compartment_2[compartment_2_item] ||= 0
        compartment_2[compartment_2_item] += 1
      end

      (compartment_1.keys + compartment_2.keys).uniq
    end

    def input_file
      FileManager.input_file(2022, 3)
    end
  end
end

day = Year2022::Day3.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
Printer.frame('Part 2') { day.part2 }
