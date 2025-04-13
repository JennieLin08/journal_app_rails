class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :desc
      t.date :due_date

      t.timestamps
    end
  end
end
