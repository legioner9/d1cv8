#!/bin/bash

echo -e "${BLUE}--- that file://${REPO_PATH}/${name_repo}/.d/.ham/main/main.fn.lst.d/file_size_check_jpg.sh ---${NORMAL}" #sistem info mesage
echo -e "${HLIGHT}--- file_size_check_jpg_arg_mb_proc__ham__d() 50k ---${NORMAL}" #start files

if ! file_size_check_jpg_arg_mb_proc__ham__d "50" ; then
    plt_info "in file://${REPO_PATH}/${name_repo}/.d/.ham/main/main.fn.lst.d/file_size_check_jpg.sh : FAIL_EXEC : file_size_check_jpg_arg_mb_proc__ham__d() : return 1"
    return 1
fi

return 0
 