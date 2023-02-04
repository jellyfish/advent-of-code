# frozen_string_literal: true

require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require 'mocha/minitest'

require_relative "day7"

module Year2022
  class Day7Test < Minitest::Test
    include MiniTest::Assertions

    TEST_INPUT = <<~TEXT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    TEXT

    def test_part1
      Day7.any_instance.stubs(iterable_input: TEST_INPUT.split("\n"))
      assert_equal(95437, Day7.new.part1)
    end

    def test_part2
    end
  end
end
