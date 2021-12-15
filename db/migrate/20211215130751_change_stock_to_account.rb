class ChangeStockToAccount < ActiveRecord::Migration[6.0]
  def change
    rename_table('stocks', 'accounts')
  end
end
