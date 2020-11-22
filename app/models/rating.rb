class Rating < ApplicationRecord
  belongs_to :barbershop

  validates_presence_of :value, :opinion, :user_name
end
