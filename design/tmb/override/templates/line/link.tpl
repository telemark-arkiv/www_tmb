{* Link - Line view *}
{if $node.data_map.location.has_content}
    <a {if is_set($class)}class="{$class}"{/if} href="{$node.data_map.location.content}" {if $node.data_map.open_in_new_window.data_int|eq(1)}target="_blank"{/if}>{if $node.data_map.location.data_text|count|gt( 0 )}{$node.data_map.location.data_text|wash}{else}{$node.data_map.location.content|wash}{/if}</a>
{/if}
