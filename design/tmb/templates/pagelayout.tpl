<!DOCTYPE html>

<html lang="no" class="ltr">
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{*include uri='design:page_head_displaystyles.tpl'*}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagedata         = ezpagedata()
     $current_node = fetch('content', 'node', hash('node_id', first_set($pagedata.node_id, 2)))
     $root_node = fetch('content', 'node', hash('node_id', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ))
     $right_menu = false()}

{if or( and(is_set($current_node.data_map.show_right_menu), $current_node.data_map.show_right_menu.data_int|eq(1)),
        and(is_set($current_node.data_map.show_right_stats), $current_node.data_map.show_right_stats.data_int|eq(1)),
        and(is_set($current_node.data_map.show_right_infoboxes), $current_node.data_map.show_right_infoboxes.data_int|eq(1)) )}
    {set $right_menu = true()}
{/if}

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
{* To simplify IE css targeting. IE9 conforms, so threat as rest *}
<!--[if lt IE 7 ]><body class="ie6"><![endif]-->
<!--[if IE 7 ]>   <body class="ie7"><![endif]-->
<!--[if IE 8 ]>   <body class="ie8"><![endif]-->
<!--[if (gt IE 8)|!(IE)]><!--><body><!--<![endif]-->
<!-- Complete page area: START -->
<!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  -->

<div id="wrapper" class="container">

  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->
  

  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}


<!-- Content: START -->
<div id="content" class="row">

  <!-- Path area: START -->
  {if $pagedata.show_path}
    {include uri='design:parts/path.tpl'}
  {/if}
  <!-- Path area: END -->

  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
    <!-- Toolbar area: START -->
    {include uri='design:page_toolbar.tpl'}
    <!-- Toolbar area: END -->
  {/if}

  <!-- Columns area: START -->

<div id="main-content" class="row">
    <div id="column-1" {if $right_menu} class="col-md-8"{else} class="col-md-12"{/if}>

  {/cache-block}
{/cache-block}
<!-- Main area content: START -->
        {$module_result.content}
<!-- Main area content: END -->
{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}
    </div>
    {if $right_menu}
        <div id="column-2" class="col-md-4">
            {include uri='design:parts/right_column.tpl'}
        </div>
    {/if}
</div>

  <!-- Columns area: END -->
</div>
<!-- Content: END -->

  <!-- Footer area: START -->
  {include uri='design:page_footer.tpl'}
  <!-- Footer area: END -->

</div>
<!-- Complete page area: END -->

<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->

{/cache-block}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>