class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :claimer_name
      t.datetime :expense_date
      t.text :description
      t.float :amount
      t.boolean :approved

      t.timestamps
    end
  end
end
