class AddLastSeenAtToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :last_seen_at, :datetime, :default => DateTime.now
  end
end
