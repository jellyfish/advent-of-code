# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day5
    class CrateStack
      def initialize(stack_from_bottom_to_top)
        @crates = stack_from_bottom_to_top
      end

      # sig { returns([Crate]) }
      def pop(n = 1)
        @crates.pop(n)
      end

      # sig { params(crates: T::Array[Crate]).void }
      def push(crates)
        @crates += crates
      end

      def top
        @crates.last
      end
    end

    class CrateManager
      def initialize(stacks = nil)
        @stacks = stacks
        @stacks ||= {
          1 => CrateStack.new(["T", "P", "Z", "C", "S", "L", "Q", "N"]),
          2 => CrateStack.new(["L", "P", "T", "V", "H", "C", "G"]),
          3 => CrateStack.new(["D", "C", "Z", "F"]),
          4 => CrateStack.new(["G", "W", "T", "D", "L", "M", "V", "C"]),
          5 => CrateStack.new(["P", "W", "C"]),
          6 => CrateStack.new(["P", "F", "J", "D", "C", "T", "S", "Z"]),
          7 => CrateStack.new(["V", "W", "G", "B", "D"]),
          8 => CrateStack.new(["N", "J", "S", "Q", "H", "W"]),
          9 => CrateStack.new(["R", "C", "Q", "F", "S", "L", "V"]),
        }
      end

      def tops
        @stacks.values.map(&:top)
      end

      def exec(command)
        amount_to_move, origin_stack, destination_stack = interpret(command)
        amount_to_move.times do |i|
          crate = origin_stack.pop
          destination_stack.push(crate)
        end
      end

      private

      def interpret(command)
        # command in form of
        # move <number of crates> from <stack index A> to <stack index B>
        # e.g. move 13 from 8 to 1

        match_data = command.match(/move (\d+) from (\d+) to (\d+)/)
        amount_to_move = match_data.captures[0].to_i
        origin_stack_index = match_data.captures[1].to_i
        destination_stack_index = match_data.captures[2].to_i

        [amount_to_move, @stacks[origin_stack_index], @stacks[destination_stack_index]]
      end
    end

    class CrateManager9001
      def initialize(stacks = nil)
        @stacks = stacks
        @stacks ||= {
          1 => CrateStack.new(["T", "P", "Z", "C", "S", "L", "Q", "N"]),
          2 => CrateStack.new(["L", "P", "T", "V", "H", "C", "G"]),
          3 => CrateStack.new(["D", "C", "Z", "F"]),
          4 => CrateStack.new(["G", "W", "T", "D", "L", "M", "V", "C"]),
          5 => CrateStack.new(["P", "W", "C"]),
          6 => CrateStack.new(["P", "F", "J", "D", "C", "T", "S", "Z"]),
          7 => CrateStack.new(["V", "W", "G", "B", "D"]),
          8 => CrateStack.new(["N", "J", "S", "Q", "H", "W"]),
          9 => CrateStack.new(["R", "C", "Q", "F", "S", "L", "V"]),
        }
      end

      def tops
        @stacks.values.map(&:top)
      end

      def exec(command)
        amount_to_move, origin_stack, destination_stack = interpret(command)
        crates = origin_stack.pop(amount_to_move)
        destination_stack.push(crates)
      end

      private

      def interpret(command)
        # command in form of
        # move <number of crates> from <stack index A> to <stack index B>
        # e.g. move 13 from 8 to 1

        match_data = command.match(/move (\d+) from (\d+) to (\d+)/)
        amount_to_move = match_data.captures[0].to_i
        origin_stack_index = match_data.captures[1].to_i
        destination_stack_index = match_data.captures[2].to_i

        [amount_to_move, @stacks[origin_stack_index], @stacks[destination_stack_index]]
      end
    end

    def initialize
      @crate_manager = CrateManager.new
      @crate_manager9001 = CrateManager9001.new
    end

    def part1
      input_file.readlines.each do |command|
        @crate_manager.exec(command)
      end
      @crate_manager.tops.join("")
    end

    def part2
      input_file.readlines.each do |command|
        @crate_manager9001.exec(command)
      end
      @crate_manager9001.tops.join("")
    end

    def crate_manager
      @crate_manager ||= CrateManager.new
    end

    private

    def input_file
      FileManager.input_file(2022, 5)
    end
  end
end

day = Year2022::Day5.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
Printer.frame('Part 2') { day.part2 }
