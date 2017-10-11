class CreateAppreciations < ActiveRecord::Migration[5.1]
  def change
    create_table :appreciations do |t|
      t.references :user, foreign_key: true
      t.integer :points
      t.string :token
      t.boolean :given, default: :false

      t.timestamps
    end
  end
end
