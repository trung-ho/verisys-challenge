require 'json'

class Employee
  attr_accessor :first_name, :middle_name, :last_name, :address_1_line_1, 
    :address_1_line_2, :address_1_city, :address_1_state, :address_1_zip, :address_2_line_1, 
    :address_2_line_2, :address_2_city, :address_2_state, :address_2_zip, :phone_1_number, 
    :phone_1_type, :phone_2_number, :phone_2_type, :phone_3_number, :phone_3_type, :license_number, :last_update_date
  attr_accessor :validate_success

  ALL_ATTRIBUTES = [:first_name, :middle_name, :last_name, :address_1_line_1, 
    :address_1_line_2, :address_1_city, :address_1_state, :address_1_zip, 
    :address_2_line_1, :address_2_line_2, :address_2_city, :address_2_state, 
    :address_2_zip, :phone_1_number, :phone_1_type, :phone_2_number, :phone_2_type, 
    :phone_3_number, :phone_3_type, :license_number, :last_update_date].freeze


  def initialize(args = nil)
    args ||= {}
    ALL_ATTRIBUTES.each do |attribute|
      self.send(attribute.to_s + "=", args[attribute])
    end

    after_init_callback
  rescue
    puts 'Fail to init Employee'
  end

  def as_json
    {
      first_name: self.first_name,
      middle_name: self.middle_name,
      last_name: self.last_name,
      address_1_line_1: self.address_1_line_1,
      address_1_line_2: self.address_1_line_2,
      address_1_city: self.address_1_city,
      address_1_state: self.address_1_state,
      address_1_zip: self.address_1_zip,
      address_2_line_1: self.address_2_line_1,
      address_2_line_2: self.address_2_line_2,
      address_2_city: self.address_2_city,
      address_2_state: self.address_2_state,
      address_2_zip: self.address_2_zip,
      phone_1_number: self.phone_1_number,
      phone_1_type: self.phone_1_type,
      phone_2_number: self.phone_2_number,
      phone_2_type: self.phone_2_type,
      phone_3_number: self.phone_3_number,
      phone_3_type: self.phone_3_type,
      license_number: self.license_number,
      last_update_date: self.last_update_date
    }
  rescue
    puts 'Fail to conver employee to json'
  end

  def after_init_callback
    check_phone_number
    # validate_driver_license
  end

  def check_phone_number
    self.phone_1_number = (format_phone_number self.phone_1_number) unless self.phone_1_number.nil?
    self.phone_2_number = (format_phone_number self.phone_2_number) unless self.phone_2_number.nil?
    self.phone_3_number = (format_phone_number self.phone_3_number) unless self.phone_3_number.nil?
  end

  def format_phone_number phone_number
    phone_number = phone_number.split(/[-.()]|\s|\b/).reject { |w| w.empty? }.join[-10..-1]
    phone_number = phone_number.sub(/(\d{3})(\d{3})(\d{4})/, "(\\1) \\2-\\3")
  rescue
    puts 'Fail to format phone number'
    ''
  end
end