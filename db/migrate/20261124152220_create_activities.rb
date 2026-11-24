class CreateActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :location
      t.decimal :price, precision: 10, scale: 2
      t.string :img
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
