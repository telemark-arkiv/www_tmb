
<url>
	{if eq($node.class_identifier, 'file')}
		<loc>{concat(concat('content/download/', $node.data_map.file.contentobject_id, '/', $node.data_map.file.id)|ezroot('no', 'full'))|extlinkfix(del_layout)}</loc>
	{else}
		<loc>{concat($node.url_alias|ezroot('no', 'full'))|extlinkfix(del_layout)}</loc>
	{/if}
	<lastmod>{$node.object.modified|datetime( 'custom', '%Y-%m-%d' )}</lastmod>
	<priority>1.0</priority>
</url>

