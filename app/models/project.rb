class Project < ActiveRecord::Base
  belongs_to :founder, :class_name => "User"
  has_many :backers, through: :donations,  :class_name => "User"
  has_many :donations


  	def formatted_goal
  		goal_in_dollars = goal.to_f / 100
  		sprintf("$%.2f", goal_in_dollars)
  	end
end
