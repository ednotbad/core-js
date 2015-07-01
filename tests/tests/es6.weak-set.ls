QUnit.module \ES6

isFunction = -> typeof! it is \Function

{freeze} = Object

eq = strictEqual

test 'WeakSet' !->
  ok isFunction(WeakSet), 'Is function'
  ok /native code/.test(WeakSet), 'looks like native'
  if \name of WeakSet => eq WeakSet.name, \WeakSet, 'name is "WeakSet"'
  eq WeakSet.length, 0, 'length is 0'
  ok \add    of WeakSet::, 'add in WeakSet.prototype'
  ok \delete of WeakSet::, 'delete in WeakSet.prototype'
  ok \has    of WeakSet::, 'has in WeakSet.prototype'
  ok new WeakSet instanceof WeakSet, 'new WeakSet instanceof WeakSet'
  ok new WeakSet([a = {}].values!).has(a), 'Init WeakSet from iterator #1'
  ok new WeakSet([a = {}]).has(a), 'Init WeakSet from iterator #2'
  ok new WeakSet([freeze f = {}]).has(f), 'Support frozen objects'
  S = new WeakSet
  S.add freeze f = {}
  eq S.has(f), on
  S.delete f
  eq S.has(f), no
  # return #throw
  done = no
  iter = [null, 1, 2]values!
  iter.return = -> done := on
  try => new WeakSet iter
  ok done, '.return #throw'
  ok !(\clear of WeakSet::), 'should not contains `.clear` method'
test 'WeakSet#add' !->
  ok isFunction(WeakSet::add), 'Is function'
  ok /native code/.test(WeakSet::add), 'looks like native'
  ok new WeakSet!add(a = {}), 'WeakSet.prototype.add works with object as keys'
  ok (try new WeakSet!add(42); no; catch => on), 'WeakSet.prototype.add throw with primitive keys'
test 'WeakSet#delete' !->
  ok isFunction(WeakSet::delete), 'Is function'
  ok /native code/.test(WeakSet::delete), 'looks like native'
  S = new WeakSet!
    .add a = {}
    .add b = {}
  ok S.has(a) && S.has(b), 'WeakSet has values before .delete()'
  S.delete a
  ok !S.has(a) && S.has(b), 'WeakSet has`nt value after .delete()'
test 'WeakSet#has' !->
  ok isFunction(WeakSet::has), 'Is function'
  ok /native code/.test(WeakSet::has), 'looks like native'
  M = new WeakSet!
  ok not M.has({}), 'WeakSet has`nt value'
  M.add a = {}
  ok M.has(a), 'WeakSet has value after .add()'
  M.delete a
  ok not M.has(a), 'WeakSet has`nt value after .delete()'
test 'WeakSet::@@toStringTag' !->
  eq WeakSet::[Symbol?toStringTag], \WeakSet, 'WeakSet::@@toStringTag is `WeakSet`'