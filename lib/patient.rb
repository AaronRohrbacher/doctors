class Patient
  attr_reader(:id, :name, :birthday, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES('#{@name}', '#{@birthday}', #{@doctor_id});")
  end

  def self.all
    DB.exec("SELECT * FROM patients")
    # id = @list.fetch("id").to_i()
  end

  def sort_pat
    DB.exec("SELECT * FROM patients ORDER BY name;")
  end

  # def doc_id
  #   DB.exec("SELECT * FROM doctors WHERE name = #{@doctor_id};")
  # end

end
