
jQuery(document).ready(function () {
  document.createElementsOnClick = true;

  jQuery('#template_edit').click(function (e) {
    if(!document.createElementsOnClick) return;

    var cursorX = e.pageX;
    var cursorY = e.pageY;

    var div = jQuery('<div></div>').css({
      position: 'absolute',
      background: 'lightgreen',
      opacity: '0.6',
      top: cursorY - 10 + 'px',
      left: cursorX - 20 + 'px',
      width: '540px',
      height: '100px'
    }).on('click', function(e) {
      e.stopPropagation();  
    });

    var button = jQuery("<input type=button value='X' />").addClass('dynamic-textbox-button').
    on('click', function(e) {
      $(this).parent().remove();
      e.stopPropagation();
    }).appendTo(div);

    var positionX = jQuery("<input type=hidden name='template[signature_position_attributes][left]' />").val(cursorX).appendTo(div);
    var positionY = jQuery("<input type=hidden name='template[signature_position_attributes][top]' />").val(cursorY).appendTo(div);

    div.appendTo(this);
    textbox.focus();
  });
});


