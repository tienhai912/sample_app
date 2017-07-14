class Micropost < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader
  validates :user, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.max_length}
  validate :picture_size

  scope :desc_order, -> {order created_at: :desc}

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, I18n.t("should_less")
    end
  end
end
