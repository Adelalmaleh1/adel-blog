require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	def setup
		@category= category.new(name: "sports")
	end

	test "category should be vaild " do
	assert @category.vaild?	
	end

end