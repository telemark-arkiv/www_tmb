{* The statistics menu *}

{if and(is_set($current_node.data_map.show_right_menu), $current_node.data_map.show_right_menu.data_int|eq(1))}

    {def $stats = fetch( 'content', 'list', hash( 'parent_node_id', $current_node.node_id,
                                                  'class_filter_type', 'include',
                                                  'class_filter_array', array( 'statistic_container' ),
                                                  'sort_by', $current_node.sort_array ) )

         $stats_count = $stats|count}
    
    {if $stats_count}

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2>Statistikk</h2>
        </div>
        <div class="panel-body">
            <div class="nav-menu nav-menu-style-">
                    <ul class="layouts level-1 list-style-none">
                        {foreach $stats as $stat}
                            <li>
                                <a href={$stat.url|ezurl} title="Gå til statistikksiden {$stat.name|wash}"><i class="fa fa-bar-chart-o"></i> {$stat.name|wash}</a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
        </div>
    </div>

    {/if}


    {undef $stats}
    {undef $stats_count}
{/if}