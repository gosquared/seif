/**
 * Instance module handles interaction with the API
 */
angular.module('instance', ['ngResource']).factory('Instance', function($resource) {
	var Instance = $resource('locationUrl',
		{}, // query parameters, i.e. auth
		{
			update:  { method: 'PUT' },
			destroy: { method: 'DELETE' },
			all:     { method:'GET', isArray:true }
		}
	);

	Instance.prototype.update = function(callback) {
		//return Instance.update()
	};
	return Instance;
});