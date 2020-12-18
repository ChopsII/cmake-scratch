
# shuffle(<output variable> [<value>...]) shuffles the values, and
# stores the result in a list.
function(shuffle var)
  set(forever 1)
 
  # Receive ARGV1, ARGV2, ..., ARGV${last} as an array of values.
  math(EXPR last "${ARGC} - 1")
 
  # Shuffle the array with Knuth shuffle (Fisher-Yates shuffle).
  # from https://rosettacode.org/wiki/Knuth_shuffle#CMake
  foreach(i RANGE ${last} 1)
    # Roll j = a random number from 1 to i.
    math(EXPR min "100000000 % ${i}")
    while(forever)
      string(RANDOM LENGTH 8 ALPHABET 0123456789 j)
      if(NOT j LESS min)        # Prevent modulo bias when j < min.
        break()                 # Break loop when j >= min.
      endif()
    endwhile()
    math(EXPR j "${j} % ${i} + 1")
 
    # Swap ARGV${i} with ARGV${j}.
    set(t ${ARGV${i}})
    set(ARGV${i} ${ARGV${j}})
    set(ARGV${j} ${t})
  endforeach(i)
 
  # Convert array to list.
  set(answer)
  foreach(i RANGE 1 ${last})
    list(APPEND answer ${ARGV${i}})
  endforeach(i)
  set("${var}" ${answer} PARENT_SCOPE)
endfunction(shuffle)


macro(getTestName outvarname)
    get_filename_component(${outvarname} ${CMAKE_CURRENT_LIST_FILE} NAME_WE)
endmacro()

function(ASSERT_EQ actualVal expectedVal)
    
    if(NOT ${actualVal} STREQUAL ${expectedVal})
        message(SEND_ERROR "Assertion failed\n\texpected: '${expectedVal}'\n\tactual..: '${${actualVal}}'") #..for padding, space padding doesn't work
    endif()
endfunction()


function(ASSERT_LIST_EQ actualList_varName expectedList_varName)
    set(local_actualList ${${actualList_varName}})
    set(local_expectedList ${${expectedList_varName}})

    if(NOT "${${actualList_varName}}" STREQUAL "${${expectedList_varName}}")
        message(SEND_ERROR "STREQUAL assertion failed\n\texpected: '${${expectedList_varName}}'\n\tactual..: '${${actualList_varName}}'") #..for padding, space padding doesn't work
    endif()

    foreach(val ${local_expectedList})
        if(NOT val IN_LIST local_actualList)
            message(SEND_ERROR "Assertion failed: didn't find '${val}' in list '${${local_actualList}}'")
        # else()
        #     message(SEND_ERROR "win")
        endif()
    endforeach()
    
    foreach(val ${local_actualList})
        if(NOT val IN_LIST local_expectedList)
            message(SEND_ERROR "Assertion failed: didn't find '${val}' in list '${${local_expectedList}}'")
        # else()
        #     message(SEND_ERROR "win")
        endif()
    endforeach()
endfunction()