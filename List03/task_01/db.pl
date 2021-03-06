%najpierw srednia
sr([],Sum,Avg,Len):-
    Avg is Sum/Len.
sr([X|L],Sum,Avg,Len):-
    S1 is Sum + X,
    sr(L,S1,Avg,Len).

%teraz kazdy element - sr
%te roznice do kwadratu
%kwadraty suma  przez Len

wariancja(L,D):-
    length(L,Len),
    sr(L,0,Avg,Len),print(Avg),
    wariancja(L,0,Len,Avg,D).
%pusta lista nie dziala ale da sie to naprawic
wariancja([],Part,Len,_,D):-
    D is Part/Len.
wariancja([X|L],Part,Len,Avg,D):-
    Next is Part + X*X - 2*Avg*X + Avg*Avg,
    wariancja(L,Next,Len,Avg,D).
