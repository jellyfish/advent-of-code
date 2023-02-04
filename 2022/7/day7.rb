# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

require_relative 'file_system'
require_relative 'cli'

require 'pry'

module Year2022
  class Day7
    def initialize
      @file_system = FileSystem.new
      populate
    end

    def populate
      iterable_input.each do |line|
        elements = line.split(" ")

        case elements.first
        when Cli::CMD
          command = elements[1]
          target_dir = elements[2]

          next if command == Cli::LS
          raise "Unknown command #{command}" unless command == Cli::CD
          # can we assume we'll have read a directory from a `ls` before wanting to cd to it? probs
          raise "Need to pass an arg to cd" if target_dir.nil?

          @file_system.cd(target_dir)
        when Cli::DIRECTORY
          dir_name = elements[1]
          @file_system.add_dir(dir_name)
        else
          file_size = elements[0].to_i
          file_name = elements[1]
          @file_system.add_file(file_name, file_size)
        end
      end
    end

    def part1
      threshold = 100_000
      cumulative_size_of_targeted_dirs = 0

      # start at the root
      @file_system.cd("/")
      @file_system.current_subdirs.each do |subdir|

      end
    end

    def part2
      "TODO"
    end

    private

    def iterable_input
      input_file.readlines
    end

    def input_file
      FileManager.input_file(2022, 7)
    end
  end
end

# day = Year2022::Day7.new
# Printer.frame('Part 1') { day.part1 }
# Printer.candycane
# Printer.frame('Part 2') { day.part2 }
