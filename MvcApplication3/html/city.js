
app.registerCtrl('cityController', function cityController($scope, $http) {
    $scope.Title = 'City Master';
    $scope.City = {};
    $scope.isEdit = false;
    $scope.getState = function () {
        $http.get('/api/StateMaster/GetStateData').then(function (d) {
            $scope.Statedata = d.data;
            //console.log(d.data);

        });
    }
    $scope.getState();



    $scope.getCity = function () {
        $http.get('/api/CityMaster/GetCityData').then(function (d) {
            $scope.CityData = d.data;
        });
    }

    $scope.getCity();

    $scope.GetCityDetail = function (cid) {
        $http({
            method: 'get',
            url: '/api/CityMaster/GetCityDetailByID/{ID}',
            params: { ID: cid }
        }).then(function (response) {
            $scope.Statedata.SMID = response.data.SMID;
            $scope.City = response.data;
            $scope.isEdit = true;
        });

    }




    $scope.oncatchange = function () {
        //if($scope.invoice.incurr==1)
        //switch ($scope.invoice.inCurr) {

        //    case 1: $scope.invoice.myvalue = "Brijesh";
        //        break;
        //    case 2: $scope.invoice.myvalue = "New Ashok Nagar";
        //        break;
        //    case 3: $scope.invoice.myvalue = "2000";
        //        break;
        //    default: $scope.invoice.myvalue = "9999999999";
        //        break;

        //}
        //console.log($scope.Statedata.SMID);
        console.log($scope.City.SMID);
    }

    $scope.SaveCity = function () {
        //console.log($scope.State.SName);
        $http({
            method: 'post',
            url: '/api/CityMaster/SaveCity',
            data: $scope.City
        }).then(function (responce) {
            $scope.getCity();
        });

    }


    $scope.EditCity = function () {
        //console.log($scope.State.SName);
        $http({
            method: 'post',
            url: '/api/CityMaster/EditCity',
            data: $scope.City
        }).then(function (responce) {
            $scope.getCity();
        });

    }
});