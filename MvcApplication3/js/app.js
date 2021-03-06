﻿var app = angular.module('app', ['ngRoute', 'checklist-model']);
function getRoute(name) {
    return {
        templateUrl: 'html/' + name + '.html?r=' + FTVer,
        controller: name.substring(name.indexOf('/') + 1) + 'Controller',
        resolve: {
            load: function ($q, $route, $rootScope) {
                var deferred = $q.defer();
                $script(['html/' + name + '.js?r=' + FTVer], function () {
                    $rootScope.$apply(function () { deferred.resolve(); });
                });
                return deferred.promise;
            }
        }
    }
}
app.config(function ($routeProvider, $controllerProvider, $locationProvider) {
    app.registerCtrl = $controllerProvider.register;
    $routeProvider
        .when('/', getRoute('registration'))
        .when('/registration', getRoute('registration'))
        .when('/state', getRoute('state'))
        .when('/state/:StateID', getRoute('state'))
        .when('/city', getRoute('city'))
        .when('/coursemaster', getRoute('coursemaster'))
        .when('/studentinfo', getRoute('Studenthtml/studentinfo'))
        .when('/subjectmaster', getRoute('subjectmaster'))
        .when('/branchmaster', getRoute('branchmaster'))
        .when('/Route08', getRoute('state'))
        .otherwise({ redirectTo: '/notfound' });
    $locationProvider.html5Mode(true);
});
app.service('appServices', appServices);
app.controller('mainCtrl', mainCtrl);

//app.run(function ($rootScope, $location, $cookies, appServices) {
//    var token = $cookies.get('UserToken');
//    if (token) $rootScope.token = token;
//    console.log(token);
//    $rootScope.$on("$routeChangeStart", function (event, next, current) {
//        $rootScope.attParam = null;
//        if (!navigator.onLine) $rootScope.setMsg('Network not connected! Please check internet connection.');
//        // Get user if token is there but no user
//        if ($rootScope.mUser == null) {
//            if ($rootScope.token) {
//                appServices.getUserByToken(token).then(function (d) {
//                    if (d.Status == 'success') {
//                        $rootScope.mUser = d.objdata;
//                        if ($rootScope.mUser != null && next.templateUrl == "views/login.html?r=0aq") {
//                            $location.path("/dashboard");
//                        }
//                        $rootScope.$broadcast('userReady', null);
//                        $rootScope.processForward();
//                    } else $rootScope.goSignin(next.templateUrl);
//                });
//            }
//            else $rootScope.goSignin(next.templateUrl);
//        }
//    });
//})

function mainCtrl($scope, $location, $rootScope, $http, appServices) {
    $rootScope.mUser = null;
    $rootScope.attParam = null;
    $rootScope.isBusy = 0;
    $scope.loc = $location;
    $scope.mainMenu = {};
    $scope.addToken = function (str) { return { Search: str, Token: $rootScope.token }; }
    //$rootScope.setMsg = function (msg, succ) {
    //    notify.closeAll();
    //    notify({ message: msg, classes: (succ ? "alert-success" : "alert-danger"), duration: 5000 });
    //}
    //$rootScope.goSignin = function (url) {
    //    if (url && url.indexOf('login.html') < 0 && url.indexOf('login.html') < 0 && url.indexOf('passwordreset.html') < 0 && url.indexOf('validate.html') < 0) {
    //        $rootScope.setMsg('Please sign-in to continue...');
    //        $location.path("/signin");
    //    }
    //}

    //$scope.getModules = function () {
    //    appServices.doActionGet({ Token: $rootScope.token }, 'modules').then(function (d) {
    //        if (d.Status == 'success') {
    //            $scope.mainModule = d.objdata;
    //        }
    //    });
    //}


    //$scope.isMenu = false;
    //$scope.getModuleMenu = function (id) {
    //    appServices.doActionGet({ Token: $rootScope.token }, 'modulemenu/' + id + '').then(function (d) {
    //        if (d.Status == 'success') {
    //            $scope.isMenu = true;
    //            $scope.moduleMenu = d.objdata;
    //        }
    //    });
    //}

    //$rootScope.processForward = function () {
    //    $scope.getModules();
    //}

    //$rootScope.signout = function () {
    //    $rootScope.mUser = null;
    //    $rootScope.token = null;
    //    $cookies.remove('UserToken');
    //    $location.path("/login");
    //}
}

function getTableObj(tableid, token, initSort, apipath, refreshTableFunc) {
    var itf = {};
    itf.id = tableid;
    itf.Rows = {};
    itf.api = apipath;
    itf.SortBy = appStor.gettext(tableid + 'sort', initSort);
    itf.Token = token;
    itf.SortDesc = false;
    itf.RPP = appStor.getnumber(tableid + 'rpp', 10);;
    itf.TotalRows = 0;
    itf.CurPage = 1;
    itf.NumPages = 1;
    itf.Params = [];
    itf.Filters = [];
    itf.FilBtnClass = function () {
        var cls = '';
        for (i = 0; i < this.Filters.length; i++) { if (this.Filters[i] > '') cls = 'btn-warning'; }
        return cls;
    }
    itf.clearFil = function () {
        for (i = 0; i < this.Filters.length; i++) { this.Filters[i] = ''; }
    }
    itf.setSort = function (newSort) {
        if (newSort == this.SortBy) this.SortDesc = !this.SortDesc; else this.SortDesc = false;
        this.SortBy = newSort;
        appStor.save(tableid + 'sort', newSort);
        refreshTableFunc();
    }
    itf.setRPP = function (nRPP) {
        this.RPP = nRPP;
        appStor.save(tableid + 'rpp', nRPP);
        refreshTableFunc();
    }
    itf.chPage = function (inc) {
        this.CurPage += inc;
        if (this.CurPage > this.NumPages) this.CurPage = this.NumPages;
        if (this.CurPage == 0) this.CurPage = 1;
        refreshTableFunc();
    }
    itf.setRows = function (aRes) {
        this.Rows = aRes.objdata;
        console.log(aRes.objdata);
        this.TotalRows = aRes.TotalRows;
        this.NumPages = Math.floor((this.TotalRows + this.RPP - 1) / this.RPP);
        if (this.CurPage > this.NumPages) this.CurPage = this.NumPages;
        if (this.CurPage == 0) this.CurPage = 1;
    }
    return itf;
}

// email validation
app.factory('validationService', function () {
    return {
        Email: function (email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
    };
});

var appStor = {
    save: function (key, value) { if (typeof (Storage) !== "undefined") { localStorage.setItem(key, value); } },
    gettext: function (key, def) { if (typeof (Storage) !== "undefined") { var val = localStorage.getItem(key); if (val) return val; else return def; } else return def; },
    getnumber: function (key, def) { if (typeof (Storage) !== "undefined") { var val = localStorage.getItem(key); if (val && !isNaN(val)) return parseInt(val); else return def; } else return def; }
}
