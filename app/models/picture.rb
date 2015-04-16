class Picture < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :image,
    :path   => ":rails_root/public/images/:id/:filename",
    :url    => "/images/:id/:filename",
    :styles => { :medium => "300x300>", :thumb => "100x100>" }

  do_not_validate_attachment_file_type :image
end