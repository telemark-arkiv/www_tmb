<div class="image-main">
    <img src="/{$object.data_map.image.content.[article_full].full_path}" alt="{$object.data_map.image.content.alternative_text|wash(xhtml)}" class="img-rounded img-responsive" />

    <div class="image-caption">
        <a href="/{$object.data_map.image.content.[article_full].full_path}" target="_blank"><i class="fa fa-search-plus pull-right"></i></a>
        {if $object.data_map.name.content}
            <strong>{$object.data_map.name.content}</strong>
        {/if}
        {if $object.data_map.image.foto_byline.content}
            <br /><em>FOTO: {$object.data_map.image.foto_byline.content}</em>
        {/if}
    </div>
</div>

{*
{def $image_variation="false"
     $attribute_parameters=$object_parameters}
{if is_set( $attribute_parameters.size )}
{set $image_variation=$object.data_map.image.content[$attribute_parameters.size]}
{else}
{set $image_variation=$object.data_map.image.content[ezini( 'ImageSettings', 'DefaultEmbedAlias', 'content.ini' )]}
{/if}

{if is_set( $link_parameters.href )}<a href={$link_parameters.href|ezurl} target="{$link_parameters.target|wash}"{if is_set($link_parameters.class)} class="{$link_parameters.class|wash}"{/if}{if is_set($link_parameters['xhtml:id'])} id="{$link_parameters['xhtml:id']|wash}"{/if}{if is_set($link_parameters['xhtml:title'])} title="{$link_parameters['xhtml:title']|wash}"{/if}>{/if}
<img src={$image_variation.full_path|ezroot} alt="{$object.data_map.image.content.alternative_text|wash(xhtml)}" />
{if is_set( $link_parameters.href )}</a>{/if}
*}