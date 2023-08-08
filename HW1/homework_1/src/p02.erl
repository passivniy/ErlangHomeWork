-module(p02).

-export([but_last/1]).

-include_lib("eunit/include/eunit.hrl").

but_last([])->[];
but_last([_])->undefined;
but_last([_, _] = X) -> X;
but_last([_|T]) -> but_last(T).

but_last_test_()->[
  ?assert(but_last([1,2,3,4,5,6])=:=[5,6]),
  ?assert(but_last([a,b,c,d,e,f,g])=:=[f,g]),
  ?assert(but_last([1])=:=undefined),
  ?assert(but_last([])=:=[])
].