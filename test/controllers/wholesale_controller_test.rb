require 'test_helper'

class WholesaleControllerTest < ActionDispatch::IntegrationTest
  test "should get all_products" do
    get wholesale_all_products_url
    assert_response :success
  end

  test "should get products_by_category" do
    get wholesale_products_by_category_url
    assert_response :success
  end

  test "should get products_by_vendor" do
    get wholesale_products_by_vendor_url
    assert_response :success
  end

end
