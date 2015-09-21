$(document).ready(function() {
  if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/geolocation',
        data: {
          latitude:'39.749631099999995',
          longitude: '-105.0002013'
        }
      });
    });
  }
});
