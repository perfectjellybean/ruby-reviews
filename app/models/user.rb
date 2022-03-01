class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        self.products.max_by{|product| product[:star_rating]}
    end

    def remove_reviews(product)
        self.reviews.map do |review|
            review.id == product.id && review.destroy
        end
    end
end