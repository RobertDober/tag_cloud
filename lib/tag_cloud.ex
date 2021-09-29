defmodule TagCloud do
  @moduledoc """
  Elxir Tools to create Tag clouds - Integration with Earmark Annotations - Independent Library Functions - Gamma correction for grey scales
  """


  @doc """
  A convenience method to access this library's version
  """
  def version do
    :application.ensure_started(:tag_cloud)
    with {:ok, version} = :application.get_key(:tag_cloud, :vsn), do: to_string(version)
  end
end
