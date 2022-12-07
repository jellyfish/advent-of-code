# frozen_string_literal

class FileManager
  class << self
    def write_input_file(year, day, contents)

    end

    def root_directory
      @root_directory ||= File.expand_path(Dir.pwd)
    end
  end
end
