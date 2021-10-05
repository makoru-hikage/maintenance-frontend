let columnFields = [
  "Area Code",
  "Description",
  "Floor",
  "Row",
  "Column",
  "Actions",
]

let columnHeaders = Belt.Array.mapWithIndex(columnFields, (id, field) => {
  <th key={Belt.Int.toString(id)} className="index-th">{React.string(field)}</th>
})

@react.component
let make = () => {
  <div>
    <table className="min-w-full border-collapse block md:table">
      <thead className="block md:table-header-group">
        <tr>
          {React.array(columnHeaders)}
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
  </div>
}