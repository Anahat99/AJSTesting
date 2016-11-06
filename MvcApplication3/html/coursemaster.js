
app.registerCtrl('coursemasterController', function coursemasterController($scope, $http) {
    $scope.Title = 'Course Master';
    $scope.Course = {};


    $scope.getCourse = function () {
        $http.get('/api/CourseMaster/GetCourseData').then(function (d) {
            $scope.Coursedata = d.data;
            console.log(d.data);
        })
    }

    $scope.getCourse();


    $scope.SaveCourse = function () {
        $http({
            method: 'post',
            url: '/api/CourseMaster/SaveCourse',
            data: $scope.Course
        }).then(function (response) {
            $scope.getCourse();
        });
    }
});


