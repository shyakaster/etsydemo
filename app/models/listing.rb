class Listing < ActiveRecord::Base
=begin
	if Rails.env.development?
	  has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "default_image.png"
	else
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "default_image.png",
	                     #validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
											:storage => :dropbox,
											:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
											:path => ":style/:id_:filename"
		end

=end
	if Rails.env.production?
		has_attached_file :image,
											:styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default_image.jpg",
											:storage => :dropbox,
											:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
											:path => ":style/:id_:filename"
		                  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
	else
		has_attached_file :image,
											:styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default_image.jpg"
	end
end
