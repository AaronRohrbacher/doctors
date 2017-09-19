class Doctor
  attr_reader(:id, :name, :specialty_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
  end

  def save
    result = DB.exec("INSERT INTO doctors (name) VALUES('#{@name}') RETURNING id;")
    @doctor_id = result.first().fetch("id").to_i()
  end

  def self.all
    @list = DB.exec("SELECT * FROM doctors")
    # id = @list.fetch("id").to_i()
  end

  def sort
    @list = DB.exec("SELECT * FROM doctors ORDER BY name;")
  end
end
