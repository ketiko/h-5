class CreateAccountTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :account_transactions do |t|
      t.references :bank_account, foreign_key: true
      t.references :appreciation, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
