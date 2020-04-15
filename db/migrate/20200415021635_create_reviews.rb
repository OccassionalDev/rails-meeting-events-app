class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :rating
      t.string :content

      t.timestamps null: false
    end
  end
end
