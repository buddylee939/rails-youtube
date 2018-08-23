class Pin < ApplicationRecord
  has_many_attached :picts
  has_one_attached :image
  validates :title, presence: true
  validates :caption, presence: true
  validate :correct_image_type
  validate :pict_type

  def thumbnail
    return self.image.variant(resize: '300x300').processed
  end

  def banner
    return self.image.variant(resize: '1300x300').processed
  end

  private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'must be a JPEG or PNG')
    elsif image.attached? == false
      errors.add(:image, 'is required')      
    end
  end

  def pict_type
    if picts.attached? == false
      errors.add(:pict, 'are missing')
    end
    picts.each do |pict|
      if !pict.content_type.in?(%w(image/jpeg image/png))
        errors.add(:pict, 'must be a JPEG or PNG')
      end
    end
  end
end
