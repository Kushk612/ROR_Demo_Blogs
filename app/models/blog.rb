class Blog < ApplicationRecord
    has_one_attached :image
    
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "decsription", "id", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[blob_id created_at id name record_id record_type]
    end
  end

  validates :title, :decsription, presence: true
  validates_length_of :decsription, minimum: 250, maximum: 1000
 end
