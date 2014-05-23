{* Folder - Full view *}

{if $node.data_map.redirect.data_int|eq(1) }
    {def $redirect_node_list=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                             'limit', 1,
                                                             'sort_by', $node.sort_array ) )
         $redirect_url = $redirect_node_list[0].url|ezurl('no')}

    {if is_set($redirect_url) }
       {redirectrelative($redirect_url)}
    {/if}
{/if}

{if $node.data_map.show_heading.data_int|eq(1)}
    <!--<h1>{$node.name|wash}</h1>-->
    <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
{/if}

{if $node.data_map.image.has_content}
        <div class="image-main">
            <img src="/{$node.data_map.image.content.main_node.data_map.image.content.[article_full].full_path}" alt="{$node.data_map.image.content.main_node.data_map.image.content.alternative_text}" class="img-rounded img-responsive" />

            <div class="image-caption">
                <a href="/{$node.data_map.image.content.main_node.data_map.image.content.[article_full].full_path}" target="_blank"><i class="fa fa-search-plus pull-right"></i></a>
                {if $node.data_map.image_title.content}
                    <strong>{$node.data_map.image_title.content}</strong>
                {/if}
                {if $node.data_map.caption.content}
                    {attribute_view_gui attribute=$node.data_map.caption}
                {/if}
                {if $node.data_map.image.content.main_node.data_map.foto_byline.content}
                    <br /><em>FOTO: {$node.data_map.image.content.main_node.data_map.foto_byline.content}</em>
                {/if}
            </div>
        </div>
{/if}

{if $node.data_map.intro.has_content}
    <div class="ingress">
      {attribute_view_gui attribute=$node.data_map.intro}
    </div>
{/if}

{attribute_view_gui attribute=$node.data_map.description}

{if $node.data_map.pentaho.has_content}
    {attribute_view_gui attribute=$node.data_map.pentaho}
{/if}

{if $node.data_map.pentaho2.has_content}
    {attribute_view_gui attribute=$node.data_map.pentaho2}
{/if}

