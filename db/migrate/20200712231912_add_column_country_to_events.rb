class AddColumnCountryToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :country, :string
  end
end
