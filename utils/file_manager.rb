# frozen_string_literal

class FileManager
  class << self
    def write_file(year, day, file_name, body:)
      ensure_directory(year, day)
      file = File.join(FileManager.root_directory, year.to_s, day.to_s, file_name)
      File.write(file, body)
    end

    def file_exist?(year, day, file_name)
      File.exist?(File.join(root_directory, year.to_s, day.to_s, file_name))
    end

    def root_directory
      @root_directory ||= File.expand_path(Dir.pwd)
    end

    def input_file(year, day)
      return unless file_exist?(year, day, INPUT_FILE_NAME)

      File.new(File.join(root_directory, year.to_s, day.to_s, INPUT_FILE_NAME))
    end

    private

    INPUT_FILE_NAME = "input"

    def year_day_dir_exist?(year, day)
      File.exist?(File.join(root_directory, year.to_s, day.to_s))
    end

    def ensure_directory(year, day)
      unless year_day_dir_exist?(year, day)
        FileUtils.makedirs(File.join(root_directory, year.to_s, day.to_s))
      end
    end
  end
end
