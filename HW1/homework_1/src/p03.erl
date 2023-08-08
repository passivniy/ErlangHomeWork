-module(p03).

-export([element_at/2]).

-include_lib("eunit/include/eunit.hrl").

element_at([H|_], 1) -> H;
element_at([_|T], X) -> element_at(T,X - 1);
element_at([],_) -> undefined.

element_at_test_()->[
  (element_at([1,2,3,4,5,6],5)=:=5),
  (element_at([],1)=:=undefined)
].