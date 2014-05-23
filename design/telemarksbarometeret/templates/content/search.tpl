{let search=false()}
{section show=true}
    {set page_limit=10}
    {set search=fetch('content','search',
                      hash('text',$search_text,
                           'section_id',$search_section_id,
                           'depth', 10,
                           'class_id', array( '16', '1', '46' ), 
                           'subtree_array',$search_subtree_array,
                           'sort_by',array('modified',false()),
                           'offset',$view_parameters.offset,
                           'limit',$page_limit))}
    {set search_result=$search['SearchResult']}
    {set search_count=$search['SearchCount']}
    {set stop_word_array=$search['StopWordArray']}
    {set search_data=$search}
{/section}

{section show=$stop_word_array}
    <p>
    {"The following words were excluded from the search:"|i18n("design/ezwebin/content/search")}:
    {section name=StopWord loop=$stop_word_array}
        {$StopWord:item.word|wash}
        {delimiter}, {/delimiter}
    {/section}
    </p>
{/section}

{switch name=Sw match=$search_count}
  {case match=0}
  <div class="warning">
  <p>{'No results were found when searching for "%1".'|i18n("design/ezwebin/content/search",,array($search_text|wash))}</p>
  </div>
    <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
    <ul>
        <li>{'Check spelling of keywords.'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Try changing some keywords (eg, "car" instead of "cars").'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Try searching with less specific keywords.'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Reduce number of keywords to get more results.'|i18n('design/ezwebin/content/search')}</li>
    </ul>
  {/case}
  {case}
  <div class="feedback">
  <p>{'Search for "%1" returned %2 matches'|i18n("design/ezwebin/content/search",,array($search_text|wash,$search_count))}</p>
  </div>
  {/case}
{/switch}

{let adv_url=concat('/content/advancedsearch/',$search_text|count_chars()|gt(0)|choose('',concat('?SearchText=',$search_text|urlencode)))|ezurl}
    <label>{"For more options try the %1Advanced search%2"|i18n("design/ezwebin/content/search","The parameters are link start and end tags.",array(concat("<a href=",$adv_url,">"),"</a>"))}</label>
{/let}

{include name=Navigator
         uri='design:navigator/google.tpl'
         page_uri='/content/search'
         page_uri_suffix=concat('?SearchText=',$search_text|urlencode,$search_timestamp|gt(0)|choose('',concat('&SearchTimestamp=',$search_timestamp)))
         item_count=$search_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{section name=SearchResult loop=$search_result show=$search_result sequence=array(background-light, background-dark)}
   {node_view_gui view=line sequence=$:sequence use_url_translation=$use_url_translation content_node=$:item}
{/section}


{include name=Navigator
         uri='design:navigator/google.tpl'
         page_uri='/content/search'
         page_uri_suffix=concat('?SearchText=',$search_text|urlencode,$search_timestamp|gt(0)|choose('',concat('&SearchTimestamp=',$search_timestamp)))
         item_count=$search_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{/let}