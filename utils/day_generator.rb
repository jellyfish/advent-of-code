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

      require_relative '../../utils/file_manager'
      require_relative '../../utils/printer'

      module Year#{@year}
        class Day#{@day}
          def initialize
          end

          def part1
            # input_file.readlines.each do |line|
            # end
            "TODO"
          end

          def part2
            "TODO"
          end

          private

          def input_file
            FileManager.input_file(#{@year}, #{@day})
          end
        end
      end

      day = Year#{@year}::Day#{@day}.new
      Printer.frame('Part 1') { day.part1 }
      Printer.candycane
      Printer.frame('Part 2') { day.part2 }
    RUBY
  end
end
