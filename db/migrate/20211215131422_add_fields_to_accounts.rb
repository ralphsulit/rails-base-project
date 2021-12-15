class AddFieldsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :logo_url, :string
    add_column :accounts, :old_price, :float
    add_column :accounts, :stock_id, :integer
    add_column :accounts, :transaction_type, :string
    add_column :accounts, :units, :float
  end
end
