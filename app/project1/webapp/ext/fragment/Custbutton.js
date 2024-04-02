sap.ui.define([
    "sap/m/Dialog",
    "sap/m/Table",
    "sap/m/Column",
    "sap/m/Input",
    "sap/m/Button",
    "sap/m/ColumnListItem",
    "sap/m/Label",
    "sap/m/Toolbar",
    "sap/m/ToolbarSpacer"
  ], function(Dialog, Table, Column, Input, Button, ColumnListItem, Label, Toolbar, ToolbarSpacer) {
    "use strict";
  
    var onPress = function() {
      // Create the table
      var oTable = new Table({
        inset: false,
        columns: [
          new Column({
            header: new Label({ text: "Reference Number" })
          }),
          new Column({
            header: new Label({ text: "Amount" })
          }),
          new Column({
            hAlign: "End",
            width: "50px" // Adjust width as needed
          })
        ],
        headerToolbar: new Toolbar({
          content: [
            new ToolbarSpacer(),
            new Button({
              text: "Add Row",
              press: function() {
                if (oTable.getItems().length < 5) {
                  var newRow = createTableRow("", "", oTable);
                  oTable.addItem(newRow);
                } else {
                  sap.m.MessageBox.error("You cannot add more than five rows.");
                }
              }
            })
          ]
        })
      });
  
      // Create table items
      var oItem1 = createTableRow("", "", oTable);
  
      // Add items to the table
      oTable.addItem(oItem1);
  
      // Create a custom dialog to wrap the table
      var oDialog = new Dialog({
        title: "Dynamic Table in Message Box",
        content: oTable,
        buttons: [
          new Button({
            text: "OK",
            press: function() {
              oDialog.close();
            }
          })
        ]
      });
  
      // Set the width of the dialog to 50%
      oDialog.setContentWidth("50%");
  
      // Open the dialog
      oDialog.open();
    };
  
    var createTableRow = function(cell1Value, cell2Value, oTable) {
      // Create table item
      var oItem = new ColumnListItem({
        cells: [
          new Input({ value: cell1Value, placeholder: "Enter reference number" }),
          new Input({ value: cell2Value, placeholder: "Enter Amount" }),
          new Button({
            text: "Add Row",
            visible: false,
            press: function() {
              if (oTable.getItems().length < 5) {
                var newRow = createTableRow("", "", oTable);
                oTable.addItem(newRow);
              } else {
                sap.m.MessageBox.error("You cannot add more than five rows.");
              }
            }
          })
        ]
      });
  
      return oItem;
    };
  
    return {
      onPress: onPress
    };
  });
  