class AddCompanyIdAndNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_reference :users, :company, index: true, type: :uuid
    add_column :users, :username, :string
  end
end
