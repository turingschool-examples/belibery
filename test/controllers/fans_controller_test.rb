require 'test_helper'

class FansControllerTest < ActionController::TestCase
  test "it gets index" do
    get :index

    assert_response :success
    assert_not_nil  assigns(:fans)
  end

  test "it gets show" do
    fan = Fan.create(name: "Gustavo", email: "belieber@example.com")

    get :show, {'id' => fan.id}

    assert_response :success
    assert_not_nil  assigns(:fan)
  end

  test "it gets new" do
    get :new

    assert_response :success
    assert_not_nil  assigns(:fan)
  end

  test "it posts to create" do
    post :create, fan: { name: "Gustavo", email: "belieber@example.com" }

    assert_response       :redirect
    assert_redirected_to  fan_path(assigns(:fan))
    assert_equal          "You have created a fan.", flash[:notice]
  end

  test "it renders new when post is unsuccessful" do
    post :create, fan: { email: "belieber@example.com" }

    assert_response :success
    assert_template :new
    assert_equal    "The fan was not created. Please try again.", flash[:alert]
  end

  test "it gets edit" do
    fan = Fan.create(name: "Gustavo", email: "belieber@example.com")
    get :edit, { id: fan.id }

    assert_response :success
    assert_not_nil  assigns(:fan)
  end

  test "it updates a fan" do
    fan = Fan.create(name: "Gustavo", email: "belieber@example.com")
    patch :update, { id: fan.id, fan: { name: "Horacio" } }

    assert_response      :redirect
    assert_redirected_to fan_path(assigns(:fan))
    assert_equal         "You have updated a fan.", flash[:notice]

    result = Fan.find(fan.id)
    assert_equal "Horacio", result.name
  end

  test "it deletes to destroy" do
    fan = Fan.create(name: "Gustavo", email: "belieber@example.com")

    assert_difference('Fan.count', -1) do
      delete :destroy, { id: fan.id }
    end

    assert_response      :redirect
    assert_redirected_to fans_path
    assert_equal         "The fan was deleted.", flash[:notice]
  end
end
