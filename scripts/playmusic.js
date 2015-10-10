(function() {
  'use strict';
  angular.module('dmk.playmusic', []).directive('dmkPlaymusic', [
    function() {
      return {
        restrict: 'A',
        link: function(scope, element, attrs) {
          var dmkPlaymusic, options;
          options = angular.extend({
            container: element[0]
          }, attrs);
          dmkPlaymusic = WaveSurfer.create(options);
          console.log(dmkPlaymusic);
          if (attrs.url) {
            dmkPlaymusic.load(attrs.url, attrs.data || null);
          }
          scope.$emit('dmkPlaymusicInit', dmkPlaymusic);
        }
      };
    }
  ]);
})();
