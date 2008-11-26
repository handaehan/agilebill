{ $method->exe("country","view") } { if ($method->result == FALSE) } { $block->display("core:method_error") } {else} 

{literal}
	<script src="themes/{/literal}{$THEME_NAME}{literal}/view.js"></script>
    <script language="JavaScript"> 
        var module 		= 'country';
    	var locations 	= '{/literal}{$VAR.module_id}{literal}';		
		var id 			= '{/literal}{$VAR.id}{literal}';
		var ids 		= '{/literal}{$VAR.ids}{literal}';    	 
		var array_id    = id.split(",");
		var array_ids   = ids.split(",");		
		var num=0;
		if(array_id.length > 2) {				 
			document.location = '?_page='+module+':view&id='+array_id[0]+'&ids='+id;				 		
		}else if (array_ids.length > 2) {
			document.write(view_nav_top(array_ids,id,ids));
		}
		
    	function delete_record(id,ids)
    	{				
    		temp = window.confirm("{/literal}{translate}alert_delete{/translate}{literal}");
    		if(temp == false) return;
    		
    		var replace_id = id + ",";
    		ids = ids.replace(replace_id, '');		
    		if(ids == '') {
    			var url = '?_page=core:search&module=' + module + '&do[]=' + module + ':delete&delete_id=' + id + COOKIE_URL;
    			window.location = url;
    			return;
    		} else {
    			var page = 'view&id=' +ids;
    		}		
    		
    		var doit = 'delete';
    		var url = '?_page='+ module +':'+ page +'&do[]=' + module + ':' + doit + '&delete_id=' + id + COOKIE_URL;
    		window.location = url;	
    	}
    //  END -->
    </script>
{/literal}

<!-- Loop through each record -->
{foreach from=$country item=country} <a name="{$country.id}"></a>

<!-- Display the field validation -->
{if $form_validation}
   { $block->display("core:alert_fields") }
{/if}

<!-- Display each record -->
<form name="update_form" method="post" action="">
  
  <table width=100% border="0" cellspacing="0" cellpadding="0" class="table_background">
    <tr> 
      <td> 
        <table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr valign="top"> 
            <td width="65%" class="table_heading"> 
              <div align="center"> 
                {translate module=country}
                title_view
                {/translate}
              </div>
            </td>
          </tr>
          <tr valign="top"> 
            <td width="65%" class="row1">
              <table width="100%" border="0" cellspacing="3" cellpadding="1" class="row1">
                <tr class="row0" valign="top"> 
                  <td width="35%"> 
                    {translate module=country}
                    field_name 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="country_name"  value="{$country.name}" size="32">
                  </td>
                </tr>
                <tr class="row1" valign="top"> 
                  <td width="35%"> 
                    {translate module=country}
                    field_two_code 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="country_two_code"  value="{$country.two_code}" size="32">
                  </td>
                </tr>
                <tr class="row3" valign="top"> 
                  <td width="35%"> 
                    {translate module=country}
                    field_three_code 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <input type="text" name="country_three_code"  value="{$country.three_code}" size="32">
                  </td>
                </tr>
                <tr class="row1" valign="top"> 
                  <td width="35%"> 
                    {translate module=country}
                    field_description 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <textarea name="country_description" cols="45" rows="5" >{$country.description}</textarea>
                  </td>
                </tr>
                <tr class="row4" valign="top"> 
                  <td width="35%"> 
                    {translate module=country}
                    field_notes 
                    {/translate}
                  </td>
                  <td width="65%"> 
                    <textarea name="country_notes" cols="45" rows="5" >{$country.notes}</textarea>
                  </td>
                </tr>
                <tr class="row1" valign="middle" align="left"> 
                  <td width="35%"></td>
                  <td width="65%"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td> 
                          <input type="submit" name="Submit" value="{translate}submit{/translate}" class="form_button">
                        </td>
                        <td align="right"> 
                          <input type="button" name="delete" value="{translate}delete{/translate}" class="form_button" onClick="delete_record('{$country.id}','{$VAR.id}');">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <input type="hidden" name="_page" value="country:view">
    <input type="hidden" name="country_id" value="{$country.id}">
    <input type="hidden" name="do[]" value="country:update">
    <input type="hidden" name="id" value="{$VAR.id}">
  </form>
  {/foreach}    
{/if}
