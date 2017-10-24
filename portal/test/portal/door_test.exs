defmodule DoorTest do
  use ExUnit.Case
  doctest Portal.Door

  test "start_link should create an empty array with a specific PID" do
    {val, _}  = Portal.Door.start_link(:green)
    assert val == :ok
  end
end
