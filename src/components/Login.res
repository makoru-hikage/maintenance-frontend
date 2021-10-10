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
          <button id="login-button" className="text-black p-2 border align-end bg-gray-400">{React.string("Login")}</button>
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