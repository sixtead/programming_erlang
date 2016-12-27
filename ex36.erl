-module(ex36).
-export([qsort/1, msort/1]).

qsort([]) -> [];
qsort([H|T]) -> qsort(less(T, H)) ++ [H] ++ qsort(more(T, H)).


less(List, Elem) -> less(List, Elem, []).

less([], _, List) -> List;
less([H|T], Elem, List) when H < Elem -> less(T, Elem, [H|List]);
less([_|T], Elem, List) -> less(T, Elem, List).


more(List, Elem) -> more(List, Elem, []).

more([], _, List) -> List;
more([H|T], Elem, List) when H >= Elem -> more(T, Elem, [H|List]);
more([_|T], Elem, List) -> more(T, Elem, List).


msort([H|[]]) ->
  [H];
msort([H|T]) ->
  msort([H], T).
  
msort(List, [H|T]) when length(List) < length([H|T]) ->
  msort([H|List], T);
msort(List1, List2) ->
  lists:reverse(merge(msort(List1), msort(List2))).


merge(List1, List2) ->
  merge(List1, List2, []).
  
merge([], [], List) -> List;
merge([], [H|T], List) -> merge([], T, [H|List]);
merge([H|T], [], List) -> merge(T, [], [H|List]);
merge([H1|T1], [H2|T2], List) ->
  case H1 < H2 of
    true ->
      merge(T1, [H2|T2], [H1|List]);
    false ->
      merge([H1|T1], T2, [H2|List])
  end.