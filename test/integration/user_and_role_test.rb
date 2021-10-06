require "test_helper"

class UserAndRoleTest < ActionDispatch::IntegrationTest
  def log_in_as(user)
    visit new_user_session_path
    fill_in("user_email", with: user.email)
    fill_in("user_password", with: user.password)
    click_button("Log in")
  end

  setup do
    @user = User.create(email: "test@example.com", password: "password")
  end

  test "a logged in user can view the project index page" do
    log_in_as(@user)
    visit(projects_path)
    assert_equal projects_path, current_path
  end
end