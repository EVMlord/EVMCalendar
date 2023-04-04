# EVMCalendar

The **EVM Calendar** smart contract provides functionality to convert a UNIX timestamp into a human-readable date string in the format "DD-MM-YYYY HH:MM:SS".

![image](https://user-images.githubusercontent.com/85406816/228015169-194365d5-f744-4b12-b195-051d1fa2a6c3.png)

## Functions
### convertTimestamp
```solidity
    function convertTimestamp(uint256 timestamp) 
        public 
        pure 
        returns (string memory)
```
**Description**: This function converts a given UNIX timestamp into a human-readable date string in the format "DD-MM-YYYY HH:mm:ss".

**Input**: A uint256 UNIX timestamp value.

**Output**: A string representing the date in the format "DD-MM-YYYY HH:mm:ss".

### countdown
```solidity
    function countdown(uint256 endTimestamp)
        external
        view
        returns (string memory)
```
**Description**: The countdown function takes a Unix timestamp as input, and returns a string in the format X days, HH:MM:SS representing the time remaining until the input timestamp is reached, starting from the current time obtained using `block.timestamp`.

**Input**: A uint256 UNIX timestamp value.

**Output**: A string representing the time remaining in the format "DD-HH-MM-SS".

### checkTimeUTC
```solidity
    function checkTimeUTC() 
        external 
        view 
        returns (string memory)
```
**Description**: This function converts a the current time into a human-readable time string.

**Output**: A string representing the current time in the format "HH:mm:ss".

### checkDateUTC
```solidity
    function checkDateUTC() 
        external 
        view 
        returns (string memory)
```
**Description**: This function converts a the current timestamp into a human-readable date string.

**Output**: A string representing the current date in the format "DD-MM-YYYY".

### getCurrentDateAndTimeUTC
```solidity
    function getCurrentDateAndTimeUTC() 
        external 
        view 
        returns (string memory);
```
**Description**: The getCurrentDateAndTimeUTC function converts the current UTC date and time in the format "YYYY-MM-DD HH:MM:SS". 

**Output**: A string representing the current date and time in the format "YYYY-MM-DD HH:MM:SS".



## Usage
To use the **EVM Calendar** contract, you can import it into your Solidity project by inheriting the ```interface```. You can then call the public functions on the contract to convert timestamps to date components or date strings.

Here is an example usage of the UnixCalendar contract:
```solidity
// SPDX-License-Identifier: MIT
// All times are in UTC

pragma solidity ^0.8.19;

interface IEVMCalendar {
    // @dev Converts timestamp to date string in YYYY-MM-DD HH:MM:SS format
    function convertTimestamp(uint256 unixTimestamp)
        external
        pure
        returns (string memory);

    function countdown(uint256 endTimestamp)
        external
        view
        returns (string memory);

    // @dev Returns current time in HH:MM:SS format
    function checkTimeUTC() external view returns (string memory);

    function checkDateUTC() external view returns (string memory);

    function getCurrentDateAndTimeUTC() external view returns (string memory);
}
```
Then you specify the contract address of the **EVM Clendar** implementation deployed on the evm you are working with.
```solidity
contract MySmartContract {
    IEVMCalendar EVMSQL;

    constructor(IEVMCalendar _EVMSQL) {
        EVMSQL = _EVMSQL;
    }
 }
```
It can also be declared as a constant like in the example below.
```solidity
contract MySmartContract {
    IEVMCalendar constant EVMSQL = IEVMCalendar(0xCalendarAddress);

    constructor() {}
 }
```
Now you can reference any of the calendar functions in your smart contract.
```solidity
    function convertTimestamp(uint256 unixTimestamp)
        external
        view
        returns (string memory)
    {
        return EVMSQL.convertTimestamp(unixTimestamp);
    }

    function countdown(uint256 endTimestamp)
        external
        view
        returns (string memory)
    {
        return EVMSQL.countdown(endTimestamp);
    }

    function checkTimeUTC() external view returns (string memory) {
        return EVMSQL.checkTimeUTC();
    }

    function checkDateUTC() external view returns (string memory) {
        return EVMSQL.checkDateUTC();
    }

    function getCurrentDateAndTimeUTC() external view returns (string memory) {
        return EVMSQL.getCurrentDateAndTimeUTC();
    }
}
```
Implementation
![image](https://user-images.githubusercontent.com/85406816/228246314-0d8064c4-d433-4dc4-96b6-1c65ff430241.png)
Feel free to use it as you see fit!

##Contributions

Contributions to the **EVM Calendar** contract are welcome. If you have any bug reports, feature requests, or other contributions, please open an issue or pull request on this repository.


