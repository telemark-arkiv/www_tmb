{* Statistikk container full view *}

<h1>{attribute_view_gui attribute=$node.data_map.title}</h1>

{if $node.data_map.ingress.has_content}
    <div class="ingress">
        {attribute_view_gui attribute=$node.data_map.ingress}
    </div>
{/if}

{if $node.data_map.body.has_content}
    <p>
        {attribute_view_gui attribute=$node.data_map.body}
    </p>
{/if}

{if $node.data_map.pentaho.has_content}
    {attribute_view_gui attribute=$node.data_map.pentaho}
{/if}

{if $node.data_map.footer.has_content}
    <p>
        {attribute_view_gui attribute=$node.data_map.footer}
    </p>
{/if}