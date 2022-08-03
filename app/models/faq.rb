# == Schema Information
#
# Table name: faqs
#
#  id         :uuid             not null, primary key
#  answer     :string           not null
#  is_shown   :boolean          default(TRUE)
#  order      :integer          not null
#  question   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Faq < ApplicationRecord
  include Faqs::Orderable
  include Faqs::Broadcast
  validates :question, :answer, presence: true
  validates_uniqueness_of :order

  after_commit :refresh_table, on: :create
end
