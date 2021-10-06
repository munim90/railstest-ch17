require_relative "../active_record_test_helper"
require_relative "../../app/models/project"
require_relative "../../app/models/task"

class ProjectWithStubsTest < ActiveSupport::TestCase
    #START: first_stub
    test "let's stub an object" do
        project = Project.new(name: "Project Greenlight")
        project.stubs(:name)
        assert_nil(project.name)
    end
    #END: first_stub

    #START: second_stub
    test "let's stub an object again" do
        project = Project.new(name: "Project Greenlight")
        project.stubs(:name).returns("Fred")
        assert_equal("Fred", project.name)
    end
    #END: second_stub

    #START: third_stub
    test "let's stub a class" do
        Project.stubs(:find).returns(Project.new(name: "Project Greenlight"))
        project = Project.find(1)
        assert_equal("Project Greenlight", project.name)
    end
    #END: third_stub

    #START: fourth_stub
    test "let's mock an object" do
        mock_project = Project.new(name: "Project Greenlight")
        mock_project.expects(:name).returns("Fred")
        assert_equal("Fred", mock_project.name)
    end
    #END: fourth_stub

    #START: fifth_stub
    test "stub with multiple returns" do
        stubby = Project.new
        stubby.stubs(:user_count).returns(1, 2)
        assert_equal(1, stubby.user_count)
        assert_equal(2, stubby.user_count)
        assert_equal(2, stubby.user_count)
    end
    #END: fifth_stub
end