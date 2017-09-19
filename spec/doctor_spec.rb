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

  describe("#name") do
    it("outputs a doctor's name") do
      new_doctor = Doctor.new({:name => "Dr. Rohrbacher"})
      new_doctor.save()
      expect(Doctor.all[0].fetch("name")).to(eq("Dr. Rohrbacher"))
    end
  end

  describe("#id") do
    it("outputs a doctor's id") do
      new_doctor = Doctor.new({:name => "Dr. Rohrbacher"})
      new_doctor.save()
      expect(Doctor.all[0].fetch("id").to_i).to(be_an_instance_of(Integer))
    end
  end

end
