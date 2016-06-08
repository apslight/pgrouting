#VERSION pgrouting 2.2.3
#TYPES
pgr_costResult(integer,integer,integer,float8)
pgr_costResult3(integer,integer,integer,integer,float8)
pgr_geomResult(integer,integer,integer,geometry)
#FUNCTIONS
_pgr_checkverttab(text,text[],in int ,in text ,out text,out text)
_pgr_createindex(text,text,text,text,in int ,in text )
_pgr_createindex(text,text,text,in int ,in text )
_pgr_dijkstra(text,bigint,bigint,boolean,boolean ,out integer,out integer,out bigint,out bigint,out float,out float)
_pgr_dijkstra(text,bigint,anyarray,boolean ,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
_pgr_dijkstra(text,anyarray,bigint,boolean ,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
_pgr_dijkstra(text,anyarray,anyarray,boolean ,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out bigint,out float,out float)
_pgr_drivingdistance(text,bigint,float8,boolean,out integer,out bigint,out bigint,out float,out float)
_pgr_drivingdistance(text,anyarray,float8,boolean,boolean,out integer,out bigint,out bigint,out bigint,out float,out float)
_pgr_endpoint(geometry)
_pgr_getcolumnname(text,text,text,in int ,in text )
_pgr_getcolumnname(text,text,in int ,in text )
_pgr_getcolumntype(text,text,text,in int ,in text )
_pgr_getcolumntype(text,text,in int ,in text )
_pgr_gettablename(in text,in int ,in text ,out text,out text)
_pgr_get_statement(text)
_pgr_iscolumnintable(text,text)
_pgr_iscolumnindexed(text,text,text,in int ,in text )
_pgr_iscolumnindexed(text,text,in int ,in text )
_pgr_ksp(text,bigint,bigint,integer,boolean,boolean,out integer,out integer,out integer,out bigint,out bigint,out float,out float)
_pgr_makedistancematrix(text,out double precision[],out integer[])
_pgr_msg(in int,in text,in text )
_pgr_onerror(in boolean,in int,in text,in text,in text ,in text )
_pgr_parameter_check(text,text,boolean )
_pgr_pointtoid(geometry,double precision,text,integer)
_pgr_quote_ident(text)
_pgr_startpoint(geometry)
_pgr_trsp(text,integer,integer,boolean,boolean,text )
_pgr_trspviavertices(text,integer[],boolean,boolean,text )
_pgr_versionless(text,text)
_pgr_withpoints(text,text,bigint,bigint,boolean,char,boolean,boolean ,out integer,out integer,out bigint,out bigint,out float,out float)
_pgr_withpoints(text,text,bigint,anyarray,boolean,char,boolean,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
_pgr_withpoints(text,text,anyarray,bigint,boolean,char,boolean,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
_pgr_withpoints(text,text,anyarray,anyarray,boolean,char,boolean,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out bigint,out float,out float)
_pgr_withpointsvia(text,bigint[],float[],boolean ,out integer,out integer,out integer,out bigint,out bigint,out bigint,out bigint,out float,out float,out float)
pgr_alphashape(text,float8 ,out float8,out float8)
pgr_analyzeoneway(text,text[],text[],text[],text[],boolean ,text ,text ,text )
pgr_analyzegraph(text,double precision,text ,text ,text ,text ,text )
pgr_apspjohnson(text)
pgr_apspwarshall(text,boolean,boolean)
pgr_astar(text,integer,integer,boolean,boolean)
pgr_bdastar(text,integer,integer,boolean,boolean)
pgr_bddijkstra(text,integer,integer,boolean,boolean)
pgr_createtopology(text,double precision,text ,text ,text ,text ,text ,boolean )
pgr_createverticestable(text,text ,text ,text ,text )
pgr_dijkstra(text,bigint,bigint,out integer,out integer,out bigint,out bigint,out float,out float)
pgr_dijkstra(text,bigint,bigint,boolean,out integer,out integer,out bigint,out bigint,out float,out float)
pgr_dijkstra(text,bigint,anyarray,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
pgr_dijkstra(text,integer,integer,boolean,boolean)
pgr_dijkstra(text,anyarray,bigint,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
pgr_dijkstra(text,anyarray,anyarray,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out bigint,out float,out float)
pgr_dijkstracost(text,bigint,bigint,boolean ,out bigint,out bigint,out float)
pgr_dijkstracost(text,bigint,anyarray,boolean ,out bigint,out bigint,out float)
pgr_dijkstracost(text,anyarray,bigint,boolean ,out bigint,out bigint,out float)
pgr_dijkstracost(text,anyarray,anyarray,boolean ,out bigint,out bigint,out float)
pgr_dijkstravia(text,anyarray,boolean ,boolean ,boolean ,out integer,out integer,out integer,out bigint,out bigint,out bigint,out bigint,out float,out float,out float)
pgr_drivingdistance(text,bigint,float8,boolean,boolean)
pgr_drivingdistance(text,bigint,float8,boolean ,out integer,out bigint,out bigint,out float,out float)
pgr_drivingdistance(text,anyarray,float8,boolean ,boolean ,out integer,out bigint,out bigint,out bigint,out float,out float)
pgr_endpoint(geometry)
pgr_flipedges(geometry[])
pgr_floydwarshall(text,boolean ,out bigint,out bigint,out float)
pgr_getcolumnname(text,text)
pgr_gettablename(in text,out text,out text)
pgr_gsoc_vrppdtw(text,integer,integer,out integer,out integer,out integer,out integer )
pgr_iscolumnintable(text,text)
pgr_iscolumnindexed(text,text)
pgr_johnson(text,boolean ,out bigint,out bigint,out float)
pgr_kdijkstrapath(text,integer,integer array,boolean,boolean)
pgr_kdijkstracost(text,integer,integer array,boolean,boolean)
pgr_ksp(text,bigint,bigint,integer,boolean ,boolean ,out integer,out integer,out integer,out bigint,out bigint,out float,out float)
pgr_ksp(text,integer,integer,integer,boolean)
pgr_labelgraph(text,text ,text ,text ,text ,text )
pgr_nodenetwork(text,double precision,text ,text ,text ,text ,boolean )
pgr_pointsaspolygon(varchar,float8 )
pgr_pointstodmatrix(geometry[],integer )
pgr_pointstovids(geometry[],text,float8 )
pgr_pointtoedgenode(text,geometry,float8)
pgr_quote_ident(text)
pgr_startpoint(geometry)
pgr_texttopoints(text,integer )
pgr_trsp(text,integer,integer,boolean,boolean,text )
pgr_trsp(text,integer,float8,integer,float8,boolean,boolean,text )
pgr_trspviaedges(text,integer[],float8[],boolean,boolean,text )
pgr_trspviavertices(text,anyarray,boolean,boolean,text )
pgr_tsp(float8[][],integer,integer ,out integer,out integer)
pgr_tsp(text,integer,integer )
pgr_version()
pgr_versionless(text,text)
pgr_vidstodmatrix(text,integer[],bool,bool,bool)
pgr_vidstodmatrix(in integer[],in geometry[],in text,float8 )
pgr_vrponedepot(text,text,text,integer,out integer,out integer,out integer,out integer,out integer)
pgr_withpoints(text,text,bigint,bigint,boolean ,char ,boolean ,out integer,out integer,out bigint,out bigint,out float,out float)
pgr_withpoints(text,text,bigint,anyarray,boolean ,char ,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
pgr_withpoints(text,text,anyarray,bigint,boolean ,char ,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out float,out float)
pgr_withpoints(text,text,anyarray,anyarray,boolean ,char ,boolean ,out integer,out integer,out bigint,out bigint,out bigint,out bigint,out float,out float)
pgr_withpointscost(text,text,bigint,bigint,boolean ,char ,out bigint,out bigint,out float)
pgr_withpointscost(text,text,bigint,anyarray,boolean ,char ,out bigint,out bigint,out float)
pgr_withpointscost(text,text,anyarray,bigint,boolean ,char ,out bigint,out bigint,out float)
pgr_withpointscost(text,text,anyarray,anyarray,boolean ,char ,out bigint,out bigint,out float)
pgr_withpointsdd(text,text,anyarray,float,boolean ,char ,boolean ,boolean ,out integer,out bigint,out bigint,out bigint,out float,out float)
pgr_withpointsdd(text,text,bigint,float,boolean ,char ,boolean ,out integer,out bigint,out bigint,out float,out float)
pgr_withpointsksp(text,text,bigint,bigint,integer,boolean ,boolean ,char ,boolean ,out integer,out integer,out integer,out bigint,out bigint,out float,out float)
