# == Schema Information
#
# Table name: Location
#
#  id                      :integer          not null, primary key
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Location < ActiveRecord::Base

  has_many :people, through: :person_locations
  has_many :person_locations, dependent: :destroy

  validates :name, presence: { message: "can't be blank" }

end
