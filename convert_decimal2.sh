#!/bin/bash

# conversion tables for hexadecimal and binary
declare -A HEX_TABLE=(
    [0]=0 [1]=1 [2]=2 [3]=3 [4]=4 [5]=5 [6]=6 [7]=7
    [8]=8 [9]=9 [10]=A [11]=B [12]=C [13]=D [14]=E [15]=F
)

# convert decimal to binary
decimal_to_binary() {
    local decimal=$1
    local binary=""
    while [ $decimal -gt 0 ]; do
        binary=$((decimal % 2))$binary
        decimal=$((decimal / 2))
    done
    
    printf "%08d\n" "${binary:-0}"
}

# convert decimal to hexadecimal
decimal_to_hexadecimal() {
    local decimal=$1
    local hex=""
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        hex="${HEX_TABLE[$remainder]}$hex"
        decimal=$((decimal / 16))
    done
    
    printf "%02s\n" "${hex:-0}"
}


if [ $# -ne 1 ]; then
    echo "Usage: $0 <decimal_number>"
    exit 1
fi

decimal=$1

#decimal number smaller than 100000
if ! [[ $decimal =~ ^[0-9]+$ ]]; then
    echo "Error: Input must be a positive decimal number."
    exit 1
elif [ $decimal -ge 100000 ]; then
    echo "Error: Decimal number must be smaller than 100000."
    exit 1
fi

#conversions
binary_result=$(decimal_to_binary $decimal)
hex_result=$(decimal_to_hexadecimal $decimal)

# Save results to a .txt file
output_file="/Problem 3/convertion_result.txt"
mkdir -p "/Problem 3"
echo "Decimal: $decimal" > "$output_file"
echo "Binary: $binary_result" >> "$output_file"
echo "Hexadecimal: $hex_result" >> "$output_file"

# print results 
cat "$output_file"

exit 0

