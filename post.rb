require "sqlite3"

class Post

  @@SQLITE_DB_FILE = "notepad.sqlite"

  def self.post_types
    { "Memo": Memo, "Link": Link, "Task": Task }
  end

  def self.create(type)
    return post_types[type].new
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
    "#{__dir__}/#{file_name}"
  end

  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)
    db.results_as_hash = true

    db.execute(
      "INSERT INTO posts (" +
        to_db_hash.keys.join(", ") +
        ")" + "VALUES (" +
        ("?," * to_db_hash.keys.size).chomp(",") +
        ")",
      to_db_hash.values
    )
    insert_row_id = db.last_insert_row_id
    db.close
    insert_row_id
  end

  def to_db_hash
    {
      "type": self.class.new,
      "created_at": @created_at.to_s
    }
  end
end
