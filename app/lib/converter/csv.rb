require 'csv'
module Converter
  class Csv
    attr_accessor :original_path, :result_path, :errors
    def initialize path
      self.original_path = path
      self.errors ||= []
      self.result_path = nil
    end

    def convert_to_json
      records = CSV.open(self.original_path, :headers => true).map { |x| x.to_h }
      file_name = "json_files/#{Time.now.to_i}_employee_list.json"

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
        self.errors = error_array
      end
      if Rails.env.test?
        File.write('spec/' + file_name, employee_list)
      else
        File.write('public/' + file_name, employee_list)
      end
      self.result_path = file_name
      return self
    end
  end
end