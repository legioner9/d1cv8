#!/bin/bash

path_file=${HOME}/PATH_TO_THAT_FILE
path_dir=$(dirname ${path_file})
name_dir_with_XXX="YYY_XXX"
analog="ANALOG"

if ! _is_yes "cr $1 like ${analog} in ${path_dir}"; then
    return 0
fi

if [[ -z "$1" ]]; then
    _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : EMPTY : '\$1' : hint=\$1 like ${analog} in ${path_dir} : return 1"
    return 1
fi

_sd2d XXX $1 ${path_dir}/${name_dir_with_XXX}