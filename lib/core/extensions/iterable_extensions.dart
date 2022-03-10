
extension IterableExtend<T> on List<T>{
    List<T>? addAllClearFirst(List<T> items){
      clear();
      addAll(items);
      return this;
    }
}