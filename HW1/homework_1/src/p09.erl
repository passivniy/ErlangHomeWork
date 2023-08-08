-module(p09).

-export([pack/1]).

-import(p05,[reverse/1]).

-include_lib("eunit/include/eunit.hrl").

pack(L)->pack(L,[],[]).

pack([],_,_) -> [];
pack([H],TempAcc,Acc) -> reverse([[H|TempAcc]|Acc]);
pack([H,H|T],TempAcc,Acc) -> pack([H|T],[H|TempAcc],Acc);
pack([H,M|T],TempAcc,Acc) -> pack([M|T],[],[[H|TempAcc]|Acc]).

pack_test_()->[
  pack([a,a,a,a,a,c,b,c,a,d])=:=[[a,a,a,a,a],[c],[b],[c],[a],[d]],
  pack([a,b,c,d,e])=:=[[a],[b],[c],[d],[e]],
  pack([])=:=[]
].