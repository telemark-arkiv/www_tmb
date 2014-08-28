{* Article - Full view *}

<div class="well background-light article-full">
    <h1>{$node.data_map.title.content|wash()}</h1>

    <p class="article-full-byline">
        {if $node.data_map.author.content.is_empty|not()}Av: {attribute_view_gui attribute=$node.data_map.author}{/if}
        Publisert: {$node.object.published|l10n(date)}
        {if eq($node.object.published, $node.object.modified)|not}
            Oppdatert: {$node.object.modified|l10n(date)}
        {/if} 
    </p>

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
    {elseif $node.data_map.image_old.has_content}
        <div class="image-main">
            <img src="/{$node.data_map.image_old.content.[article_full].full_path}" alt="{$node.data_map.image_old.content.main_node.data_map.image.content.alternative_text}" class="img-rounded img-responsive" />
            <div class="image-caption">
                <a href="/{$node.data_map.image_old.content.[article_full].full_path}" target="_blank"><i class="fa fa-search-plus pull-right"></i></a>
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

    {if $node.data_map.intro.content.is_empty|not}
        <div class="ingress">
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
    {/if}

    {if $node.data_map.body.content.is_empty|not}
        {attribute_view_gui attribute=$node.data_map.body}
    {/if}

    {if $node.data_map.pentaho.has_content}
        {attribute_view_gui attribute=$node.data_map.pentaho}
    {/if}
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
        <a title="Del på Facebook" class="addthis_button_facebook"></a>
        <a title="Del på Twitter" class="addthis_button_twitter"></a>
        <a title="Del på Google+" class="addthis_button_google_plusone_share"></a>
        <a title="Del på LinkedIn" class="addthis_button_linkedin"></a>
        <a title="Del via e-post" class="addthis_button_email"></a>
    </div>
    {literal}
        <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4fd5e24713b656c1"></script>
    {/literal}
    <!-- AddThis Button END -->
</div>