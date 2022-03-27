abstract class IBaseRepository<T> {
  Future<List<T>> fetchAll();
  Future<T> fetchById(int id);
  Future<T> create(T t);
  Future<T> update(T t);
}