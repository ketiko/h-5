class AddCommentsToAppreciations < ActiveRecord::Migration[5.1]
  def change
    add_column :appreciations, :comments, :text
    add_column :appreciations, :giver_name, :string
    add_column :appreciations, :likes, :integer
  end
end
