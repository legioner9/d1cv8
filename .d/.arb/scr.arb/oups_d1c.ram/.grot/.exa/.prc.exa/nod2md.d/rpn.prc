echo "in rpn.prc"

_lnv2e ${dir_cntx}/nod2md.d.cntx

local short_item=$(_s2se ${HOME} @ ${_item_})

echo -e "
<!-- file://${_item_} -->

[${name_ext}](${short_item})
" >> ${file_md}