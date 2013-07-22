angular.module('MenuFlick', ['ngMobile'])
  .controller "MainController", ($scope) ->
    $scope.items = [
      id: 0
      restaurant: "Rudy's Tacos"
      name: "Carne Asada Burrito"
      rating: 0
    ,
      id: 1
      restaurant: "Blue Ribbon Pizza"
      name: "Red Oak Pizza"
      rating: 0
    ,
      id: 2
      restaurant: "Blue Ribbon Pizza"
      name: "Cheese Pizza"
      rating: 0
    ,
      id: 3
      restaurant: "Sake House"
      name: "Takoyaki (Octopus)"
      rating: 0
    ,
      id: 4
      restaurant: "Mrs. Taco"
      name: "Carne Asada Burrito"
      rating: 0
    ,
      id: 5
      restaurant: "Tin Leaf Kitchen"
      name: "Thanksgiving On A Bun"
      rating: 0
    ,
      id: 6
      restaurant: "Riki Sushi"
      name: "California Roll"
      rating: 0
    ,
      id: 7
      restaurant: "Riki Sushi"
      name: "Salmon Roll"
      rating: 0
    ,
      id: 8
      restaurant: "Mama's And Papa's"
      name: "Spaghetti and Meatball"
      rating: 0
    ,
      id: 9
      restaurant: "Two Brother's From Italy"
      name: "Cheese Pizza"
      rating: 0
    ]
    $scope.upVote = (index) ->
      $scope.items[index].rating++
    $scope.downVote = (index) ->
      $scope.items[index].rating--
