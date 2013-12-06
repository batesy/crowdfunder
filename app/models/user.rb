class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication 
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :username, presence: true

  has_many :projects

  has_many :donations
  has_many :backed_projects, through: :donations, :source => :project 

  mount_uploader :image, ImageUploader

end
