{def $href=$root_node.url|ezurl}
<header>
    <div class="row">
        <h1><img src="/var/telemarksbarometeret/storage/images/media/images/design/telemarksbarometeret-logo/11160-1-nor-NO/Telemarksbarometeret-logo.png" alt="Telemarksbarometeret logo" title="Telemarksbarometeret logo"></h1>
    </div>
</header>

{include uri='design:page_header_menu.tpl'}

{if eq($current_node.node_id, 2)}
  {include uri='design:page_header_menu_frontpage.tpl'}
{/if}

{undef $href}

