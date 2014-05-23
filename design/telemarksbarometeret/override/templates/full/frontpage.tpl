{* Frontpage - Full view *}

{set scope=global persistent_variable=hash('show_path', false())}
{def $nyhetsmapper = array() }
{def $lokale_nyhetssaker = array() }
{def $root_node = fetch('content', 'node', hash('node_id', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ))}
{def $nyhetssaker = array()}
{def $nyhetssaker_tmp = array()}
{def $nyhet = ''}
{def $antall_nyhetssaker_pr_kolonne=0}

{set $nyhetsmapper = $root_node.data_map.frontpage_news_folders.content.relation_list}

{foreach $nyhetsmapper as $related_folder}
  {def $lokale_nyhetssaker_tmp = array() }
  {def $lokal_nyhetssak = ''}
  {def $lokale_nyhetssaker_tmp = fetch('content', 'list', hash('parent_node_id', $related_folder.node_id,
                                               'depth', 10,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'article' ),
                                               'sort_by', array( 'published', false()),
                                               'attribute_filter', array( array('article/show_on_frontpage', '=', 1)
                                                                                )))}
   {if gt($lokale_nyhetssaker_tmp|count(), 0)}
    {def $lokale_nyhetssaker = $lokale_nyhetssaker|append($lokale_nyhetssaker_tmp[0].node_id|int())}
   {/if}
{/foreach}

{set $nyhetssaker_tmp = fetch('content', 'list', hash('parent_node_id', $node.node_id,
                                               'depth', 10,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'article' ),
                                               'sort_by', array( 'published', false()),
                                               'attribute_filter', array( array('article/show_on_frontpage', '=', 1)
                                                                                )))}

{if $nyhetssaker_tmp}

{foreach $nyhetssaker_tmp as $mulig_nyhet}
  {if $lokale_nyhetssaker|contains($mulig_nyhet.node_id|int())}
    {def $nyhetssaker = $nyhetssaker|append($mulig_nyhet)}
  {/if}
{/foreach}

{def $antall_nyhetssaker_pr_kolonne = div($nyhetssaker|count(), 3)}
{if eq(mod($antall_nyhetssaker_pr_kolonne, 3), 0)}
  {def $antall_nyhetssaker_pr_kolonne = sub($antall_nyhetssaker_pr_kolonne, 1)}
{/if}
{if eq($nyhetssaker|count(), 6)}
  {def $antall_nyhetssaker_pr_kolonne = sub($antall_nyhetssaker_pr_kolonne, 1)}
{/if}
{if eq($nyhetssaker|count(), 3)}
  {def $antall_nyhetssaker_pr_kolonne = sub($antall_nyhetssaker_pr_kolonne, 1)}
{/if}

<div class="row">
  <div class="col-md-4">
    {foreach $nyhetssaker|extract(0, sum(floor($antall_nyhetssaker_pr_kolonne),1)) as $nyhet sequence array( 'background-light', 'background-dark' ) as $style}
      <div class="well {$style} frontpage-newsbox">
        {if $nyhet.data_map.image.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image.content.main_node.data_map.image.content.[large].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
        {elseif $nyhet.data_map.image_old.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image_old.content.[frontpage_article_list].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded">
          </a>
        {/if}
        <h2 class="{$style}"><a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">{attribute_view_gui attribute=$nyhet.data_map.title}</a></h2>
        <p>{$nyhet.object.published|l10n(date)}</p>
        {if $nyhet.data_map.short_intro.content}
            <p>{attribute_view_gui attribute=$nyhet.data_map.short_intro}</p>
        {else}
            {def $xml_content=$nyhet.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
        <p>
          <a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}"><i class="fa fa-file-text-o"></i> Les mer</a>
        </p>
      </div>
    {/foreach}
  </div>
  <div class="col-md-4">
    {foreach $nyhetssaker|extract(sum(floor($antall_nyhetssaker_pr_kolonne),1), sum(floor($antall_nyhetssaker_pr_kolonne),1)) as $nyhet sequence array( 'background-dark', 'background-light' ) as $style}
    <div class="well {$style} frontpage-newsbox">
      {if $nyhet.data_map.image.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image.content.main_node.data_map.image.content.[large].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
      {elseif $nyhet.data_map.image_old.has_content}
        <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
          <img src="/{$nyhet.data_map.image_old.content.[frontpage_article_list].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded">
        </a>
      {/if}
      <h2 class="{$style}"><a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">{attribute_view_gui attribute=$nyhet.data_map.title}</a></h2>
      <p>{$nyhet.object.published|l10n(date)}</p>
      {if $nyhet.data_map.short_intro.content}
            <p>{attribute_view_gui attribute=$nyhet.data_map.short_intro}</p>
        {else}
            {def $xml_content=$nyhet.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
      <p>
        <a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}"><i class="fa fa-file-text-o"></i> Les mer</a>
      </p>
    </div>
    {/foreach}
  </div>
  <div class="col-md-4">
    {foreach $nyhetssaker|extract(mul(sum(floor($antall_nyhetssaker_pr_kolonne),1), 2)) as $nyhet sequence array( 'background-light', 'background-light' ) as $style}
      <div class="well {$style} frontpage-newsbox">
        <h2 class="{$style}"><a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">{attribute_view_gui attribute=$nyhet.data_map.title}</a></h2>
        <p>{$nyhet.object.published|l10n(date)}</p>
        <p>
          <a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}"><i class="fa fa-file-text-o"></i> Les mer</a>
        </p>
      </div>
    {/foreach}
  </div>      
</div>
{/if}

{undef $nyhetsmapper}
{undef $nyhetssaker}
{undef $nyhet}
{undef $antall_nyhetssaker}
