do ->
  'use strict'
  PlayerController = ($scope) ->
    activeUrl = null
    $scope.paused = true
    $scope.music = "assets/edward.mp3"
    $scope.$on('dmkPlaymusicInit', (e,dmkPlaymusic)->
      $scope.dmkPlaymusic = dmkPlaymusic
      $scope.dmkPlaymusic.on('play', ()->
        $scope.paused = false
        return
      )
      $scope.dmkPlaymusic.on('pause', ()->
        $scope.paused = true
        return
      )
      $scope.dmkPlaymusic.on('finish',()->
        $scope.paused = true
        $scope.dmkPlaymusic.seekTo(0)
        $scope.$apply()
        return
      )
      return
    )
    $scope.play = (url) ->
      if (!$scope.dmkPlaymusic)
        return
      activeUrl = url
      $scope.dmkPlaymusic.once('ready', ()->
        $scope.dmkPlaymusic.play()
        $scope.$apply()
        return
      )
      $scope.dmkPlaymusic.load(activeUrl)
    $scope.isPlaying = (url) ->
      url == activeUrl
    return

  angular.module('app', ['dmk.playmusic'])
    .controller('PlayerController',PlayerController)
  PlayerController.$inject = ['$scope']







  return