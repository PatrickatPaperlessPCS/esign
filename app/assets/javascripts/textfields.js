
jQuery(document).ready(function () {
  document.createElementsOnClick = true;

  jQuery('#textfields').click(function (e) {
    if(!document.createElementsOnClick) return;

    var cursorX = e.pageX;
    var cursorY = e.pageY;

    var textBoxFocusHandler = function(e) {
      document.createElementsOnClick = false;
    };

    var textBoxBlurHandler = function(e) {
      document.createElementsOnClick = true;
    };

    var div = jQuery('<div></div>').addClass('dynamic-textbox').css({
      position: 'absolute',
      background: 'transparent',
<<<<<<< HEAD
      top: cursorY - 32 + 'px',
      left: cursorX + 'px',
=======
      top: cursorY - 10 + 'px',
      left: cursorX - 20 + 'px',
>>>>>>> a43ec37a1e7bb3a90c8e15f963a25249211c3e29
    });

    var button = jQuery("<input type=button value='X' />").addClass('dynamic-textbox-button').
    on('click', function(e) {
      $(this).parent().remove();
      e.stopPropagation();
    }).appendTo(div);

    var textbox = jQuery("<input type='text' name='document[dynamic_textfields_attributes][][text]' />").
      on('focus', textBoxFocusHandler).
      on('blur', textBoxBlurHandler).
      appendTo(div);

    var positionX = jQuery("<input type=hidden name='document[dynamic_textfields_attributes][][left]' />").val(cursorX).appendTo(div);
    var positionY = jQuery("<input type=hidden name='document[dynamic_textfields_attributes][][top]' />").val(cursorY).appendTo(div);

    div.appendTo(this);
    textbox.focus();
  });
});

