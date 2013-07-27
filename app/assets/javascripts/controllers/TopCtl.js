var TopCtrl = function($scope, $http){
  $scope.STATE_UNKNOWN  = 0;
  $scope.STATE_LOGIN    = 1;
  $scope.STATE_LOGOUT   = 2;

  $scope.user = {}
  $scope.userStatus = $scope.STATE_UNKNOWN;

  $http.get('sessions/index').success(function(data) {
    if(data != "null") {
      $scope.userStatus = $scope.STATE_LOGIN;
      $scope.user = data;
    } else {
      $scope.userStatus = $scope.STATE_LOGOUT;
    }
  });
};
