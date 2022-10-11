function tests = cutPadSecondsTest
    tests = functiontests(localfunctions);
end

function desiredLongerTest(testCase)
    original_signal = [1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9];
    fs = 3;
    desired_length_seconds = 7;
    
    expected_signal = [1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 0 0 0];
    
    actual_signal = cutPadSeconds(original_signal, ...
                                  desired_length_seconds, ...
                                  fs);
    
    assert(isequal(expected_signal, actual_signal))
end

function desiredShorterTest(testCase)
    original_signal = [1; 2; 3; 4; 5; 6; 7; 8; 9; 1; 2; 3; 4; 5; 6];
    fs = 3;
    desired_length_seconds = 4;
    
    expected_signal = [1; 2; 3; 4; 5; 6; 7; 8; 9; 1; 2; 3];
    
    actual_signal = cutPadSeconds(original_signal, ...
                                  desired_length_seconds, ...
                                  fs);
    
    assert(isequal(expected_signal, actual_signal))
end