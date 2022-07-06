let slideIndex = 1;
showSlides(slideIndex, 0);

// Next/previous controls
function plusSlides(n, c) {
  showSlides(slideIndex += n, c);
}

// Thumbnail image controls
function currentSlide(n, c) {
  showSlides(slideIndex = n, c);
}

function showSlides(n, c) {
  let i;
  if (c == "c1"){
	  let slides1 = document.getElementsByClassName("mySlides1");
	  let dots1 = document.getElementsByClassName("demo1");
	  let captionText1 = document.getElementById("caption1");
	  if (n > slides1.length) { slideIndex = 1}
	  if (n < 1) {slideIndex = slides1.length}
	  for (i = 0; i < slides1.length; i++) {
	    slides1[i].style.display = "none";
	  }
	  for (i = 0; i < dots1.length; i++) {
	    dots1[i].className = dots1[i].className.replace(" active1", "");
	  }
	  slides1[slideIndex-1].style.display = "block";
	  dots1[slideIndex-1].className += " active1";
	  captionText1.innerHTML = dots1[slideIndex-1].alt;
  }
  else if (c == "c2") {
	  let slides2 = document.getElementsByClassName("mySlides2");
	  let dots2 = document.getElementsByClassName("demo2");
	  let captionText2 = document.getElementById("caption2");
	  if (n > slides2.length) { slideIndex = 1}
	  if (n < 1) {slideIndex = slides2.length}
	  for (i = 0; i < slides2.length; i++) {
	    slides2[i].style.display = "none";
	  }
	  for (i = 0; i < dots2.length; i++) {
	    dots2[i].className = dots2[i].className.replace(" active2", "");
	  }
	  slides2[slideIndex-1].style.display = "block";
	  dots2[slideIndex-1].className += " active2";
	  captionText2.innerHTML = dots2[slideIndex-1].alt;
  }
  else if (c == "c3") {
	  let slides3 = document.getElementsByClassName("mySlides3");
	  let dots3 = document.getElementsByClassName("demo3");
	  let captionText3 = document.getElementById("caption3");
	  if (n > slides3.length) { slideIndex = 1}
	  if (n < 1) {slideIndex = slides3.length}
	  for (i = 0; i < slides3.length; i++) {
	    slides3[i].style.display = "none";
	  }
	  for (i = 0; i < dots3.length; i++) {
	    dots3[i].className = dots3[i].className.replace(" active3", "");
	  }
	  slides3[slideIndex-1].style.display = "block";
	  dots3[slideIndex-1].className += " active3";
	  captionText3.innerHTML = dots3[slideIndex-1].alt;
  }
  else {
	  let slides1 = document.getElementsByClassName("mySlides1");
	  let slides2 = document.getElementsByClassName("mySlides2");
	  let slides3 = document.getElementsByClassName("mySlides3");
	  let dots1 = document.getElementsByClassName("demo1");
	  let dots2 = document.getElementsByClassName("demo2");
	  let dots3 = document.getElementsByClassName("demo3");
	  let captionText1 = document.getElementById("caption1");
	  let captionText2 = document.getElementById("caption2");
	  let captionText3 = document.getElementById("caption3");
	  /////////////////////////////////////////////////
	  if (n > slides1.length) { slideIndex = 1}
	  if (n < 1) {slideIndex = slides1.length}
	  for (i = 0; i < slides1.length; i++) {
	    slides1[i].style.display = "none";
	  }
	  for (i = 0; i < dots1.length; i++) {
	    dots1[i].className = dots1[i].className.replace(" active1", "");
	  }
	  slides1[slideIndex-1].style.display = "block";
	  dots1[slideIndex-1].className += " active1";
	  captionText1.innerHTML = dots1[slideIndex-1].alt;
	  ////////////////////////////////////////////////
	  if (n > slides2.length) { slideIndex = 1}
	  if (n < 1) {slideIndex = slides2.length}
	  for (i = 0; i < slides2.length; i++) {
	    slides2[i].style.display = "none";
	  }
	  for (i = 0; i < dots2.length; i++) {
	    dots2[i].className = dots2[i].className.replace(" active2", "");
	  }
	  slides2[slideIndex-1].style.display = "block";
	  dots2[slideIndex-1].className += " active2";
	  captionText2.innerHTML = dots2[slideIndex-1].alt;
	  ///////////////////////////////////////////////////
	  if (n > slides3.length) { slideIndex = 1}
	  if (n < 1) {slideIndex = slides3.length}
	  for (i = 0; i < slides3.length; i++) {
	    slides3[i].style.display = "none";
	  }
	  for (i = 0; i < dots3.length; i++) {
	    dots3[i].className = dots3[i].className.replace(" active3", "");
	  }
	  slides3[slideIndex-1].style.display = "block";
	  dots3[slideIndex-1].className += " active3";
	  captionText3.innerHTML = dots3[slideIndex-1].alt;
	 
  }
  }

/*let dots = document.getElementsByClassName("demo");
let captionText = document.getElementById("caption");
if (n > slides1.length) { slideIndex = 1}

if (n < 1) {slideIndex = slides1.length}
for (i = 0; i < slides1.length; i++) {
  slides1[i].style.display = "none";
}
for (i = 0; i < dots.length; i++) {
  dots[i].className = dots[i].className.replace(" active", "");
}
slides1[slideIndex-1].style.display = "block";
dots[slideIndex-1].className += " active";
captionText.innerHTML = dots[slideIndex-1].alt;*/
  