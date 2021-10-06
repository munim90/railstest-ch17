require "test_helper"

class ProjectsControllerTest < ActionController::TestCase
    test "routing" do
        assert_routing "/", controller: "projects", action: "index"
        assert_routing({path: "/projects", method: "post"},
            controller: "projects", action: "create")
        assert_routing "/projects/new", controller: "projects", action: "new"
        assert_routing "/projects/1", controller: "projects",
            action: "show", id: "1"
        assert_routing "/projects/1/edit", controller: "projects",
            action: "edit", id: "1"
        assert_routing({path: "/projects/1", method: "patch"},
            controller: "projects", action: "update", id: "1")
        assert_routing({path: "/projects/1", method: "delete"},
            controller: "projects", action: "destroy", id: "1")
    end
end