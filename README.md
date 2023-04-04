# EVMCalendar

The **EVM Calendar** smart contract provides functionality to convert a UNIX timestamp into a human-readable date string in the format "DD-MM-YYYY HH:MM:SS".

![image](https://user-images.githubusercontent.com/85406816/228015169-194365d5-f744-4b12-b195-051d1fa2a6c3.png)

## Functions
### convertTimestamp
solidity
```solidity
function convertTimestampToDateString(uint256 timestamp) public pure returns (string memory)
```
Description: This function converts a given UNIX timestamp into a human-readable date string in the format "DD-MMM-YYYY HH:mm:ss".

Input: A uint256 UNIX timestamp value.

Output: A string representing the date in the format "DD-MMM-YYYY HH:mm:ss".


Implementation
![image](https://user-images.githubusercontent.com/85406816/228246314-0d8064c4-d433-4dc4-96b6-1c65ff430241.png)



