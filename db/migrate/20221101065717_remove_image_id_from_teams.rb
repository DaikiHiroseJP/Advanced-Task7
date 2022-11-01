class RemoveImageIdFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :image_id, :string
  end
end
