
let columnFields = [
  "Area Code",
  "Description",
  "Floor",
  "Row",
  "Column",
  "Actions",
]

let columnHeaders = Belt.Array.mapWithIndex(columnFields, (id, field) => {
  <th key={Belt.Int.toString(id)}>{React.string(field)}</th>
})

@react.component
let make = () => {
  <div>
    <table>
      <thead>
        <tr>
          {React.array(columnHeaders)}
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>
}