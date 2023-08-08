-module(p01).

-export([last/1]).

-include_lib("eunit/include/eunit.hrl").

last([]) -> [];
last([H]) -> H;
last([_|T]) -> last(T).

last_test_()->[
  ?assert(last([1,2,3,4,5,6])=:=6),
  ?assert(last([1])=:=1),
  ?assert(last([])=:=[]),
  ?assert(last(["a",2,"c",3,"b",-5])=:=-5)
].