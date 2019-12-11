require 'rails_helper'

RSpec.describe Employee do
  context 'validation' do
    before do 
      @employee_hash = { first_name: 'John', last_name: 'Doe', license_number: '1648198614' }
    end
    it 'should be successfull when license_number is valid' do
      new_employee = Employee.new @employee_hash
      expect(new_employee.first_name).to eq @employee_hash[:first_name]
      expect(new_employee.last_name).to eq @employee_hash[:last_name]
      expect(new_employee.license_number).to eq @employee_hash[:license_number]
      expect(new_employee.validate_success).to eq true
    end

    it 'should be failure when license_number is invalid' do
      @employee_hash[:license_number] = '7000000004'
      new_employee = Employee.new @employee_hash
      expect(new_employee.validate_success).to eq false
    end

    it 'should be failure when license_number is empty' do
      @employee_hash[:license_number] = ''
      new_employee = Employee.new @employee_hash
      expect(new_employee.validate_success).to eq false
      @employee_hash[:license_number] = nil
      new_employee = Employee.new @employee_hash
      expect(new_employee.validate_success).to eq false
    end

    it 'should be failure when license_number is not 10 digits' do
      @employee_hash[:license_number] = '12345678901'
      new_employee = Employee.new @employee_hash
      expect(new_employee.validate_success).to eq false
    end
  end

  context 'phone number' do
    before do 
      @employee_hash = { first_name: 'John', last_name: 'Doe',  license_number: '1648198614', 
        phone_1_number: '117.039.0336',
        phone_2_number: '202-109-5356',
        phone_3_number: '1-138-071-6522' }
    end
    it 'should be re-formated' do
      new_employee = Employee.new @employee_hash
      expect(new_employee.phone_1_number).to eq '(117) 039-0336'
      expect(new_employee.phone_2_number).to eq '(202) 109-5356'
      expect(new_employee.phone_3_number).to eq '(138) 071-6522'
    end
  end
end