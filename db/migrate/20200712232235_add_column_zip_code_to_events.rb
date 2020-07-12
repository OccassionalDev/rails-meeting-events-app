class AddColumnZipCodeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :zip_code, :integer
  end
end
