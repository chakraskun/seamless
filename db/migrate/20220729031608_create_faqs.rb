class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs, id: :uuid do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.integer :order, null: false
      t.boolean :is_shown, default: true
      t.timestamps
    end
  end
end
