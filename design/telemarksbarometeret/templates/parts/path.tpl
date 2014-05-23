<div>
<ol class="breadcrumb">
    {foreach $pagedata.path_array as $path}
        {if $path.url}
            <li>
                <a href={cond( is_set( $path.url_alias ), $path.url_alias, $path.url )|ezurl} title="Gå til {$path.text|wash}">{$path.text|wash}</a>
            </li>
        {else}
            <li class="active">{$path.text|wash}</li>
        {/if}    
    {/foreach}
   <li>
       <a href="#" onclick="window.print(); return false;" title="Skriv ut"><i class="fa fa-print"></i></a>
   </li>
   <li>
       <a href={concat('/layout/set/pdf/content/view/full/', $current_node.node_id)|ezurl}  title="Eksporter til PDF"><i class="fa fa-save"></i></a>
   </li>
</ol>
</div>