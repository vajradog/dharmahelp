class AddSearchIndexToPosts < ActiveRecord::Migration
  def up
    execute "create index posts_title on posts using gin(to_tsvector('english', title))"
    execute "create index posts_body on posts using gin(to_tsvector('english', body))"
  end

  def down
    execute "drop index posts_title"
    execute "drop index posts_body"
  end
end
