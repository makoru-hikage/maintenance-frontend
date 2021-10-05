@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
    | list{"login"} => <Login.LoginModal/>
    | list{} => <Index/>
    | _ => <PageNotFound/>
  }
}