class CreateFixTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :fix_tasks do |t|
      t.string :period, null: false
      t.string :job_description, null: false
      t.references :task, index: true

      t.timestamps
    end
  end
end
