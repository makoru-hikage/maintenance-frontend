@val @scope("document") external cookie: string = "cookie"

let setCookie = %raw(`
  function(name, value) {
    document.cookie = name + "=" + value + "; SameSite=Strict;";
  }
`)

let getCookie = () => cookie

let deleteCookie = %raw(`
  function(name, value) {
    document.cookie = "";
  }
`)