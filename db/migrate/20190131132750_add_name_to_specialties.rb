class AddNameToSpecialties < ActiveRecord::Migration[5.2]
  def change
    add_column :specialties, :name, :string
  end
end
