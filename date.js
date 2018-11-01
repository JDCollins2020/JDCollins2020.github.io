function setDate(){
  document.getElementById('date').innerHTML= Date();
}
function display(element){
  console.log(element.src);
    document.getElementById('message').style.backgroundImage = element.src;
}
