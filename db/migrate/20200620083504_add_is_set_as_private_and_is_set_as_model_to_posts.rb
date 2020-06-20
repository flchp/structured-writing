class AddIsSetAsPrivateAndIsSetAsModelToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :is_set_as_model, :boolean, default: false
    add_column :posts, :is_set_as_private, :boolean, default: false
  end
end
