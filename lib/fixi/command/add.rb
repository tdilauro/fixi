require 'trollop'
require 'fixi/index'

class Fixi::Command::Add
  def self.synopsis
    "Add new files to the index"
  end

  def self.arghelp
    "[<dir>|<file>] ..."
  end

  def self.details
    "If no argument is given, the current directory ('.') is assumed."
  end

  def execute args
    opts = Trollop::options args do
      banner Fixi::Command.banner "add"
      opt :absolute, "Show absolute paths. By default, paths are reported
        relative to the index root.".pack
      opt :dry_run, "Don't do anything; just report what would be done"
    end

    # default to current directory, if no paths specified
    paths = args.empty? ? ['.'] : args

    paths.each do |path|
      path = File.expand_path(path)
      index = Fixi::Index.new(path)

      index.find(path) do |abspath|
        relpath = index.relpath(abspath)
        unless index.contains?(relpath)
          puts "A #{opts[:absolute] ? abspath : relpath}"
          index.add(relpath) unless opts[:dry_run]
        end
      end
    end

  end
end
