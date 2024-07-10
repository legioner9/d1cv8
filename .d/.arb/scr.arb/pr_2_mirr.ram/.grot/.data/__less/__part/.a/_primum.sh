#!/bin/bash

path_file=${REPO_PATH}/d1cv8/.d/.arb/scr.arb/pr_1_mirr.ram/.grot/.data/__less/__part/.a/primum.sh
# path_file=${REPO_PATH}/PATH_TO_THAT_FILE_FROM_REPO

echo -e "${GREEN}\$@ = $@${NORMAL}" #print variable

path_dir=$(dirname ${path_file})

hint="\$1: (-name|-rb) \$2: name dir for creat"



if [ "-name" = "$1" ] ; then

if [ -n "$2" ] ;then
. ${path_dir}/gig_dir_from_XXX.sh $2 
else 
_st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : NOT_DEFINE : '\$2 \$3'  : ${hint} : return 1"
fi

elif [ "-rb" = "$1" ]; then

. ${path_dir}/gig_dir_from_XXX.sh

elif [ -z "$1" ]; then
    _st_exit "in fs= file://${path_file} , line=${LINENO}, ${FNN}() : NOT_DEFINE : '\$1' : ${hint} : return 1"
    return 1
else

_st_exit "in fs= file:// , line=${LINENO}, ${FNN}() : : NOT_IN_CONDITION : 'ACCODING_HINT' : ${hint} : return 1"
return 1

fi
