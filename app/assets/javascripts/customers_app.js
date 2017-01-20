var app = angular.module('customers',[]);

app.controller("CustomerSearchController", [
	"$scope","$http",
	function($scope, $http){

		var page = 0;

		$scope.previousPage = function(){
			if (page > 0){
				page = page - 1;
				$scope.search($scope.keywords);
			}
		}

		$scope.nextPage = function(){
			page = page + 1;
			$scope.search($scope.keywords);
		}

		$scope.customers = [];
		$scope.search = function(searchTerm){
			if (searchTerm.length < 3){
				return;
			}
			$scope.searchedFor = searchTerm;
			$scope.customers = [
				{
					"first_name":"Schuler",
					"last_name":"Cremin",
					"email":"giles0@macgyver.net",
					"username":"killian0",
					"created_at":"2015-03-04"
				},
				{
					"first_name":"Cristian",
					"last_name":"Gacitua",
					"email":"cgacitua@gacitua.com",
					"username":"kolvalik",
					"created_at":"2015-03-04"
				},
				{
					"first_name":"lolo",
					"last_name":"lalqa",
					"email":"wewewe0@macgyver.net",
					"username":"wewewe",
					"created_at":"2015-03-04"
				}
			]
			$http.get("/customers.json",
				{"params": {"keywords": searchTerm, "page": page}}
				).then(function(response){
					$scope.customers = response.data;
					console.log($scope.customers);
				}, function(response){
					alert("There was a problem: " + response.status);
				});
		}
	}
]);