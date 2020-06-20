class AddPostReadAmountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :post_read_amount, :integer, default: 0
  end
end
