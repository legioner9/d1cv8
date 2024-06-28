#!/bin/bash

echo -e "${CYAN}--- source file://"${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/gig_dir_from_XXX.sh" $* ---${NORMAL}" #started functions


gig_dir_from_XXX_rnd7_1bfebd6() {

    # gig from ${ST_RC_D_PATH}/.d/.arb/stl0.arb/ufl_stl0.ram/.grot/ufl_stl0.sh

    local FNN=${FUNCNAME[0]}
    local ARGS=("$@")
    local NARGS=$#
    local PPWD=$PWD
    local path_file="${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/gig_dir_from_XXX.sh"
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
ARGS: \$1 - name dir
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

    hint="\$1: name gig dir"
    if _isn_from ${NARGS} 1 1 "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : ERR_AMOUNT_ARGS entered :'${NARGS}' args : ${hint} : return 1"; then
        return 1
    fi

    #! ptr_path
    # local ptr_path="$1"
    # ptr_path="$("${_abs_path}" "${PPWD}" "ptr_path")"
    #[[ptr_path]]

    #! START BODY FN ---------------------------------------

    name_dir_with_XXX="XXX.a"
    analog="ANALOG"

    name_dir_curr=$(_s2se XXX $1 $name_dir_with_XXX)

    echo -e "${GREEN}\$name_dir_curr = $name_dir_curr${NORMAL}" #print variable

    path_dir_cur=${path_dir}/${name_dir_curr}

    echo -e "${GREEN}\$path_dir_cur = $path_dir_cur${NORMAL}" #print variable

    [ -d ${path_dir_cur} ] && {
        if _is_yes "DIR_EXIST : path_dir_cur ${path_dir_cur} : DO? remove that?"; then
            rm -r ${path_dir_cur}
        else
            _st_info "return 0"
            return 0
        fi
    }

    # read
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

    #! END BODY FN ---------------------------------------

}

gig_dir_from_XXX_rnd7_1bfebd6 $@
