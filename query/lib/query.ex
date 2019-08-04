defmodule Query do
  def org_url() do
    github = "https://api.github.com/orgs/in-line-connection/repos"
    "#{github}"
  end

  def column_names() do
    Enum.join(~w(RepoOwner NumberOfRepos), ",")
  end

  def get(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  def decode(body) do
    {_status, body} = body
     return = Poison.decode(body)
    "#{return}"
  end

end
