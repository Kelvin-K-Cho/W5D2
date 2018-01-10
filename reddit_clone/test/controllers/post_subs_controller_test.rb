require 'test_helper'

class PostSubsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_subs_new_url
    assert_response :success
  end

  test "should get create" do
    get post_subs_create_url
    assert_response :success
  end

  test "should get index" do
    get post_subs_index_url
    assert_response :success
  end

  test "should get show" do
    get post_subs_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_subs_edit_url
    assert_response :success
  end

  test "should get update" do
    get post_subs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get post_subs_destroy_url
    assert_response :success
  end

end
