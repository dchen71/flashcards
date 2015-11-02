class ChangeColumnFrontBackInCards < ActiveRecord::Migration
  def change
  	change_column :cards, :front, :text, :default => nil
  	change_column :cards, :back, :text, :default => nil
  end
end
