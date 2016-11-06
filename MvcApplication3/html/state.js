app.registerCtrl('stateController', function stateController($scope, $http, $routeParams, $location) {
    $scope.Title = 'State Master';
    $scope.State = {};
    $scope.isEdit = false;
    $scope.getState = function () {
        $http.get('/api/StateMaster/GetStateData').then(function (d) {
            $scope.Statedata = d.data;
            //console.log(d.data);

        });

        $scope.getstatebyid= function (id) {
            console.log(id);
            var result = null;
            angular.forEach(persons, function(p) {
                if (p.id == id) result = p;
            });
            return result;
        }
    }
    $scope.getState();

    
    $scope.GetStateDetail = function (smid,Flag) {
        //if ($routeParams.StateID = 'new')
        //    $location.path('/Route02/new');
        //else {
        //    console.log('ID is ' + $routeParams.StateID)

        //}
        //console.log('stateid is ' + smid);
        if (Flag == 'U') {
            $http({
                method: 'get',
                url: '/api/StateMaster/GetStateDataByID/{ID}',
                params: { ID: smid }
            }).then(function (responce) {
                $scope.State = responce.data;
                $scope.isEdit = true;
            });
        }
        else if (Flag == 'D') {
            console.log(Flag);
            $http({
                method: 'post',
                url: '/api/StateMaster/DeleteState/{ID}',
                params: { ID: smid }
            }).then(function (responce) {
                $scope.getState();
            });
        }



        //$http.get('/api/StateMaster/GetStateDataByID/{ID}', { params: {ID:smid}}).then(function (d) {
        //    //$scope.Statedata = d.data;
        //    //console.log(d.data);

        //});

        
        //$location.path('/Route02/'+smid);
    };
    

    $scope.SaveState = function () {
        //console.log($scope.State.SName);
        $http({
            method: 'post',
            url: '/api/StateMaster/SaveState',
            data: $scope.State
        }).then(function (responce) {
            $scope.getState();
        });

    }


    $scope.EditState = function () {
        //console.log($scope.State.SName);
        $http({
            method: 'post',
            url: '/api/StateMaster/EditState',
            data: $scope.State
        }).then(function (responce) {
            $scope.getState();
        });

    }

    $scope.CancelState = function () {
        $scope.isEdit = false;
        $scope.State = {};
    }
});




app.controller("ShowCtrl", function ($scope, $routeParams, Person) {
    $scope.Title = 'Employee Registration Edit';
   // $scope.person = Statedata.get($routeParams.id);
    $scope.person = $scope.getstatebyid($routeParams.id);
    console.log($routeParams.id);
});
