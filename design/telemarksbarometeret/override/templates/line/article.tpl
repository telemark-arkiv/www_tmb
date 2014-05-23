{* Article - Line view *}

<div class="well {$sequence} searchpage-newsbox">
    
    {if $node.data_map.image.has_content}
    <div>
        <a href={$node.url_alias|ezurl}>
            <img src="/{$node.data_map.image.content.main_node.data_map.image.content.[medium].full_path}" alt="Les artikkelen: {$node.data_map.title.content|wash()}" class="img-rounded img-responsive pull-left">
        </a>
    </div>
    {elseif $node.data_map.image_old.has_content}
    <div>
        <a href={$node.url_alias|ezurl}>
            <img src="/{$node.data_map.image_old.content.[medium].full_path}" alt="Les artikkelen: {$node.data_map.title.content|wash()}" class="img-rounded img-responsive pull-left">
        </a>
    </div>
    {/if}
    <div>
        <h2 class="{$sequence}">
            <a href={$node.url_alias|ezurl} class="{$sequence}">{$node.data_map.title.content|wash}</a>
        </h2>
        <p>{$node.object.published|l10n(date)} </p>
        {if $node.data_map.short_intro.content}
            <p>{attribute_view_gui attribute=$node.data_map.short_intro}</p>
        {else}
            {def $xml_content=$node.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
        
        <p>
        <a href={$node.url|ezurl} class="{$sequence}"><i class="fa fa-file-text-o"></i> Les mer</a>
      </p>    
    </div>
    <div class="clearfix"></div>
</div>