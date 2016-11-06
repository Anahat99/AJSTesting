app.registerCtrl('studentinfoController',  function studentinfoController($scope, $http) {
    $scope.Title = 'Student Information';
    $scope.StudentInfo = {};
    $scope.SelectAll = false;
    $scope.getState = function () {
        $http.get('/api/StateMaster/GetStateData').then(function (d) {
            $scope.Statedata = d.data;
            //console.log(d.data);


        });
    }
    $scope.getState();
    


    $scope.oncatchange = function (smid) {
        
        console.log($scope.StudentInfo);
        console.log(smid);
        $http({
            method: 'get',
            url: '/api/StudentInfo/GetCityDataByState/{SMID}',
            params: {SMID:smid}
        }).then(function (d) {
            $scope.CityData = d.data;
        });

    }


    $scope.SaveStudentInfo = function () {
        console.log(1);
        $http({
            method: 'post',
            url: '/api/StudentInfo/SaveStudentInfo',
            data: $scope.StudentInfo
        }).then(function (d) {
            console.log(2);
        });

    }



    $scope.getStudentInfo = function () {
        $http.get('/api/StudentInfo/GetStudentInfo').then(function (d) {
            $scope.StudentInfoData = d.data;
        });
    }

    $scope.getStudentInfo();

    $scope.Set = function () {
        $scope.SelectAll = true;
    }

    $scope.user = {
        StudentInfoData: []
    };

    $scope.checkAll = function () {
        console.log('hi');
        if ($scope.SelectAll == false) {
            $scope.user.StudentInfoData = $scope.StudentInfoData.map(function (item) { return item.SIID; });
            $scope.SelectAll = true;
        }
        else if ($scope.SelectAll == true) {
            $scope.user.StudentInfoData = [];
            $scope.SelectAll = false;
        }
    };
    //$scope.uncheckAll = function () {
    //    $scope.user.roles = [];
    //};
    //$scope.checkFirst = function () {
    //    $scope.user.roles.splice(0, $scope.user.roles.length);
    //    $scope.user.roles.push('guest');
    //};


});