-module(p06).

-export([is_palindrome/1]).

-import(p05, [reverse/1]).
-include_lib("eunit/include/eunit.hrl").

is_palindrome(L) -> L == reverse(L).

is_palindrome_test_()->[
  is_palindrome([1,2,3,2,1])=:=true,
  is_palindrome([1])=:=true,
  is_palindrome([])=:=true
].