# frozen_string_literal: true

require_relative 'file_manager'

class TestGenerator
  def initialize(year, day)
    file_name = "day#{day}_test.rb"
    return if FileManager.file_exist?(year, day, file_name)

    @year = year
    @day = day
    FileManager.write_file(year, day, file_name, body: template)
  end

  def template
    @template ||= <<~RUBY
      # frozen_string_literal: true

      require "minitest"
      require "minitest/autorun"
      require "minitest/reporters"

      require_relative "day#{@day}"

      module Year#{@year}
        class Day#{@day}Test < Minitest::Test
          include MiniTest::Assertions

          def test_part1
          end

          def test_part2
          end
        end
      end
    RUBY
  end
end
