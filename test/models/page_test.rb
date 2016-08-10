require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'serializes h1-content, h2-content, h3-content, and links' do
    model.h1_content = []
    model.h3_content = []
    model.h3_content = []
    model.links = []
    model.save

    page = Page.last
    assert_equal [], page.h1_content
    assert_equal [], page.h2_content
    assert_equal [], page.h3_content
    assert_equal [], page.links
  end

  def model
    @page ||= Page.new
  end
end
