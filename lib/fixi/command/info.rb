require 'trollop'
require 'fixi/index'

class Fixi::Command::Info
  def self.synopsis
    "Display a summary of the index associated with each path"
  end

  def self.arghelp
    "[<dir>|<file>] ..."
  end

  def self.details
    "If no argument is given, the current directory ('.') is assumed."
  end

  def execute args
    opts = Trollop::options args do
      banner Fixi::Command::banner "info"
    end

    # default to current directory, if no paths specified
    paths = args.empty? ? ['.'] : args

    paths.each do |path|
      path = File.expand_path(path)
      Fixi::Index.new(path).describe
    end
  end
end
