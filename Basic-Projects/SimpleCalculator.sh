#!/bin/bash

echo "This is an Interactive Calculator, Keep Entering Numbers and the Operation, Press x to Stop"
result=0

while [[ true ]]; do
	read -p "Enter the Number, Press x to Stop: " num
	if [[ "$num" == "x" ]]; then
		break
	fi

	if ! [[ "$num" =~ ^[-+]?[0-9]+$ ]]; then
		echo "Please Enter a Valid Number"
		continue
	fi

	read -p "Enter The Operator, [+, -, *, /, %]" op

	case "$op" in
		+)
			result=$(( result + num ))
			;;
		-)
			result=$(( result - num ))
			;;
		*)
			result=$(( result * num ))
			;;
		/)
			if (( num == 0 )); then
				echo "Division By Zero"
				continue
			fi
			result=$(( result / num ))
			;;
		%)
			if (( num == 0 )); then
				echo "Division By Zero"
				continue
			fi
			result=$(( result % num ))
			;;
		*)
			echo "Enter a Valid Operator"
			continue
			;;
	esac
	echo "Current Result: $result"
done
echo "Final Result: $result"

