class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :department, null: false
      t.integer :grade
      t.string :occupation, null: false

      t.timestamps
    end
  end
end
