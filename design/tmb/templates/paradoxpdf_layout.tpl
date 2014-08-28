{set-block variable=$xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}
{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagedata         = ezpagedata()
     $current_node = fetch('content', 'node', hash('node_id', $pagedata.node_id))
     $root_node = fetch('content', 'node', hash('node_id', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ))
     $right_menu = false()}

{if or( and(is_set($current_node.data_map.show_right_menu), $current_node.data_map.show_right_menu.data_int|eq(1)),
        and(is_set($current_node.data_map.right_column_content), $current_node.data_map.right_column_content.has_content) )}
    {set $right_menu = true()}
{/if}

{foreach ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) as $style}
    <link rel="stylesheet" type="text/css" href={concat('stylesheets/', $style)|ezdesign} media="print,screen"></link>

{/foreach}
{literal}
<style media="print,screen" type="text/css">
        #siteSearch, #megaDropDown, #sign-in { display:none; }
        body { background:#fff; color: #000; font-family: Georgia, serif; line-height: 1.2; }
        #footer { background:transparent none; color:#999; border-color:#999; border-width:1px 0 0; }
        .internetausdrucker { position:relative; top:0px; left:0px; }
        #wrapper {width: 860px;}
        #wrapper.folder {width: 800px;}

        @page {
            size: a4 portrait;
            margin: 1.5cm 1cm 3em 1cm;
            padding-top: 3cm;
        
            @top-center {
                content: element(header);
            }
            @bottom-center {
                content: element(footer);
            }
        }
        #header {
            position: running(header);
            display: block;
        }
        #footer {
            position: running(footer);
            display: block;
            margin-top: -3em;
        }
</style>
{/literal}

<title></title>
</head>
<body>
<div id="wrapper" class="{$current_node.class_identifier} node-{$current_node.node_id}">

  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->

  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}


<!-- Content: START -->
<div id="content">

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

<div id="main-content" {if $right_menu} class="two-columns"{/if}>
    <div id="column-1">

  {/cache-block}
{/cache-block}
<!-- Main area content: START -->
        {$module_result.content}
<!-- Main area content: END -->
{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}
    </div>
    {if $right_menu}
        <div id="column-2">
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
{/cache-block}

</body>
</html>
{/set-block}

{* Folowing Avoid printing debug on pdf files when debug enabled*}
{*<!-- DEBUG_REPORT -->*}

{*******************************************************************************************************
  You can tweak the pdf cache just as a template cache-block it's
  based on the same mecanisme. So for more information please refere
  to online documentation :
  http://ez.no/doc/ez_publish/technical_manual/4_0/reference/template_functions/miscellaneous/cache_block

  Usage :
        -Full : paradoxpdf(hash('xhtml',$xhtml,
                                'pdf_file_name',$pdf_file_name,
                                'keys',$keys,
                                'subtree_expiry',$subtree_expiry,
                                'expiry',$expiry ,
                                'ignore_content_expiry',$ignore_content_expiry))
        -Minium : paradoxpdf(hash('xhtml',$xhtml))

  Parameters :
        $xhtml : (required)
        $pdf_file_name : just the name (without .pdf extension) that will be assigned
                         to generated file during download if not given "file.pdf" will
                         be used
        $keys, $subtree_expiry, $expiry , $ignore_content_expiry : controls cache
                         (see cache-block documentation)

  Example :

  {def  $pdf_file_name  = $module_result.content_info.url_alias|explode('/')|reverse|extract(0)[0]
        $keys           = array($uri_string,$current_user.contentobject_id)
        $subtree_expiry = $module_result.node_id
        $expiry         = 6000
        $ignore_content_expiry=false()

        $paradoxpdf_params= hash('xhtml', $xhtml,
                                 'pdf_file_name',$pdf_file_name,
                                 'keys', $keys,
                                 'subtree_expiry', $subtree_expiry,
                                 'expiry',$expiry ,
                                 'ignore_content_expiry',$ignore_content_expiry)}

*******************************************************************************************************}

{def $paradoxpdf_params = hash('xhtml', $xhtml,
                               'pdf_file_name',$module_result.content_info.url_alias|explode('/')|reverse|extract(0)[0],
                               'subtree_expiry',$module_result.node_id )

}

{*$xhtml*}
{paradoxpdf($paradoxpdf_params)}