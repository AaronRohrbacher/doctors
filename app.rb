require 'sinatra'
require 'sinatra/reloader'
require './lib/doctor'
require './lib/patient'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'hospital'})

get ('/') do
  @doctor = Doctor.all
  @specialty = DB.exec("SELECT * FROM specialty;")
  @patient = Patient.all
  erb(:index)
end

get ('/patient') do
  @doctor = Doctor.all
  @specialty = DB.exec("SELECT * FROM specialty;")
  @patient = Patient.all
  erb(:index)
end

post('/') do
  doctor = Doctor.new(:name => params["doc_name"], :specialty_id => params["doc_spec"].to_i)
  test = params['doc_spec']
  doctor.save
  @patient = Patient.all
  @doctor = Doctor.all
  @specialty = DB.exec("SELECT * FROM specialty;")
  erb(:index)
end

post('/patient') do
  patient = Patient.new(:name => params["pat_name"], :birthday => params['birthday'], :doctor_id => params["doc_id"])
  patient.save
  @doctor = Doctor.all
  @specialty = DB.exec("SELECT * FROM specialty;")
  @patient = Patient.all
  erb(:index)
end
