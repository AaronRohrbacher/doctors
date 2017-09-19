require 'spec_helper'

describe(Doctor) do

  describe(".all") do
    it('is empty at first') do
      array = []
      Doctor.all.each do |doctor|
        array.push(doctor.name)
      end
      expect(array).to(eq([]))
    end
  end

  describe('.save') do
    it("saves a doctors information to the database") do
      new_doctor = Doctor.new({:name => "Dr. Rohrbacher", :specialty_id => 1})
      new_doctor.save()
      expect(Doctor.all[0].fetch('name')).to(eq("Dr. Rohrbacher"))
    end
  end

  describe("#name") do
    it("outputs a doctor's name") do
      new_doctor = Doctor.new({:name => "Dr. Rohrbacher", :specialty_id => 1})
      new_doctor.save()
      expect(Doctor.all[0].fetch("name")).to(eq("Dr. Rohrbacher"))
    end
  end

  describe("#id") do
    it("outputs a doctor's id") do
      new_doctor = Doctor.new({:name => "Dr. Rohrbacher", :specialty_id => 1})
      new_doctor.save()
      expect(Doctor.all[0].fetch("id").to_i).to(be_an_instance_of(Integer))
    end
  end


  describe(".spec_id") do
    it('connects a specialty to a doctor') do
      doctor = Doctor.new({:name => "Dr. Rohrbacher", :specialty_id => 1})
      doctor.save
      specialty_id = doctor.specialty_id
      query = DB.exec("SELECT * FROM specialty WHERE id = #{specialty_id}")
      expect(query[0].fetch("name")).to(eq("Gynecology"))
    end
  end

end
