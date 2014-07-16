class AddIndexToGroupTitle < ActiveRecord::Migration
  def change
  	add_index :groups, :title, :unique => :true 
  end
end
