defmodule ExBanking.Structs.User do
  @moduledoc """
  User struct module contains the User struct and its related functions.
  """
  use Domo

  defstruct name: ""

  #########################################################################
  # Types
  #########################################################################
  @type name :: String.t()

  @type t :: %__MODULE__{
          name: name()
        }

  #########################################################################
  # Public APIs
  #########################################################################
  @spec validate(username :: name()) :: :ok | {:error, :wrong_arguments}
  def validate(username) do
    %__MODULE__{name: username}
    |> ensure_type()
    |> case do
      {:ok, _user} -> :ok
      {:error, _reason} -> {:error, :wrong_arguments}
    end
  end

  def validate(from_user, from_user), do: {:error, :wrong_arguments}
  def validate(_from_user, _to_user), do: :ok
end
