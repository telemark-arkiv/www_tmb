{if $attribute.data_text}
<a href="{$attribute.content|wash( xhtml )}">{$attribute.data_text|wash( xhtml )} </a>
{else}
<a href="{$attribute.content|wash( xhtml )}">{$attribute.content|wash( xhtml )}</a>
{/if}
<!-- Jeg er i bruk -->