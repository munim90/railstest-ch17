require_relative "../active_record_test_helper"
require_relative "../../app/models/project"
require_relative "../../app/models/task"

class UserTest < ActiveSupport::TestCase
  # 
  def create_two_projects
    Project.delete_all
    @user = User.create!(email: "user@example.com", password: "password")
    @project_1 = Project.create!(name: "Project 1")
    @project_2 = Project.create!(name: "Project 2")
    @all_projects = [@project_1, @project_2]
  end

  def assert_visiblity_of(*projects)
    assert_equal(@user.visible_projects, projects)
    projects.all? { |p| assert(@user.can_view?(p)) }
    (@all_projects - projects).all? { |p| refute(@user.can_view?(p)) }
  end

  test "a user can see their projects" do
    create_two_projects
    @user.projects << @project_1
    assert_visiblity_of(@project_1)
  end

  test "an admin can see all projects" do
    create_two_projects
    @user.admin = true
    assert_visiblity_of(@project_1, @project_2)
  end

  test "a user can see public projects" do
    create_two_projects
    @user.projects << @project_1
    @project_2.update_attributes(public: true)
    assert_visiblity_of(@project_1, @project_2)
  end

  test "no dupes in project list" do
    create_two_projects
    @user.projects << @project_1
    @project_1.update_attributes(public: true)
    assert_visiblity_of(@project_1)
  end
  # 
end