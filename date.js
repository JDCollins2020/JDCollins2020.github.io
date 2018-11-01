function setDate(){
  document.getElementById('date').innerHTML= Date();
}
function display(element){
    document.getElementById('message').style.backgroundImage = "url(" +element.src+ ")";
}
