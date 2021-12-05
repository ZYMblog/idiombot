class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :target_user_id
      t.references :user
      t.references :chat
      t.timestamps
    end
  end
end
