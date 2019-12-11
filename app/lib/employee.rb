class Employee
  attr_accessor :first_name, :middle_name, :last_name, :address_1_line_1, 
    :address_1_line_2, :address_1_city, :address_1_state, :address_1_zip, :address_2_line_1, 
    :address_2_line_2, :address_2_city, :address_2_state, :address_2_zip, :phone_1_number, 
    :phone_1_type, :phone_2_number, :phone_2_type, :phone_3_number, :phone_3_type, :license_number, :last_update_date

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
  end
end