(function ($) {
  $.fn.serializeFormJSON = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
      if (o[this.name]) {
        if (!o[this.name].push) {
            o[this.name] = [o[this.name]];
        }
        o[this.name].push(this.value || '');
      } else {
        o[this.name] = this.value || '';
      }
    });
    return JSON.stringify(o);
  };
})(jQuery);

$(function() {
  $('#contact-form').on('submit', function(event) {
    event.preventDefault();
    var contact = $(this).serializeFormJSON(),
        $btn = $('#contact-form .btn'),
        $result = $('#contact-form .result');

    $result.text('sending...');

    $.post( "https://6b0gd8a1h0.execute-api.eu-west-1.amazonaws.com/prod/contacts",
            contact ).done(function(data) {
        if(data==0)
          $result.text('Formulario enviado con exito');
        else 
          $result.text('error: ' + data.errorMessage);
      })
      .fail( function(data) {
        $result.text('Ooops! Se ha producido un error al enviar el formulario.');
      })
      .always(function() {
        console.log( "finished send" );
      });
  });
});
