class AddImageInDevise < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_link, :string, default: 'user.png'
  end
end
