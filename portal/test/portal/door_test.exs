defmodule DoorTest do
  use ExUnit.Case
  doctest Portal.Door

  test "start_link should create an empty array with a specific PID" do
    {val, _}  = Portal.Door.start_link(:green)
    assert val == :ok
  end

  test "should return the list contained in a door" do
    Portal.Door.start_link(:pink)
    assert Portal.Door.get(:pink) == []

    Portal.Door.push(:pink, 25)
    assert Portal.Door.get(:pink) == [25]
  end

  test "should add an item for a door" do
    Portal.Door.start_link(:pink)
    assert Portal.Door.get(:pink) == []

    Portal.Door.push(:pink, 25)
    assert Portal.Door.get(:pink) == [25]
  end

  test "should pop an item for a door" do
    Portal.Door.start_link(:pink)
    assert Portal.Door.get(:pink) == []

    Portal.Door.push(:pink, 25)
    assert Portal.Door.get(:pink) == [25]

    assert Portal.Door.pop(:pink) == {:ok, 25}
    assert Portal.Door.get(:pink) == []
  end
end
