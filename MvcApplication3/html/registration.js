app.registerCtrl('registrationController', function registrationController($scope, $http, $location) {
    $scope.Title = 'Employee Registration';
    $scope.Emp = {};
    $scope.getEmp = function () {
        $http.get('/api/Employee/GetEmp').then(function (d) {
            $scope.empdata = d.data;

            //$scope.EmpId = d.data[0].EmpId;
            //$scope.Name = d.data[0].Name;
            //$scope.Email = d.data[0].Email;
        });
    }
    $scope.getEmp();

    $scope.SaveEmp = function () {
        $http({
            method: 'post',
            url: '/api/Employee/SaveEmp',
            data: $scope.Emp
        }).then(function (responce) {
            $scope.getEmp();
        });

    }


    $scope.getEmpByID = function (id) {
        console.log(id);
        $http({
            method: 'GET',
            url: '/api/Employee/GetEmpByID',
            params: { empid: id },
        }).then(function (responce) {
            console.log(responce);
            $scope.Emp = responce;
            $location.path('html/RegistrationEdit/id');
        });

    }

    $scope.show = function (id) {
       
        $window.location.href="#/Route03/" + id;
    }

});



app.controller('RegistrationEdit', function ($scope) {
    $scope.Title = 'Employee Registration Edit';
    $scope.Emp = {};
    $scope.getEmp = function () {
        $http.get('/api/Employee/GetEmpByID').then(function (d) {
            $scope.empdata = d.data;

            //$scope.EmpId = d.data[0].EmpId;
            //$scope.Name = d.data[0].Name;
            //$scope.Email = d.data[0].Email;
        });
    }
});