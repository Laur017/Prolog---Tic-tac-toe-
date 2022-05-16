- dynamic o1.
- dynamic x1.
- dynamic v1.

ordered_line(1,2,3).
ordered_line(2,3,4).
ordered_line(5,6,7).
ordered_line(6,7,8).
ordered_line(9,10,11).
ordered_line(10,11,12).
ordered_line(13,14,15).
ordered_line(14,15,16).
ordered_line(1,5,9).
ordered_line(5,9,13).
ordered_line(2,6,10).
ordered_line(6,10,14).
ordered_line(3,7,11).
ordered_line(7,11,15).
ordered_line(4,8,12).
ordered_line(8,12,16).
ordered_line(5,10,15).
ordered_line(1,6,11).
ordered_line(6,11,16).
ordered_line(2,7,12).
ordered_line(9,6,3).
ordered_line(13,10,7).
ordered_line(10,7,4).
ordered_line(14,11,8).


line(A,B,C) - ordered_line(A,B,C).
line(A,B,C) - ordered_line(A,C,B).
line(A,B,C) - ordered_line(B,A,C).
line(A,B,C) - ordered_line(B,C,A).
line(A,B,C) - ordered_line(C,A,B).
line(A,B,C) - ordered_line(C,B,A).


full(A) - x(A).
full(A) - o(A).
full(A) - v(A).

empty(A) - +(full(A)).
same(A,A).
different(A,B) - +(same(A,B)).


all_full - full(1),full(2),full(3),full(4),full(5),
full(6),full(7),full(8),full(9),full(10),full(11),full(12),full(13),full(14),
full(15),full(16).

done - ordered_line(A,B,C), x(A), x(B), x(C), write('Computer won.'),nl.

done - ordered_line(A,B,C), o(A), o(B), o(C), write('Player 1 won.'),nl.

done - ordered_line(A,B,C), v(A), v(B), v(C), write('Player 2 won.'),nl.

done - all_full, write('Draw.'), nl.


move2 - write('Player 1 move '), read(X),empty(X), assert(o(X)).
move2 - all_full.

move3 - write('Player 2 move '), read(X),empty(X), assert(v(X)).
move3 - all_full.

printsquare(N) - o(N), write(' o ').
printsquare(N) - x(N), write(' x ').
printsquare(N) - v(N), write(' v ').
printsquare(N) - empty(N), write(' - ').


printboard - printsquare(1),printsquare(2),printsquare(3),printsquare(4),nl,
          printsquare(5),printsquare(6),printsquare(7),printsquare(8),nl,
         printsquare(9),printsquare(10),printsquare(11),printsquare(12),nl,
    printsquare(13),printsquare(14),printsquare(15),printsquare(16),nl,nl.

play - repeat, makemove, printboard, (done; move2, printboard,(done; move3, printboard, done)).

makemove -  move(X), empty(X), assert(x(X)).
makemove - all_full.

move(A) - good(A), empty(A).

good(A) - win(A).
good(A) - block_win(A).
good(A) - fork(A).
good(A) - block_fork(A).
good(A) - build(A).
good(6). good(7).

win(A) - x(B), x(C), different(B,C), line(A,B,C).

block_win(A) - o(B), o(C), different(B,C), line(A,B,C).
block_win(A) - v(B), v(C), different(B,C), line(A,B,C).

fork(A) - x(B), x(C), different(B,C), line(A,B,D), line(A,C,E), empty(D), empty(E).

block_fork(A) - o(B), o(C), different(B,C), line(A,B,D), line(A,C,E), empty(D), empty(E).
block_fork(A) - v(B), v(C), different(B,C), line(A,B,D), line(A,C,E), empty(D), empty(E).

build(A) - x(B), line(A,B,C), empty(C).


%pentru rulare: ?- play.



