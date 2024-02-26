// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ECommerce {
    uint256 public totalCommerce;
    mapping(address => Commerce) public commerce;

    struct Commerce {
        string user;
        string customer;
        string login;
        string logout;
        string firstname;
        string lastname;
        string email;
        uint256 phoneNumber;
        string items;
        address walletAddress;
        uint256 amount;
        address payer;
        address payee;
        bool paid;
        int256 logitiude;
        int256  latitude;
    }

    function addECommerce(
        string memory _user,
        string memory _customer,
        string memory _login,
        string memory _logout,
        string memory _firstname,
        string memory _lastname,
        string memory _email,
        uint256 _phoneNumber,
        string memory _items,
        address _walletAddress,
        uint256 _amount,
        address _payer,
        address _payee,
        bool _paid
    ) public {
        Commerce storage newCommerce = commerce[msg.sender];
        newCommerce.user = _user;
        newCommerce.customer = _customer;
        newCommerce.login = _login;
        newCommerce.logout = _logout;
        newCommerce.firstname = _firstname;
        newCommerce.lastname = _lastname;
        newCommerce.email = _email;
        newCommerce.phoneNumber = _phoneNumber;
        newCommerce.items = _items;
        newCommerce.walletAddress = _walletAddress;
        newCommerce.amount = _amount;
        newCommerce.payer = _payer;
        newCommerce.payee = _payee;
        newCommerce.paid = _paid;

        totalCommerce++;
    }

    function getCommerceDetail() external view returns (Commerce memory) {
        return commerce[msg.sender];
    }

    function balanceOf() public view returns (uint256) {
        return address(this).balance;
    }

    event PaymentReceived(address indexed from, uint256 amount);

    modifier onlyPayer() {
        require(msg.sender == commerce[msg.sender].payer, "Only payer can call this function");
        _;
    }

    modifier onlyPayee() {
        require(msg.sender == commerce[msg.sender].payee, "Only payee can call this function");
        _;
    }

    modifier notPaid() {
        require(!commerce[msg.sender].paid, "Payment has already been made");
        _;
    }

    function makePayment() external onlyPayer notPaid payable {
        require(msg.value == commerce[msg.sender].amount, "Incorrect payment amount");
        commerce[msg.sender].payee.transfer(msg.value);
            }
        function createPayment() extenal {
        commerce[msg.sender].paid = true;
        emit PaymentReceived(msg.sender, msg.value);
    }

    function getPaymentDetail() external view returns (address, address, uint256, bool) {
        return (
            commerce[msg.sender].payer,
            commerce[msg.sender].payee,
            commerce[msg.sender].amount,
            commerce[msg.sender].paid
        );
    }

    function incrementCart(string memory _items) public {
        commerce[msg.sender].items = _items;
    }

    function decrementCart(string memory _items) public {
        commerce[msg.sender].item = _item;
    }

    function addClothes() external {
        clothes++;
    }

    contract Location  is ECommerce{
        struct Location {
            address userAddress;
            int256  latitude;
            int256 longitude;

        }
        mapping(address=> Location) public userLocation;

        function setUserLocation(int256 _latitude,int256 _longitiude) public  {
            userLocation[msg.sender] = Location (_latitude,_longitiude)
        }  
    }
   
    }
    
   
    

          


  

   
