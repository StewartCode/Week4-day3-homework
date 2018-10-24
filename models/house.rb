require_relative('../db/sql_runner')

class House

  attr_accessor :name
  attr_reader :id


  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    house = SqlRunner.run(sql, values)
    @id = house[0]['id'].to_i
  end

  def update()
    sql = "UPDATE houses
    SET
    (
      first_name

    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@first_name, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end
  #
  def delete()
    sql = "DELETE FROM houses
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM houses"
    house = SqlRunner.run( sql )
    result = house.map { |h| House.new( h ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

end
