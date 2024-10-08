﻿{block name="title" prepend}{$LNG.lm_buyfleet}{/block}
{block name="content"}
<link rel="stylesheet" type="text/css" href="{$dpath}css/byRes.css">
<div id="page">
    <div id="content">
        <div id="ally_content" class="conteiner">
            <div class="gray_stripe valueTest4" style="padding-right: 0;">
                <span>{$LNG.lm_buyfleet}</span>  
                {if isModuleAvailable($smarty.const.MODULE_SHIPYARD_FLEET)}
                <a href="game.php?page=shipyard&mode=fleet" class="right_flank button">{$LNG.lm_shipshard}</a>
                {/if}
            </div>
            <div class="row" style="padding: 7px">
                <form action="game.php?page=buyFleet" method="post">
                    <input type="hidden" name="mode" value="send">
                    <input type="hidden" id="Element" name="Element" value="">  
                    <div class="row">      
                        <div class="col-12">
                            <div class="buy_content valueTest2 m-2">
                                <div class="buy_sector buyfleet">        
                                    <div class="buy_id">
                                        <img class="buy_img" id="img" alt="" data-src="{$dpath}gebaeude/" src="{$dpath}gebaeude/undefined.gif"/>
                                    </div>
                                    <div id="count_calculator">
                                        <input class="buy_number" min="0" onchange="Total();" type="text" id="count" name="count" onkeyup="Total();">
                                    </div>
                                    <span class="buy_title" id="traderHead">{$LNG.lm_buyfleet}</span> 
                                    <span class="buy_cost">{$LNG.bd_the_cost} {$LNG.tech.$buy_instantly}: <span id="price" class="colore{$buy_instantly}"></span> 	</span> 
                                    <span class="buy_outcome">{$LNG.bd_total} {$LNG.tech.$buy_instantly}: <span id="total_price_count" class="colore{$buy_instantly}"></span></span>
                                    <span class="buy_quantity">{$LNG.bd_quantity_up} </span>	
                                    <input class="buy_res_btn" id="batn" type="submit" value="{$LNG.bd_buy}">
                                            <div class="clear"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row"> 
                        {foreach $Elements as $Element}
                        <div class="col-1">
                            <div class="card m-2"> 
                                <img class="valueTest2 opacity-70" onclick="updateVars({$Element})" src="{$dpath}gebaeude/{$Element}.gif" />
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </form>
            </div> 
        </div>         
    </div> 
</div>
{/block}
{block name="script" append}
<script type="text/javascript">
   var CostInfo = {$CostInfos|json};
</script>
{/block}