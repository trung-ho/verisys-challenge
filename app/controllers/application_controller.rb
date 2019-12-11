class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def home
  end

  def convert_to_json
    if params[:csv_file].present?
      @csv_file_converter = Converter::Csv.new params[:csv_file].path
      @csv_file_converter.convert_to_json
    end
    render 'home'
  end
end
