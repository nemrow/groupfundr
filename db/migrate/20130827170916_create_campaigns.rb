class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.decimal :group_raised, :scale => 2
      t.date :deadline
      t.integer :owner_id

      t.timestamps
    end
  end
end
