-module(ex33).
-export([print_numbers/1, print_odd_numbers/1]).

print_numbers(N) ->
  print_num(N, 1).
  
print_odd_numbers(N) ->
  print_odd_num(N, 1).
  
print_num(N, N) ->
  io:format("Number:~p~n", [N]);
print_num(N, M) when M < N ->
  io:format("Number:~p~n", [M]),
  print_num(N, M + 1).
  
print_odd_num(N, N) ->
  if
    N rem 2 == 1 -> io:format("Number:~p~n", [N])
  end;
print_odd_num(N, M) when (M < N) and (M rem 2 /= 0) ->
  io:format("Number:~p~n", [M]),
  print_odd_num(N, M + 1);
print_odd_num(N, M) when (M < N) ->
  print_odd_num(N, M + 1).