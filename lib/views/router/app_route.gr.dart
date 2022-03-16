// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../shelf/all_import.dart' as _i1;
import '../screens/home/ui/update_dialog/home_update_dialog.dart' as _i2;

class AppRoute extends _i3.RootStackRouter {
  AppRoute([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    HomeUpdateRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HomeUpdateRouteArgs>(
          orElse: () =>
              HomeUpdateRouteArgs(taskId: pathParams.getInt('taskId')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.HomeUpdateDialog(key: args.key, taskId: args.taskId));
    },
    HomeAllRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeAllPage());
    },
    HomeCompleteRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeCompletePage());
    },
    HomeIncompleteRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeIncompletePage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i3.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i3.RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'all',
              fullMatch: true),
          _i3.RouteConfig(HomeAllRoute.name,
              path: 'all', parent: HomeRoute.name),
          _i3.RouteConfig(HomeCompleteRoute.name,
              path: 'complete', parent: HomeRoute.name),
          _i3.RouteConfig(HomeIncompleteRoute.name,
              path: 'incomplete', parent: HomeRoute.name)
        ]),
        _i3.RouteConfig(HomeUpdateRoute.name, path: 'update/:taskId')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.HomeUpdateDialog]
class HomeUpdateRoute extends _i3.PageRouteInfo<HomeUpdateRouteArgs> {
  HomeUpdateRoute({_i1.Key? key, required int taskId})
      : super(HomeUpdateRoute.name,
            path: 'update/:taskId',
            args: HomeUpdateRouteArgs(key: key, taskId: taskId),
            rawPathParams: {'taskId': taskId});

  static const String name = 'HomeUpdateRoute';
}

class HomeUpdateRouteArgs {
  const HomeUpdateRouteArgs({this.key, required this.taskId});

  final _i1.Key? key;

  final int taskId;

  @override
  String toString() {
    return 'HomeUpdateRouteArgs{key: $key, taskId: $taskId}';
  }
}

/// generated route for
/// [_i1.HomeAllPage]
class HomeAllRoute extends _i3.PageRouteInfo<void> {
  const HomeAllRoute() : super(HomeAllRoute.name, path: 'all');

  static const String name = 'HomeAllRoute';
}

/// generated route for
/// [_i1.HomeCompletePage]
class HomeCompleteRoute extends _i3.PageRouteInfo<void> {
  const HomeCompleteRoute() : super(HomeCompleteRoute.name, path: 'complete');

  static const String name = 'HomeCompleteRoute';
}

/// generated route for
/// [_i1.HomeIncompletePage]
class HomeIncompleteRoute extends _i3.PageRouteInfo<void> {
  const HomeIncompleteRoute()
      : super(HomeIncompleteRoute.name, path: 'incomplete');

  static const String name = 'HomeIncompleteRoute';
}
