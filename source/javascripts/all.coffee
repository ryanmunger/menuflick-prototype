angular.module('MenuFlick', ['ngMobile', 'LocalStorageModule'])

  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/leaderboards', templateUrl: 'leaderboards.html', controller: 'LeaderBoardsController')
      .when('/login', templateUrl: 'login.html', controller: 'LoginController')
      .when('/404', templateUrl: '404.html')
      .otherwise(redirectTo: '/404')
  ])

  .controller("MainAppController", ['$scope', '$http', 'localStorageService', '$location', ($scope, $http, localStorageService, $location) ->
    authValue = localStorageService.get('authToken')
    console.log authValue
    if authValue == null
      $location.path('/login')
      $scope.$apply
    $scope.logout = ->
      localStorageService.clearAll()
      $location.path('/login')
      $scope.$apply
  ])

  .controller("LoginController", ['$scope', '$http', 'localStorageService', '$location', ($scope, $http, localStorageService, $location) ->
    $scope.login = ->

      $http(
        method: 'POST',
        url: 'http://mfbackend.appspot.com/json/login',
        data: $.param(
          username: $scope.user.username
          password: $scope.user.password
        ),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      ).success((data, status, headers, config) ->
        console.log data
        console.log config
        if data.response == 1
          $location.path('/leaderboards')
          localStorageService.add('authToken', data.auth_token)
          $scope.$apply
        else
          alert "you've entered the wrong info!"
      ).error (data, status, headers, config) ->
  ])
  
  .controller("LeaderBoardsController", ['$scope', '$http', 'localStorageService', ($scope, $http, localStorageService) ->
    authValue = localStorageService.get('authToken')
    console.log authValue
    $scope.getLocation = ->
      window.navigator.geolocation.getCurrentPosition (position) ->
        $scope.$apply ->
          $http(
            method: "GET"
            url: "http://mfbackend.appspot.com/json/items?latitude=" + position.coords.latitude + "&longitude=" + position.coords.longitude + "&radius=30000"
          ).success((data, status, headers, config) ->
            $scope.items = data.items
            console.log data
          ).error (data, status, headers, config) ->

  ])

