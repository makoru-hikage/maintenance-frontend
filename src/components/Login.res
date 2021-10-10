module LoginAction = {

  type jsonToken = {
    token: string
  }

  @scope("JSON") @val external parseTokenJson: string => jsonToken = "parse"

  let storeToken = token => {
    let tokenParts = Js.String.split(".", token)
    Dom.Storage.setItem("header", tokenParts[0], Dom.Storage.localStorage)
    Dom.Storage.setItem("payload", tokenParts[1], Dom.Storage.localStorage)
    Cookie.setCookie("token-signature", tokenParts[2])
  }

  let login = (u: string, p: string): () => {
    let user = {
      "username": u,
      "password": p
    }

    let url = Env.apiHost->Belt.Option.mapWithDefault("", x => x)

    let headers = Js.Dict.fromList(list{
      ("Content-Type", "application/json")
    })

    Request.make(
      ~url= url ++ "/api/login",
      ~method=#POST,
      ~responseType=Text,
      ~body=Js.Json.serializeExn(user),
      ~headers=headers, 
      ())
    ->Future.get(response => {
      switch response {
      | Ok({response}) =>
        {
          storeToken(parseTokenJson(Belt.Option.getExn(response)).token)
        }
      | Error(error) =>
        Js.log(error)
      }
    })
  }
}

module LoginForm = {
  @react.component
  let make = () => {

  let (username, setUsername) = React.useState(_ => "")
  let (password, setPassword) = React.useState(_ => "")

  let usernameChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setUsername(_prev => value);
  }

  let passwordChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setPassword(_prev => value);
  }

  let login = (evt) => {
    ReactEvent.Mouse.preventDefault(evt)
    LoginAction.login(username, password)
  }

    <div className="inline-block align-bottom bg-gray-400 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
      <form className="flex flex-col flex-wrap px-8 pt-6 pb-8 mb-4 bg-gray-300">
        <div className="m-4">
          <label htmlFor="username" className="table-cell text-black">{React.string("Username: ")} </label>
          <input onChange=usernameChange type_="text" name="username" id="username-field" value=username className="border shadow table-cell"/>
        </div>
        <div className="m-4">
          <label htmlFor="password" className="table-cell text-black">{React.string("Password: ")} </label>
          <input onChange=passwordChange type_="password" name="password" id="password-field" value=password className="border shadow table-cell"/>
        </div>
        <div className="m-4">
          <button onClick=login id="login-button" className="text-black p-2 border align-end bg-gray-400">{React.string("Login")}</button>
        </div>
      </form>
    </div>
  }
}

module LoginModal = {
  @react.component
  let make = () => {
    <div className="flex items-end justify-center ">
      <LoginForm/>
    </div>
  }
}