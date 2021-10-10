// Generated by ReScript, PLEASE EDIT WITH CARE


var setCookie = (function(name, value) {
    document.cookie = name + "=" + value + "; SameSite=Strict;";
  });

function getCookie(param) {
  return document.cookie;
}

var deleteCookie = (function(name, value) {
    document.cookie = "";
  });

export {
  setCookie ,
  getCookie ,
  deleteCookie ,
  
}
/* No side effect */