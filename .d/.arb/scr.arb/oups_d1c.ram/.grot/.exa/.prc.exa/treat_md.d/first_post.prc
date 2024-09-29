echo "in first_post.prc"

_lnv2e ${dir_cntx}/nod2md.d.cntx

echo -e "
[[__TOC_]]

<a name="top"></a>
<a class="top-link hide" href="#top">↑</a>

<!-- TOC tocDepth:2..3 chapterDepth:2..6 -->

<!-- /TOC -->

End Contents Menu

<!--
CMND: ufl_stl0 4 ${_ARGS_[1]} ${_ARGS_[2]}

PPWD: ${PPWD}

FLOW: ${dir_set}

DATE: $(_date)

DATX: $(date +%s)
-->
" >> ${file_md}



ufl_stl0 1 ${file_md}_ufl4

echo -e "
ufl_stl0 4 ${_ARGS_[1]} ${_ARGS_[2]}
" > ${file_md}_ufl4.tmp

echo -e "${HLIGHT}--- _f2f file://${file_md}_ufl4.tmp {{body_fn}} file://${file_md}_ufl4 ---${NORMAL}" #start files
_f2f ${file_md}_ufl4.tmp {{body_fn}} ${file_md}_ufl4

# path2nom_stl0 ${file_md}.ufl4

rm ${file_md}_ufl4.tmp

path2nom_stl0 ${file_md}_ufl4

