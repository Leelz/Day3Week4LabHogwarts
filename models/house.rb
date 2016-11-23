require_relative('../db/sql_runner')

class House
  attr_reader(:id)
  attr_accessor(:house_name, :logo)

  def initialize(options)
    @id = options['id'].to_i
    @house_name = options['house_name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (house_name, logo) VALUES ('#{@house_name}', '#{@logo}') RETURNING *"
    houses = SqlRunner.run(sql).first
    @id = houses['id'].to_i
  end

  def self.all()
  sql = "SELECT * FROM houses" #In terminal you can type House.all
  houses = SqlRunner.run( sql )
  return houses.map { |house| House.new(house)  }
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id}"
    houses = SqlRunner.run(sql)
    result = House.new( houses.first )
    return result
  end

def self.delete_all()
  sql = "DELETE FROM houses"
  SqlRunner.run(sql)
end

def self.destroy( id )
  sql = "DELETE FROM houses WHERE id=#{id}"
  SqlRunner.run( sql )
end

end
