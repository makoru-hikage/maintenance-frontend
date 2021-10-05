@react.component
let make = (
  ~areaCode: string,
  ~description: string,
  ~row: int,
  ~column: int
) => {
  <tr>
    <td>{React.string(areaCode)}</td>
    <td>{React.string(description)}</td>
    <td>{React.int(row)}</td>
    <td>{React.int(column)}</td>
  </tr>
}