class News < ActiveRecord::Base

	require 'uri'
	belongs_to :user
	validates :news_url,:title,:news_style, presence: true
	validate :url_format 


	def url_format
		if self.news_url.present?
			begin
				errors.add(:news_url, "Invalid url") unless URI(self.news_url).is_a?(URI::HTTP)
			rescue URI::InvalidURIError
				errors.add(:news_url, "Invalid url")
			end
		end
	end
end
