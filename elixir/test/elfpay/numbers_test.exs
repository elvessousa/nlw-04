defmodule Elfpay.NumbersText do
  use ExUnit.Case, async: true

  alias Elfpay.Numbers

  describe "sum_from_file/1" do
    test "When there is a filename is given, returns the sum of its numbers." do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: 49}}
      assert response == expected_response
    end

    test "When there is no file with given name, returns an error." do
      response = Numbers.sum_from_file("banana")
      expected_response = {:error, %{message: "Invalid file"}}
      assert response == expected_response
    end
  end
end
