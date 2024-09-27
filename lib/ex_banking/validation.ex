defmodule ExBanking.Validation do
  @moduledoc """
  Validation module contains functions that are used to validate the attributes
  """

  alias ExBanking.Structs.{Account, User}

  defdelegate validate_account(currency, balance \\ 0.0), to: Account, as: :validate
  defdelegate validate_user(username), to: User, as: :validate
end
