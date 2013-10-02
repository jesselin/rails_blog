class Message < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    
    has_many :users

  	validates :message, :presence => true
	validates :author, :presence => true
end
