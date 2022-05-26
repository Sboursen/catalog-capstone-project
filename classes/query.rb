require 'json'
module Query
  def self.create_path(file_name)
    "./storage/#{file_name}.json"
  end

  def self.read(file_name)
    path = create_path(file_name)
    return [] unless File.exist?(path)

    file = File.open(path)
    content = file.read
    file.close
    content == '' ? [] : JSON.parse(content)
  end

  def self.write(file_name, data)
    File.write(create_path(file_name), data)
  end
end