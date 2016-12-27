-module(ex31).
-export([sum/1, sum/2]).

sum(0) ->
  0;
sum(N) when N < 0 ->
  N + sum(N + 1);
sum(N) ->
  N + sum(N - 1).

sum(N, N) ->
  N;
sum(N, M) when N > M ->
  1/0;
sum(_N, M) ->
  M + sum(M - 1).