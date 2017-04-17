var app = angular.module('customers');
app.controller("ConfirmDesactivateController", [
	"$scope","$uibModalInstance",
	function($scope, $uibModalInstance){
		$scope.desactivate = function() {
			$uibModalInstance.close();
		};

		$scope.nevermind = function () {
			$uibModalInstance.dismiss('cancel');
		};
	}
]);