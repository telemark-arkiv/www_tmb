
{* The Menu *}
{include uri='design:parts/column_menu.tpl'}

{* The Statistics menu*}
{include uri='design:parts/statistic_infobox.tpl'}

{* The infoboxes *}

{if and(is_set($current_node.data_map.show_right_infoboxes), $current_node.data_map.show_right_infoboxes.data_int|eq(1))}
    
         {def
         $infoboxes = fetch( 'content', 'list', hash( 'parent_node_id', $current_node.node_id,
                                                        'class_filter_type', 'include',
                                                        'class_filter_array', array( 'infobox' ),
                                                            'sort_by', $current_node.sort_array,
                                                            'load_data_map', false() ) )
         $infoboxes_count = $infoboxes|count()}
         
    {if $infoboxes_count}
        {foreach $infoboxes as $infobox}
            {node_view_gui content_node=$infobox view=line}
        {/foreach}    
    {/if}

    {undef $infoboxes $infoboxes_count}
{/if}

{*
{if and(is_set($current_node.data_map.right_column_content), $current_node.data_map.right_column_content.has_content)}
    {attribute_view_gui attribute=$current_node.data_map.right_column_content}
{/if}
*}