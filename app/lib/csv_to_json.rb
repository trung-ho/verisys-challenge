require 'csv'
require 'json'
require 'byebug'
require_relative '../lib/employee'
require_relative '../lib/converter/csv'

puts 'Begin'
csv_file_converter = Converter::Csv.new 'app/lib/csv_files/sample.csv'
csv_file_converter.convert_to_json
if csv_file_converter.errors.any?
  puts csv_file_converter.errors.join('. ')
end
puts "File convert succsessfull. Please check json at: #{csv_file_converter.result_path}"

