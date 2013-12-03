class Project < ActiveRecord::Base
  belongs_to :user
  has_many :backers, through: :donations,  class => "user"
  has_many :donations
end
