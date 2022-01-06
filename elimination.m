function [A, B] = elimination(pegs, guess, A, B)
% function elimination: takes the returned pegs and eliminates impossible combinations 
% inputs: pegs - the [red, white] pegs returned by player
%         guess - the computers current guess
%         A - matrix holding unused guesses
%         B - matrix holding possible codes left
% outputs:A - matrix holding unused guesses
%         B - matrix holding possible codes left

    % remove guess from A
    [rA cA] = size(A);
    for i=1:1:rA % for every element in A
        if (A(i, :) == guess(1, :))
            A(i, :) = [];
            rA = rA-1;
            break
        end
    end

    % create new B
    [rB cB] = size(B);
    j=1;
    for i=1:1:rB
        rw = compareCodes(guess, B(i, :));
        if (rw == pegs)
            newB(j, 1) = B(i, 1);
            newB(j, 2) = B(i, 2);
            newB(j, 3) = B(i, 3);
            newB(j, 4) = B(i, 4);
            j = j+1;
        end
    end
    if (exist('newB', 'var')==0) % one of the red/white pegs returned by the player was incorrect, and the correct code has been eliminated
        disp('The pegs you returned are invalid. Please check each of your responses and try again.\n')
        error('The pegs you returned are invalid. Please check each of your responses and try again.\n')
    end
    B = newB;
end