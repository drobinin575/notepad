require "date"

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "Что надо сделать?"
    @text = STDIN.gets.chomp

    puts "К какой дате? Укажите в формате ДД.ММ.ГГГГ"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%d-%m-%Y_%H-%M-%S")} \n \n"
    deadline = "Крайний срок - #{@due_date}"
    return [@text, deadline, time_string]
  end
end
