%%raw("import '../styles/main.css'")

switch(ReactDOM.querySelector("#root")){
  | Some(root) => ReactDOM.render(<Index/>, root)
  | None => () // do nothing
}