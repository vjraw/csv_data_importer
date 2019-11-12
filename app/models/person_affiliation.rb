# == Schema Information
#
# Table name: person_affiliation
#
#  id                  :integer          not null, primary key
#  person_id           :integer
#  affiliation_id      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

# Join model between person and affiliation
class PersonAffiliation < ActiveRecord::Base

  belongs_to :affiliation
  belongs_to :person, touch: true

  validate :affiliation_must_exists

  def affiliation_must_exists
    errors.add(:affiliation_id, 'The Affiliation ID specified does not exist.') unless Affiliation.exists?(affiliation_id)
  end

end
