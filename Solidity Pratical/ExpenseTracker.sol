// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense {
        address user;
        uint256 amount;
        string description;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, 25, "Shoes"));
        expenses.push(Expense(msg.sender, 100, "Clothes"));
        expenses.push(Expense(msg.sender, 90, "Rings"));
    }

    function addExpense(string memory _description, uint256 _amount) public {
        expenses.push(Expense(msg.sender, _amount, _description));
    }

    function getExpenses(address _user) public view returns (Expense[] memory) {
        Expense[] memory userExpenses;
        for (uint256 i = 0; i < expenses.length; i++) {
            if (expenses[i].user == _user) {
                userExpenses.push(expenses[i]);
            }
        }
        return userExpenses;
    }
}
