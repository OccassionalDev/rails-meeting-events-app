class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :address
      t.string :time 

      t.timestamps null: false
    end
  end
end
