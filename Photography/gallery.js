function setDisplay(element){
  //document.getElementById('message').style.backgroundImage = element.src;
  document.getElementById('message').style.backgroundImage = 'url(' + element.src + ')';
}
function resetDisplay(){
  document.getElementById('message').innerHTML = 'Hover over image';
   document.getElementById('message').style.backgroundImage = "url('');";
}
