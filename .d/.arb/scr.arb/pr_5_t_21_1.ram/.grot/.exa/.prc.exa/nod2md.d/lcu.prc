echo "in code.prc"

_lnv2e ${dir_cntx}/nod2md.d.cntx

local short_item=$(_s2se ${HOME} @ ${_item_})

echo -e "
<!-- file://${_item_} -->

[${name_ext}](${short_item})
" >> ${file_md}

echo -e "
{{lcu}}
" >> ${file_md}

_f2f ${_item_} "{{lcu}}" ${file_md}

_s2f "{{lcu}}" @ ${file_md}
