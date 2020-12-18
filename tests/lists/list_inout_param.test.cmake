
getTestName(testName)


#pass list variable by reference to function (in-out param) such that IN_LIST works in the function and in the calling function

function (targetFn variableName)
    
    set(expected "")
    list(APPEND expected "value1")
    list(APPEND expected "value2")
    
    ASSERT_LIST_EQ(${variableName} expected)

    list(APPEND ${variableName} "value3")

    set(${variableName} ${${variableName}} PARENT_SCOPE)

endfunction()

function (test)
    message("Running ${testName}")

    set(var "")
    list(APPEND var "value1")
    list(APPEND var "value2")

    targetFn(var)

    set(expected "")
    list(APPEND expected "value1")
    list(APPEND expected "value2")
    list(APPEND expected "value3")

    ASSERT_LIST_EQ(var expected)

endfunction()

test()