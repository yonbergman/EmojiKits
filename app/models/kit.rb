class Kit < ActiveRecord::Base
  has_many :emoji, class_name: 'Emoji'
end
