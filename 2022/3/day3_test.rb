# frozen_string_literal: true

require "minitest"
require "minitest/autorun"
require "minitest/reporters"

require_relative "day3"

module Year2022
  class Day3Test < Minitest::Test
    include MiniTest::Assertions

    def setup
      @day = Year2022::Day3.new
    end

    def test_priority
      assert_equal(16, @day.send(:priority)['p'])
      assert_equal(38, @day.send(:priority)['L'])
      assert_equal(42, @day.send(:priority)['P'])
      assert_equal(22, @day.send(:priority)['v'])
      assert_equal(20, @day.send(:priority)['t'])
      assert_equal(19, @day.send(:priority)['s'])
    end

    def test_part1
    end

    def test_part2
    end
  end
end
