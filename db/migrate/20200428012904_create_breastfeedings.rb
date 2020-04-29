class CreateBreastfeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :breastfeedings do |t|
      t.datetime :date
      t.integer :time
      t.integer :quantity
      t.references :baby, foreign_key: true

      t.timestamps
    end
  end
end
