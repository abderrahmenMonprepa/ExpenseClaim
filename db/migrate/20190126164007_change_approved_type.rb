class ChangeApprovedType < ActiveRecord::Migration[5.2]
  def change
  	change_column :expenses, :approved, :string
  end
end
