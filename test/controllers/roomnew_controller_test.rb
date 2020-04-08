require 'test_helper'

class RoomnewControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get roomnew_create_url
    assert_response :success
  end

  test "should get listing" do
    get roomnew_listing_url
    assert_response :success
  end

  test "should get price" do
    get roomnew_price_url
    assert_response :success
  end

  test "should get description" do
    get roomnew_description_url
    assert_response :success
  end

  test "should get photos" do
    get roomnew_photos_url
    assert_response :success
  end

  test "should get amenities" do
    get roomnew_amenities_url
    assert_response :success
  end

  test "should get location" do
    get roomnew_location_url
    assert_response :success
  end

  test "should get update" do
    get roomnew_update_url
    assert_response :success
  end

end
