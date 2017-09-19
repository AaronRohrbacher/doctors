require 'spec_helper'

describe(Patient) do

  describe(".all") do
    it('is empty at first') do
      array = []
      Patient.all.each do |patient|
        array.push(patient.name)
      end
      expect(array).to(eq([]))
    end
  end

  describe("#name") do
    it("outputs a patient's name") do
      new_patient = Patient.new({:name => "Mr. Ruebling", :birthday => "1992-02-01", :doctor_id => 1})
      new_patient.save()
      expect(Patient.all[0].fetch("name")).to(eq("Mr. Ruebling"))
    end
  end

  describe("#birthday") do
    it("outputs a patient's birthday") do
      new_patient = Patient.new({:name => "Mr. Ruebling", :birthday => "1992-02-01", :doctor_id => 1})
      new_patient.save()
      expect(Patient.all[0].fetch("birthday")).to(eq("1992-02-01"))
    end
  end

  describe("#id") do
    it("outputs a patient's id") do
      new_patient = Patient.new({:name => "Mr. Ruebling", :birthday => "1992-02-01", :doctor_id => 1})
      new_patient.save()
      expect(Patient.all[0].fetch("id").to_i).to(be_an_instance_of(Integer))
    end
  end

  describe("#doctor_id") do
    it('connects a patient to a doctor') do
      doctor = Doctor.new({:name => "Dr. Rohrbacher", :specialty_id => 1})
      doctor.save
      doctor_id = Doctor.all[0].fetch("id").to_i
      patient = Patient.new({:name => "Tiffany", :birthday => "1970-02-01", :doctor_id => doctor_id})
      patient.save
      doctor_id = Patient.all[0].fetch("doctor_id").to_i
      query = DB.exec("SELECT * FROM doctors WHERE id = #{doctor_id};")
      expect(query[0].fetch("name")).to(eq("Dr. Rohrbacher"))
    end
  end

end
