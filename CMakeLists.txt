project ("CMake scratch")
cmake_minimum_required(VERSION 3.19)

include(utils.cmake)

file(GLOB_RECURSE tests
    tests/*.test.cmake
)


shuffle(tests ${tests})

foreach(test ${tests})
    include(${test})
endforeach()
