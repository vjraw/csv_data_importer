# == Schema Information
#
# Table name: Affiliation
#
#  id                      :integer          not null, primary key
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Affiliation < ActiveRecord::Base

  has_many :people, through: :person_affiliations
  has_many :person_affiliations, dependent: :destroy

  validates :name, presence: { message: "can't be blank" }

end
