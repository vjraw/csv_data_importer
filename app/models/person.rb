# == Schema Information
#
# Table name: People
#
#  id                      :integer          not null, primary key
#  first_name              :string
#  last_name               :string
#  species                 :string
#  gender                  :string
#  weapon                  :string
#  vehicle                 :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Person < ActiveRecord::Base

  has_many :locations, through: :person_locations, dependent: :destroy
  has_many :person_locations, dependent: :destroy
  has_many :affiliations, through: :person_affiliations, dependent: :destroy
  has_many :person_affiliations, dependent: :destroy

  validates :first_name, :species, :gender, presence: { message: "can't be blank" }
  validates :first_name, uniqueness: { scope: [:last_name] }

  def self.search(search)
    search ? where('first_name LIKE :search OR last_name LIKE :search OR species LIKE :search OR gender LIKE :search OR weapon LIKE :search OR vehicle LIKE :search', search: search) : where(nil)
  end

end
