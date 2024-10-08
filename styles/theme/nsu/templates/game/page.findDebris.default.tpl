{block name="title" prepend}{$LNG.lm_finddebris}{/block}
{block name="content"}
<link rel="stylesheet" type="text/css" href="{$dpath}css/statistics.css">
<div id="page">
    <div id="content">
        <div id="ally_content" class="conteiner">
            <div class="gray_stripo">{$LNG.lm_finddebris}
                <a class="tornaindietro" href="?page=findDebris&y=1">{$LNG.debris_show} ({$LNG.debris_range}: {$range})</a>
            </div>
            <div class="row" style="padding: 7px">
                <div class="col-md-12">
                    <div class="card valueTest2"> 
                        <div class="ally_img">
                            <table class="no_visible">
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="{$dpath}img/title/findDebris.jpg" alt="*">
                                            <span class="designation">
                                                <span>{$LNG.lm_finddebris}</span>
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>            
                    </div>
                </div>
            </div>
            <table class="tablesorter ally_ranks tabstatistica">
                {$debris}
            </table>
        </div>
    </div>
</div>
<script>
   function doit(missionID, planetID) {
   	$.getJSON("game.php?page=fleetAjax&ajax=1&mission="+missionID+"&planetID="+planetID, function(data)
   	{
   		$('#slots').text(data.slots);
   		if(typeof data.ships !== "undefined")
   		{
   			$.each(data.ships, function(elementID, value) {
   				$('#elementID'+elementID).text(number_format(value));
   			});
   		}
   		
   		var statustable	= $('#fleetstatusrow');
   		var messages	= statustable.find("~tr");

   		var element		= $('<td />').attr('colspan', 8).attr('class', data.code == 600 ? "success" : "error").text(data.mess).wrap('<tr />').parent();
   		statustable.removeAttr('style').after(element);
   	});
   }
</script>
{/block}