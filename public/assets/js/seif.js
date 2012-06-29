/**
 * Define the main module Seif that holds routing config
 */
angular.module('seif', [
	'service', 'instance', 'serviceFilterDescription', 'noServiceDescription'
	]).config(function($routeProvider) {
		$routeProvider.
		when('/', {
			controller:ServiceList, templateUrl:'/assets/partials/services.html'}).
		when('/service/:name', {
			controller:ServiceController, templateUrl:'/assets/partials/service.html'}).
		when('/service/:name/edit', {
			controller:EditServiceController, templateUrl:'/assets/partials/edit_service.html'}).
		otherwise({redirectTo:'/'});
});

function InstanceList($scope) {
	$scope.instances = Instance.query();
}

/**
 * Filters to make information more human readable
 */
angular.module('serviceFilterDescription', []).filter('filter_description', function() {
  return function(input) {
    return input ? input : 'all';
  };
});

angular.module('noServiceDescription', []).filter('no_services_description', function() {
  return function(input) {
    return (input.length > 0) ? '' : 'No services running.';
  };
});
