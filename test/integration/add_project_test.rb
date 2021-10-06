require "test_helper"

class AddProjectTest < ActionDispatch::IntegrationTest
    setup do
        @user = FactoryBot.create(:user)
        login_as @user
    end

    test "allows a user to create a project with tasks" do
        visit new_project_path
        fill_in "Name", with: "Project Runway"
        fill_in "Tasks", with: "Choose Fabric:3\nMake it Work:5"
        click_on("Create Project")
        visit projects_path
        @project = Project.find_by(name: "Project Runway")
        visit("/")
        assert_selector("#project_#{@project.id} .name", text: "Project Runway")
        assert_selector("#project_#{@project.id} .total-size", text: "8")
    end

    test "does not allow a user to create a project without a name" do
        visit new_project_path
        fill_in "Name", with: ""
        fill_in "Tasks", with: "Choose Fabric:3\nMake it Work:5"
        click_on("Create Project")
        assert_selector(".new_project")
    end

    test "behaves correctly with a database failure" do
        workflow = stub(success?: false, create: false, project: Project.new)
        CreatesProject.stubs(:new).returns(workflow)
        visit new_project_path
        fill_in "Name", with: "Project Runway"
        fill_in "Tasks", with: "Choose Fabric:3\nMake it Work:5"
        click_on("Create Project")
        @project = Project.find_by(name: "Project Runway")
        assert_selector(".new_project")
    end
end