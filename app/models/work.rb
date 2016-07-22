class Work < ActiveRecord::Base
  validates :title, presence: true
  has_attached_file :image,
  source_file_options: { all: '-auto-orient' },
  styles: { original: "", thumb: "200x200#" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
