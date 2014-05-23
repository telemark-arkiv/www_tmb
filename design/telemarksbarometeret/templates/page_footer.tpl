<!-- Footer area: START -->

{if ne($current_node.node_id, 2)}

{def $menu_item = false
     $sub_item_list = array()
     $temaliste = array()
     $antall_tema_pr_kolonne=0
     $header_link = ''}

{set $temaliste = $root_node.data_map.menu.content.relation_list}
{def $antall_tema_pr_kolonne = div($temaliste|count(), 4)}

<div class="well frontpage-newsbox frontpage-menu background-light row margintop20">
    <span class="legend">Statistikkområder</span>
    <div class="row lead">
        <div class="col-md-12">
            
                <ul class="col-md-3 list-unstyled">
                {foreach $temaliste|extract(0, sum(floor($antall_tema_pr_kolonne),1)) as $related_object}
                  {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}
              </ul>
              <ul class="col-md-3 list-unstyled">
                {foreach $temaliste|extract(sum(floor($antall_tema_pr_kolonne),1), sum(floor($antall_tema_pr_kolonne),1)) as $related_object}
                {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}

              </ul>
              <ul class="col-md-3 list-unstyled">
                {foreach $temaliste|extract(mul(sum(floor($antall_tema_pr_kolonne),1),2), sum(floor($antall_tema_pr_kolonne),1)) as $related_object}
                {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}                
              </ul>
              <ul class="col-md-3 list-unstyled">
                {foreach $temaliste|extract(mul(sum(floor($antall_tema_pr_kolonne),1),3)) as $related_object}
                {set $menu_item = fetch('content', 'node', hash('node_id', $related_object.node_id))}
                  <li>
                    <a href={$menu_item.url|ezurl} title="Gå til statistikkområdet {$menu_item.name|wash}">{$menu_item.name|wash}</a>
                  </li>
                {/foreach}   
              </ul>
                        

        </div>
    </div>
                     
    
</div><!-- End: frontpage-menu - container-->

{undef $menu_item $sub_item_list $temaliste $antall_tema_pr_kolonne $header_link}                    
{/if}

<div class="footer-wrapper row">
<hr />
<div >
        <div class="col-md-12">
                    <div class="col-md-7">
                    </div>
                    <div class="col-md-5">
                      <p class="muted pull-right">
                          <a href="http://www.telemark.no" target="_blank" title="Trykk for å komme til hjemmesidene for Telemark fylkeskommune (åpnes i nytt vindu)" class="dsp-inline"><i class="fa fa-globe"></i> Telemark fylkeskommune</a>
                          <a href="http://www.fylkesmannen.no/Telemark" target="_blank" title="Trykk for å komme til hjemmesidene for Fylkesmannen i Telemark (åpnes i nytt vindu)" class="dsp-inline"><i class="fa fa-globe"></i> Fylkesmannen i Telemark</a>
                      </p>
                    </div>
                </div>
            </div>
</div>