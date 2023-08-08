-module(p12).

-export([decode_modified/1]).

-import(p05,[reverse/1]).

-include_lib("eunit/include/eunit.hrl").

decode_modified(Acc) -> decode_modified(Acc, []).

decode_modified([], Acc) -> reverse(Acc);
decode_modified([{Value, Key} | Tail], Acc) ->
  decode_modified(Tail, decode_to_list([Value, Key], Acc));
decode_modified([Head | Tail], Acc) ->
  decode_modified(Tail, [Head | Acc]).

decode_to_list([0, _], Acc) -> Acc;
decode_to_list([Value, Key], Acc) ->
  decode_to_list([Value - 1, Key], [Key | Acc]).

decode_modified_test_()->[
  decode_modified([{1,a},{5,b},{3,c}])=:=[a,b,b,b,b,b,c,c,c],
  decode_modified([])=:=[],
  decode_modified([{1,a}])=:=[a]
].