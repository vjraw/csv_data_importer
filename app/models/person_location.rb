# == Schema Information
#
# Table name: person_location
#
#  id                  :integer          not null, primary key
#  person_id           :integer
#  location_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

# Join model between person and location
class PersonLocation < ActiveRecord::Base

  belongs_to :location
  belongs_to :person, touch: true

  validate :location_must_exists

  def location_must_exists
    errors.add(:location_id, 'The Location ID specified does not exist.') unless Location.exists?(location_id)
  end

end
