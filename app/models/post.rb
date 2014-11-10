class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: true
	validates :body, presence: true

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
