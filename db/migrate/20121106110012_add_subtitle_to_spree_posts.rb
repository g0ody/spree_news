class AddSubtitleToSpreePosts < ActiveRecord::Migration
  def change
    add_column :spree_posts, :subtitle, :string
  end
end
