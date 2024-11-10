import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class DioService {
  static final dio = Dio();
  static Future<void> initialize() async {
    final temp = await getTemporaryDirectory();
    final options = CacheOptions(
      store: HiveCacheStore(temp.path),
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      hitCacheOnErrorExcept: [], // for offline behaviour
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    dio
      ..interceptors.add(
        DioCacheInterceptor(options: options),
      );
  }
}
