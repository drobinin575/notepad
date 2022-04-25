class Link < Post
  def initialize
    super

    @url = ""
  end

  def read_from_console
    puts "Адрес ссылки:"
    @url = STDIN.gets.chomp

    puts "Что за ссылка?"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%d-%m-%Y_%H-%M-%S")} \n \n"
    return [@text, @url, time_string]
  end
end