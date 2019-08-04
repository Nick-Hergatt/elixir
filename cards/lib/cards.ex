defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings representing playing cards
  """
  def create do
    values = ["ace", "two", "three", "four", "five"]
    suits = ["Spades", "clubs", "hearts", "diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    divides a deck int a hand and theremainder of the deck. 
    the `hand_size` argument indicates how many cards should 
    be in the hand
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file) do
    binary = :erlang.term_to_binary(deck)
    File.write(file, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "that file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
