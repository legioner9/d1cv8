#!/bin/bash

path_file=${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/rbl_man_from_arg.sh
# path_file=${REPO_PATH}/PATH_TO_THAT_FILE_FROM_REPO

path_dir=$(dirname ${path_file})
# name_dir_with_XXX="XXX.a"
analog="ANALOG"

# if ! _is_yes "cr $1 like ${analog} in ${path_dir}"; then
#     return 0
# fi

# if [[ -z "$1" ]]; then
#     _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : EMPTY : '\$1' : hint=\$1 like ${analog} in ${path_dir} : return 1"
#     return 1
# fi

# _sd2d XXX $1 ${path_dir}/${name_dir_with_XXX}

if [[ -z "$1" ]]; then
    _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : EMPTY : '\$1' : hint=\$1 like ${analog} in ${path_dir} : return 1"
    return 1
fi

cd ${path_dir} || {
    _st_exit "NOT_DIR : ${path_dir}"
    return 1
}

[ -d $1.a ] || {
    _st_exit "NOT_DIR $1${path_dir}/$1"
    return 1
}

_is_yes "rebuild $path_dir/$1.a/$1.man" && {

    rm $path_dir/$1.a/$1.man

    cp $path_dir/$1.a/$1.man.tml $path_dir/$1.a/$1.man

    # _f2f insert.file '{\[reciver\]}' res
    # _f2f insert.file '{\[reciver\]}' res

    eval "_f2f $path_dir/$1.a/.sdbl/$1.sdbl '{\[$1.sdbl\]}' $path_dir/$1.a/$1.man"
    eval "_f2f $path_dir/$1.a/.bsl/$1.bsl '{\[$1.bsl\]}' $path_dir/$1.a/$1.man"
    eval "_f2f $path_dir/$1.a/.man/$1.man '{\[$1.man\]}' $path_dir/$1.a/$1.man"
    # eval "_f2f $path_dir/$1.a/.sdbl/$1.sdbl '{\[$1.sdbl\]}' $path_dir/$1.a/$1.man"

    echo -e "${HLIGHT}--- pdf2jpg_stl0 $path_dir/$1.a/.pic/$1.pdf ---${NORMAL}" #start files
    pdf2jpg_stl0 $path_dir/$1.a/.pic/$1.pdf
}
