class queue2stk:
  fr = []
  bk = []
  def __init__(self):
    self.fr = []
    self.bk = []
  def __str__(self) -> str:
    strr = 'queue:'
    if(self.fr):
      strr += ' fr ' + ' '.join(map(str, self.fr))
    if(self.bk):
      strr += ' bk ' + ' '.join(map(str, self.bk))
      # strr = strr.join(map(str, self.bk))
    return strr
  def __call__(self):
    print(self)
  def empty(self):
    self.fr = []
    self.bk = []
  def add(self, ele):
    self.bk.insert(0, ele)
    self.__flip()
  def isEmpty(self) -> bool:
    if((not self.bk) and (not self.fr)):
      return True
    else: return False
  def front(self) -> any:
    if(self.fr):
      return self.fr[0]
    else: return None
  def remove(self):
    if(self.fr):
      self.fr.pop(0)
    self.__flip()
  def __flip(self):
    if(not self.fr):
      if(self.bk):
        self.bk.reverse()
        self.fr = self.bk
      else: self.fr = []
      self.bk = []
  def retrieve(self) -> list:
    lst = self.fr
    if(self.fr):
      if(self.bk):
        tp = self.bk
        tp.reverse()
        lst.extend(tp)
    else: lst = self.bk
    return lst
  def invariant(self) -> bool:
    if(self.fr or (not self.bk)):
      return True
    else: return False

def test():
  test = queue2stk()
  print(test)
  test.add(1)
  print(test)
  print('isEmpty', test.isEmpty())
  test.empty()   
  print(test)
  print('isEmpty', test.isEmpty())
  test.add(10)
  print(test)
  test.add(3)
  test.add(3)
  print(test)
  test.remove()
  print(test)
  test.add(4)
  test.add(4)
  print(test.retrieve())
  print('invariant', test.invariant())

def property_i(ele) -> bool:
  # -- c.  Property: *front_empty*: 
  # > prop_front_empty :: Integer -> Bool
  # > prop_front_empty x = frontI (addI x emptyI) == x
  que = queue2stk()
  que.add(ele)
  if(que.front() == ele): return True
  else: return False

def property_ii(ele, que: queue2stk) -> bool:
  # -- d.  Property: *front_add*:
  # > prop_front_add x q = invariant q && not (isEmptyI q) ==>
  # >                         frontI (addI x q) == frontI q
  if(que.invariant() and (not que.isEmpty())):
    bf = que.front()
    que.add(ele)
    af = que.front()
    # que.remove()
    if(bf == af):       
      return True
  return False

# test()
# # queue:
# # queue: fr 1
# # isEmpty False
# # queue:
# # isEmpty True
# # queue: fr 10
# # queue: fr 10 bk 3 3
# # queue: fr 3 3
# # [3, 3, 4, 4]
# # invariant True
##############################
que = queue2stk()
que.add(4)
emptyque = queue2stk()
print('*front_empty*', property_i(3), '3')
print('*front_empty*', property_i(0), '0')
print('*front_empty*', property_i(0), '-1')
print('*front_empty*', property_i('z'), 'z')
print('*front_add*', property_ii(5, que), que)
print('*front_add*', property_ii(4, emptyque), emptyque)
# *front_empty* True 3
# *front_empty* True 0
# *front_empty* True -1
# *front_empty* True z
# *front_add* True queue: fr 4 bk 5
# *front_add* False queue: