app.registerCtrl('subjectmasterController', function subjectmasterController($scope, $http) {
    $scope.Title = 'Subject Master';
    $scope.Subject = {};

    $scope.SaveSubject = function () {

        $http({
            method: 'post',
            url: '/api/SubjectMaster/SaveSubject',
            data: $scope.Subject
        }).then(function (response) {
            $scope.GetSubject();
        });
    }


    $scope.GetSubject = function () {
        $http({
            method: 'get',
            url: '/api/SubjectMaster/GetSubjectData'
        }).then(function (response) {
            $scope.SubjectData = response.data;
        });
    }

    $scope.GetSubject();

});