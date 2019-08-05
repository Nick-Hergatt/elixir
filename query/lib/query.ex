defmodule Query do
    #github = "https://api.github.com/orgs/in-line-connection/repos"

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %{body: raw_body, status_code: _code}} -> {raw_body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  def decode(body) do
    {body} = body

    Poison.decode(body, as: %name{repo: repo})
  end

  def request(url) do
  url
  |> get
  |> decode
  end


end
