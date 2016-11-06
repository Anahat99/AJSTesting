
app.registerCtrl('branchmasterController', function branchmasterController($scope, $http) {
    $scope.Title = 'Branch Master';
    $scope.Branch = {};

    $scope.getCourse = function () {
        $http.get('/api/CourseMaster/GetCourseData').then(function (d) {
            $scope.Coursedata = d.data;
            //console.log(d.data);
        });
    }

    $scope.getCourse();

    $scope.SaveBranch = function ()
    {
        $http({
            method: 'post',
            url: '/api/BranchMaster/SaveBranch',
            data: $scope.Branch
        }).then(function (response) {
            $scope.GetBranch();
        });
    }

    $scope.GetBranch = function () {
        $http.get('/api/BranchMaster/GetBranch').then(function (d) {
            $scope.Branchdata = d.data;
        });
    }

    $scope.GetBranch();

});