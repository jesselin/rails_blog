class Blog < ActiveRecord::Base
	validates :name, :description, presence: true, :length => { :minimum => 7}

	has_many :posts,:dependent=>:destroy
	has_many :owners,:dependent=>:destroy
	has_many :users, through: :owners
end
