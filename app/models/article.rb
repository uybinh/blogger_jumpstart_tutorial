class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    self.tags.collect {|tag| tag.name}.join(", ")
  end

  def tag_list=(tags_string)
    tags_name = tags_string.split(",").collect {|tag| tag.strip.downcase}.uniq
    new_or_found_tags = tags_name.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end
end
