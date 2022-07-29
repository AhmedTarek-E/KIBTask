

typedef TestListPredicate<E> = bool Function(E e);
typedef ElementIndexedMapper<T, E> = T Function(E element, int index);
typedef ElementMapper<T, E> = T Function(E element);

extension ListsExtensions<E> on List<E> {
  int? firstIndexWhere(TestListPredicate<E> test) {
    final index = indexWhere((element) => test(element));
    if (index == -1) {
      return null;
    } else {
      return index;
    }
  }

  List<T> mapIndexed<T>(ElementIndexedMapper<T, E> mapper) {
    final list = <T>[];
    for(int i = 0; i < length; i++) {
      list.add(mapper(this[i], i));
    }
    return list;
  }

  E? getOrNull(int index) {
    if (index >= 0 && isNotEmpty) {
      return this[index];
    } else {
      return null;
    }
  }

  E? firstOrNull() {
    try {
      return first;
    } catch (e) {
      return null;
    }
  }

  E? lastOrNull() {
    try {
      return last;
    } catch (e) {
      return null;
    }
  }

  E? firstWhereOrNull(TestListPredicate<E> test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  List<M> mapNotNull<M>(M? Function(E element) mapper) {
    final list = <M>[];
    forEach((element) {
      final item = mapper(element);
      if (item != null) {
        list.add(item);
      }
    });
    return list;
  }
}