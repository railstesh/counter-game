document.addEventListener('DOMContentLoaded', () => {
  var random_images = document.getElementById("random-images");
  if (random_images) {
    var images = random_images.getAttribute("data").split(" ");
    var time_counter = 10;
    var image_counter = 0;
    setInterval(function(){
      document.getElementById("timer").innerHTML = time_counter;
      document.getElementById("image").src = images[image_counter];
      time_counter--;
      image_counter++;
      if (image_counter >= images.length) {
        image_counter = 0;
      }
      if (time_counter === 0) {
        time_counter = 10;
      }
    }, 1000);
  }
  if(document.getElementById("upload-button")) {
    document.getElementById("upload-button").disabled = true;
    document.querySelector('#file-field').addEventListener("change",function(){
      if (document.getElementById("file-field").files.length > 0) {
        document.getElementById("upload-button").disabled = false;
      }
    });
  }
})

function postPlays() {
  var xmlhttp;
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  }
  xmlhttp.onreadystatechange = function() {
  if (xmlhttp.readyState === 4) {
    if (xmlhttp.status === 200) {
      data = JSON.parse(xmlhttp.responseText);
      timer = data["timer_count"];
      url = data["image_url"];
      var table = document.getElementById("plays");
      var row = table.insertRow(1);
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      var img = document.createElement("img");
      img.style.cssText = "height: 50px";
      img.src = url;
      cell1.innerHTML = timer;
      cell2.appendChild(img);
      }
    }
  }
  timer = document.getElementById("timer").innerHTML;
  image = document.getElementById("image").src;
  xmlhttp.open("POST", "/plays", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("play[timer_count]=" + timer + "&play[image_url]=" + image + "");
}
