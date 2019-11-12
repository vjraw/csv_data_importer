class PeopleController < ApplicationController
  include PeopleHelper
  helper_method :sort_direction, :sort_column

  def index
    @people = Person.search(person_params[:search])
             .order(sort_column + " " + sort_direction)
             .page(params[:page])
             .per(10)
  end

  def import
    begin
      file = person_params[:file]
      file_path = file.path
      Import::Csv::CsvParser.new('Person').parse(file_path: file_path)
      redirect_to root_url, notice: "Data imported."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

  private

  def sort_direction
    %w[asc desc].include?(person_params[:direction]) ? person_params[:direction] : "asc"
  end

  def sort_column
    Person.column_names.include?(person_params[:sort]) ? person_params[:sort] : "first_name"
  end

  def person_params
    params.permit(:id, :first_name, :last_name, :species, :gender, :weapon,
                  :vehicle, :direction, :search, :page, :sort, :file, :utf8,
                  :authenticity_token, :commit)
  end

end
