$(document).ready(function() {
  if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      $.ajax({
        type: 'POST',
        url: 'http://walk-this-way.herokuapp.com',
        data: {
          latitude: position.coords.latitude,
          longitude: position.coords.latitude
        }
      });
    });
  }
});
