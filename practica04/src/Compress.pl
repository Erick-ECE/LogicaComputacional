
delPal([], []).
delPal(List, Compressed):-
    accDelPal(List, [], Compressed).


palindrome(L):-
        length(L, N),
        N > 1,
        reverse(L, L).


accDelPal([], [], []).
accDelPal([], Acc, Compressed):-
    palindrome(Acc),
    length(Acc, N),
    Length is N / 2,
    ceiling(Length, Take),
    take(Take, Acc, Compressed), !.
accDelPal([], Acc, Acc).
accDelPal(Rest, Acc, Compressed):-
    palindrome(Acc),
    length(Acc, N),
    Length is N / 2,
    ceiling(Length, Take),
    take(Take, Acc, Half),
    accDelPal(Rest, [], RestCompressed),
    append(Half, RestCompressed, Compressed), !.
accDelPal([H | Rest], Acc, Compressed):-
    accDelPal(Rest, [H | Acc], Compressed).


take(0, _, []).
take(_, [], []).
take(_, [_], [_]).
take(N, [H | F], [H | Rest]):-
    N1 is N-1,
    take(N1, F, Rest), !.