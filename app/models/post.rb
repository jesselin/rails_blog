class Post < ActiveRecord::Base
    belongs_to :blog
    belongs_to :user
  	validates :title, :presence => true, length: { minimum: 7 }
	validates :content, :presence => true
    has_many :messages, :dependent => :destroy
end
