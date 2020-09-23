class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :age, numericality: {more_than: 0, less_than: 110, message: "%{value} is not a valid age."}
    validates :bio, length: {minimum: 30}

    def featured_post
        x = self.posts.map do |bloggerpost|
        bloggerpost.likes
        end.sort.pop(5)
        byebug

        
    end

    def total_likes
        self.posts.map do |bloggerpost|
            bloggerpost.likes
        end.sum
    end

end
