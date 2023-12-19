class FileReader
  def read_file(file_name)
    File.readlines(file_name).each do |line|
      puts(line)
    end
  end
end
