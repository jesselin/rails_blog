class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :author
      t.text :message

      t.timestamps
    end
  end
end
