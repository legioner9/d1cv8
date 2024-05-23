function addnumber(id, number)
{
	var obj = document.getElementById(id);
	if ( obj.value == ''){
		obj.value = obj.value + '(' + number + ') ';	
	}
	else{
		obj.value = obj.value + ' (' + number + ') ';	
	}
}

function selectreplace(_tag_start, _tag_end, _obj_name)
{
    var area = document.getElementsByName(_obj_name).item(0);	
	area.focus();
	if (document.getSelection)
	{
		area.value = area.value.substring(0, area.selectionStart) + 
					_tag_start + area.value.substring(area.selectionStart, area.selectionEnd) + 
					_tag_end + area.value.substring(area.selectionEnd, area.value.length);
	}
	else
	{
		document.selection.createRange().text = _tag_start + document.selection.createRange().text + _tag_end;	
	}
}

function addlinc(_obj_name)
{
	var url = prompt('Введите URL ссылки');
	url = unescape(url);
	selectreplace('<a href="' + url + '">', '</a>', _obj_name);	
}

function addimg(_obj_name)
{
	var src = prompt('Введите src картинки');
	src = unescape(src);
	selectreplace('<img src="' + src + '"/>', '', _obj_name);	
}

function add1c(_obj_name)
{
	selectreplace('<1ccode>', '</1ccode>', _obj_name);	
}

function addtab(_obj_name)
{
	selectreplace('	', '', _obj_name);	
}

function addtable(_obj_name)
{
	var table = '\r\n<table>' + 
				'\r\n	<tr>' +
				'\r\n		<th></th>' +
				'\r\n		<th></th>' +
				'\r\n	</tr>' +
				'\r\n	<tr>' +
				'\r\n		<td></td>' +
				'\r\n		<td></td>' +
				'\r\n	</tr>' +
				'\r\n</table>';
	
	selectreplace(table, '', _obj_name);	
}

function addb(_obj_name)
{
	selectreplace('<b>', '</b>', _obj_name);	
}

function addi(_obj_name)
{
	selectreplace('<i>', '</i>', _obj_name);	
}

function addh3(_obj_name)
{
	selectreplace('<h3>', '</h3>', _obj_name);	
}

function addh4(_obj_name)
{
	selectreplace('<h4>', '</h4>', _obj_name);	
}