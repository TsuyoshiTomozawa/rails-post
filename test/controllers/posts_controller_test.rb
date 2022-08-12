require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
    include Warden::Test::Helpers

    def setup
        @user = users(:michael)
        # login_as @user
    end

    test "should redirect index when not logged in" do
        get posts_path
        assert_redirected_to new_user_session_path
    end



end
