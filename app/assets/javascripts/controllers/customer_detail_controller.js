var app = angular.module('customers');
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