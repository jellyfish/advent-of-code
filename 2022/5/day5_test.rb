# frozen_string_literal: true

require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require 'mocha/minitest'

require_relative "day5"

module Year2022
  class Day5Test < Minitest::Test
    include MiniTest::Assertions

    def setup
      @crate_manager = Year2022::Day5::CrateManager.new({
        1 => Year2022::Day5::CrateStack.new(["Z", "N"]),
        2 => Year2022::Day5::CrateStack.new(["M", "C", "D"]),
        3 => Year2022::Day5::CrateStack.new(["P"]),
      })
      Year2022::Day5.any_instance.stubs(crate_manager: @crate_manager)
    end

    def test_tops
      assert_equal(["N", "D", "P"], @crate_manager.tops)
    end

    def test_crate_manager_exec
      @crate_manager.exec("move 1 from 2 to 1")
      assert_equal(["D", "C", "P"], @crate_manager.tops)

      @crate_manager.exec("move 3 from 1 to 3")
      assert_equal([nil, "C", "Z"], @crate_manager.tops)

      @crate_manager.exec("move 2 from 2 to 1")
      assert_equal(["M", nil, "Z"], @crate_manager.tops)

      @crate_manager.exec("move 1 from 1 to 2")
      assert_equal(["C", "M", "Z"], @crate_manager.tops)
    end

    def test_crate_manager_9001_exec
      @crate_manager = Year2022::Day5::CrateManager9001.new({
        1 => Year2022::Day5::CrateStack.new(["Z", "N"]),
        2 => Year2022::Day5::CrateStack.new(["M", "C", "D"]),
        3 => Year2022::Day5::CrateStack.new(["P"]),
      })

      @crate_manager.exec("move 1 from 2 to 1")
      assert_equal(["D", "C", "P"], @crate_manager.tops)

      @crate_manager.exec("move 3 from 1 to 3")
      assert_equal([nil, "C", "Z"], @crate_manager.tops)

      @crate_manager.exec("move 2 from 2 to 1")
      assert_equal(["M", nil, "Z"], @crate_manager.tops)

      @crate_manager.exec("move 1 from 1 to 2")
      assert_equal(["C", "M", "Z"], @crate_manager.tops)
    end

    def test_part1
      puts
    end

    def test_part2
    end
  end
end
