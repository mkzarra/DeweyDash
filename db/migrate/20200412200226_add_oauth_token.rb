class AddOauthToken < ActiveRecord::Migration
  def up
    create_table :oauth_tokens, id: :serial do |t|
      t.string :oauth_token, null: false
      t.string :oauth_token_secret, null: false
      t.timestamps

      t.index :oauth_token
    end
  end

  def down
    drop_table :oauth_tokens
  end
end
