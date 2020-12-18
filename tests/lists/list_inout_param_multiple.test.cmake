
getTestName(testName)


#pass multiple list variables by reference to function (in-out param) such that IN_LIST works in the function and in the calling function

function (targetFn variableName1 variableName2)
    
    set(expected1 "")
    list(APPEND expected1 "value1.1")
    list(APPEND expected1 "value1.2")
        
    set(expected2 "")
    list(APPEND expected2 "value2.1")
    list(APPEND expected2 "value2.2")
    
    ASSERT_LIST_EQ(${variableName1} expected1)
    ASSERT_LIST_EQ(${variableName2} expected2)

    list(APPEND ${variableName1} "value1.3")
    list(APPEND ${variableName2} "value2.3")

    set(${variableName1} ${${variableName1}} PARENT_SCOPE)
    set(${variableName2} ${${variableName2}} PARENT_SCOPE)

endfunction()

function (test)
    message("Running ${testName}")

    set(var1 "")
    list(APPEND var1 "value1.1")
    list(APPEND var1 "value1.2")

    set(var2 "")
    list(APPEND var2 "value2.1")
    list(APPEND var2 "value2.2")

    targetFn(var1 var2)

    set(expected1 "")
    list(APPEND expected1 "value1.1")
    list(APPEND expected1 "value1.2")
    list(APPEND expected1 "value1.3")

    set(expected2 "")
    list(APPEND expected2 "value2.1")
    list(APPEND expected2 "value2.2")
    list(APPEND expected2 "value2.3")

    ASSERT_LIST_EQ(var1 expected1)
    ASSERT_LIST_EQ(var2 expected2)

endfunction()

test()