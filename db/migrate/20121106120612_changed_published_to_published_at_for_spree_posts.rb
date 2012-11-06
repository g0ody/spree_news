class RemovePublishedFromSpreePosts < ActiveRecord::Migration
  def change
    remove_column :spree_posts, :published
    add_column :spree_posts, :published_at, :datetime
  end
end
