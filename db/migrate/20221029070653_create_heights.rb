class CreateHeights < ActiveRecord::Migration[6.1]
  def change
    create_table :heights do |t|
      t.string :name
      t.float :height
      t.date :rec_date

      t.timestamps
    end
  end
end
