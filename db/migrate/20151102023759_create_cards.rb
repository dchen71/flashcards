class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :front, default: 'blank'
      t.text :back, default: 'blank'
      t.references :deck

      t.timestamps null: false
    end
  end
end
