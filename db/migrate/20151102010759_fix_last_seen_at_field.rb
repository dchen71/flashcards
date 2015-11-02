class FixLastSeenAtField < ActiveRecord::Migration
  def change
  	remove_column :decks, :last_seen_at
  	add_column :decks, :last_visited, :datetime, null: false, default: DateTime.now
  end
end
