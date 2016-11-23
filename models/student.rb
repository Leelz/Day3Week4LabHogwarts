require_relative('../db/sql_runner')

class Student
  attr_reader(:id)
  attr_accessor(:first_name, :second_name, :house, :age)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, second_name, house, age) VALUES ('#{@first_name}', '#{@second_name}', '#{@house}', #{@age}) RETURNING *"
    students = SqlRunner.run(sql).first
    @id = students['id'].to_i
  end

  def self.all()
  sql = "SELECT * FROM students" #In terminal you can type Student.all
  students = SqlRunner.run( sql )
  return students.map { |student| Student.new(student)  }
end

  def self.update( options )
    sql = "UPDATE students SET
    first_name='#{options['first_name']}',
    second_name='#{options['second_name']}',
    house='#{options['house']}',
    age='#{options['age']}'
    WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

def self.find(id)
  sql = "SELECT * FROM students WHERE id = #{id}"
  students = SqlRunner.run(sql)
  result = Student.new( students.first )
  return result
end

def self.delete_all()
  sql = "DELETE FROM students"
  SqlRunner.run(sql)
end

def self.destroy( id )
  sql = "DELETE FROM students WHERE id=#{id}"
  SqlRunner.run( sql )
end

end
