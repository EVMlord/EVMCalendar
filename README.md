# EVMCalendar

The **EVM Calendar** smart contract provides functionality to convert a UNIX timestamp into a human-readable date string in the format "DD-MM-YYYY HH:MM:SS".

![image](https://user-images.githubusercontent.com/85406816/228015169-194365d5-f744-4b12-b195-051d1fa2a6c3.png)

## Functions
### convertTimestamp
solidity
```solidity
function convertTimestampToDateString(uint256 timestamp) public pure returns (string memory)
```
**Description**: This function converts a given UNIX timestamp into a human-readable date string in the format "DD-MMM-YYYY HH:mm:ss".

**Input**: A uint256 UNIX timestamp value.

**Output**: A string representing the date in the format "DD-MMM-YYYY HH:mm:ss".



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

contract EVMCalendarImplementation {
    IEVMCalendar EVMSQL;

    constructor(IEVMCalendar _EVMSQL) {
        EVMSQL = _EVMSQL;
    }

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



