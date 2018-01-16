#!/usr/bin/bash

if [[ -z "$1" ]]; then
    echo "file not found"
    exit 1
fi

inputfile=$1
awk -F, '{
    a[$7]+=$2;
    b[$7]+=$6
}
END {
    print "eWalletID, TotalTransactionAmount, TotalTransactionType\n"
    for (i in a)
        {
            print i FS a[i] FS b[i]
        }
}' $inputfile
