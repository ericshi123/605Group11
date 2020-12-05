#!/bin/bash

merged_data='taxi.csv'

i=0
for filename in './*.csv';do
	if['$filename' != 'merged_data' ];then	
		if [[ $i -eq 0]];then
			head -1 '$filename' > '$merged_data'
		fi
		tail -n +2
		i=$(($i+1))
	fi
done 	
	
