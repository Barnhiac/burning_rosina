[{block name="widget_locator_paging"}]
[{if $pages->changePage}]
    <div class="pager [{if $place eq "bottom"}] lineBox[{/if}]" id="itemsPager[{$place}]">
    [{if $pages->previousPage }]
        <a class="prev" rel="prev" href="[{$pages->previousPage}]">[{* [{oxmultilang ident="PREVIOUS"}] *}]&#10096;&#10096;</a>
    [{/if}]
        [{assign var="i" value=1}]
        [{foreach key=iPage from=$pages->changePage item=page}]
            [{if $iPage == $i }]
               <a href="[{$page->url}]" class="page[{if $iPage == $pages->actPage }] active[{/if}]">[{$iPage}]</a>
               [{assign var="i" value=$i+1}]
            [{elseif $iPage > $i }]
               ...
               <a href="[{$page->url}]" class="page[{if $iPage == $pages->actPage }] active[{/if}]">[{$iPage}]</a>
               [{assign var="i" value=$iPage+1}]
            [{elseif $iPage < $i }]
               <a href="[{$page->url}]" class="page[{if $iPage == $pages->actPage }] active[{/if}]">[{$iPage}]</a>
               ...
               [{assign var="i" value=$iPage+1}]
            [{/if}]
        [{/foreach}]
    [{if $pages->nextPage }]
        <a class="next" rel="next" href="[{$pages->nextPage}]">[{* [{oxmultilang ident="NEXT"}] *}]&#10097;&#10097;</a>
    [{/if}]
     </div>

     
        
          
        
      
[{/if}]
[{/block}]