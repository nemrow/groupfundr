class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :name
      t.string :email
      t.integer :campaign_id
      t.string :token
      t.text :message
      t.boolean :expired

      t.timestamps
    end
  end
end
