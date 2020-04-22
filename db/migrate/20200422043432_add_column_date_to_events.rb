class AddColumnDateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :string
  end
end
