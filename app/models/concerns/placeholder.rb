module PlaceHolder
	extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
	"http://via.placeholder.it/#{height}x#{width}"
    end
end