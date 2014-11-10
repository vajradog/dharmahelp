class AddLinksToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :links, :text
  end
end
