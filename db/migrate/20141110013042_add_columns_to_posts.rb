class AddColumnsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :biography, :text
  	add_column :posts, :writings, :text
  	add_column :posts, :further_readings, :text
  	add_column :posts, :source, :string
  	add_column :posts, :primary_image, :string
  end
end
