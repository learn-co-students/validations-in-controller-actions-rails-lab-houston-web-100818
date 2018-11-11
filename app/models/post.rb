class Post < ActiveRecord::Base
    validates :title, presence: :true
    validates :content, length: { minimum: 100 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
        message: "%{value} is not a valid category." }
 
end
