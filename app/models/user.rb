class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :username, presence: true

  has_many :donations
  has_many :projects
  has_many :backed_projects, through: :donations, class => "projects"
end
