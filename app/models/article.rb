class Article < ActiveRecord::Base
belongs_to :user
validates :title, presence: true, length: { minimum: 3, maximum: 50}
validates :description, presence: true, length: {minimim: 10, maximum: 2000 }
validates :user_id, presence: true

	
  def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	  where("description LIKE ?", "%#{search}%")
	end

end