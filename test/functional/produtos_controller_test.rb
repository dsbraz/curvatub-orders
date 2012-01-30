require 'test_helper'

class ProdutosControllerTest < ActionController::TestCase
  setup do
    @produto = produtos(:one)
  end

  test "deve abrir o index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produtos)
  end

  test "deve abrir o new" do
    get :new
    assert_response :success
  end

  test "deve criar o produto" do
    assert_difference('Produto.count') do
      post :create, produto: @produto.attributes
    end

    assert_redirected_to produto_path(assigns(:produto))
  end

  test "deve mostrar o produto" do
    get :show, id: @produto.to_param
    assert_response :success
  end

  test "deve abrir o edit" do
    get :edit, id: @produto.to_param
    assert_response :success
  end

  test "deve alterar o produto" do
    put :update, id: @produto.to_param, produto: @produto.attributes
    assert_redirected_to produto_path(assigns(:produto))
  end

  test "deve remover o produto" do
    assert_difference('Produto.count', -1) do
      delete :destroy, id: @produto.to_param
    end

    assert_redirected_to produtos_path
  end
end
