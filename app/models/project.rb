class Project < ActiveRecord::Base
  acts_as_taggable

  belongs_to :founder, :class_name => "User"
  has_many :backers, through: :donations,  :class_name => "User"
  has_many :donations

  mount_uploader :image, ProjectImageUploader

  	def formatted_goal
  		goal_in_dollars = goal.to_f / 100
  		sprintf("$%.2f", goal_in_dollars)
  	end

    def pledged
      total = 0
      self.donations.each {|d| total += d.amount}
      total
    end

    def percent_to_goal
      percent = (pledged / goal.to_f) * 100
      sprintf("%.0f", percent)
    end

    def meter
      meter = (pledged / goal.to_f) * 100
      if meter > 100
        100
      else
        meter
      end
    end
end
