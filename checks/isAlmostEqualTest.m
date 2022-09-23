function tests = isAlmostEqualTest
    tests = functiontests(localfunctions);
end

function notEqualTest(testCase)
    array_1 = [0 1 2];
    array_2 = [0 1 2.1];
    tolerance = 0.01;
    
    actual = isAlmostEqual(array_1, array_2, tolerance);
    expected = 0;
    
    assert(isequal(actual, expected))
    
    actual = isAlmostEqual(array_2, array_1, tolerance);
    expected = 0;
    
    assert(isequal(actual, expected))
end

function equalTest(testCase)
    array_1 = [0 1 2];
    array_2 = [0 1 2.00001];
    tolerance = 0.01;
    
    actual = isAlmostEqual(array_1, array_2, tolerance);
    expected = 1;
    
    assert(isequal(actual, expected))
    
    actual = isAlmostEqual(array_2, array_1, tolerance);
    expected = 1;
    
    assert(isequal(actual, expected))
end

function boundaryTest(testCase)
    array_1 = [0 1 2];
    array_2 = [0 1 2.00001];
    tolerance = 0.00001;
    
    actual = isAlmostEqual(array_1, array_2, tolerance);
    expected = 0;
    
    assert(isequal(actual, expected))
    
    actual = isAlmostEqual(array_2, array_1, tolerance);
    expected = 0;
    
    assert(isequal(actual, expected))
end