import Symbol from 'core-js-pure/features/symbol';

QUnit.test('Symbol.asyncDispose', assert => {
  assert.ok('asyncDispose' in Symbol, 'Symbol.asyncDispose available');
  assert.ok(Object(Symbol.asyncDispose) instanceof Symbol, 'Symbol.asyncDispose is symbol');
});
