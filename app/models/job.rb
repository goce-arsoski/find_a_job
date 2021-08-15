class Job < ApplicationRecord
  has_many :applications, dependent: :destroy
end
