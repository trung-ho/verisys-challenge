require 'csv'
require 'json'
require 'byebug'
require_relative '../lib/employee'

records = CSV.open('app/lib/csv_files/sample.csv', :headers => true).map { |x| x.to_h }
file_name = "tmp/#{Time.now.to_i}_employee_list.json"

employee_list = { 'data': []}
records.each do |record|
  record_hash = record.map {|k, v| [k.downcase.tr(" ", "_").to_sym, v]}.to_h
  employee = Employee.new record_hash
  employee_list[:data].push(employee.as_json)
end
employee_list = JSON.pretty_generate employee_list
# File.write(file_name, employee_list)

