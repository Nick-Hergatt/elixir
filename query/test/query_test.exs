defmodule QueryTest do
  use ExUnit.Case
  doctest Query

  test "greets the world" do
    assert Query.hello() == :world
  end
end
