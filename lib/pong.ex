defmodule Pong do
  @moduledoc """
    Модуль, возвращающий {:pong, node()} на запрос :ping
  """
  use GenServer

  # Client

  @doc """
  Запускает GenServer процесса с данным модулем.
  """
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  @doc """
  Отправляет запрос `:ping` процессу с заданным `pid`.

  ## Возвращаемое значение

    Возвращает кортеж `{:pong, node()}`, где `node()` — имя узла, на котором
    выполняется процесс.

  ## Пример

      iex> {:ok, pid} = Pong.start_link(:any_value)
      iex> Pong.ping(pid)
      {:pong, :nonode@nohost}
  """
  def ping(pid) do
    GenServer.call(pid, :ping)
  end

  # Server

  @impl true
  def init(_) do
    {:ok, node()}
  end

  @impl true
  def handle_call(:ping, _, state) do
    {:reply, {:pong, state}, state}
  end
end
