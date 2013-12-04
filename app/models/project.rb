class Project < ActiveRecord::Base
  belongs_to :founder, :class_name => "User"
  has_many :backers, through: :donations,  :class_name => "User"
  has_many :donations

end
