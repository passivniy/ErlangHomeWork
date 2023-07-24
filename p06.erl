-module(p06).
-export([is_palindrome/1]).

is_palindrome(L) -> L == is_palindrome(L, []).

is_palindrome([], L) ->
  L;
is_palindrome([H | T], L) ->
  is_palindrome(T, [H | L]).