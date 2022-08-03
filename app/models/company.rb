# == Schema Information
#
# Table name: companies
#
#  id         :uuid             not null, primary key
#  address    :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  has_many :users
end
