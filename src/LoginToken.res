let getToken = ():string => {
  let header = Dom.Storage.getItem("header", Dom.Storage.localStorage)
  let payload = Dom.Storage.getItem("payload", Dom.Storage.localStorage)
  let jsCookie = JsCookie.getCookie()

  let cookie = Cookie.parse(~str=jsCookie, ())->Js.Dict.get("token-signature")
  let result = Belt.Array.keepMap([header, payload, cookie], x => x)

  if Belt.Array.length(result) > 0 {
    result[0] ++ "." ++ result[1] ++ "." ++ result[2]
  } else {
    ""
  }
}