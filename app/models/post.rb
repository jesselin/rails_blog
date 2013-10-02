class Post < ActiveRecord::Base
    belongs_to :blog
    belongs_to :user

  	has_many :users
 	has_many :blogs
  	has_many :messages, :dependent => :destroy

  	validates :title, :presence => true, length: { minimum: 7 }
	validates :content, :presence => true
    
end
