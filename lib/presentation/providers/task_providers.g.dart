// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTaskByIdHash() => r'69d37c7e933afb09f4dcd528bf353d28781d6e32';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getTaskById].
@ProviderFor(getTaskById)
const getTaskByIdProvider = GetTaskByIdFamily();

/// See also [getTaskById].
class GetTaskByIdFamily extends Family<AsyncValue<Task>> {
  /// See also [getTaskById].
  const GetTaskByIdFamily();

  /// See also [getTaskById].
  GetTaskByIdProvider call(
    int id,
  ) {
    return GetTaskByIdProvider(
      id,
    );
  }

  @override
  GetTaskByIdProvider getProviderOverride(
    covariant GetTaskByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTaskByIdProvider';
}

/// See also [getTaskById].
class GetTaskByIdProvider extends AutoDisposeFutureProvider<Task> {
  /// See also [getTaskById].
  GetTaskByIdProvider(
    int id,
  ) : this._internal(
          (ref) => getTaskById(
            ref as GetTaskByIdRef,
            id,
          ),
          from: getTaskByIdProvider,
          name: r'getTaskByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTaskByIdHash,
          dependencies: GetTaskByIdFamily._dependencies,
          allTransitiveDependencies:
              GetTaskByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetTaskByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Task> Function(GetTaskByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTaskByIdProvider._internal(
        (ref) => create(ref as GetTaskByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Task> createElement() {
    return _GetTaskByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTaskByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTaskByIdRef on AutoDisposeFutureProviderRef<Task> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetTaskByIdProviderElement extends AutoDisposeFutureProviderElement<Task>
    with GetTaskByIdRef {
  _GetTaskByIdProviderElement(super.provider);

  @override
  int get id => (origin as GetTaskByIdProvider).id;
}

String _$tasksHash() => r'005ee0472439c77904cd25aa7e967a6538aff7a8';

/// See also [Tasks].
@ProviderFor(Tasks)
final tasksProvider =
    AutoDisposeAsyncNotifierProvider<Tasks, List<Task>>.internal(
  Tasks.new,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tasks = AutoDisposeAsyncNotifier<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
