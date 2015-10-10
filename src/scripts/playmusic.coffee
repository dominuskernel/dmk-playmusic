do ->
  'use strict'
  angular
    .module('dmk.playmusic',[])
    .directive 'dmkPlaymusic', [ ->
      restrict: 'A'
      link: (scope, element, attrs) ->
        options = angular.extend({container:element[0]}, attrs)
        dmkPlaymusic = WaveSurfer.create(options)
        if attrs.url
          dmkPlaymusic.load(attrs.url, attrs.data || null)

        scope.$emit('dmkPlaymusicInit', dmkPlaymusic)
        return
    ]
  return