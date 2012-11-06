class Spree::Post < ActiveRecord::Base

	validates_presence_of :description
	validates_presence_of :title
	validates_presence_of :published_at

	attr_accessible :description, :title, :subtitle, :published_at

	scope :published, -> { where("published_at <= ?", DateTime.now) }

	default_scope { order("published_at DESC") }

	before_create :set_published_at_to_now

	def set_published_at_to_now
		self.published_at = Time.now
	end

end
