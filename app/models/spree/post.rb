class Spree::Post < ActiveRecord::Base

  validates_presence_of :description
  validates_presence_of :title
  validates_presence_of :published_at
  validate :no_attachment_errors

  attr_accessible :description, :title, :subtitle, :published_at, :picture, :link

  has_attached_file :picture,
      :styles => { :normal => '626x300#' },
      :default_style => :normal,
      :url => ':s3_eu_url',
      :path => ':rails_root/public/spree/post/:id/:style/:basename.:extension',
      :default_url => '/assets/default_post.png'

  include Spree::Core::S3Support
  supports_s3 :picture

  scope :published, -> { where("published_at <= ?", DateTime.now) }

  default_scope { order("published_at DESC") }

  before_create :set_published_at_to_now

  def set_published_at_to_now
    self.published_at = Time.now
  end

  def no_attachment_errors
    unless picture.errors.empty?
      # uncomment this to get rid of the less-than-useful interrim messages
      # errors.clear
      errors.add :picture, "Paperclip returned errors for file '#{picture_file_name}' - check ImageMagick installation or image source file."
      false
    end
  end
end
