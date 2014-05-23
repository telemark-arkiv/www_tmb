{* Statistic container - Line view *}

<div class="well {$sequence} searchpage-newsbox">
    <div>
        <h2 class="{$sequence}">
            <a href={$node.url_alias|ezurl} class="{$sequence}">{$node.data_map.title.content|wash}</a>
        </h2>
        <p>{$node.object.published|l10n(date)} </p>
        {if $node.data_map.ingress.has_content}
            {attribute_view_gui attribute=$node.data_map.ingress}
        {/if}
        <p>
        <a href={$node.url|ezurl} class="{$sequence}"><i class="fa fa-bar-chart-o"> Se statistikk</i></a>
      </p>    
    </div>
    <div class="clearfix"></div>
</div>