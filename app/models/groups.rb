class Groups < ActiveRecord::Base
	attr_accessible :group_id, :title

	validates :title, :presence => :true, :uniqueness => :true

	has_many :user_groups, dependent: :destroy
end
