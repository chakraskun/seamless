# == Schema Information
#
# Table name: works
#
#  id            :uuid             not null, primary key
#  client_name   :string           not null
#  content       :string
#  is_shown      :boolean          default(TRUE)
#  project_name  :string           not null
#  slug          :string           not null
#  year          :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  categories_id :uuid             not null
#
# Indexes
#
#  index_works_on_categories_id  (categories_id)
#
# Foreign Keys
#
#  fk_rails_...  (categories_id => categories.id)
#
class Work < ApplicationRecord
end
