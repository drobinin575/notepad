class Post

  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    return post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console

  end

  def to_strings

  end

  def save
    file = File.new(file_path, "w:UTF-8")
    to_strings.each { |string| file.puts(string) }
    file.close
  end

  def file_path
    file_name = @created_at.strftime("#{self.class.name}_%d-%m-%Y_%H-%M-%S.txt")
    return "#{__dir__}/#{file_name}"
  end
end