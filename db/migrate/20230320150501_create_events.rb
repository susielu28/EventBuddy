class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.decimal :price
      t.string :venue, default: "Madison Square Garden", null: false
      t.string :genre
      t.text :info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
