#!/bin/bash

arg=$1
if [[ -n "$arg" ]] && [ "$1" == "-p" ]; then

	arg2=$2
	if [[ -n "$arg2" ]] && [ "$2" == "cti" ] || [ "$2" == "test1" ] || [ "$2" == "test2" ]; then
		router -p $2 A &
		router -p $2 B &
		router -p $2 C &
		router -p $2 D &
		router -p $2 E &
		if [ "$2" == "test2" ]; then
			router -p $2 F &
			router -p $2 G &
			router -p $2 H &
		fi
	else
		echo "error: please specify valid folder: run.sh [-p] <foldername> where foldername has to be cti, test1, or test2"
	fi

elif [[ -n "$arg" ]] && [ "$1" == "cti" ] || [ "$1" == "test1" ] || [ "$1" == "test2" ]; then
	router $1 A &
	router $1 B &
	router $1 C &
	router $1 D &
	router $1 E &
	if [ "$1" == "test2" ]; then
		router $1 F &
		router $1 G &
		router $1 H &
	fi
else
	echo "error: please specify valid folder: run.sh [-p] <foldername> where foldername has to be cti, test1, or test2"
fi
