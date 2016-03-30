class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 

  has_many :articles
  before_save { self.email = email.downcase }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_attached_file :avatar,
	styles: { medium: "200x300>", thumb: "100x100>" },
	default_url: "/images/user_default.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
