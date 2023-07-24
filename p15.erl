-module(p15).
-export([replicate/2]).

replicate(Acc, Value) -> lists:reverse(replicate(Acc, [], Value)).

replicate([], Acc, _) -> Acc;
replicate([H | T], Acc, Value) ->
  replicate(T, replicate_to_list(H, Value, Acc), Value).

replicate_to_list(_, 0, Acc) -> Acc;
replicate_to_list(Key, Value, Acc) -> replicate_to_list(Key, Value - 1, [Key | Acc]).