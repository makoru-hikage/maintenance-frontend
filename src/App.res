%%raw("import 'tailwindcss/tailwind.css'")
%%raw("import '../styles/main.css'")

switch(ReactDOM.querySelector("#root")){
  | Some(root) => ReactDOM.render(<Login.LoginModal/>, root)
  | None => () // do nothing
}