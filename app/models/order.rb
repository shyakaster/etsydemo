class Order < ActiveRecord::Base
  validates :address, :state, :city, presence: true
  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

end
