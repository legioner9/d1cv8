#!/bin/bash

primum_rnd7_ac7f029() {

    # gig from ${ST_RC_D_PATH}/.d/.arb/stl0.arb/ufl_stl0.ram/.grot/ufl_stl0.sh

    local FNN=${FUNCNAME[0]}
    local ARGS=("$@")
    local NARGS=$#
    local PPWD=$PWD
    local path_file="${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/primum.sh"
    local path_dir="$(dirname "$path_file")"

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

    hint="\$1: (-name|-rb) \$2: name dir for creat"
    if _isn_from ${NARGS} 2 2 "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : ERR_AMOUNT_ARGS entered :'${NARGS}' args : ${hint} : return 1"; then
        return 1
    fi

    #! ptr_path
    # local ptr_path="$1"
    # ptr_path="$("${_abs_path}" "${PPWD}" "ptr_path")"
    #[[ptr_path]]

    #! START BODY FN ---------------------------------------

    if ! [ "-name" = "$1" ] || ! [ "-rb" = "$1" ]; then
        _st_exit "in fs= file:// , line=${LINENO}, ${FNN}() : : NOT_IN_CONDITION : '\$1' : ${hint} : return 1"
        return 1
    fi

    if [ "-name" = "$1" ]; then

        . ${path_dir}/gig_dir_from_XXX.sh $2 || {
            # hint="\$1: \$2: "
            _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : : EXEC_FAIL : '. ${path_dir}/gig_dir_from_XXX.sh $2' : ${hint} : return 1"
            return 1
        }

    elif [ "-rb" = "$1" ]; then

        . ${path_dir}/gig_dir_from_XXX.sh $2 || {
            # hint="\$1: \$2: "
            _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : : EXEC_FAIL : '. ${path_dir}/gig_dir_from_XXX.sh $2' : ${hint} : return 1"
            return 1
        }

    fi

    #! END BODY FN ---------------------------------------

}

primum_rnd7_ac7f029 $@
