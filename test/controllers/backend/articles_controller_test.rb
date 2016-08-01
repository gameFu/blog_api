require 'test_helper'

class Backend::ArticlesControllerTest < ActionController::TestCase
  setup do
    current_admin
    @article = create :article
  end

  test "no access with no login " do
    get :index
    assert_response 401
  end

  test "article index" do
    admin_get :index
    assert_equal @article.id, response_json['data'][0]['id'].to_i
  end

  test "article show" do
    admin_get :show, params: { id: @article.id }
    assert_equal @article.title, response_json['data']['attributes']['title']
  end

  test "article create" do
    assert_difference "Article.count", 1 do
      admin_post :create, params: { article: { title: 'webpack打包', content: '打包流程' } }
    end
  end

  test "article destroy" do
    article = create(:article)
    assert_difference "Article.count", -1 do
      admin_delete :destroy, params: { id: article.id }
    end
  end

  test "article update" do
    article = create(:article)
    admin_put :update, params: { id: article.id, article: { title: 'webpack打包' } }
    assert_equal 'webpack打包', article.reload.title
  end

end
