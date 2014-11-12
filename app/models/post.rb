class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true
	validates :body, presence: true

	belongs_to :category
	before_save :create_category_from_name

	attr_accessor :new_category_name
	

	def create_category_from_name
		create_category(name: new_category_name) unless new_category_name.blank?		
	end

	include PgSearch
	pg_search_scope :search, against: [:title, :body, :biography, :writings],
		using: {tsearch: {dictionary: "english"}}
		# can add associated models check railscast 343
		# or add unaccent

  def self.text_search(query)
  	if query.present?
  		rank = <<-RANK
      	ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
      	ts_rank(to_tsvector(body), plainto_tsquery(#{sanitize(query)})) +
     		ts_rank(to_tsvector(biography), plainto_tsquery(#{sanitize(query)})) +
     		ts_rank(to_tsvector(writings), plainto_tsquery(#{sanitize(query)}))
    	RANK
  		where("title @@ :q or body @@ :q or biography @@ :q or writings @@ :q", q: query).order("#{rank} desc")
  	else
  		all
  	end
  end

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
