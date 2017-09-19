class Doctor
  attr_reader(:id, :name, :specialty_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty_id = attributes.fetch(:specialty_id)
  end


  def save
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES('#{@name}', '#{@specialty_id}') RETURNING id;")
    @doctor_id = result.first().fetch("id").to_i()
  end

  def self.all
    DB.exec("SELECT * FROM doctors")
    # id = @list.fetch("id").to_i()
  end

  def sort_doc
    DB.exec("SELECT * FROM doctors ORDER BY name;")
  end

  # def spec_id
  #   DB.exec("SELECT * FROM specialty WHERE name = #{@specialty_id};")
  # end

end
