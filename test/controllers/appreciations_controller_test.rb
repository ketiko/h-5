require 'test_helper'

class AppreciationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appreciation = appreciations(:one)
  end

  test "should get index" do
    get appreciations_url
    assert_response :success
  end

  test "should get new" do
    get new_appreciation_url
    assert_response :success
  end

  test "should create appreciation" do
    assert_difference('Appreciation.count') do
      post appreciations_url, params: { appreciation: { points: @appreciation.points, token: @appreciation.token, user_id: @appreciation.user_id } }
    end

    assert_redirected_to appreciation_url(Appreciation.last)
  end

  test "should show appreciation" do
    get appreciation_url(@appreciation)
    assert_response :success
  end

  test "should get edit" do
    get edit_appreciation_url(@appreciation)
    assert_response :success
  end

  test "should update appreciation" do
    patch appreciation_url(@appreciation), params: { appreciation: { points: @appreciation.points, token: @appreciation.token, user_id: @appreciation.user_id } }
    assert_redirected_to appreciation_url(@appreciation)
  end

  test "should destroy appreciation" do
    assert_difference('Appreciation.count', -1) do
      delete appreciation_url(@appreciation)
    end

    assert_redirected_to appreciations_url
  end
end
