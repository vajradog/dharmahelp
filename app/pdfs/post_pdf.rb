class PostPdf < Prawn::Document

	def initialize(post)
		super(top_margin: 10)
		@post = post
		text "Thank you for using: www.dharmahelp.com", size: 10, align: :right
		title
		body
		biography
		writings
	end

	def title
		move_down 20
		text "#{@post.title}", size: 30, style: :bold
	end

	def body
		move_down 20
		text "#{@post.body}",:inline_format => true
	end

	def biography
		move_down 20
		text "Biography", size: 20, style: :bold
		text "#{@post.biography}", :inline_format => true
	end

	def writings
		move_down 20
		text "Writings", size: 20, style: :bold
		text "#{@post.writings}", :inline_format => true
	end
end