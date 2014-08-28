{def $menu_item = false
     $sub_item_list = array()
     $temaliste = array()
     $antall_tema_pr_kolonne=0
     $header_link = ''}

{set $temaliste = $root_node.data_map.menu.content.relation_list}
{def $antall_tema_pr_kolonne = div($temaliste|count(), 4)}
<div class="row">
<div class="navbar navbar-default yamm" role="banner">
  
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Åpne/lukke meny</span>
        <span class="fa fa-bars"></span>
      </button>
      <a class="navbar-brand" href="/"><i class="fa fa-home"></i></a>  
    </div>
    
    <div class="navbar-collapse collapse" role="navigation">
    <ul class="nav navbar-nav">
      <li class="dropdown yamm-fullwidth">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Statistikkområder <b class="caret"></b> </a>
        <ul class="dropdown-menu">
          <li>
            <div class="yamm-content">
              <ul class="col-md-3 list-unstyled" role="menu">
                {foreach $temaliste|extract(0, sum(floor($antall_tema_pr_kolonne),1)) as $related_object}
                  {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a role="menuitem" tabindex="-1" href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}
              </ul>
              <ul class="col-md-3 list-unstyled" role="menu">
                {foreach $temaliste|extract(sum(floor($antall_tema_pr_kolonne),1), sum(floor($antall_tema_pr_kolonne),1)) as $related_object}
                {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a role="menuitem" tabindex="-1" href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}

              </ul>
              <ul class="col-md-3 list-unstyled" role="menu">
                {foreach $temaliste|extract(mul(sum(floor($antall_tema_pr_kolonne),1),2), sum(floor($antall_tema_pr_kolonne),1)) as $related_object}
                {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a role="menuitem" tabindex="-1" href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}                
              </ul>
              <ul class="col-md-3 list-unstyled" role="menu">
                {foreach $temaliste|extract(mul(sum(floor($antall_tema_pr_kolonne),1),3)) as $related_object}
                {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a role="menuitem" tabindex="-1" href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}   
              </ul>
            </div>
          </li>
        </ul>
      </li>
      {foreach $root_node.data_map.header_links.content.relation_list as $related_object}
    {set $header_link = fetch('content', 'node', hash('node_id', $related_object.node_id))}
    {if $header_link.class_identifier|eq('link')}
        {node_view_gui content_node=$header_link view=line class='omraadelink'}
    {else}
        <li><a href={$header_link.url|ezurl} title="Gå til siden for {$header_link.name|wash}">{$header_link.name|wash}</a></li>
    {/if}
{/foreach}

<li><a href={"/rss/feed/nyheter"|ezurl} title="Abonner på nyheter via RSS"><i class="fa fa-rss"></i></a></li>



    </ul>
    
    <form action={"/content/search"|ezurl} class="navbar-form navbar-right">
    
      <div class="form-group">
        <label for="searchtext" class="hide">Søkekriterier</label>
        <input id="searchtext" name="SearchText" type="text" value="{$search_text|wash}" placeholder="Søkekriterier" class="form-control"/>  
      </div>
      <button id="searchbutton" class="btn btn-default" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}">
          <i class="fa fa-search"></i>
      </button>
    </form>

  </div><!-- Navbar collapse-->

</div>
</div>

{undef $menu_item $sub_item_list $temaliste $antall_tema_pr_kolonne $header_link}