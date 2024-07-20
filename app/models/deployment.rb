class Deployment < ApplicationRecord
  belongs_to :user
  belongs_to :application
  belongs_to :environment
end
