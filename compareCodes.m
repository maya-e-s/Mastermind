function [rw] = compareCodes(a, b)
% function compareCodes: compares sets A and B using the the number of red and white pegs that would be returned if the codebreaker guessed code ‘b’ while the secret code was code ‘a’ 
% inputs: a - a four number code representing the possible secret code
%         b - a four number code representing a potentional codebreaker guess
% output:rw - set containing [red, white] peg combo corresponing with guesses 'a' and 'b'
    
    rw = [0 0]; % default

    % check red pegs
    for i=1:1:4
        if (a(i) == b(i))
            rw(1) = rw(1)+1;
            a(i)=0; % avoid counting twice
            b(i)=7; % avoid counting twice
        end
    end

    % check white pegs
    for i=1:1:4
        for j=1:1:4
            if(a(i) == b(j))
                rw(2)= rw(2)+1;
                a(i)=0; % avoid counting twice
                b(j)=7; % avoid counting twice
            end
        end
    end
end
