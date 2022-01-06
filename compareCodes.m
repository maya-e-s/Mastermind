function [rw] = compareCodes(a, b)
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