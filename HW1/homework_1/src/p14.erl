-module(p14).

-export([duplicate/1]).

-import(p05,[reverse/1]).

-include_lib("eunit/include/eunit.hrl").

duplicate(Acc) -> duplicate(Acc, []).

duplicate([], Acc) -> reverse(Acc);
duplicate([H|T], Acc) -> duplicate(T, [H, H | Acc]).

duplicate_test_()->[
  duplicate([a,b,c,d])=:=[a,a,b,b,c,c,d,d],
  duplicate([])=:=[],
  duplicate([a])=:=[a,a]
].