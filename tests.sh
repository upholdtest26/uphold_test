#!/bin/bash

expect_success () {
    result=$(echo "$1" | ./string_padder) 
    if [[ "$2" != $result ]]; then  
        echo "FAILED with input=[$1] result=[$result] expect_success=[$2]"
        exit 1
    fi
}

expect_fail () {
    result=$(echo "$1" | ./string_padder) 
    ret=$?
    if [[ $ret == 0 ]]; then  
        echo "should have FAILED with input=[$1] result=[$result]"
        exit 1
    fi
}

c++ ./string_padder.cpp -o ./string_padder 

expect_success '"3",3' '"003"' 
expect_success '"3",1' '"3"'
expect_success '"",3' '""' 
expect_success '"James Bond 7",3' '"James Bond 007"'
expect_success '"PI=3.14",2' '"PI=03.14"'
expect_success "\"It's 3:13pm\",2" "\"It's 03:13pm\""
expect_success '"99UR1337", 6"' '"000099UR001337"'
expect_success '"3asd1111111",4"' '"0003asd1111111"' 
expect_success '"3asd1111111",1' '"3asd1111111"' 
expect_success '"+3asd1+",2' '"+03asd01+"' 
expect_success '"+3asd1",2' '"+03asd01"' 
expect_success '"+3asd1",0' '"+3asd1"' 

expect_fail '"",a3' 
expect_fail ',3' 
expect_fail '"sdf"' 
expect_fail '",3' 
expect_fail ',-3'
expect_fail '"",' 

echo "ALL TESTS PASSED"