{if and(is_set($node.data_map.show_as_category_frontpage), $node.data_map.show_as_category_frontpage.data_int|eq(1))}
  {def $nyhetssaker = ''}
  {def $nyhet = ''}

  {set $nyhetssaker = fetch('content', 'list', hash('parent_node_id', $node.node_id,
                                                    'depth', 10,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'article' ),
                                                    'sort_by', array( 'published', false()),
                                                    'attribute_filter', array( array('article/show_on_category_frontpage', '=', 1))))}

  {if $nyhetssaker}
    {def $antall_nyhetssaker_pr_kolonne=0}
    {def $justeringsfaktor = 0}
    {def $antall_nyhetssaker_pr_kolonne = floor(div($nyhetssaker|count(), 2))}
    {if gt($nyhetssaker|count(), mul($antall_nyhetssaker_pr_kolonne, 2))}
      {def $justeringsfaktor = 1}
    {/if}
  <div class="row">
    <div class="col-md-6">
    {foreach $nyhetssaker|extract(0, sum($antall_nyhetssaker_pr_kolonne, $justeringsfaktor)) as $nyhet sequence array( 'background-light', 'background-dark' ) as $style}
      <div class="well {$style} frontpage-newsbox">

        {if $nyhet.data_map.image.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image.content.main_node.data_map.image.content.[large].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
        {elseif $nyhet.data_map.image_old.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image_old.content.[large].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded" width="402">
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
    <div class="col-md-6">
    {foreach $nyhetssaker|extract(sum($antall_nyhetssaker_pr_kolonne, $justeringsfaktor)) as $nyhet sequence array( 'background-dark', 'background-light' ) as $style}
      <div class="well {$style} frontpage-newsbox">
        {if $nyhet.data_map.image.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image.content.main_node.data_map.image.content.[large].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
        {elseif $nyhet.data_map.image_old.has_content}
          <a href={$nyhet.url_alias|ezurl} title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">
            <img src="/{$nyhet.data_map.image_old.content.[large].full_path}" alt="Les artikkelen: {$nyhet.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
        {/if}
        <h2 class="$style"><a href={$nyhet.url|ezurl} class="{$style}" title="Gå til artikkelen: {$nyhet.data_map.title.content|wash()}">{attribute_view_gui attribute=$nyhet.data_map.title}</a></h2>
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
  </div>
    {undef $antall_nyhetssaker_pr_kolonne $justeringsfaktor}
  {/if}

  {undef $nyhetssaker}
  {undef $nyhet}
{/if}

{if and(is_set($node.data_map.show_children), $node.data_map.show_children.data_int|eq(1))}
  {def $artikler = ''}
  {def $artikkel = ''}

  {set $artikler = fetch('content', 'list', hash('parent_node_id', $node.node_id,
                                                 'class_filter_type', 'include',
                                                 'class_filter_array', array( 'article' ),
                                                 'sort_by', array( 'published', false())))}

  {if $artikler}
    {def $antall_artikler_pr_kolonne=0}
    {def $justeringsfaktor = 0}
    {def $antall_artikler_pr_kolonne = floor(div($artikler|count(), 2))}
    {if gt($artikler|count(), mul($antall_artikler_pr_kolonne, 2))}
      {def $justeringsfaktor = 1}
    {/if}
    <div class="row">
      <div class="col-md-6">
        {foreach $artikler|extract(0, sum($antall_artikler_pr_kolonne, $justeringsfaktor)) as $artikkel sequence array( 'background-light', 'background-dark' ) as $style}
          <div class="well {$style} frontpage-newsbox">
            {if $artikkel.data_map.image.has_content}
          <a href={$artikkel.url_alias|ezurl} title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}">
            <img src="/{$artikkel.data_map.image.content.main_node.data_map.image.content.[large].full_path}" alt="Les artikkelen: {$artikkel.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
          
            {elseif $artikkel.data_map.image_old.has_content}
              <a href={$artikkel.url_alias|ezurl} title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}">
                <img src="/{$artikkel.data_map.image_old.content.[large].full_path}" alt="Les artikkelen: {$artikkel.data_map.title.content|wash()}" class="img-rounded" width="402">
              </a>
            {/if}
            <h2 class="{$style}">
              <a href={$artikkel.url|ezurl} class="{$style}" title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}">{attribute_view_gui attribute=$artikkel.data_map.title}</a>
            </h2>
            <p>{$artikkel.object.published|l10n(date)}</p>
            <p>
              {attribute_view_gui attribute=$artikkel.data_map.intro}
            </p>
            <p>
              <a href={$artikkel.url|ezurl} class="{$style}" title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}"><i class="fa fa-file-text-o"> Les mer</i></a>
            </p>
          </div>            
        {/foreach}
      </div>
      <div class="col-md-6">
        {foreach $artikler|extract(sum($antall_artikler_pr_kolonne, $justeringsfaktor)) as $artikkel sequence array( 'background-dark', 'background-light' ) as $style}
          <div class="well {$style} frontpage-newsbox">
            {if $artikkel.data_map.image.has_content}
          <a href={$artikkel.url_alias|ezurl} title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}">
            <img src="/{$artikkel.data_map.image.content.main_node.data_map.image.content.[large].full_path}" alt="Les artikkelen: {$artikkel.data_map.title.content|wash()}" class="img-rounded" width="402">
          </a>
            {elseif $artikkel.data_map.image_old.has_content}
              <a href={$artikkel.url_alias|ezurl} title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}">
                <img src="/{$artikkel.data_map.image_old.content.[large].full_path}" alt="Les artikkelen: {$artikkel.data_map.title.content|wash()}" class="img-rounded" width="402">
              </a>
            {/if}
            <h2 class="$style">
              <a href={$artikkel.url|ezurl} class="{$style}" title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}">{attribute_view_gui attribute=$artikkel.data_map.title}</a>
            </h2>
            <p>{$artikkel.object.published|l10n(date)}</p>
            <p>
              {attribute_view_gui attribute=$artikkel.data_map.intro}
            </p>
            <p>
              <a href={$artikkel.url|ezurl} class="{$style}" title="Gå til artikkelen: {$artikkel.data_map.title.content|wash()}"><i class="fa fa-file-text-o"></i> Les mer</a>
            </p>
          </div>            
        {/foreach}
      </div>
    </div>
    {undef $antall_artikler_pr_kolonne $justeringsfaktor}

  {/if}

  {undef $artikler}
  {undef $artikkel}
{/if}