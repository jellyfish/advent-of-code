# frozen_string_literal: true

require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require 'mocha/minitest'

require_relative "day6"

module Year2022
  class Day6Test < Minitest::Test
    include MiniTest::Assertions

    def test_part1_simple
      datastream = "abcd"
      Day6.any_instance.stubs(datastream: datastream)

      assert_equal(4, Day6.new.part1)
    end

    def test_part1_med
      datastream = ("abc" * 3) + "d"
      Day6.any_instance.stubs(datastream: datastream)

      assert_equal(10, Day6.new.part1)
    end

    def test_part1_repeat
      repeating_section = "ab" * 4
      marker = "abcd"

      datastream = repeating_section + marker
      Day6.any_instance.stubs(datastream: datastream)

      expected_length = repeating_section.size + marker.size
      assert_equal(expected_length, Day6.new.part1)
    end

    def test_part1_middle
      repeating_section = "ab" * 4
      marker = "abcd"

      datastream = repeating_section + marker + repeating_section
      Day6.any_instance.stubs(datastream: datastream)

      expected_length = repeating_section.size + marker.size
      assert_equal(expected_length, Day6.new.part1)
    end

    def test_part2
    end
  end
end
