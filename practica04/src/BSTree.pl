
binTree(btnil).
binTree(btbranch(_, LChild, RChild)) :-
    binTree(LChild),
    binTree(RChild).


infoTree(btnil, 0, 0).
infoTree(btbranch(_, btnil, btnil), 0, 1).
infoTree(btbranch(_, LChild, RChild), InNodes, Leaves):-
    infoTree(LChild, InNodesL, LeavesL),
    infoTree(RChild, InNodesR, LeavesR),
    InNodes is InNodesR + InNodesL + 1,
    Leaves is LeavesL + LeavesR.


binSearchTree(L, Result):-
    reverse(L, Reversed),
    binSearchTreeReversed(Reversed, Result).    


preOrder(btnil, []).
preOrder(btbranch(R, LChild, RChild), [R | Nodes]):-
    preOrder(LChild, LChildNodes),
    preOrder(RChild, RChildNodes),
    append(LChildNodes, RChildNodes, Nodes).


inOrder(btnil, []).
inOrder(btbranch(R, LChild, RChild), Nodes):-
    inOrder(LChild, LChildNodes),
    inOrder(RChild, RChildNodes),
    append(LChildNodes, [R], LeftAndRoot),
    append(LeftAndRoot, RChildNodes, Nodes).

postOrder(btnil, []).
postOrder(btbranch(R, LChild, RChild), Nodes):-
    postOrder(LChild, LChildNodes),
    postOrder(RChild, RChildNodes),
    append(LChildNodes, RChildNodes, LeftAndRight),
    append(LeftAndRight, [R], Nodes).


binSearchTreeReversed([], btnil).
binSearchTreeReversed([R | Nodes], Result):-
    binSearchTreeReversed(Nodes, Old),
    addElem(R, Old, Result), !.


addElem(E, btnil, btbranch(E, btnil, btnil)).
addElem(E, btbranch(R, btnil, RChild), btbranch(R, btbranch(E, btnil, btnil), RChild)):-
    E @=< R.
addElem(E, btbranch(R, LChild, btnil), btbranch(R, LChild, btbranch(E, btnil, btnil))):-
    E @> R.
addElem(E, btbranch(R, OldL, RChild), btbranch(R, NewL, RChild)):-
    E @=< R,
    addElem(E, OldL, NewL).
addElem(E, btbranch(R, LChild, OldR), btbranch(R, LChild, NewR)):-
    E @> R,
    addElem(E, OldR, NewR).