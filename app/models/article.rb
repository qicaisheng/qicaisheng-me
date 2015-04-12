require 'acts-as-taggable-on'
class Article < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
	validates :category ,presence: true
	acts_as_taggable
	acts_as_taggable_on :tagged
end
