-module(ex35).
-export([filter/2, reverse/1, concatenate/1, flatten/1]).

filter(List, N) ->
  reverse(filter(List, N, [])).

filter([], _, NewList) ->
  NewList;
filter([H|T], N, NewList) when H =< N ->
  filter(T, N, [H|NewList]);
filter ([_|T], N, NewList) ->
  filter(T, N, NewList).


reverse(List) ->
  reverse(List, []).
  
reverse([], NewList) ->
  NewList;
reverse([H|T], NewList) ->
  reverse(T, [H|NewList]).


concatenate(List) ->
  reverse(concatenate(List, [])).
  
concatenate([], NewList) ->
  NewList;
concatenate([H|T], NewList) ->
  concatenate(T, add_to_list(H, NewList)).

%same as reverse/2 but added case for non-list frst arg
add_to_list([], NewList) ->
  NewList;
add_to_list([H|T], NewList) ->
  add_to_list(T, [H|NewList]);
add_to_list(N, NewList) ->
  [N|NewList].
  
flatten(List) ->
  case all_non_list(List) of
    true ->
      List;
    false ->
      flatten(concatenate(List))
  end.
  
all_non_list([]) ->
  true;
all_non_list([H|T]) ->
  case is_list(H) of
    false ->
      all_non_list(T);
    true ->
      false
  end.
