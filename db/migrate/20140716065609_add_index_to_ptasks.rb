class AddIndexToPtasks < ActiveRecord::Migration
  def change
  	add_index :periodic_tasks, :title, :unique => :true
  end
end
