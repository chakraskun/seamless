class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false
      t.string :address
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
    end
  end
end
