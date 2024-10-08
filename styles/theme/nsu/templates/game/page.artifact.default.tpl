{block name="title" prepend}{$LNG.lm_artifact}{/block}
{block name="script"}
<script type="text/javascript" src="./scripts/game/price.js?v=6"></script>
{/block}
{block name="content"}
<link rel="stylesheet" type="text/css" href="{$dpath}css/building.css">
<div id="page">
    <div id="content">
    {if !empty($artifactList)}
        <div id="ally_content" class="conteiner" style="width: 100%;">
            <div class="gray_stripe valueTest4">
                {$LNG.lm_artifact}               
            </div>
            {include file="main.res.tpl"}
            <div id="build_elements">
                {foreach $artifactList as $ID => $Element}
                <div id="ofic_{$ID}" class="build_box valueTest2">
                    <div class="head valueTest4">
                        {$LNG.tech.{$ID}}
                        {if $Element.timeLeft > 0}<span style="float:right; color:#CCC;">{$LNG.bd_active} <span id="time_{$ID}">-</span></span>{/if}
                    </div>
                    <div class="content_box">
                        <div class="image_mini valueTest2">
                            <img src="{$dpath}gebaeude/{$ID}.gif" alt="{$LNG.tech.{$ID}}">
                        </div>
                        <div class="prices_mini overflow-auto">
                            <font color="#096">{foreach $Element.elementBonus as $BonusName => $Bonus}{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{floatval($Bonus[0])}{/if} {$LNG.bonus.$BonusName}<br>{/foreach}</font>
                        </div>
                        <div class="clear"></div>
                        <form action="game.php?page=artifact" method="post" class="build_form">
                            <div class="price_build">
                                {foreach $Element.costResources as $RessID => $RessAmount}{$LNG.tech.{$RessID}}: 
                                <b><span id="price{$ID}" style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}">{$RessAmount|number}</span></b>
                                {/foreach}
                            </div>
                            <div class="btn_build_border">
                            {if $Element.buyable}
                                <form action="game.php?page=artifact" method="post" class="build_form">
                                    <input name="id" value="{$ID}" type="hidden">      
                                    <div class="btn_build_border btn_build_border_left dm_btn_build_border_left valueTest">
                                        <label class="max_btn_ship">{$LNG.bd_time_day}</label>
                                        <div class="div_text count_ships_dots">
                                            {foreach $Element.costResources as $RessID => $RessAmount}
                                            <input id="amount{$ID}" class="text" onchange="Price{$RessID}('{$ID}', {$RessAmount});" name="amount" max="{$Element.maxLevel}" min="1" value="1" type="number">
                                            {/foreach}
                                        </div>
                                    </div>
                                    <div class="btn_build_border btn_build_border_right dm_btn_build_border_right">
                                        <button class="btn_build valueTest2" type="submit">{$LNG.bd_buy}</button>  
                                    </div>                  
                                </form>
                            {else}
                                <span class="btn_build red valueTest6">{$LNG.bd_notres}</span>
                            {/if}
                            </div>
                        </form>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    {/if}
    </div>
</div>
{/block}