# frozen_string_literal: true

module GemMirror
  ##
  # The MirrorDirectory is used for dealing with files and directories that are
  # mirrored from an external source.
  #
  # @!attribute [r] path
  #  @return [String]
  #
  class MirrorDirectory
    attr_reader :path

    ##
    # @param [String] path
    #
    def initialize(path)
      @path = path
    end

    ##
    # Creates a new directory with the given name.
    #
    # @param [String] name
    # @return [GemMirror::MirrorDirectory]
    #
    def add_directory(name)
      full_path = File.join(path, name)

      Dir.mkdir(full_path) unless File.directory?(full_path)

      self.class.new(full_path)
    end

    ##
    # Creates a new file with the given name and content.
    #
    # @param [String] name
    # @param [String] content
    # @return [Gem::MirrorFile]
    #
    def add_file(name, content)
      full_path = File.join(path, name)
      file      = MirrorFile.new(full_path)

      file.write(content)

      file
    end

    ##
    # Checks if a given file exists in the current directory.
    #
    # @param [String] name
    # @return [TrueClass|FalseClass]
    #
    def file_exists?(name)
      File.file?(File.join(path, name))
    end
  end
end
