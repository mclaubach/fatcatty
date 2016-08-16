class Post < ActiveRecord::Base
 has_many :taggings
 has_many :tags, through: :taggings, dependent: :destroy
 validates :title, presence: true


  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).select("taggings.tag_id, tags.id, tags.name")
  end
  
  def to_param
    "#{id} #{title}".parameterize
  end


end
