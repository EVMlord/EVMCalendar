// SPDX-License-Identifier: GPL-2.0-or-later
// @author EVMlord => https://lord.dev
// All times are in UTC 

pragma solidity ^0.8.19;

interface IEVMCalendar {
    // @dev Converts timestamp to date string in YYYY-MM-DD HH:MM:SS format
    function convertTimestamp(uint256 unixTimestamp) external pure returns (string memory);
    function countdown(uint256 endTimestamp) external view returns (string memory);
    // @dev Returns current time in HH:MM:SS format
    function checkTimeUTC() external view returns (string memory);
    function checkDateUTC() external view returns (string memory);
    function getCurrentDateAndTimeUTC() external view returns (string memory); 
    }
