defmodule PortalTest do
  use ExUnit.Case
  doctest Portal

  test "create a portal" do
    Portal.Door.start_link(:orange)
    Portal.Door.start_link(:blue)
    portal = Portal.transfer(:orange, :blue, [1, 2, 3])
   # IO.puts portal
    #assert portal == {left: :orange, right: :blue}
  end

  test "test transfer of data" do
    Portal.Door.start_link(:orange)
    Portal.Door.start_link(:blue)
    portal = Portal.transfer(:orange, :blue, [1, 2, 3])
    orange_data = Portal.Door.get(:orange);
    blue_data = Portal.Door.get(:blue)
    assert orange_data = [3, 2, 1]
    assert blue_data = []
  end

  test "push right one the data from the left to the right" do
    Portal.Door.start_link(:orange)
    Portal.Door.start_link(:blue)
    portal = Portal.transfer(:orange, :blue, [1, 2, 3])
    Portal.push_right(portal)
    orange_data = Portal.Door.get(:orange);
    blue_data = Portal.Door.get(:blue)
    assert orange_data = [2, 1]
    assert blue_data = [3]
  end

end
