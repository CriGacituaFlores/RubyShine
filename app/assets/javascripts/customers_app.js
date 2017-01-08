var app = angular.module('customers',[]);

app.controller("CustomerSearchController", [
	"$scope",
	function($scope){
		$scope.customers = [];
		$scope.search = function(searchTerm){
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
		}
	}
]);