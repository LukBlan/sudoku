class FileReader
  def initialize(path_to_dir)
    @path_to_dir = path_to_dir
  end

  def read_file(file_name)
    File.readlines("#{@path_to_dir}/#{file_name}").map(&:chomp)
  end

  def get_available_files
    Dir.entries(@path_to_dir)
  end
end
