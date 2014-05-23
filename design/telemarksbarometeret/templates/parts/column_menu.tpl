{* The column menu *}

{if and(is_set($current_node.data_map.show_right_menu), $current_node.data_map.show_right_menu.data_int|eq(1))}
    {def $root_menu_node=fetch( 'content', 'node', hash( 'node_id', $pagedata.path_array[1].node_id ) )

         $menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_menu_node.node_id,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array( 'folder' ),
                                                       'sort_by', $root_menu_node.sort_array,
                                                       'load_data_map', false() ) )
         $menu_items_count = $menu_items|count()
         $class = ''
         $link_class = 'fa fa-angle-double-right'
         $current_node_in_path_2 = first_set( $pagedata.path_array[2].node_id,  0 )
         $current_node_in_path_3 = first_set( $pagedata.path_array[3].node_id,  0 )}

    {if $menu_items_count}

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2>Meny</h2>
        </div>
        <div class="panel-body">
            <div class="nav-menu nav-menu-style-">
                <ul class="layouts level-1 list-style-none">
                    {foreach $menu_items as $item}
                        {set $class = cond($current_node_in_path_2|eq($item.node_id), 'open', '')}
                        {if $item.node_id|eq( $current_node.node_id)}
                            {set $class = concat($class, ' selected')}
                            {set $link_class = 'fa fa-angle-double-down'}
                        {else}
                            {set $link_class = 'fa fa-angle-double-right'}
                        {/if}
                        <li class="{$class}">
                            <a class="{$class}" href={$item.url|ezurl} title="Gå til {$item.name|wash}"><i class="{$link_class}"></i> {$item.name|wash}</a>

                            {if eq( $current_node_in_path_2, $item.node_id )}
                                {def $sub_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                                                       'class_filter_type', 'include',
                                                                                       'class_filter_array', array( 'folder' ),
                                                                                       'sort_by', $item.sort_array,
                                                                                       'load_data_map', false() ) )
                                     $sub_menu_items_count = $sub_menu_items|count}
                                {if $sub_menu_items_count}
                                    <ul class="layouts level-2 list-style-none">
                                        {foreach $sub_menu_items as  $subitem}
                                            {set $class = cond($current_node_in_path_3|eq($subitem.node_id), 'open', '')}
                                            {if $subitem.node_id|eq( $current_node.node_id)}
                                                {set $class = concat($class, ' selected')}
                                                {set $link_class = 'fa fa-angle-double-down'}
                                            {else}
                                                {set $link_class = 'fa fa-angle-double-right'}
                                            {/if}
                                            <li class="{$class}">
                                                <a class="{$class}" href={$subitem.url|ezurl} title="Gå til {$item.name|wash}"><i class="{$link_class}"></i> {$subitem.name|wash}</a>
                                                {if eq( $current_node_in_path_3, $subitem.node_id )}
                                                    {def $sub_sub_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $subitem.node_id,
                                                                                    'class_filter_type', 'include',
                                                       'class_filter_array', array( 'folder' ),
                                                                                      'sort_by', $subitem.sort_array,
                                                                                      'load_data_map', false() ) )
                                                         $sub_sub_menu_items_count = $sub_sub_menu_items|count}
                                                    {if $sub_sub_menu_items_count}
                                                        <ul class="layouts level-2 list-style-none">
                                                            {foreach $sub_sub_menu_items as  $sub_subitem}
                                                                {set $class = cond($sub_subitem.node_id|eq( $current_node.node_id), 'selected', '')}
                                                                {set $link_class = 'fa fa-angle-double-right'}
                                                                <li class="{$class}">
                                                                    <a class="{$class}" href={$sub_subitem.url|ezurl} title="Gå til {$item.name|wash}"><i class="{$link_class}"></i> {$sub_subitem.name|wash}</a>
                                                                </li>
                                                            {/foreach}
                                                        </ul>
                                                    {/if}
                                                    {undef $sub_sub_menu_items $sub_sub_menu_items_count}
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                                {undef $sub_menu_items $sub_menu_items_count}
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>

    {/if}
    {undef $root_menu_node $menu_items $menu_items_count $class $current_node_in_path_2 $current_node_in_path_3}
{/if}