{*
<div id="siteSearch">
  <form action={"/content/search"|ezurl}>
    <label for="searchtext" class="hide">{'Search text:'|i18n('design/ezwebin/pagelayout')}</label>
    {if $pagedata.is_edit}
        <input id="searchtext" name="SearchText" type="text" value="" size="30" disabled="disabled" />
        <input id="searchbutton" class="button-disabled" type="submit" value="'Search'|i18n('design/ezwebin/pagelayout')" title="{'Search'|i18n('design/ezwebin/pagelayout')}" disabled="disabled" />
    {else}
        <input id="searchtext" name="SearchText" type="text" value="" size="30" />
        <input id="searchbutton" class="button" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" title="{'Search'|i18n('design/ezwebin/pagelayout')}" />
        {if eq( $ui_context, 'browse' )}
            <input name="Mode" type="hidden" value="browse" />
        {/if}
    {/if}
  </form>
</div>
*}

<form action={"/content/search"|ezurl} class="pull-right">
    <label for="searchtext" class="hide">Søkekriterier</label>
    <div class="input-append">
        <input id="searchtext" name="SearchText" type="text" value="{$search_text|wash}" placeholder="Søkekriterier"/>
        <button id="searchbutton" class="btn" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" title="" />
          <i class="icon-search"></i>
        </button>  
      </div>
</form>