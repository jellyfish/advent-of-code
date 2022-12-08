# frozen_string_literal: true

require "minitest"
require "minitest/autorun"
require "minitest/reporters"

require_relative "day4"

module Year2022
  class Day4Test < Minitest::Test
    include MiniTest::Assertions

    def setup
      @day = Year2022::Day4.new
    end

    def test_range_contains_range_returns_false_if_doesnt_contain_range
      range1 = "1-3"
      range2 = "4-6"

      refute(@day.range_contains_range?(range1, range2))
    end

    def test_range_contains_range_true_case1
      range1 = "1-5"
      range2 = "2-4"

      assert(@day.range_contains_range?(range1, range2))
    end

    def test_range_contains_range_true_case2
      range1 = "1-5"
      range2 = "1-4"

      assert(@day.range_contains_range?(range1, range2))
    end

    def test_range_contains_range_true_case3
      range1 = "1-6"
      range2 = "6-6"

      assert(@day.range_contains_range?(range1, range2))
    end

    def test_range_doesnt_contain_case2
      range1 = "5-9"
      range2 = "9-71"

      refute(@day.range_contains_range?(range1, range2))
    end
  end
end
