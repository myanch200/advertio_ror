class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.decimal :price_cents, precision: 10, scale: 2, default: 0.0, null: false
      t.timestamps
    end
  end
end
