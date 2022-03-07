// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../shelf/all_import.dart' as _i1;

class AppRoute extends _i2.RootStackRouter {
  AppRoute([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    HomeAllRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeAllPage());
    },
    HomeCompleteRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeCompletePage());
    },
    HomeIncompleteRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeIncompletePage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i2.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i2.RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'all',
              fullMatch: true),
          _i2.RouteConfig(HomeAllRoute.name,
              path: 'all', parent: HomeRoute.name),
          _i2.RouteConfig(HomeCompleteRoute.name,
              path: 'complete', parent: HomeRoute.name),
          _i2.RouteConfig(HomeIncompleteRoute.name,
              path: 'incomplete', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.HomeAllPage]
class HomeAllRoute extends _i2.PageRouteInfo<void> {
  const HomeAllRoute() : super(HomeAllRoute.name, path: 'all');

  static const String name = 'HomeAllRoute';
}

/// generated route for
/// [_i1.HomeCompletePage]
class HomeCompleteRoute extends _i2.PageRouteInfo<void> {
  const HomeCompleteRoute() : super(HomeCompleteRoute.name, path: 'complete');

  static const String name = 'HomeCompleteRoute';
}

/// generated route for
/// [_i1.HomeIncompletePage]
class HomeIncompleteRoute extends _i2.PageRouteInfo<void> {
  const HomeIncompleteRoute()
      : super(HomeIncompleteRoute.name, path: 'incomplete');

  static const String name = 'HomeIncompleteRoute';
}
