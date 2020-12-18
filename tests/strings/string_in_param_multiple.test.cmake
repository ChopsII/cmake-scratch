
getTestName(testName)

#pass multiple string variables to function (in param)
function (targetFn2 variableName1 variableName2)
    ASSERT_EQ(${variableName1} "${testName} value 1")
    ASSERT_EQ(${variableName2} "${testName} value 2")
endfunction()

function (test2)
    message("Running ${testName}")
    set(var1 "${testName} value 1")
    set(var2 "${testName} value 2")
    targetFn2(var1 var2)
endfunction()

test2()