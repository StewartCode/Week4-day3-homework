require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :last_name, :age, :house_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      age,
      house_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @age, @house_id]
    data = SqlRunner.run(sql, values)
    @id = data[0]['id'].to_i
  end

  def update()
    sql = "UPDATE students
    SET
    (
      first_name,
      last_name,
      age,
      house_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  # def delete()
  # sql = "DELETE FROM pizza_orders
  # WHERE id = $1"
  # values = [@id]
  # SqlRunner.run( sql, values )
  # end

  def self.all()
    sql = "SELECT * FROM students"
    student = SqlRunner.run( sql )
    result = student.map { |s| Student.new( s ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = Student.new( student[0] )
    return result
  end

  def house()
    sql = "SELECT *
           FROM houses
           WHERE id
           = $1"
    values = [@house_id]
    house = SqlRunner.run( sql, values)[0]
    House.new( house )

  end


end
