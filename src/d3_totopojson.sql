
/**
d3_totopojson
**/
DROP FUNCTION IF EXISTS plv8.d3_ToTopojson(collection JSONB, numeric);
CREATE FUNCTION plv8.d3_ToTopojson(collection JSONB,q numeric)
RETURNS JSONB
immutable language plv8
as $$
	var startT = new Date();
	var topo = topojson.topology({entities: collection},q);
	var endT = new Date();
	//plv8.elog(NOTICE,'Topotime: ' + (endT - startT)/1000);
	//plv8.elog(NOTICE,JSON.stringify(topo));
	return topo;
$$;
