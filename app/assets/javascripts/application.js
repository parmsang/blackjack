// = require jquery
// = require jquery_ujs

$(document).ready(function() {

  $('#deal').click(function() {
    window.location.reload();
  });

  $('#stand').click(function() {

  });

  $('#hit').click(function() {
    $.ajax({
      url: "/game/hit",
      success: function(data) {
        var img = $("<img />").attr('src', data.view);
        $('#cards').append(img);
        $('#total').text(data.total);
      },
      failure: function(jqXHR, textStatus, errorThrown) {
        alert("error" + textStatus);
      },
      statusCode: {
        500: function() {
          alert("Hand has ended!");
        }
      },
      async: true
    });

  });

});
