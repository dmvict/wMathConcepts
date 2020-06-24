if( typeof module !== 'undefined' )
require( 'wmathmodels' );

var _ = wTools;

/* */

var plane = [ 1, 0, 0, 1 ];
var line = [ 1, 0, 1, 1, 1, 1 ];
var intersected = _.plane.lineIntersects( plane, line );
console.log( `Plane intersects with line : ${ intersected }` );
/* log : Plane intersects with line : true */
