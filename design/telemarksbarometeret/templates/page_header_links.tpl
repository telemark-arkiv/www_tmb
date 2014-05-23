
{def $header_link = ''}

{foreach $root_node.data_map.header_links.content.relation_list as $related_object}
    {set $header_link = fetch('content', 'node', hash('node_id', $related_object.node_id))}
    {if $header_link.class_identifier|eq('link')}
        {node_view_gui content_node=$header_link view=line class='omraadelink'}
    {else}
        <a href={$header_link.url|ezurl}>{$header_link.name|wash}</a>
    {/if}
{/foreach}

{undef $header_link}
