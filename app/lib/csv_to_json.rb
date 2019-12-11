require 'csv'
require 'json'
require 'byebug'
require_relative '../lib/employee'

puts 'Begin'
records = CSV.open('app/lib/csv_files/sample.csv', :headers => true).map { |x| x.to_h }
file_name = "tmp/#{Time.now.to_i}_employee_list.json"

employee_list = { 'data': []}
error_array = []
records.each_with_index do |record, index|
  record_hash = record.map {|k, v| [k.downcase.tr(" ", "_").to_sym, v]}.to_h
  employee = Employee.new record_hash
  if employee.validate_success
    employee_list[:data].push(employee.as_json) 
  else
    error_array << "Employee name: #{employee.full_name} is failed to convert"
  end
end
employee_list = JSON.pretty_generate employee_list
if error_array.any?
  puts error_array.join('. ')
end
File.write(file_name, employee_list)
puts "File convert succsessfull. Please check json at: #{file_name}"

