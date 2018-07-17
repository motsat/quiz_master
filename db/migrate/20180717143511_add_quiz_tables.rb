class AddQuizTables < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :sequence, null: false, index: { unique: true }
      t.timestamps
    end

    create_table :answers do |t|
      t.text :content, null: false
      t.belongs_to :question, null: false, unique: true
      t.timestamps
    end
  end
end
