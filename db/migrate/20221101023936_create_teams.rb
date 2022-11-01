class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :outline
      t.string :image_id
      t.integer :owner_id
      t.timestamps
    end
  end
end
