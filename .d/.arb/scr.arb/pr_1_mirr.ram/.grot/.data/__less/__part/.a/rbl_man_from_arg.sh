#!/bin/bash

echo -e "${CYAN}--- rbl_man_from_arg_rnd7_22fdf97() $* in file://${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/rbl_man_from_arg.sh---${NORMAL}" #started functions

rbl_man_from_arg_rnd7_22fdf97() {

    # gig from file://${ST_RC_D_PATH}/.d/.arb/stl0.arb/ufl_stl0.ram/.grot/ufl_stl0.sh

    local FNN=${FUNCNAME[0]}
    local ARGS=("$@")
    local NARGS=$#
    local PPWD=$PWD
    local path_file="${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/rbl_man_from_arg.sh"
    local path_dir="$(dirname "$path_file")"

    echo -e "${CYAN}--- $FNN() $* in file://${path_file}---${NORMAL}" #started functions

    cd ${path_dir} || {
        # hint="\$1: \$2: "
        _st_exit "in fs= file://$path_file , line=${LINENO}, ${FNN}() : NOT_DIR : 'file://${path_dir}' : ${hint} : return 1"
        return 1
    }

    if [ "-h" == "$1" ]; then
        echo -e "${CYAN} ${FNN}() help: 
MAIN: 
TAGS: @
ARGS: \$1
EXAM: 
EXEC: 
CNTL: 
    _go  : _edit ${path_file}
RETURN: ( result>stdout, return 0 | data | change to ptr |  fs_structure | ...)
ERROR: ( return 1 | ... )
    ${FNN} 
${NORMAL}"
    fi

    if [[ "_go" == "$1" ]]; then
        _edit "${path_file}"
        return 0
    fi

    # hint="\$1: \$2: "
    if _isn_from ${NARGS} less more "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : ERR_AMOUNT_ARGS entered :'${NARGS}' args : ${hint} : return 1"; then
        return 1
    fi

    #! ptr_path
    # local ptr_path="$1"
    # ptr_path="$("${_abs_path}" "${PPWD}" "ptr_path")"
    #[[ptr_path]]

    #! START BODY FN ---------------------------------------

    path_dir=$(dirname ${path_file})
    name_dir_with_XXX="XXX.a"
    analog="ANALOG"

    # IFS=' '

    echo -e "${HLIGHT}--- _dd2e ${path_dir} ---${NORMAL}" #start files
    _dd2e ${path_dir}
    # IFS=$' \t\n'
    arr_name_=($(_dd2e ${path_dir}))
    # _parr3e arr_name_
    IFS=$'\n'
    res_=
    _nr2mm arr_name_ arr_name_ res_ 0

    echo -e "${GREEN}\$res_ = $res_${NORMAL}" #print variable

    read -p "enter inserter to XXX : " inserter
    echo -e "${GREEN}\$inserter = $inserter${NORMAL}" #print variable

    name_dir_curr=${res_}
    #---------------------------------------
    # name_dir_curr=$(_s2se XXX $1 $name_dir_with_XXX)

    echo -e "${GREEN}\$name_dir_curr = $name_dir_curr${NORMAL}" #print variable

    if [[ -z "$inserter" ]]; then
        _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : EMPTY : '\$inserter' : hint=\$inserter like ${analog} in ${path_dir} : return 1"
        return 1
    fi

    cd ${path_dir} || {
        _st_exit "NOT_DIR : ${path_dir}"
        return 1
    }

    [ -d $name_dir_curr ] || {
        _st_exit "NOT_DIR ${path_dir}/$name_dir_curr"
        return 1
    }

    _is_yes "rebuild $path_dir/$name_dir_curr/$inserter.man" && {

        rm $path_dir/$name_dir_curr/$inserter.man

        cp $path_dir/$name_dir_curr/$inserter.man.tml $path_dir/$name_dir_curr/$inserter.man

        # _f2f insert.file '{\[reciver\]}' res
        # _f2f insert.file '{\[reciver\]}' res

        eval "_f2f $path_dir/$name_dir_curr/.sdbl/$inserter.sdbl '{\[$inserter.sdbl\]}' $path_dir/$name_dir_curr/$inserter.man"
        eval "_f2f $path_dir/$name_dir_curr/.bsl/$inserter.bsl '{\[$inserter.bsl\]}' $path_dir/$name_dir_curr/$inserter.man"
        eval "_f2f $path_dir/$name_dir_curr/.man/$inserter.man '{\[$inserter.man\]}' $path_dir/$name_dir_curr/$inserter.man"
        # eval "_f2f $path_dir/$1.a/.sdbl/$1.sdbl '{\[$1.sdbl\]}' $path_dir/$1.a/$1.man"

        echo -e "${HLIGHT}--- pdf2jpg_stl0 $path_dir/$name_dir_curr/.pic/$inserter.pdf ---${NORMAL}" #start files
        pdf2jpg_stl0 $path_dir/$name_dir_curr/.pic/$inserter.pdf
    }

    #! END BODY FN ---------------------------------------

}

rbl_man_from_arg_rnd7_22fdf97 $@
