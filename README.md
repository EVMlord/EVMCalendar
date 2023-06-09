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

Proposed real life use cases of the **EVM Calendar** can be found [**HERE**](https://github.com/EVMlord/EVMCalendar/blob/main/README.md#real-life-use-cases)

EVM Calendar Implementation Contracts can be found [**HERE**](https://github.com/EVMlord/EVMCalendar/blob/main/README.md#evm-calendar-implementation-contracts)

Here is an example usage of the EVMCalendar contract:
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

## Real life use cases
* **Timestamp verification**: The *EVM Calendar* can be used to verify the timestamp of a particular event or transaction by comparing it with the current date and time in UTC. This can be useful in applications like supply chain management, where tracking and verifying the time of events (e.g., product shipment, delivery) is crucial.
* **Decentralized scheduling and reminders**: The *EVM Calendar* can be used to create and manage schedules and reminders for various purposes, like personal task management, appointment booking, or event planning. By printing today's date, the current time in UTC, and converting timestamps to date strings, users can easily understand and interact with the schedules and reminders.
* **Escrow services**: The *EVM Calendar* can be used to facilitate escrow services, where funds or assets are held in trust until a specific condition is met or a specific time has elapsed. The countdown function can provide the time remaining until the release of the funds or assets.
* **Voting and governance**: The *EVM Calendar* can be used to manage voting processes and governance for decentralized organizations or communities. The countdown function can display the time remaining until the voting period ends, and the timestamp conversion can provide the exact end time for transparency.
* **Event scheduling**: The *EVM Calendar* can be used to schedule events, such as conferences, webinars, or product launches. Users can input the event's timestamp, and the countdown function will display the time remaining until the event begins.
* **Token sale or ICO**: The *EVM Calendar* can be used to manage a token sale or initial coin offering (ICO). The countdown function can be used to show the time remaining until the sale starts or ends, and the timestamp conversion can provide the exact start and end times for transparency.
* **Decentralized finance (DeFi) applications**: The smart contract can be used in various DeFi applications that require time-related information, such as lending platforms (to calculate interest rates and payment deadlines), staking (to track staking duration), or insurance products (to manage policy periods).

Feel free to use it as you see fit!

## EVM Calendar Implementation Contracts
```json
{
  "EVMCalendars": [
    {
      "address": "0xB3a412605838A783C72148B0BB9b33C1DB7f2749",
      "network": "BNB Smart Chain Testnet"
    },
    {
      "address": "0x21eD826DDa652ab16fE08F4DC17A178031754D2E",
      "network": "BNB Smart Chain Mainnet"
    },
    {
      "address": "0x68B5E924DDDdA92dEA7F38f8dCB3386d4854c18F",
      "network": "Arbitrum One"
    },
    {
      "address": "0xe7C2c8ab7766e46406A9c3a2c9119a8A7cBa75ae",
      "network": "Polygon Mainnet"
    },
    {
      "address": "0x8a81348e22B60f79610f2fa6308F61e6c4d10EA0",
      "network": "Metis Andromeda Mainnet"
    }
  ]
}
```

## Contributions

Contributions to the **EVM Calendar** contract are welcome. If you have any bug reports, feature requests, or other contributions, please open an issue or pull request on this repository. Send me your implementations on twitter [@EVMlord](https://twitter.com/EVMlord), I look forward to adding a featured implementations section where I'll reference noteworthy use cases.

### Acknowledgements
@ionikdev wrote the first draft of this documentation.
