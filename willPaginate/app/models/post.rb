class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  self.per_page = 3

  def reverse_order
    return self..order('created_at DESC')
  end

end
