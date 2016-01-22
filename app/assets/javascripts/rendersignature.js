function renderSignature(data, selector) {
  $(selector).signaturePad({displayOnly: true}).regenerate(data);
}
