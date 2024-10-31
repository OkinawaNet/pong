defmodule PongTest do
  use ExUnit.Case
  doctest Pong

  test "метод ping возвращает {:pong, node()} " do
    {:ok, pid} = Pong.start_link([])

    assert Pong.ping(pid) == {:pong, node()}
  end
end
