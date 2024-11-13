// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const DASHBOARD = _Paths.DASHBOARD;
  static const ARTICLE = _Paths.ARTICLE;
  // static const WAITING = _Paths.WAITING;
  // static const SEARCH = _Paths.SEARCH;
  // static const SAVED = _Paths.SAVED;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARD = '/';
  static const ARTICLE = '/article';
  // static const WAITING = '/waiting';
  // static const SEARCH = '/search';
  // static const SAVED = '/saved';
}