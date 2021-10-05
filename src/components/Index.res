let perhaps: FloorArea.t = {
  areaCode: "perhaps",
  description: "perhaps",
  floor: "perhaps",
  row: 0,
  column: 0
}

@react.component
let make = () => {
  <div className="mx-16">
    <div id="top-buttons">
      <button className="text-black dark:text-white p-4">{React.string("Add")}</button>
    </div>
    <div id="table-container">
      <FloorAreaTable floorAreas=[perhaps]/>
    </div>
  </div>
}