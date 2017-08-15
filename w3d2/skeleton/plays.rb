require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT
      *
    FROM
      plays
    WHERE
      title = ?
  SQL
  return nil unless play.length > 0
  #initialize takes care of this new input with the options hash and is then
  #stored into an array
  Play.new(play.fist)
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    raise "#{name} not found in DB" unless playwright

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
    SELECT
      *
    FROM
      plays
    -- JOIN playwrights
    --   ON playwrights.id = plays.playwright_id
    WHERE
      playwright_id = ?
    SQL
    # return nil unless play.length > 0

    plays.map { |play| Play.new(play)}
  end

end

class Playwright

  attr_accessor :name, :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    person = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      playwrights
    WHERE
      name = ?
    SQL

    return nil unless person.length > 0
    #why just first here???
    Playwright.new(person.first)

  end

  def initialize(options)
    @name = options['name']
    @id = options['id']
  end

  def create
    raise "already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      INSERT INTO
        playwrights (name, id)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
  end

  def get_plays
  end

end
