# frozen_string_literal: true

require 'json'

require_relative 'cli'

class FileSystem
  ROOT = "/"
  FILES = "_files"
  METADATA = "_metadata"

  ElfFile = Struct.new('ElfFile', :name, :size)

  attr_reader :current_path

  def initialize
    # Dir structure:
    # "dir_name" => {
    #   "sub_dir_name" => {
    #     "_files" => [],
    #     "_metadata" => { "size" => 0 },
    #   },
    #   "_files" => [],
    #   "_metadata" => { "size" => 0 },
    # }
    @tree = {
      "/" => new_dir,
    }
    @current_path = []
  end

  def cd(into_dir)
    if into_dir == ROOT
      @current_path = ["/"]
    else
      into_dir == Cli::UP_ONE ? @current_path.pop : @current_path << into_dir
    end
  end

  def add_dir(dir_name)
    current_dir[dir_name] = new_dir
  end

  def add_file(file_name, file_size)
    current_dir[FILES] << ElfFile.new(file_name, file_size)
    @current_path.size.times do |depth|
      @tree.dig(*@current_path[..depth])[METADATA]["size"] += file_size
    end
  end

  def current_dir
    @tree.dig(*@current_path)
  end

  def current_subdirs
    current_dir.keys - [FILES, METADATA]
  end

  def to_s
    JSON.pretty_generate(@tree)
  end

  private

  def new_dir
    {
      FILES => [],
      METADATA => { "size" => 0 },
    }
  end

end
