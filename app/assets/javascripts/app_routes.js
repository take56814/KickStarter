angular.module('nicolive', []).
  config(function($routeProvider, $locationProvider) {
      $locationProvider.html5Mode(true);
      // ルートプロバイダに設定
      return $routeProvider.
        when('/', {controller:'TopCtrl', templateUrl:'templates/top.html'}).
        //when('/b/:Id', {controller:BDetailCtrl, templateUrl:'templates/detail.html'}).
        otherwise({redirectTo:'/'});
    }
);
