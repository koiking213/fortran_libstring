#!/bin/bash 
FC=gfortran

# copy libraries
cp libstring.mod libstring.o test
cd test

# results are saved
mkdir result 2>/dev/null

# check all tests
OK=0
NG=0
for line in `cat list`
do
    TP=`echo ${line} | cut -d' ' -f1`
    # compilation
    ${FC} libstring.o ${line}
    if [ $? -eq 1 ]; then
	echo ${TP} : compilation failed
	((NG++))
	continue
    fi
    # execution
    ./a.out >result/${TP}.res
    diff result/${TP}.res <(echo pass) -w
    if [ $? -eq 1 ]; then
	echo ${TP} : execution failed
	((NG++))
    else
	echo ${TP} : passed
	((OK++))
    fi
done

# print result
echo ---- resutl ----
echo OK:${OK}
echo NG:${NG}
