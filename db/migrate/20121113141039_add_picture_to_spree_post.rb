class AddPictureToSpreePost < ActiveRecord::Migration
  def change
    add_column :spree_posts, :picture_file_name, :string
    add_column :spree_posts, :picture_content_type, :string
    add_column :spree_posts, :picture_file_size, :integer
    add_column :spree_posts, :picture_updated_at, :datetime
  end
end