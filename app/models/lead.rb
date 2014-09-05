class Lead < ActiveRecord::Base

  validates_uniqueness_of :first_name
end
