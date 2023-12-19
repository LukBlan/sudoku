class FileReader
  def initialize(path_to_dir)
    @path_to_dir = path_to_dir
  end

  def read_file(file_name)
    File.readlines(file_name).each do |line|
      puts(line)
    end
  end

  def get_available_files
    Dir.entries(@path_to_dir)
  end
end
