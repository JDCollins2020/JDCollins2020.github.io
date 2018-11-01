function setDisplay(element){
  //document.getElementById('message').style.backgroundImage = element.src;
  document.getElementById('message').style.backgroundImage = 'url(' + element.src + ')';
}
function resetDisplay(){
  x = document.getElementById('message');
  x.innerHTML = 'Hover over image';
  x.style.backgroundImage = "url();";
}
