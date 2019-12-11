require 'rails_helper'

RSpec.describe Converter::Csv do
  context 'conver csv file to json file' do
    before do 
      @file_path = "#{Rails.root}/spec/file_importing/sample10.csv"
    end
    it 'should convert successfull' do
      csv_file_converter = Converter::Csv.new @file_path
      csv_file_converter.convert_to_json
      expect(csv_file_converter.errors.size).to eq 2
    end
  end
end