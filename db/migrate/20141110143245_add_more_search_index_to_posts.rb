class AddMoreSearchIndexToPosts < ActiveRecord::Migration
  def up
    execute "create index posts_biography on posts using gin(to_tsvector('english', biography))"
    execute "create index posts_writings on posts using gin(to_tsvector('english', writings))"
  end

  def down
    execute "drop index posts_biography"
    execute "drop index posts_writings"
  end
end
