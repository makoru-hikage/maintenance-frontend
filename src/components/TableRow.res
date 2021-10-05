@react.component
let make = (
  ~areaCode: string,
  ~description: string,
  ~floor: string,
  ~row: int,
  ~column: int
) => {
  <tr key="React.string(areaCode)">
    <td className="index-td">{React.string(areaCode)}</td>
    <td className="index-td">{React.string(description)}</td>
    <td className="index-td">{React.string(floor)}</td>
    <td className="index-td">{React.int(row)}</td>
    <td className="index-td">{React.int(column)}</td>
    <td className="index-td">{React.string("+-~")}</td>
  </tr>
}