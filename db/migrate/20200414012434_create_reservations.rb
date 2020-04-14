class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
