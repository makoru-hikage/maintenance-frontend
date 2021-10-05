%%raw("import 'tailwindcss/tailwind.css'")
%%raw("import '../styles/main.css'")

switch(ReactDOM.querySelector("#root")){
  | Some(root) => ReactDOM.render(<Main/>, root)
  | None => () // do nothing
}