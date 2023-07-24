-module(p12).
-export([decode_modified/1]).

decode_modified(Acc) -> lists:reverse(decode_modified(Acc, [])).

decode_modified([], Acc) -> Acc;
decode_modified([{Value, Key} | Tail], Acc) ->
  decode_modified(Tail, decode_to_list([Value, Key], Acc));
decode_modified([A | Tail], Acc) ->
  decode_modified(Tail, [A | Acc]).

decode_to_list([0, _], Acc) -> Acc;
decode_to_list([Value, Key], Acc) ->
  decode_to_list([Value - 1, Key], [Key | Acc]).