class Spree::Post < ActiveRecord::Base

	validates_presence_of :description
	validates_presence_of :title

	attr_accessible :description, :title, :published

	scope :published, -> { where(:published => true) }

end
