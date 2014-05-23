{* Folder - Line view *}

<div class="well {$sequence} searchpage-newsbox">

    {if $node.data_map.image.has_content}
    <div>
        <a href={$node.url_alias|ezurl}>
            <img src="/{$node.data_map.image.content.main_node.data_map.image.content.[medium].full_path}" alt="Gå til mappen {$node.data_map.name.content|wash()}" class="img-rounded img-responsive pull-left">
        </a>
    </div>
    {/if}
    <div>
        <h2 class="{$sequence}">
            <a href={$node.url_alias|ezurl} class="{$sequence}" title="Gå til {$node.data_map.name.content|wash}">{$node.data_map.name.content|wash}</a>
        </h2>
        <p>{$node.object.published|l10n(date)} </p>
        {if $node.data_map.short_description.has_content}
            {attribute_view_gui attribute=$node.data_map.short_description}
        {/if}
        <p>
        <a href={$node.url|ezurl} class="{$sequence}" title="Gå til {$node.data_map.name.content|wash}"><i class="fa fa-file-text-o"></i> Les mer</a>
      </p>    
    </div>
    <div class="clearfix"></div>
</div>