
getTestName(testName)

#return multiple string values from function (out param)
function (targetFn variableName1 variableName2)
    set(${variableName1} "${testName} return value1" PARENT_SCOPE)
    set(${variableName2} "${testName} return value2" PARENT_SCOPE)
endfunction()

function (test)
    message("Running ${testName}")

    targetFn(var1 var2)
    
    if(NOT var1 STREQUAL "${testName} return value1")
        message(SEND_ERROR "${testName} failed: got '${var1}'")
    endif()
    
    if(NOT var2 STREQUAL "${testName} return value2")
        message(SEND_ERROR "${testName} failed: got '${var2}'")
    endif()
endfunction()

test()