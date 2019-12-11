require 'json'
require 'byebug'
require_relative '../lib/employee'
require_relative '../lib/converter/csv'

puts 'Begin'
puts 'Please input file name (eg: sample.csv)'
puts 'Please note: File must be at app/lib/csv_files):'
file_name = gets.chomp
path = 'app/lib/csv_files/' + file_name
if file_name!= '' && !file_name.nil? && (File.exist? path)
  csv_file_converter = Converter::Csv.new path
  csv_file_converter.convert_to_json
  if csv_file_converter.errors.any?
    puts csv_file_converter.errors.join('. ')
  end
  puts "File convert succsessfull. Please find json file at: public/#{csv_file_converter.result_path}"
else
  puts 'Invalid file name.'
end

