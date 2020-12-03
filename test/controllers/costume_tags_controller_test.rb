require 'test_helper'

class CostumeTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get costume_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get costume_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get costume_tags_destroy_url
    assert_response :success
  end

end
