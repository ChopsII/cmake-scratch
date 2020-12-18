
#pass multiple list variables that came from one function into a second function, such that IN_LIST works in the second function

function (targetFunction1 variableName1 variableName2)

    list(APPEND ${variableName1} "value1.1")
    list(APPEND ${variableName1} "value1.2")

    list(APPEND ${variableName2} "value2.1")
    list(APPEND ${variableName2} "value2.2")

    set(${variableName1} ${${variableName1}} PARENT_SCOPE)
    set(${variableName2} ${${variableName2}} PARENT_SCOPE)

endfunction()

function (targetFunction2 variableName1 variableName2)

    set(exp1 "")
    list(APPEND exp1 "value1.1")
    list(APPEND exp1 "value1.2")
    
    set(exp2 "")
    list(APPEND exp2 "value2.1")
    list(APPEND exp2 "value2.2")

    ASSERT_LIST_EQ(exp1 ${variableName1})

    ASSERT_LIST_EQ(exp2 ${variableName2})

endfunction()

function (test)
    message("Running ${testName}")

    set(var1 "")
    set(var2 "")

    targetFunction1(var1 var2)

    set(expected1 "")
    list(APPEND expected1 "value1.1")
    list(APPEND expected1 "value1.2")

    set(expected2 "")
    list(APPEND expected2 "value2.1")
    list(APPEND expected2 "value2.2")

    ASSERT_LIST_EQ(var1 expected1)
    ASSERT_LIST_EQ(var2 expected2)

    
    targetFunction2(var1 var2)

endfunction (test)

test()