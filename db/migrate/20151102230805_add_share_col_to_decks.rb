class AddShareColToDecks < ActiveRecord::Migration
  def change
  	add_column :decks, :share, :boolean, default: false
  end
end
