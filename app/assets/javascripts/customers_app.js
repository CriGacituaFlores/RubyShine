var app = angular.module('customers',['ngRoute','ngResource','ngMessages','templates']);

app.directive("customerSummary", function() {
	return {
		"scope": {
			"cust": "=",
			"viewDetailsFunction": "="
		},
			"templateUrl": "customer_summary.html"
		}
});

app.config(["$routeProvider",function($routeProvider){

	$routeProvider.when("/",{
		controller: "CustomerSearchController",
		templateUrl: "customer_search.html"
	}).when("/:id",{
		controller: "CustomerDetailController",
		templateUrl: "customer_detail.html"
	});

}]);

app.filter("name", function(){
	return function(input){
		if (!input){
			return input;
		}

		if ((input.toLowerCase() === input) || (input.toUpperCase() === input)){
			return input.charAt(0).toUpperCase() + input.slice(1).toLowerCase();
		}else {
			return input;
		}
	}
});

app.controller("CustomerDetailController", [
	"$scope","$http","$routeParams","$location","$resource",
	function($scope,$http,$routeParams,$location,$resource){
		//var customerId = $routeParams.id;
		$scope.customerId = $routeParams.id;
		var Customer = $resource('/customers/:customerId.json',
														{"customerId": "@customer_id"},
														{ "save": { "method": "PUT" }});

		$scope.customer = Customer.get({"customerId": $scope.customerId})


		//EN CASO DE NO USAR $resouce SE UTIIZARA ESTO
		//$scope.customer = {};

		//$http.get(
		//	"/customers/" + customerId + ".json"
		//).then(function(response) {
		//	$scope.customer = response.data;
		//	},function(response){
		//		alert("There was a problem: " + response.status);
		//	}
		//);

		$scope.backIndex = function() {
			$location.path("/")
		}

		$scope.save = function(){
			if($scope.form.$valid){
				$scope.customer.$save(
					function() {
						$scope.form.$setPristine();
						$scope.form.$setUntouched();
						alert("Guardado con exito");
					},
					function() {
						alert("algo salio mal");
					}
				);
			}
		}
	}
]);

app.controller("CustomerSearchController", [
	"$scope","$http","$location",
	function($scope, $http, $location){

		var page = 0;

		$scope.viewDetails = function(customer) {
			$location.path("/" + customer.id)
		}

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
				$scope.customers = [];
				return;
			}
			$scope.searchedFor = searchTerm;
			$http.get("/customers.json",
				{"params": {"keywords": searchTerm, "page": page}}
				).then(function(response){
					$scope.customers = response.data;
					console.log($scope.customers);
				}, function(response){
					alert("Ocurrió un problema: " + response.status);
				});
		}
	}
]);

app.controller("CustomerCreditCardController", [
	"$scope","$resource",
	function($scope,$resource){
		var CreditCardInfo = $resource('/fake_billing.json')
		$scope.setCardholderId = function(cardholderId){
			$scope.creditCard = CreditCardInfo.get(
				{"cardholder_id": cardholderId}
			)
		}
	}
]);