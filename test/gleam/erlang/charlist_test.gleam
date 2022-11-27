import gleam/dynamic
import gleam/erlang/charlist

pub fn to_string_test() {
  assert "Hello, from erlang!" =
    "Hello, from erlang!"
    |> charlist.from_string()
    |> charlist.to_string()
}

external fn lists_duplicate(n: Int, elem: Int) -> charlist.Charlist =
  "lists" "duplicate"

pub fn from_char_list_test() {
  // Test conversion from a char list generated by Erlang
  assert "ééé" =
    lists_duplicate(3, 0xE9)
    |> charlist.to_string()
}

pub fn empty_string_test() {
  assert "" =
    []
    |> dynamic.from
    |> dynamic.unsafe_coerce
    |> charlist.to_string

  assert [] =
    ""
    |> charlist.from_string()
    |> dynamic.from
    |> dynamic.unsafe_coerce
}
