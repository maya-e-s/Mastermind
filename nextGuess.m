function [guess, A, B] = nextGuess(A, B)
% function nextGuess: returns next guess computer should make by using the minimax technique (minimizes maximum loss)
% inputs: A - set containing all unused combinations. Every time a code is used as a guess, that code is eliminated from A
%         B - set containing all possible codes that may match the secret code created by the codemaker 
% outputs:guess - four numbers representing the next guess the computer should make
%         A - updated set A
%         B - updated set B
    
    [rA cA] = size(A); 
    [rB cB] = size(B);
    scores = zeros(14, rA); % number of codes that will not be eliminated for every element in A (codes remaining)
    % Every element in set A is compared to those remaining in B, and the number of codes that would remain in B given each combination of possible red and white return pegs is stored in a new set called ‘scores’
    for i=1:1:rA % for each unused guess (A)
        for j=1:1:rB % for each possible code left (B)
            rw = compareCodes(A(i, :), B(j, :)); 
                if (rw == [0 0]) 
                    scores(1, i) = scores(1, i) + 1;
                elseif (rw == [0 1])
                    scores(2, i) = scores(2, i) + 1;
                elseif (rw == [0 2])
                    scores(3, i) = scores(3, i) + 1;
                elseif (rw == [0 3])
                    scores(4, i) = scores(4, i) + 1;
                elseif (rw == [0 4])
                    scores(5, i) = scores(5, i) + 1;
                elseif (rw == [1 0])
                    scores(6, i) = scores(6, i) + 1;
                elseif (rw == [1 1])
                    scores(7, i) = scores(7, i) + 1;
                elseif (rw == [1 2])
                    scores(8, i) = scores(8, i) + 1;
                elseif (rw == [1 3])
                    scores(9, i) = scores(9, i) + 1;
                elseif (rw == [2 0])
                    scores(10, i) = scores(10, i) + 1;
                elseif (rw == [2 1])
                    scores(11, i) = scores(11, i) + 1;
                elseif (rw == [2 2])
                    scores(12, i) = scores(12, i) + 1;
                elseif (rw == [3 0])
                    scores(13, i) = scores(13, i) + 1;
                elseif (rw == [4 0])
                    scores(14, i) = scores(14, i) + 1;
                end
        end
    end

    % The maximum score out of each of the five scores for each element in A represents the worse case scenario, or having that amount of codes remain in B after that guess is played. 
    maxScores = zeros(1, rA); % max of each column of scores (worst case scenario)
    for i=1:1:rA
        maxScores(i) = max(scores(:, i));
    end

    % The minimum element in maxScores shows the minimum amount of codes that can remain in B following the worst case scenario
    miniMax = min(maxScores); % min of maxScores (best of worst case scenario)

    % Any element of A whose maxScore matches miniMax is added to a new set called ‘nextGuess’
    % If an element of nextGuess also exists in B, that guess is played. 
    % If none of the elements of nextGuess exist in B, then the first element in nextGuess is played
    nextGuess = zeros(1, 4); % possible next guesses
    j=1;
    for i=1:1:rA
        if (maxScores(i) == miniMax)
            nextGuess(j, 1) = A(i, 1);
            nextGuess(j, 2) = A(i, 2);
            nextGuess(j, 3) = A(i, 3);
            nextGuess(j, 4) = A(i, 4);
            j = j+1;
        end
    end
    [rNG cNG] = size(nextGuess);
    inB = ismember(nextGuess, B, 'rows');
    guess = [0 0 0 0]; % pick next guess
    for i=1:1:rNG 
        if (inB(i) == 1) % if an element of nextGuess also exists in B
            guess = nextGuess(i, :);
            break
        end
    end
    if (guess == [0 0 0 0]) % none of nextGuess exist in B
        guess = nextGuess(1, :);
    end
end
