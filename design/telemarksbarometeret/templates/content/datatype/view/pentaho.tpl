{if $attribute.data_text}
  <a href="{$attribute.data_text}" id="ieSpecial" class="btn btn-primary pentaho-button" target="_blank" style="display:none;">
  	Trykk for å åpne tabellen i nytt vindu
  </a>
  <iframe src="{$attribute.data_text}" id="normalBrowser" class="iframe" height="650" style="display:none;"></iframe>

{literal}
<script>
  var
  	ua = navigator.userAgent.toString(),
    divId = 'normalBrowser';

  if (ua.indexOf('Trident') > -1) {
    divId = "ieSpecial"
  }

  document.getElementById(divId).style.display = '';
</script>
{/literal}

{/if}

{*
{if $attribute.data_text}
<!--[if lt IE 9 ]>
    <iframe src="{$attribute.data_text}"  class="iframe" height="650" frameborder="0"></iframe>
<![endif]-->
<!--[if gt IE 8 ]><!-->
    <iframe src="{$attribute.data_text}"  class="iframe" height="650"></iframe>
<!--<![endif]-->
{/if}
*}