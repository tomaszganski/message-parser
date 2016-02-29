class Action < ActiveRecord::Base
  has_many :params, class_name: 'ActionParam', dependent: :delete_all
end