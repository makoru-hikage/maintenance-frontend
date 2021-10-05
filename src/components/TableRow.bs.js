// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

var buttonClasses = "text-black dark:text-white border px-2 m-2";

function TableRow(Props) {
  var areaCode = Props.areaCode;
  var description = Props.description;
  var floor = Props.floor;
  var row = Props.row;
  var column = Props.column;
  return React.createElement("tr", {
              key: "React.string(areaCode)"
            }, React.createElement("td", {
                  className: "index-td"
                }, areaCode), React.createElement("td", {
                  className: "index-td"
                }, description), React.createElement("td", {
                  className: "index-td"
                }, floor), React.createElement("td", {
                  className: "index-td"
                }, row), React.createElement("td", {
                  className: "index-td"
                }, column), React.createElement("td", {
                  className: "index-td"
                }, React.createElement("button", {
                      className: buttonClasses
                    }, "Edit"), React.createElement("button", {
                      className: buttonClasses
                    }, "Delete"), React.createElement("button", {
                      className: buttonClasses
                    }, "View")));
}

var make = TableRow;

export {
  buttonClasses ,
  make ,
  
}
/* react Not a pure module */
