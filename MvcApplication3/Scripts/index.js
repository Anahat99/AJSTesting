var app = angular.module('app', ['ngRoute']);
app.config(['$routeProvider',
  function ($routeProvider, $locationProvider) {
      //$locationProvider.hashPrefix('!');
      $routeProvider.
          when('/', {
              templateUrl: 'html/Registration.html',
              controller: 'appController'
          }).
          when('/Route01', {
              templateUrl: 'html/Registration.html',
              controller: 'appController'
          }).
          when('/Route02', {
            templateUrl: 'html/State.html',
            controller: 'StateController'
          }).
          when('/Route02/:StateID', {
              templateUrl: 'html/State.html',
              controller: 'StateController'
          }).
          when('/Route03', {
              templateUrl: 'html/City.html',
              controller: 'CityController'
          }).
          when('/Route04', {
              templateUrl: 'html/CourseMaster.html',
              controller: 'CourseController'
          }).
          when('/Statedata/:ID', {
              templateUrl: 'html/RegistrationEdit.html',
              controller: 'appController'
          }).
          when('/Route05', {
              templateUrl: 'html/Studenthtml/StudentInfo.html',
              controller: 'StudentInfoController'
          }).
          when('/Route06', {
              templateUrl: 'html/SubjectMaster.html',
              controller: 'SubjectController'
          }).
          when('/Route07', {
              templateUrl: 'html/BranchMaster.html',
              controller: 'BranchController'
          }).
          when('/Route08', {
              templateUrl: 'html/Test/TestState.html',
              controller: 'TestState'
          }).
        
        otherwise({
            templateUrl: 'Error1.html'
        });
  }]);