
getTestName(testName)

#pass multiple string variables by reference to function (in-out param)
function (targetFn variable1Name variable2Name)

    if(NOT ${variable1Name} STREQUAL "${testName} value1")
        message(SEND_ERROR "${testName} failed: got '${variable1Name}'")
    endif()
    set(${variable1Name} "${testName} return value1" PARENT_SCOPE)
    
    if(NOT ${variable2Name} STREQUAL "${testName} value2")
        message(SEND_ERROR "${testName} failed: got '${variable2Name}'")
    endif()

    set(${variable2Name} "${testName} return value2" PARENT_SCOPE)
endfunction()

function (test)
    message("Running ${testName}")
    set(var1 "${testName} value1")
    set(var2 "${testName} value2")
    targetFn(var1 var2)
    
    if(NOT var1 STREQUAL "${testName} return value1")
        message(SEND_ERROR "${testName} failed: got '${var1}'")
    endif()
    
    if(NOT var2 STREQUAL "${testName} return value2")
        message(SEND_ERROR "${testName} failed: got '${var2}'")
    endif()
endfunction()

test()