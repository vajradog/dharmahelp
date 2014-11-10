class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true
	validates :body, presence: true

	include PgSearch
	pg_search_scope :search, against: [:title, :body],
		using: {tsearch: {dictionary: "english"}}
		# can add associated models check railscast 343
		# or add unaccent

	def self.text_search(query)
  	if query.present?
    	rank = <<-RANK
      	ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
      	ts_rank(to_tsvector(body), plainto_tsquery(#{sanitize(query)}))
    	RANK
    	where("to_tsvector('english', title) @@ :q or to_tsvector('english', body) @@ :q", q: query).order("#{rank} desc")
  	else
    	all
  	end
	end

  #def self.search(search)
  #	if search
  #  	find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
 	#	else
  #  	find(:all)
  #	end
	#end

	#before_save :separate_links

	#def separate_links
	#	link = post.links
	#	link.split(",").each {|t| t.strip!}
	#end

	#def separate_links
  #if links_changed? and links.is_a?(String)
  #  self.links = self.links.split(',').collect(&:strip) 
  #end
	#end

	#def links
	#	@post.links
	#end

	#def separate_links
	#	self.links.split(/,\s*/)

		#if @post.links
		#  self.links = @post.links.split(",").each {|t| t.strip!}
	  #end
	#end
	
end
