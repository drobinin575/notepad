class Memo < Post
  def read_from_console
    puts "Новая заметка (все, что пишите до строчки 'end'):"
    @text = []
    line = nil
    until line == "end"
      line = STDIN.gets.chomp
      @text << line
    end
    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%d-%m-%Y_%H-%M-%S")} \n \n"
    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge(
      {
        "text": @text.join("\n")
      }
    )
  end
end
