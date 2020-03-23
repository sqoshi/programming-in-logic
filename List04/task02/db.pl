% kolory:    czerwony, zielony, bialy, zolty, niebieskie
% narodowosc:   norweg, anglik, dunczyk, niemiec, szwed
% zwierze:      kot, ptak, pies, kon, rybki
% drink:    herbata, mleko, woda, piwo, kawa
% papierosy:   light, cygaro, pipe, nofilter, menthol
%
%    Zakłada się, że domy ustawione są w jednej linii (1-2-3-4-5),
% a określenie „po lewej stronie” w punkcie 3. dotyczy lewej strony z
% perspektywy naprzeciw tych domów (tj. dom o numerze n jest bezpośrednio
% po lewej stronie domu n+1, a dom po lewej od domu n to dom o numerze
% n-1).
%

rybki(Kto) :- rozwiaz_zagadke(Domy),
    member([_,_,Kto,rybki,_,_],Domy),!.

rozwiaz_zagadke(Domy):-
    Domy = [
        [1, _, _, _, _, _], [2, _, _, _, _, _], [3, _, _, _, _, _],
        [4, _, _, _, _, _], [5, _, _, _, _, _]
    ],
    %Norweg zamieszkuje pierwszy dom
    member([1, _, norweg, _, _, _], Domy),
    %Anglik mieszka w czerwonym domu.
    member([_, czerwony, anglik, _, _, _], Domy),
    %Zielony dom znajduje się bezpośrednio po lewej stronie domu białego.
    member([N11, zielony, _, _, _, _], Domy),member([N12, bialy, _, _, _, _], Domy),N11 is N12-1,
    %Duńczyk pija herbatkę.
    member([_, _, dunczyk, _, herbata, _], Domy),
    %Palacz papierosów light mieszka obok hodowcy kotów.
    member([N21, _, _, _, _, light], Domy),member([N22, _, _, koty, _, _], Domy),(N21 is N22-1 ; N21 is N22+1),
    %Mieszkaniec żółtego domu pali cygara.
    member([_, zolty, _, _, _, cygara], Domy),
    %Niemiec pali fajkę.
    member([_, _, niemiec, _, _, fajka], Domy),
    %Mieszkaniec środkowego domu pija mleko.
    member([3, _, _, _, mleko, _], Domy),
    %Palacz papierosów light ma sąsiada, który pija wodę.
    member([N31, _, _, _, _, light], Domy),member([N32, _, _, _, woda, _], Domy),(N31 is N32+1 ; N31 is N32-1),
    %Palacz papierosów bez filtra hoduje ptaki.
    member([_, _, _, ptaki, _, bezfiltra], Domy),
    %Szwed hoduje psy.
    member([_, _, szwed, psy, _, _], Domy),
    %Norweg mieszka obok niebieskiego domu.
    member([N41, _, norweg, _, _, _], Domy),member([N42, niebieski, _, _, _, _], Domy),(N41 is N42+1 ; N41 is N42-1),
    %Hodowca koni mieszka obok żółtego domu.
    member([N51, _, _, konie, _, _], Domy),member([N52, zolty, _, _, _, _], Domy),(N51 is N52+1 ; N51 is N52-1),
    %Palacz mentolowych pija piwo.
    member([_, _, _, _, piwo, mentolowe], Domy),
    %W zielonym domu pija się kawę
    member([_, zielony, _, _, kawa, _], Domy).

