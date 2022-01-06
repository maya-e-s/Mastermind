% Maya Stevenson    Mastermind - 4 spots 6 color choices      12/1/19
close all
clear all
clc

%% create set 'A' and 'B'
% set A contains all unused combinations. Every time a code is used as a guess, that code is eliminated from A
% set B contains all possible codes that may match the secret code created by the codemaker 
A = zeros(1296, 4); % all unused guesses
i=1;
    for j=1:6
        for k=1:6
            for m=1:6
                for n=1:6
                    A(i, :) = [j k m n];
                    i=i+1;
                end
            end
        end
    end
B = A; % possible codes left

%% start game
fprintf('Think of a 4 digit code containing the numbers 1-6, allowing repeats.\nThe computer will return a guess.\nEnter the number of red pegs (right color and right position)\n   and white pegs (right color wrong position).\nThe computer will guess your code in 5 guesses or less.\n\n')
tries = 1;
pegs = [0 0];

% until guess is correct, continue guessing
while (pegs(1) ~= 4) 
    [guess, A, B] = nextGuess(A, B);
    fprintf('Computer guessed: %1.0f %1.0f %1.0f %1.0f\n', guess);
    pegs = input('Return pegs [red, white]: ');
    [A, B] = elimination(pegs, guess, A, B);
    tries = tries+1;
end

% computer guessed code; print success
fprintf('\nYour code is %1.0f %1.0f %1.0f %1.0f\n', guess);
fprintf('Computer guessed it in %1.0f tries\n', tries-1);
