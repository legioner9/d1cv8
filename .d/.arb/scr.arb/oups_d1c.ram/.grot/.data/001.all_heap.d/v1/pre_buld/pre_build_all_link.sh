#!/bin/bash

echo -e "${CYAN}--- pre_build_all_link_rnd7_eb272c3() $* in file://${REPO_PATH}/d1cv8/.d/.arb/scr.arb/oups_d1c.ram/.grot/.data/001.all_heap.d/v1/pre_buld/pre_build_all_link.sh ---${NORMAL}" #started functions

pre_build_all_link_rnd7_eb272c3() {

    # gig from file://${ST_RC_D_PATH}/.d/.arb/stl0.arb/ufl_stl0.ram/.grot/ufl_stl0.sh

    local FNN=${FUNCNAME[0]}
    local ARGS=("$@")
    local NARGS=$#
    local PPWD=$PWD
    local path_file="${REPO_PATH}/d1cv8/.d/.arb/scr.arb/oups_d1c.ram/.grot/.data/001.all_heap.d/v1/pre_buld/pre_build_all_link.sh"
    local path_dir="$(dirname "$path_file")"

    # echo -e "${CYAN}--- $FNN() $* in file://${path_file}---${NORMAL}" #started functions

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
    # if _isn_from ${NARGS} less more "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : ERR_AMOUNT_ARGS entered :'${NARGS}' args : ${hint} : return 1"; then
    #     return 1
    # fi

    # local _ARGS_=("$@")
    # _parr3e _ARGS_

    #{{ptr_path}}

    #! START BODY FN ---------------------------------------

    echo "START BODY FN : ${FNN}() $*"

    # cat ../001.lnk.d/all_heap.lnk.lst

    local item=
    local item_dir=
    local n_name=
    local ufl_9_file=

    cat ../001.anc.d/all_heap.anc.lst

    for item in $(_f2e ../001.anc.d/all_heap.anc.lst); do

        item_dir=$(_prs_f -d $item)

        n_name=$(_prs_f -n $item)
        echo -e "${GREEN}\$n_name = $n_name${NORMAL}" #print variable
        n_name=${n_name/000./}
        echo -e "${GREEN}\$n_name = $n_name${NORMAL}" #print variable
        n_name=$(_prs_f -n $n_name)
        echo -e "${GREEN}\$n_name = $n_name${NORMAL}" #print variable


        ufl_9_file=${item_dir}/${n_name}.man_ufl9
        echo -e "${GREEN}\$ufl_9_file = file://$ufl_9_file${NORMAL}" #print variable

        [ -f ${ufl_9_file} ] && {
            echo -e "${GREEN}\$ufl_9_file = $ufl_9_file${NORMAL}" #print variable
            . ${ufl_9_file}
        }
    done

    #{{body_fn}}

    #! END BODY FN ---------------------------------------

    cd $PPWD
    return 0

}

pre_build_all_link_rnd7_eb272c3 "$@"
