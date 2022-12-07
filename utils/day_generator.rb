# frozen_string_literal: true

require_relative 'file_manager'

class DayGenerator
  def initialize(year, day)
    file_name = "day#{day}.rb"
    return if FileManager.file_exist?(year, day, file_name)

    @year = year
    @day = day
    FileManager.write_file(year, day, file_name, body: template)
  end

  def template
    @template ||= <<~RUBY
      # frozen_string_literal: true

      module Year#{@year}
        class Day#{@day}
          def initialize
          end

          def part1
          end

          def part2
          end
        end
      end
    RUBY
  end
end
