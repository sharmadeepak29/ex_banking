defmodule ExBanking.Structs.Account do
  @moduledoc """
  Account struct module contains the Account struct and its related functions.
  """
  use Domo

  import ExBanking.Utils, only: [to_float: 1]

  defstruct currency: "", balance: 0.0

  #########################################################################
  # Types
  #########################################################################
  @type currency :: String.t()

  @type balance :: float()
  precond(balance: &(&1 >= 0.0))

  @type t :: %__MODULE__{
          currency: currency(),
          balance: balance()
        }

  #########################################################################
  # Public APIs
  #########################################################################
  @spec validate(currency :: currency(), balance :: balance() | non_neg_integer()) ::
          :ok | {:error, :wrong_arguments}
  def validate(currency, balance \\ 0.0) do
    %__MODULE__{currency: currency, balance: to_float(balance)}
    |> ensure_type()
    |> case do
      {:ok, _account} -> :ok
      {:error, _reason} -> {:error, :wrong_arguments}
    end
  end
end
