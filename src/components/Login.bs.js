// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Cookie from "../Cookie.bs.js";
import * as Future from "rescript-future/src/Future.bs.js";
import * as Js_dict from "rescript/lib/es6/js_dict.js";
import * as Js_json from "rescript/lib/es6/js_json.js";
import * as $$Request from "rescript-request/src/Request.bs.js";
import * as Caml_array from "rescript/lib/es6/caml_array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Dom_storage from "rescript/lib/es6/dom_storage.js";

function storeToken(token) {
  var tokenParts = token.split(".");
  Dom_storage.setItem("header", Caml_array.get(tokenParts, 0), localStorage);
  Dom_storage.setItem("payload", Caml_array.get(tokenParts, 1), localStorage);
  return Cookie.setCookie("token-signature", Caml_array.get(tokenParts, 2));
}

function login(u, p) {
  var user = {
    username: u,
    password: p
  };
  var url = Belt_Option.mapWithDefault(Caml_option.nullable_to_opt(import.meta.env.VITE_API_HOST), "", (function (x) {
          return x;
        }));
  var headers = Js_dict.fromList({
        hd: [
          "Content-Type",
          "application/json"
        ],
        tl: /* [] */0
      });
  return Future.get($$Request.make(url + "/api/login", "POST", /* Text */0, Js_json.serializeExn(user), Caml_option.some(headers), undefined, undefined, undefined, undefined, undefined), (function (response) {
                if (response.TAG === /* Ok */0) {
                  return storeToken(JSON.parse(Belt_Option.getExn(response._0.response)).token);
                }
                console.log(response._0);
                
              }));
}

var LoginAction = {
  storeToken: storeToken,
  login: login
};

function Login$LoginForm(Props) {
  var match = React.useState(function () {
        return "";
      });
  var setUsername = match[1];
  var username = match[0];
  var match$1 = React.useState(function () {
        return "";
      });
  var setPassword = match$1[1];
  var password = match$1[0];
  var usernameChange = function (evt) {
    evt.preventDefault();
    var value = evt.target.value;
    return Curry._1(setUsername, (function (_prev) {
                  return value;
                }));
  };
  var passwordChange = function (evt) {
    evt.preventDefault();
    var value = evt.target.value;
    return Curry._1(setPassword, (function (_prev) {
                  return value;
                }));
  };
  var login$1 = function (evt) {
    evt.preventDefault();
    return login(username, password);
  };
  return React.createElement("div", {
              className: "inline-block align-bottom bg-gray-400 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full"
            }, React.createElement("form", {
                  className: "flex flex-col flex-wrap px-8 pt-6 pb-8 mb-4 bg-gray-300"
                }, React.createElement("div", {
                      className: "m-4"
                    }, React.createElement("label", {
                          className: "table-cell text-black",
                          htmlFor: "username"
                        }, "Username: "), React.createElement("input", {
                          className: "border shadow table-cell",
                          id: "username-field",
                          name: "username",
                          type: "text",
                          value: username,
                          onChange: usernameChange
                        })), React.createElement("div", {
                      className: "m-4"
                    }, React.createElement("label", {
                          className: "table-cell text-black",
                          htmlFor: "password"
                        }, "Password: "), React.createElement("input", {
                          className: "border shadow table-cell",
                          id: "password-field",
                          name: "password",
                          type: "password",
                          value: password,
                          onChange: passwordChange
                        })), React.createElement("div", {
                      className: "m-4"
                    }, React.createElement("button", {
                          className: "text-black p-2 border align-end bg-gray-400",
                          id: "login-button",
                          onClick: login$1
                        }, "Login"))));
}

var LoginForm = {
  make: Login$LoginForm
};

function Login$LoginModal(Props) {
  return React.createElement("div", {
              className: "flex items-end justify-center "
            }, React.createElement(Login$LoginForm, {}));
}

var LoginModal = {
  make: Login$LoginModal
};

export {
  LoginAction ,
  LoginForm ,
  LoginModal ,
  
}
/* react Not a pure module */
