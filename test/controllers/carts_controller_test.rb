require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)

    @p1 = products(:ruby)
    @p2 = products(:sap)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: {  }
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should show cart" do
    get :show, id: @cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cart
    assert_response :success
  end

  test "should update cart" do
    patch :update, id: @cart, cart: {  }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart
      delete :destroy, id: @cart
    end

    assert_redirected_to store_path
  end

  test "should calculate ok" do
    @cart.add_product(@p1.id, @p1.price)
    @cart.add_product(@p2.id, @p1.price)

    assert_equal(@cart.line_items.size, 2)
    assert_equal(@cart.total_price, 129.49)
  end
end
