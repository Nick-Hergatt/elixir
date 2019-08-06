defmodule Query do
    #github = "https://api.github.com/orgs/in-line-connection/repos"

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %{body: raw_body, status_code: _code}} -> {raw_body}
        case body do
           ->
            
        end
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  def decode(body) do
    {body} = body

    Poison.decode(body, keys: :atoms)
  end
  
  def convertToList(body) do
    body
    |> Tuple.to_list
    |> List.flatten
  end 
  Enum.each

  
  def request(url) do
  url
  |> get
  |> decode
  |> convertToList
  end


end
