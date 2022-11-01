class CreateTeamUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_users do |t|
      t.references  :user,  index: true, foreign_key: true
      t.references  :team, index: true, foreign_key: true
      t.timestamps
    end
  end
end
