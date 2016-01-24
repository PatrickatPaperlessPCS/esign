
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
      width: '50px',
      background: 'transparent',
      top: cursorY + 'px',
      left: cursorX + 'px'
    });

    var button = jQuery("<input type=button value='X' />").
    on('click', function(e) {
      $(this).parent().remove();
    }).appendTo(div);

    var textbox = jQuery("<input type='text' name='document[dynamic_textfields_attributes][][text]' />").
      on('focus', textBoxFocusHandler).
      on('blur', textBoxBlurHandler).
      appendTo(div);
    
    var positionX = jQuery("<input type=hidden name='document[dynamic_textfields_attributes][][left]' />").val(cursorX).appendTo(div);
    var positionY = jQuery("<input type=hidden name='document[dynamic_textfields_attributes][][top]' />").val(cursorY).appendTo(div);
      
    div.appendTo(this);
  });
});

