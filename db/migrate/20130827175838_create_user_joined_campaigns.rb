class CreateUserJoinedCampaigns < ActiveRecord::Migration
  def change
    create_table :user_joined_campaigns do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.decimal :goal, :scale => 2
      t.decimal :raised, :scale => 2
      t.string :link

      t.timestamps
    end
  end
end
