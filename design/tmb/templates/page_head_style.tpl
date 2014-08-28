<!--[if lt IE 9]>
{literal}
    <style type="text/css">
        article,aside,details,figcaption,figure,
        footer,header,hgroup,menu,nav,section {
            display:block;
        }
    </style>
{/literal}
<![endif]-->


{*{ezcss_load( array( ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) ))}*}


  {*ezcss_load( array( 'core.css',
                      'debug.css',
                      'pagelayout.css',
                      'content.css',
                      'websitetoolbar.css' ))*}

{*
{literal}
<style media="print" type="text/css">
        #siteSearch, #megaDropDown, #sign-in { display:none; }
        body { background:#fff; color: #000; font-family: Georgia, serif; line-height: 1.2; }
        #footer { background:transparent none; color:#999; border-color:#999; border-width:1px 0 0; }
        .internetausdrucker { position:relative; top:0px; left:0px; }
</style>
{/literal}
*}

<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">

<link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.2/css/font-awesome.min.css" rel="stylesheet">

{ezcss_load( array( 'yamm.css', 'bootstrap_custom.css' ))}