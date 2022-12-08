# frozen_string_literal: true

require 'cli/ui'

class Printer
  class << self
    def frame(title, &block)
      CLI::UI::StdoutRouter.enable
      CLI::UI::Frame.open(title, color: :green) do
        CLI::UI::SpinGroup.new do |sg|
          sg.add('running...') do |spinner|
            evaluated = yield
            spinner.update_title(evaluated.to_s)
          end
        end
      end
    end

    def candycane
      puts CLI::UI.fmt("{{green:━━}}{{red:━━}}" * 15)
    end
  end
end
