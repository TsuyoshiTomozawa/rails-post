require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
    include Warden::Test::Helpers

    def setup
        @user = users(:michael)
        login_as @user
    end

    test "should get index" do
        get root_path
        assert_response :success
    end


end
