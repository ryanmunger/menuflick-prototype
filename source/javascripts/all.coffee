angular.module('MenuFlick', ['ngMobile', 'LocalStorageModule'])

  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/', templateUrl: 'main.html', controller: 'MainController')
      .when('/login', templateUrl: 'login.html', controller: 'LoginController')
      .otherwise(redirectTo: '/')
  ])

  .controller("LoginController", ['$scope', '$http', 'localStorageService', ($scope, $http, localStorageService) ->
    localStorageService.clearAll()
    localStorageService.add('key','Add this!')
    value = localStorageService.get('key')
    console.log value
  ])
  
  .controller("MainController", ['$scope', '$http', 'localStorageService', ($scope, $http, localStorageService) ->
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
