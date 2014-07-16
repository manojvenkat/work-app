class CreatePeriodicTasks < ActiveRecord::Migration
  def change
    create_table :periodic_tasks do |t|
      t.string :title
      t.minutes :periodicity
      t.integer :group_id

      t.timestamps
    end
  end
end
