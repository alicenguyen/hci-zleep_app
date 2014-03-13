class Changecolumninalarm < ActiveRecord::Migration
  def change
  	    change_column :alarms, :is_dismiss, :string, default: "on"

  end
end
