
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_background">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr valign="top"> 
          <td width="65%" class="table_heading"> 
            <center>
              <b>
              {translate}
              alert 
              {/translate}
              </b> 
            </center>
          </td>
        </tr>
        {* show discount details *}
        {if $invoice.discount_arr != '' && $invoice.discount_amt > 0}
        {/if}
        {* show checkout/payment plugin details *}
        {if $invoice.checkout_plugin_id != '0'}
        {assign var=sql1 value=" AND id='"}
        {assign var=sql2 value="' "}
        {assign var=sql3 value=$invoice.checkout_plugin_id}
        {assign var=sql  value=$sql1$sql3$sql2}
        {if $list->smarty_array("checkout", "checkout_plugin", $sql, "checkout") }
        {assign var=checkout_plugin value=$checkout[0].checkout_plugin}
        <!-- billing details -->
        {/if}
        {/if}
        <tr valign="top"> 
          <td width="65%" class="row1"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="5" class="body">
              <tr> 
                <td valign="top" width="67%"> 
                  <p><u><b>Please remit full payment for this purchase by bank 
                    wire to:</b></u> <b><br>
                    Bank Name: ------------------<br>
                    Bank Branch: --------------<br>
                    Bank Address: ------------------<br>
                    ABA Routing Number: ----------------<br>
                    For further Credit to: ---------------<br>
                    Bank of America Account Number: ----------------</b></p>
                  <p> <b>
                    {translate module=checkout}
                    remit_alert 
                    {/translate}
                    </b> </p>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table> 
<br>
<br>
{ $block->display("invoice:user_view") }
