class ChangeDescriptionAndSubtitleToText < ActiveRecord::Migration
  def change
  	change_column :spree_posts, :description, :text
  	change_column :spree_posts, :subtitle, :text
  end

end
