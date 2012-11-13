class Spree::Post < ActiveRecord::Base

	validates_presence_of :description
	validates_presence_of :title
	validates_presence_of :published_at

	attr_accessible :description, :title, :subtitle, :published_at

	#has_attached_file :image,
    #  :default_style => :original,
    #  :url => '/spree/post/:id/:style/:basename.:extension',
    #  :path => ':rails_root/public/spree/post/:id/:style/:basename.:extension',
    #  :default_url => '/assets/default_taxon.png'

	scope :published, -> { where("published_at <= ?", DateTime.now) }

	default_scope { order("published_at DESC") }

	before_create :set_published_at_to_now

	def set_published_at_to_now
		self.published_at = Time.now
	end

end
