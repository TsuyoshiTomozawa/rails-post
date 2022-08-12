require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
    include Warden::Test::Helpers

    def setup
        @user = users(:michael)
        login_as @user
    end

    test "should get show" do
        get user_url @user
        assert_response :success
        assert_template 'users/show'
    end
end
