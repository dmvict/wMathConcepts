( function _Capsule_test_s_( ) {

'use strict';

// return;

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }


  var _ = _global_.wTools;

  _.include( 'wTesting' );
  _.include( 'wMathVector' );
  _.include( 'wMathSpace' );

  require( '../geometric/aConcepts.s' );

}

//

var _ = _global_.wTools.withArray.Float32;
var Space = _.Space;
var vector = _.vector;
var vec = _.vector.fromArray;
var avector = _.avector;
var sqrt = _.sqrt;
var Parent = _.Tester;

_.assert( _.routineIs( sqrt ) );

// --
// test
// --

function make( test )
{
  test.case = 'Default'; /* */

  var gotCapsule = _.capsule.make();
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );

  test.case = 'srcDim undefined'; /* */

  var srcDim = undefined;
  var gotCapsule = _.capsule.make( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim null'; /* */

  var srcDim = null;
  var gotCapsule = _.capsule.make( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim 2'; /* */

  var srcDim = 2;
  var gotCapsule = _.capsule.make( srcDim );
  var expected = [ 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim array'; /* */

  var srcDim = [ 0, 1, 2, 3, 4 ];
  var gotCapsule = _.capsule.make( srcDim );
  var expected = [ 0, 1, 2, 3, 4 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim vector'; /* */

  var srcDim = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotCapsule = _.capsule.make( srcDim );
  var expected = [ 0, 1, 2, 3, 4 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.make( [ 0, 0, 0 ], [ 1, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.make( [ 0, 0, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.make( 'capsule' ));
}

//

function makeZero( test )
{
  test.case = 'Default'; /* */

  var gotCapsule = _.capsule.makeZero();
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );

  test.case = 'srcDim undefined'; /* */

  var srcDim = undefined;
  var gotCapsule = _.capsule.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim null'; /* */

  var srcDim = null;
  var gotCapsule = _.capsule.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim 2'; /* */

  var srcDim = 2;
  var gotCapsule = _.capsule.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim array'; /* */

  var srcDim = [ 0, 1, 2, 3, 4 ];
  var gotCapsule = _.capsule.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim vector'; /* */

  var srcDim = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotCapsule = _.capsule.makeZero( srcDim );
  var expected = [ 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.makeZero( [ 0, 0, 0 ], [ 1, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.makeZero( [ 0, 0, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.makeZero( 'capsule' ));

}

//

function makeNil( test )
{
  test.case = 'Default'; /* */

  var gotCapsule = _.capsule.makeNil();
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );

  test.case = 'srcDim undefined'; /* */

  var srcDim = undefined;
  var gotCapsule = _.capsule.makeNil( srcDim );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim null'; /* */

  var srcDim = null;
  var gotCapsule = _.capsule.makeNil( srcDim );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim 2'; /* */

  var srcDim = 2;
  var gotCapsule = _.capsule.makeNil( srcDim );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim array'; /* */

  var srcDim = [ 0, 1, 2, 3, 4 ];
  var gotCapsule = _.capsule.makeNil( srcDim );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  test.case = 'srcDim vector'; /* */

  var srcDim = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotCapsule = _.capsule.makeNil( srcDim );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcDim );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.makeNil( [ 0, 0, 0 ], [ 1, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.makeNil( [ 0, 0, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.makeNil( 'capsule' ));
}

//

function zero( test )
{
  test.case = 'Default'; /* */

  var gotCapsule = _.capsule.zero();
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );

  test.case = 'srcCapsule undefined'; /* */

  var srcCapsule = undefined;
  var gotCapsule = _.capsule.zero( srcCapsule );
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcCapsule );

  test.case = 'srcCapsule null'; /* */

  var srcCapsule = null;
  var gotCapsule = _.capsule.zero( srcCapsule );
  var expected = [ 0, 0, 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcCapsule );

  test.case = 'srcCapsule 2'; /* */

  var srcCapsule = 2;
  var gotCapsule = _.capsule.zero( srcCapsule );
  var expected = [ 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcCapsule );

  test.case = 'srcCapsule array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4 ];
  var gotCapsule = _.capsule.zero( srcCapsule );
  var expected = [ 0, 0, 0, 0, 0 ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule === srcCapsule );

  test.case = 'srcCapsule vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotCapsule = _.capsule.zero( srcCapsule );
  var expected =  _.vector.fromArray( [ 0, 0, 0, 0, 0 ] );
  test.identical( gotCapsule, expected );
  test.is( gotCapsule === srcCapsule );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.zero( [ 0, 0, 1 ], [ 0, 0, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.zero( [ 0, 0, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.zero( 'capsule' ));

}

//

function nil( test )
{
  test.case = 'Default'; /* */

  var gotCapsule = _.capsule.nil();
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );

  test.case = 'srcCapsule undefined'; /* */

  var srcCapsule = undefined;
  var gotCapsule = _.capsule.nil( srcCapsule );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcCapsule );

  test.case = 'srcCapsule null'; /* */

  var srcCapsule = null;
  var gotCapsule = _.capsule.nil( srcCapsule );
  var expected = [ Infinity, Infinity, Infinity, - Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcCapsule );

  test.case = 'srcCapsule 2'; /* */

  var srcCapsule = 2;
  var gotCapsule = _.capsule.nil( srcCapsule );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule !== srcCapsule );

  test.case = 'srcCapsule array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4 ];
  var gotCapsule = _.capsule.nil( srcCapsule );
  var expected = [ Infinity, Infinity, - Infinity, - Infinity, - Infinity ];
  test.identical( gotCapsule, expected );
  test.is( gotCapsule === srcCapsule );

  test.case = 'srcCapsule vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotCapsule = _.capsule.nil( srcCapsule );
  var expected = _.vector.fromArray( [ Infinity, Infinity, - Infinity, - Infinity, - Infinity ] );
  test.identical( gotCapsule, expected );
  test.is( gotCapsule === srcCapsule );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.nil( [ 0, 0, 1 ], [ 0, 0, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.nil( [ 0, 0, 1, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.nil( 'capsule' ));
}

//

function from( test )
{
  test.case = 'Same instance returned - array'; /* */

  var srcCapsule = [ 0, 0, 2, 2, 1 ];
  var expected = [ 0, 0, 2, 2, 1 ];

  var gotCapsule = _.capsule.from( srcCapsule );
  test.identical( gotCapsule, expected );
  test.is( srcCapsule === gotCapsule );

  test.case = 'Different instance returned - vector -> array'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 0, 2, 2, 1 ] );
  var expected = _.vector.fromArray( [ 0, 0, 2, 2, 1 ] );

  var gotCapsule = _.capsule.from( srcCapsule );
  test.identical( gotCapsule, expected );
  test.is( srcCapsule === gotCapsule );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.from( ));
  test.shouldThrowErrorSync( () => _.capsule._from( [] ));
  test.shouldThrowErrorSync( () => _.capsule.from( [ 0, 0, 0, 0 ] ));
  test.shouldThrowErrorSync( () => _.capsule.from( [ 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule.from( 'capsule' ));
  test.shouldThrowErrorSync( () => _.capsule.from( NaN ));
  test.shouldThrowErrorSync( () => _.capsule.from( undefined ));
}

//

function _from( test )
{
  test.case = 'Same instance returned - vector'; /* */

  var srcCapsule = [ 0, 0, 2, 2, 1 ];
  var expected = _.vector.from( [ 0, 0, 2, 2, 1 ] );

  var gotCapsule = _.capsule._from( srcCapsule );
  test.identical( gotCapsule, expected );
  test.is( srcCapsule !== gotCapsule );

  test.case = 'Different instance returned - vector -> vector'; /* */

  var srcCapsule = _.vector.from( [ 0, 0, 2, 2, 1 ] );
  var expected = _.vector.from( [ 0, 0, 2, 2, 1 ] );

  var gotCapsule = _.capsule._from( srcCapsule );
  test.identical( gotCapsule, expected );
  test.is( srcCapsule === gotCapsule );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule._from( ));
    test.shouldThrowErrorSync( () => _.capsule._from( [] ));
  test.shouldThrowErrorSync( () => _.capsule._from( [ 0, 0, 0, 0 ] ));
  test.shouldThrowErrorSync( () => _.capsule._from( [ 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1 ] ));
  test.shouldThrowErrorSync( () => _.capsule._from( 'capsule' ));
  test.shouldThrowErrorSync( () => _.capsule._from( NaN ));
  test.shouldThrowErrorSync( () => _.capsule._from( null ));
  test.shouldThrowErrorSync( () => _.capsule._from( undefined ));
}

//

function is( test )
{
  debugger;
  test.case = 'array'; /* */

  test.is( _.capsule.is([ 0, 0, 0 ]) );
  test.is( _.capsule.is([ 0, 1, 2, 3, 4 ]) );
  test.is( _.capsule.is([ 0, 0, 0, 0, 0, 0, 0 ]) );

  test.case = 'vector'; /* */

  test.is( _.capsule.is( _.vector.fromArray([ 0, 0, 0 ]) ) );
  test.is( _.capsule.is( _.vector.fromArray([ 0, 1, 2, 3, 4 ]) ) );
  test.is( _.capsule.is( _.vector.fromArray([ 0, 0, 0, 0, 0, 0, 0 ]) ) );

  test.case = 'not capsule'; /* */

  test.is( !_.capsule.is([ 0, 0 ]) );
  test.is( !_.capsule.is([ 0, 0, 0, 0 ]) );

  test.is( !_.capsule.is( _.vector.fromArray([ 0, 0 ]) ) );
  test.is( !_.capsule.is( _.vector.fromArray([ 0, 0, 0, 0 ]) ) );

  test.is( !_.capsule.is( 'abc' ) );
  test.is( !_.capsule.is( { start : [ 0, 0, 0 ], end : [ 1, 1, 1 ], radius : 1 } ) );
  test.is( !_.capsule.is( function( a, b, c ){} ) );

  test.is( !_.capsule.is( [] ) );
  test.is( !_.capsule.is( _.vector.fromArray([]) ) );
  test.is( !_.capsule.is( null ) );
  test.is( !_.capsule.is( NaN ) );
  test.is( !_.capsule.is( undefined ) );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.is( ));
  test.shouldThrowErrorSync( () => _.capsule.is( [ 0, 0, 0 ], [ 0, 2, 1 ] ));

}

//

function dimGet( test )
{
  test.case = 'srcCapsule 1D - array'; /* */

  var srcCapsule = [ 0, 1, 1 ];
  var gotDim = _.capsule.dimGet( srcCapsule );
  var expected = 1;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcCapsule );

  test.case = 'srcCapsule 1D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 1 ] );
  var gotDim = _.capsule.dimGet( srcCapsule );
  var expected = 1;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcCapsule );

  test.case = 'srcCapsule 2D - array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4 ];
  var gotDim = _.capsule.dimGet( srcCapsule );
  var expected = 2;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcCapsule );

  test.case = 'srcCapsule 2D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotDim = _.capsule.dimGet( srcCapsule );
  var expected = 2;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcCapsule );

  test.case = 'srcCapsule 3D - array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4, 5, 6 ];
  var gotDim = _.capsule.dimGet( srcCapsule );
  var expected = 3;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcCapsule );

  test.case = 'srcCapsule 3D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4, 5, 6 ] );
  var gotDim = _.capsule.dimGet( srcCapsule );
  var expected = 3;
  test.identical( gotDim, expected );
  test.is( gotDim !== srcCapsule );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.dimGet( ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( [] ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( [ 0, 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( [ 0, 0, 0 ], [ 1, 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( 'capsule' ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( null ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( NaN ) );
  test.shouldThrowErrorSync( () => _.capsule.dimGet( undefined ) );

}

//

function originGet( test )
{
  test.case = 'Source capsule remains unchanged'; /* */

  var srcCapsule = [ 0, 0, 1, 1, 1 ];
  var expected = _.vector.from( [ 0, 0 ] );

  var gotOrigin = _.capsule.originGet( srcCapsule );
  test.identical( gotOrigin, expected );

  var oldSrcCapsule = [ 0, 0, 1, 1, 1 ];
  test.equivalent( srcCapsule, oldSrcCapsule );

  test.case = 'srcCapsule 1D - array'; /* */

  var srcCapsule = [ 0, 1, 2 ];
  var gotOrigin = _.capsule.originGet( srcCapsule );
  var expected = _.vector.from( [ 0 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcCapsule );

  test.case = 'srcCapsule 1D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 1 ] );
  var gotOrigin = _.capsule.originGet( srcCapsule );
  var expected = _.vector.from( [ 0 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcCapsule );

  test.case = 'srcCapsule 2D - array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4 ];
  var gotOrigin = _.capsule.originGet( srcCapsule );
  var expected = _.vector.from( [ 0, 1 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcCapsule );

  test.case = 'srcCapsule 2D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotOrigin = _.capsule.originGet( srcCapsule );
  var expected = _.vector.from( [ 0, 1 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcCapsule );

  test.case = 'srcCapsule 3D - array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4, 5, 6 ];
  var gotOrigin = _.capsule.originGet( srcCapsule );
  var expected = _.vector.from( [ 0, 1, 2 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcCapsule );

  test.case = 'srcCapsule 3D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4, 5, 6 ] );
  var gotOrigin = _.capsule.originGet( srcCapsule );
  var expected = _.vector.from( [ 0, 1, 2 ] );
  test.identical( gotOrigin, expected );
  test.is( gotOrigin !== srcCapsule );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.originGet( ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( [ 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( [ 0, 0, 1 ], [ 1, 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( 'capsule' ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( null ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( NaN ) );
  test.shouldThrowErrorSync( () => _.capsule.originGet( undefined ) );

}

//

function endPointGet( test )
{
  test.case = 'Source capsule remains unchanged'; /* */

  var srcCapsule = [ 0, 0, 1, 1, 2 ];
  var expected = _.vector.from( [ 1, 1 ] );

  var gotDirection = _.capsule.endPointGet( srcCapsule );
  test.identical( gotDirection, expected );

  var oldSrcCapsule = [ 0, 0, 1, 1, 2 ];
  test.equivalent( srcCapsule, oldSrcCapsule );

  test.case = 'srcCapsule 1D - array'; /* */

  var srcCapsule = [ 0, 1, 2 ];
  var gotDirection = _.capsule.endPointGet( srcCapsule );
  var expected = _.vector.from( [ 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcCapsule );

  test.case = 'srcCapsule 1D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2 ] );
  var gotDirection = _.capsule.endPointGet( srcCapsule );
  var expected = _.vector.from( [ 1 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcCapsule );

  test.case = 'srcCapsule 2D - array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4 ];
  var gotDirection = _.capsule.endPointGet( srcCapsule );
  var expected = _.vector.from( [ 2, 3 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcCapsule );

  test.case = 'srcCapsule 2D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4 ] );
  var gotDirection = _.capsule.endPointGet( srcCapsule );
  var expected = _.vector.from( [ 2, 3 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcCapsule );

  test.case = 'srcCapsule 3D - array'; /* */

  var srcCapsule = [ 0, 1, 2, 3, 4, 5, 6 ];
  var gotDirection = _.capsule.endPointGet( srcCapsule );
  var expected = _.vector.from( [ 3, 4, 5 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcCapsule );

  test.case = 'srcCapsule 3D - vector'; /* */

  var srcCapsule = _.vector.fromArray( [ 0, 1, 2, 3, 4, 5, 6 ] );
  var gotDirection = _.capsule.endPointGet( srcCapsule );
  var expected = _.vector.from( [ 3, 4, 5 ] );
  test.identical( gotDirection, expected );
  test.is( gotDirection !== srcCapsule );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( [ 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( [ 0, 0, 1 ], [ 1, 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( 'capsule' ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( null ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( NaN ) );
  test.shouldThrowErrorSync( () => _.capsule.endPointGet( undefined ) );

}

//

function radiusGet( test )
{

  test.case = 'Source capsule remains unchanged'; /* */

  var srcCapsule = [ 0, 0, 1, 1, 2 ];
  var oldSrcCapsule = srcCapsule.slice();
  var expected =  2;

  var gotRadius = _.capsule.radiusGet( srcCapsule );

  test.equivalent( srcCapsule, oldSrcCapsule );
  test.identical( gotRadius, expected );

  test.case = 'One dimension capsule'; /* */

  var capsule = [ 0, 1, 2 ];
  var expected =  2 ;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );

  test.case = 'Two dimension capsule'; /* */

  var capsule = [ 0, 0, 1, 1, 2 ];
  var expected = 2;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );

  test.case = 'Three dimension capsule'; /* */

  var capsule = [ 0, - 1, - 2, 2, 2, 2, 3 ];
  var expected = 3;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );

  test.case = 'Four dimension capsule'; /* */

  var capsule = [ 0, - 1, - 2, 2, 4, 4, 4, 4, 3 ];
  var expected =  3;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );

  test.case = 'negative radius'; /* */

  var capsule = [ 1, 2, 3, 4, - 3 ];
  var expected = - 3;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );


  test.case = 'NaN radius'; /* */

  var capsule = [ 1, 2, 3, 4, NaN ];
  var expected = NaN;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );

  test.case = 'NaN capsule'; /* */

  var capsule = [ NaN, NaN, NaN ];
  var expected = NaN;

  var gotRadius = _.capsule.radiusGet( capsule );
  test.identical( gotRadius, expected );


  test.case = 'radiusGet+Set two dimensions'; /* */

  var capsule = [ 0, 1, 2, 2, 1 ];
  var radiusOld = 1;
  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radiusSph, radiusOld );

  var radius = 2;
  var expected = [ 0, 1, 2, 2, 2 ];
  expected = _.vector.from(expected);
  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radius, radiusSph );

  test.case = 'radiusGet+Set three dimensions'; /* */

  var capsule = [ 0, 0, 1, 1, 1, 2, 1 ];
  var radiusOld = 1;
  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radiusOld, radiusSph );

  var radius = 2;
  var expected = [ 0, 0, 1, 1, 1, 2, 2 ];
  expected = _.vector.from(expected);
  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.equivalent( gotCapsule, expected );

  var radiusSph = _.capsule.radiusGet( gotCapsule );
  test.equivalent( radius, radiusSph );

  /* */

  if( !Config.debug )
  return;
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( [ ] ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( [ 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( [ 0, 0, 1 ], [ 1, 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( 'capsule' ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( null ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( NaN ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusGet( undefined ) );

}

//

function radiusSet( test )
{

  test.case = 'Source radius remains unchanged'; /* */

  var capsule = [ 0, 0, 1, 1, 0 ];
  var srcRadius = 2;
  var expected =  [ 0, 0, 1, 1, 2 ] ;
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, srcRadius );
  test.identical( gotCapsule, expected );

  var oldSrcRadius = 2;
  test.equivalent( srcRadius, oldSrcRadius );

  test.case = 'One dimension capsule'; /* */

  var capsule = [ 0, 1, 0 ];
  var radius = 2;
  var expected = [ 0, 1, 2 ] ;
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'Two dimension capsule'; /* */

  var capsule = [ 0, 0, 1, 1, 2 ];
  var radius = 3;
  var expected = [ 0, 0, 1, 1, 3 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'Three dimension capsule'; /* */

  var capsule = [ 0, - 1, - 2, 1, 1, 1, 2 ];
  var radius = 4;
  var expected = [ 0, - 1, - 2, 1, 1, 1, 4 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'Four dimension capsule'; /* */

  var capsule = [ 0, - 1, - 2, 2, 2, 2, 2, 2, 0 ];
  var radius = 5;
  var expected =  [ 0, - 1, - 2, 2, 2, 2, 2, 2, 5 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'negative radius'; /* */

  var capsule = [ 1, 2, - 3 ];
  var radius = - 2;
  var expected = [ 1, 2, - 2 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'NaN radius'; /* */

  var capsule = [ 1, 2, 3 ];
  var radius = NaN;
  var expected = [ 1, 2, NaN ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'NaN capsule'; /* */

  var capsule = [ NaN, NaN, NaN ];
  var radius = 2;
  var expected = [ NaN, NaN, 2 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  test.case = 'radiusSet+Get one dimensions'; /* */

  var capsule = [ 0, 2, 3 ];
  var radiusOld = 3;
  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radiusOld, radiusSph );

  var radius = 2;
  var expected = [ 0, 2, 2 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radius, radiusSph );

  test.case = 'radiusSet+Get two dimensions'; /* */

  var capsule = [ 0, 0, 1, 1, 3 ];
  var radiusOld = 3;
  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radiusOld, radiusSph );

  var radius = 2;
  var expected = [ 0, 0, 1, 1, 2 ];
  expected = _.vector.from(expected);

  var gotCapsule = _.capsule.radiusSet( capsule, radius );
  test.identical( gotCapsule, expected );

  var radiusSph = _.capsule.radiusGet( capsule );
  test.equivalent( radius, radiusSph );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.radiusSet( ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( 0, 1 ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( [ ] ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( [ 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( [ 0, 0, 1 ], [ 1, 1, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( 'radius' ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( null ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( NaN ) );
  test.shouldThrowErrorSync( () => _.capsule.radiusSet( undefined ) );

}

//

function pointContains( test )
{

  test.case = 'Capsule and Point remain unchanged'; /* */

  var capsule = [  - 1,  - 1 , 1, 1, 1 ];
  var point = [ 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1,  - 1 , 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null capsule contains point'; /* */

  var capsule = null;
  var point = [ 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Point capsule contains Point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Capsule capsule contains point'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0 ];
  var point = [  1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Capsule capsule doesn´t contain point'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0 ];
  var point = [  1, 1, 1.1 ];
  var expected = false;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Sphere capsule contains point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 1 ];
  var point = [  1, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Sphere capsule doesn´t contain point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 1 ];
  var point = [  1, 1, 0 ];
  var expected = false;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );


  test.case = 'Capsule under point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 2, 1 ];
  var point = [ 0, 1, 4 ];
  var expected = false;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Point closer to origin'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 2, 1 ];
  var point = [ 0, 0, -2 ];
  var expected = false;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Capsule of four dimensions contains point'; /* */

  var capsule = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1, 1 ];
  var point = [ 0, 0, 0, 1 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Capsule of four dimensions doesn´t contain point'; /* */

  var capsule = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1, 1 ];
  var point = [ 0, 0, 0 , 2 ];
  var expected = false;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Capsule of 1 dimension contains point'; /* */

  var capsule = [ 0, 2, 1 ];
  var point = [ 1 ];
  var expected = true;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  test.case = 'Capsule of 1 dimension desn´t contain point '; /* */

  var capsule = [ 0, 2, 1 ];
  var point = [ - 3 ];
  var expected = false;

  var gotBool = _.capsule.pointContains( capsule, point );
  test.identical( gotBool,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.pointContains( ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 1, 1, 2, 2, 1 ], 'capsule') );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointContains( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function pointDistance( test )
{

  test.case = 'Capsule and Point remain unchanged'; /* */

  var capsule = [  - 1,  - 1 , 1, 1, 0 ];
  var point = [ 0, 0 ];
  var expected = 0;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance, expected );

  var oldCapsule = [  - 1,  - 1 , 1, 1, 0 ];
  test.identical( capsule, oldCapsule );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null capsule Distance empty point'; /* */

  var capsule = null;
  var point = [ 0, 0, 0 ];
  var expected = 0;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Point capsule Distance same Point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = 0;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Point capsule Distance other Point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var point = [ 3, 4, 0 ];
  var expected = 5;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Capsule contains point in the middle'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var point = [  1, 1, 1 ];
  var expected = 0;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Capsule contains point'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var point = [  1, 1, 1.5 ];
  var expected = 0;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Capsule under point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 2, 1 ];
  var point = [ 0, 1, 4 ];
  var expected = Math.sqrt( 5 ) - 1;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Point closer to origin'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 2, 1 ];
  var point = [ 0, 0, - 2 ];
  var expected = 1;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Capsule of four dimensions distance '; /* */

  var capsule = [ - 1, - 1, - 1, - 1, 1, 1, 1, 1, 2 ];
  var point = [ 0, 0, 0 , 4 ];
  var expected = Math.sqrt( 12 ) - 2;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Capsule of 1 dimension contains point'; /* */

  var capsule = [ 0, 2, 1 ];
  var point = [ 1 ];
  var expected = 0;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );

  test.case = 'Capsule of 1 dimension distance'; /* */

  var capsule = [ 0, 2, 2 ];
  var point = [ - 3 ];
  var expected = 1;

  var gotDistance = _.capsule.pointDistance( capsule, point );
  test.identical( gotDistance,  expected );
  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.pointDistance( ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 1, 1, 2, 2 ], 'point') );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointDistance( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function pointClosestPoint( test )
{

  test.case = 'Capsule and Point remain unchanged'; /* */

  var capsule = [  - 1,  - 1 , 1, 1, 1 ];
  var point = [ 0, 0 ];
  var expected = [ 0, 0 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint, expected );

  var oldCapsule = [  - 1,  - 1 , 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldPoint = [ 0, 0 ];
  test.identical( point, oldPoint );

  test.case = 'Null capsule - empty point'; /* */

  var capsule = null;
  var point = [ 0, 0, 0 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Point capsule - same Point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var point = [ 0, 0, 0 ];
  var expected = [ 0, 0, 0 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Point capsule - other Point'; /* */

  var capsule = [ 1, 2, 3, 0, 0, 0, 0 ];
  var point = [ 3, 4, 5 ];
  var expected = [ 1, 2, 3 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Capsule contains point in the middle'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var point = [ 1, 1, 1 ];
  var expected = [ 1, 1, 1 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Capsule contains point'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var point = [ 1.2, 0.9, 1.3 ];
  var expected = [ 1.2, 0.9, 1.3 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Capsule under point'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 2, 1 ];
  var point = [ 0, 0, 4 ];
  var expected = [ 0, 0, 3 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Point closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var point = [ - 2, - 2, - 2 ];
  var expected = [ - 1 /Math.sqrt( 3 ), - 1 /Math.sqrt( 3 ), - 1 /Math.sqrt( 3 ) ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Capsule of four dimensions distance '; /* */

  var capsule = [ - 1, - 1, - 1, - 1, 3, 3, 3, 3, 1 ];
  var point = [ 0, 0, 0, 2 ];
  var expected = [ 0.21132486540518708, 0.21132486540518708, 0.21132486540518708, 1.3660254037844388 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Capsule of 1 dimension contains point'; /* */

  var capsule = [ 0, 2, 1 ];
  var point = [ 1 ];
  var expected = [ 1 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );

  test.case = 'Capsule of 1 dimension distance'; /* */

  var capsule = [ 0, 2, 1 ];
  var point = [ - 3 ];
  var expected = [ - 1 ];

  var gotClosestPoint = _.capsule.pointClosestPoint( capsule, point );
  test.identical( gotClosestPoint,  expected );
  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 1, 1, 2, 2 ], 'point') );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 1, 1, 2, 2 ], [ 1, 2, 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.pointClosestPoint( [ 1, 1, 2, 2 ], [ 1, 2 ] ) );

}

//

function boxContains( test )
{

  test.case = 'Capsule and box remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null capsule - empty box'; /* */

  var capsule = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - same box'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - no intersection'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 2, 0.5 ];
  var box = [ 1, 2, 4, 3, 4, 0 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'point capsule in box'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule contains box'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule and box intersect'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 2, 1 ];
  var box = [ 0, 0, 2, 4, 4, 5 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule over box'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 0.5 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'box closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.75 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = '2D intersection'; /* */

  var capsule = [ 0, 0, 2, 2, 1 ];
  var box = [ 1, 2, 3, 4 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = '2D no intersection'; /* */

  var capsule = [ 0, 0, 2, -2, 1 ];
  var box = [ 1, 2, 3, 4 ];
  var expected = false;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );

  test.case = '2D contained'; /* */

  var capsule = [ 0, 0, 2, 2, 1 ];
  var box = [ 1, 1, 2, 2 ];
  var expected = true;

  var gotBool = _.capsule.boxContains( capsule, box );
  test.identical( gotBool,  expected );


  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.boxContains( ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( [ 1, 1, 2, 2, 1 ], 'box') );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( [ 1, 1, 2, 2, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( [ 1, 1, 2, 2, 1 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( [ 1, 1, 2, 2, 1 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxContains( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2 ] ) );

}

//

function boxIntersects( test )
{

  test.case = 'Capsule and box remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null capsule - empty box'; /* */

  var capsule = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - same box'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - no intersection'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var box = [ 1, 2, 4, 3, 4, 0 ];
  var expected = false;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'sphere capsule in box'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0.1 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule contains box'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule and box intersect'; /* */

  var capsule = [ 0, 0, -2, 0, 0, 2, 1 ];
  var box = [ 0, 0, 1, 4, 4, 4 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule over box'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 0.5 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = false;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'box closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.75 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = false;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = '2D intersection'; /* */

  var capsule = [ 0, 0, 2, 2, 0.2 ];
  var box = [ 1, 2, 3, 4 ];
  var expected = true;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );

  test.case = '2D no intersection'; /* */

  var capsule = [ 0, 0, 2, -2, 0.3 ];
  var box = [ 1, 2, 3, 4 ];
  var expected = false;

  var gotBool = _.capsule.boxIntersects( capsule, box );
  test.identical( gotBool,  expected );


  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 1, 1, 2, 2, 1 ], 'box') );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 1, 1, 2, 2, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 1, 1, 2, 2, 1 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 1, 1, 2, 2, 1 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxIntersects( [ 1, 1, 2, 2, -1 ], [ 1, 1, 2, 2 ] ) );

}

//

function boxDistance( test )
{
  test.case = 'Capsule and box remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null capsule - empty box'; /* */

  var capsule = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'box capsule - same box'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'point capsule'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var box = [ 1, 2, 4, 3, 4, 5 ];
  var expected = 1;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'sphere capsule in box'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0.1 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = 0;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule and box intersect'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'Capsule over box'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 1 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = Math.sqrt( 2 ) - 1;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'box corner closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.5 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = Math.sqrt( 3 ) - 0.5;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  test.case = 'box side closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.2 ];
  var box = [ -1, -1, -1, 0.5, 0.5, - 0.3 ];
  var expected = 0.1;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.equivalent( gotBool,  expected );

  test.case = '2D'; /* */

  var capsule = [ 2, 2, 3, 3, 1 ];
  var box = [ 0, 0, 1, 1 ];
  var expected = Math.sqrt( 2 ) - 1;

  var gotBool = _.capsule.boxDistance( capsule, box );
  test.identical( gotBool,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.boxDistance( ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 1, 1, 2, 2, 1 ], 'box') );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 1, 1, 2, 2, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 1, 1, 2, 2, 1 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 1, 1, 2, 2, 1 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxDistance( [ 1, 1, 2, 2, -1 ], [ 1, 1, 2, 2 ] ) );

}

//

function boxClosestPoint( test )
{
  test.case = 'Capsule and box remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldBox = [ 0, 0, 0, 1, 1, 1 ];
  test.identical( box, oldBox );

  test.case = 'Null capsule - empty box'; /* */

  var capsule = null;
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'box capsule - same box'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var box = [ 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'point capsule'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var box = [ 1, 2, 4, 3, 4, 0 ];
  var expected = [ 1, 2, 3 ];

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'sphere capsule in box'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0.1 ];
  var box = [ 1, 2, 2, 3, 4, 4 ];
  var expected = 0;

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'Capsule and box intersect'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 1 ];
  var box = [ 0, 0, 0, 1, 1, 1 ];
  var expected = 0;

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'Capsule over box'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 0.5 ];
  var box = [ 0, 1, 1, 3, 7, 3 ];
  var expected = [ 0, 0.35355339059327373, 3.646446609406726 ];

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'box corner closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var box = [ - 2, - 2, - 2, -1, -1, -1 ];
  var expected = [ - 1 / Math.sqrt( 3 ), - 1 / Math.sqrt( 3 ), - 1 / Math.sqrt( 3 ) ];

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'box side closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.1 ];
  var box = [ -1, -1, -1, 0.5, 0.5, - 0.3 ];
  var expected = [ 0, 0, - 0.1 ];

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = 'box corner closer to end'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 1 ];
  var box = [ 6, 6, 8, 6, 9, 10 ];
  var expected = [ 2.485071250072666, 2.485071250072666, 2.727606875108999 ];

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  test.case = '2D'; /* */

  var capsule = [ 0, 0, 2, 10, 1 ];
  var box = [ 6, 7, 10, 8 ];
  var expected = [ 2.7498114449216895, 8.650037711015663 ];

  var gotPoint = _.capsule.boxClosestPoint( capsule, box );
  test.identical( gotPoint,  expected );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 1, 1, 2, 2 ], 'box') );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 1, 1, 2, 2 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 1, 1, 2, 2 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 1, 1, 2, 2 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.boxClosestPoint( [ 1, 1, 2, 2, -1 ], [ 1, 1, 2, 2 ] ) );

}

//

function capsuleIntersects( test )
{

  test.case = 'Capsules remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var tstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldTstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  test.identical( tstCapsule, oldTstCapsule );

  test.case = 'Null capsule - empty capsule'; /* */

  var capsule = null;
  var tstCapsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - same capsule'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var tstCapsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - no intersection'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var tstCapsule = [ 1, 2, 4, 3, 4, 0, 0.5 ];
  var expected = false;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'sphere capsule in capsule'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0.1 ];
  var tstCapsule = [ 1, 2, 2, 3, 4, 4, 2 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsule contains capsule'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 2 ];
  var tstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsules intersect'; /* */

  var capsule = [ 0, 0, -2, 0, 0, 2, 1 ];
  var tstCapsule = [ 0, 0, 0, 0, 4, 0, 0.2 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsule over capsule'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 0.5 ];
  var tstCapsule = [ 0, 1, 1, 3, 7, 3, 1 ];
  var expected = false;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'capsule closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.75 ];
  var tstCapsule = [ - 2, - 2, - 2, -1, -1, -1, 0.1 ];
  var expected = false;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = '2D intersection'; /* */

  var capsule = [ 0, 0, 2, 2, 0.2 ];
  var tstCapsule = [ 1, 2, 3, 4, 1 ];
  var expected = true;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = '2D no intersection'; /* */

  var capsule = [ 0, 0, 2, -2, 0.3 ];
  var tstCapsule = [ 1, 2, 3, 4, 0.2 ];
  var expected = false;

  var gotBool = _.capsule.capsuleIntersects( capsule, tstCapsule );
  test.identical( gotBool,  expected );


  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, 1 ], 'capsule') );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, 1 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, 1 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, 1 ], [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, -1 ], [ 1, 1, 2, 2, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleIntersects( [ 1, 1, 2, 2, 1 ], [ 1, 1, 2, 2, - 1 ] ) );

}

//

function capsuleDistance( test )
{

  test.case = 'Capsules remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var tstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldTstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  test.identical( tstCapsule, oldTstCapsule );

  test.case = 'Null capsule - empty capsule'; /* */

  var capsule = null;
  var tstCapsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - same capsule'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var tstCapsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - no intersection'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var tstCapsule = [ 1, 2, 4, 3, 4, 0, 0.5 ];
  var expected = 0.07735026918962584;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'sphere capsule in capsule'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0.1 ];
  var tstCapsule = [ 1, 2, 2, 3, 4, 4, 2 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsule contains capsule'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 2 ];
  var tstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsules intersect'; /* */

  var capsule = [ 0, 0, -2, 0, 0, 2, 1 ];
  var tstCapsule = [ 0, 0, 0, 0, 4, 0, 0.2 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsule over capsule'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 0.5 ];
  var tstCapsule = [ 0, 1, 1, 3, 7, 3, 1 ];
  var expected = 1.6622776601683795;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'capsule closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.75 ];
  var tstCapsule = [ - 2, - 2, - 2, -1, -1, -1, 0.1 ];
  var expected = 0.8820508075688772;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = '2D intersection'; /* */

  var capsule = [ 0, 0, 2, 2, 0.2 ];
  var tstCapsule = [ 1, 2, 3, 4, 1 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = '2D no intersection'; /* */

  var capsule = [ 0, 0, 2, -2, 0.3 ];
  var tstCapsule = [ 1, 2, 3, 4, 0.2 ];
  var expected = 1.7360679774997898;

  var gotBool = _.capsule.capsuleDistance( capsule, tstCapsule );
  test.identical( gotBool,  expected );


  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, 1 ], 'capsule') );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, 1 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, 1 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, 1 ], [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, -1 ], [ 1, 1, 2, 2, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleDistance( [ 1, 1, 2, 2, 1 ], [ 1, 1, 2, 2, - 1 ] ) );

}

//

function capsuleClosestPoint( test )
{

  test.case = 'Capsules remain unchanged'; /* */

  var capsule = [  - 1,  - 1, -1, 1, 1, 1, 1 ];
  var tstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool, expected );

  var oldCapsule = [  - 1, - 1, -1, 1, 1, 1, 1 ];
  test.identical( capsule, oldCapsule );

  var oldTstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  test.identical( tstCapsule, oldTstCapsule );

  test.case = 'Null capsule - empty capsule'; /* */

  var capsule = null;
  var tstCapsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - same capsule'; /* */

  var capsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var tstCapsule = [ 0, 0, 0, 0, 0, 0, 0 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'point capsule - no intersection'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0 ];
  var tstCapsule = [ 1, 2, 4, 3, 4, 0, 0.5 ];
  var expected = [ 1, 2, 3 ];

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'sphere capsule in capsule'; /* */

  var capsule = [ 1, 2, 3, 1, 2, 3, 0.1 ];
  var tstCapsule = [ 1, 2, 2, 3, 4, 4, 2 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsule contains capsule'; /* */

  var capsule = [ -2, -2, -2, 2, 2, 2, 2 ];
  var tstCapsule = [ 0, 0, 0, 1, 1, 1, 1 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsules intersect'; /* */

  var capsule = [ 0, 0, -2, 0, 0, 2, 1 ];
  var tstCapsule = [ 0, 0, 0, 0, 4, 0, 0.2 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'Capsule over capsule'; /* */

  var capsule = [ 0, 0, 4, 0, 0, 6, 0.5 ];
  var tstCapsule = [ 0, 1, 1, 3, 7, 3, 1 ];
  var expected = [ 0, 0.15811388300841897, 3.525658350974743 ];

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'capsule closer to origin'; /* */

  var capsule = [ 0, 0, 0, 2, 2, 2, 0.75 ];
  var tstCapsule = [ - 2, - 2, - 2, -1, -1, -1, 0.1 ];
  var expected = [ - 0.4330127018922194,  - 0.4330127018922194,  - 0.4330127018922194 ];

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = '2D intersection'; /* */

  var capsule = [ 0, 0, 2, 2, 0.2 ];
  var tstCapsule = [ 1, 2, 3, 4, 1 ];
  var expected = 0;

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = '2D no intersection'; /* */

  var capsule = [ 0, 0, 2, -2, 0.3 ];
  var tstCapsule = [ 1, 2, 3, 4, 0.2 ];
  var expected = [ 0.13416407864998736, 0.2683281572999747 ];

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule );
  test.identical( gotBool,  expected );

  test.case = 'dstPoint is vector'; /* */

  var capsule = [ 0, 0, 1, 0, 1 ];
  var tstCapsule = [ 0, 2, 1, 2, 0.5 ];
  var dstPoint = _.vector.from( [ 0, 0 ]);
  var expected =  _.vector.from( [ 0, 1 ] );

  var gotBool = _.capsule.capsuleClosestPoint( capsule, tstCapsule, dstPoint );
  test.identical( gotBool,  expected );


  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 0, 0, 0 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( 'capsule', [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, 1 ], 'capsule') );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( 0 ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( undefined, [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, 1 ], null ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, 1 ], undefined ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, 1 ], - 2 ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, 1 ], [ 1, 1, 2, 2 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2 ], [ 1, 1, 2, 2, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, -1 ], [ 1, 1, 2, 2, 1 ] ) );
  test.shouldThrowErrorSync( () => _.capsule.capsuleClosestPoint( [ 1, 1, 2, 2, 1 ], [ 1, 1, 2, 2, - 1 ] ) );

}




// --
// define class
// --

var Self =
{

  name : 'Tools/Math/Capsule',
  silencing : 1,
  enabled : 1,
  // routine: 'is',

  tests :
  {
    make : make,
    makeZero : makeZero,
    makeNil : makeNil,

    zero : zero,
    nil : nil,

    from : from,
    _from : _from,

    is : is,
    dimGet : dimGet,
    originGet : originGet,
    endPointGet : endPointGet,
    radiusGet : radiusGet,
    radiusSet : radiusSet,

    pointContains : pointContains,
    pointDistance : pointDistance,
    pointClosestPoint : pointClosestPoint,

    boxContains : boxContains,
    boxIntersects : boxIntersects,
    boxDistance : boxDistance,
    boxClosestPoint : boxClosestPoint,

    capsuleIntersects : capsuleIntersects,
    capsuleDistance : capsuleDistance,
    capsuleClosestPoint : capsuleClosestPoint,


  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
