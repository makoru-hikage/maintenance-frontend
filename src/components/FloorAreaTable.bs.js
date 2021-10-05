// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

var columnFields = [
  "Area Code",
  "Description",
  "Floor",
  "Row",
  "Column",
  "Actions"
];

var columnHeaders = Belt_Array.mapWithIndex(columnFields, (function (id, field) {
        return React.createElement("th", {
                    key: String(id),
                    className: "index-th"
                  }, field);
      }));

function FloorAreaTable(Props) {
  return React.createElement("div", undefined, React.createElement("table", {
                  className: "min-w-full border-collapse block md:table"
                }, React.createElement("thead", {
                      className: "block md:table-header-group"
                    }, React.createElement("tr", undefined, columnHeaders)), React.createElement("tbody", undefined)));
}

var make = FloorAreaTable;

export {
  columnFields ,
  columnHeaders ,
  make ,
  
}
/* columnHeaders Not a pure module */
