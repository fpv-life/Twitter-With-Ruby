if (window.location.hash === "#_=_"){
  history.replaceState 
      ? history.replaceState(null, null, window.location.href.split("#")[0])
      : window.location.hash = "";
}

setTimeout(fade_out, 2000);

function fade_out() {
  $(".alert").fadeOut().empty();
}

var Followers = function(check){
  var people = document.getElementsByClassName("list-following")[0];
  var strangers = document.getElementsByClassName("list-followers")[0];
  var likes = document.getElementsByClassName("list-likes")[0];
  var active = document.getElementsByClassName("selection");

  if(check === 'followers'){
      active[1].classList.add("active");
      active[0].classList.remove("active");
      active[2].classList.remove("active");

      people.style.display = "none";
      strangers.style.display = "block";
      likes.style.display = "none";
  }else if(check === 'following'){
      active[1].classList.remove("active");
      active[0].classList.add("active");
      active[2].classList.remove("active");

      people.style.display = "block";
      strangers.style.display = "none";
      likes.style.display = "none";
  }else{
      active[1].classList.remove("active");
      active[0].classList.remove("active");
      active[2].classList.add("active");
    
      people.style.display = "none";
      strangers.style.display = "none";
      likes.style.display = "block";
  }
}