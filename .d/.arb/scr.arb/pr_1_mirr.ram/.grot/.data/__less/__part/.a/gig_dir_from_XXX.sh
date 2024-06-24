#!/bin/bash

path_file=${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/gig_dir_from_XXX.sh
# path_file=${REPO_PATH}/PATH_TO_THAT_FILE_FROM_REPO

path_dir=$(dirname ${path_file})
name_dir_with_XXX="XXX.a"
analog="ANALOG"

if ! _is_yes "cr $1 like ${analog} in ${path_dir}"; then
    return 0
fi

if [[ -z "$1" ]]; then
    _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : EMPTY : '\$1' : hint=\$1 like ${analog} in ${path_dir} : return 1"
    return 1
fi

_sd2d XXX $1 ${path_dir}/${name_dir_with_XXX} || {
    # hint="\$1: \$2: "
    _st_exit "in fs= file:// , line=${LINENO}, ${FNN}() : : EXEC_FAIL : '_sd2d XXX $1 ${path_dir}/${name_dir_with_XXX}' : ${hint} : return 1"
    return 1

}

# cd ${path_dir} || {
#     _st_exit "NOT_DIR : ${path_dir}"
#     return 1
# }

# _f2f insert.file '{\[reciver\]}' res
# _is_yes "rebuild $path_dir/$1.a/$1.man" && {
#     eval "_f2f $path_dir/$1.a/.sdbl/$1.sdbl '{\[$1\]}' $path_dir/$1.a/$1.man.tml"
# }
