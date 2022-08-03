# == Schema Information
#
# Table name: users
#
#  id                 :uuid             not null, primary key
#  confirmation_token :string(128)
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  name               :string
#  remember_token     :string(128)      not null
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :uuid
#
# Indexes
#
#  index_users_on_company_id          (company_id)
#  index_users_on_confirmation_token  (confirmation_token) UNIQUE
#  index_users_on_email               (email)
#  index_users_on_remember_token      (remember_token) UNIQUE
#
class User < ApplicationRecord
  include Clearance::User
  belongs_to :company
end
