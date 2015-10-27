require 'securerandom'
require_relative '../../config/environments/init'

class Url < ActiveRecord::Base
	before_create :shorten #automatically saves shortened url into db
	validates :long_url, presence: true, :format => {:with => URI.regexp}
	validates :short_url, uniqueness: true

	def shorten
		random_string = self.SecureRandom.base64(4)
	end
end		




# a = SecureRandom.hex(6)
# b = SecureRandom.base64(1)
# c = SecureRandom.urlsafe_base64(12)

# puts a
# puts b
# puts c
