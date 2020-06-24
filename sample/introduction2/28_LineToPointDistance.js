if( typeof module !== 'undefined' )
require( 'wmathmodels' );

var _ = wTools;

/* */

var point = [ 3, 2 ];
var line = [ -4, 4, 0 ];
var distance = _.plane.pointDistance( line, point );
console.log( `Distance from straight to point : ${ _.toStr( distance, { precision : 2 } ) }` );
/* log : Distance from straight to point: -0.71*/
