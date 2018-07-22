class AddQuizTables < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :right_answer, null: false
      t.integer :display_order, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
