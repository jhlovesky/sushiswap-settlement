// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "../libraries/Orders.sol";

interface ISettlement {
    event OrderFilled(bytes32 indexed hash, uint256 amountIn, uint256 amountOut);
    event OrderCanceled(bytes32 indexed hash);
    event FeeTransferred(bytes32 indexed hash, address indexed recipient, uint256 amount);
    event FeeSplitTransferred(bytes32 indexed hash, address indexed recipient, uint256 amount);

    struct FillOrderArgs {
        Orders.Order order;
        uint256 amountToFillIn;
        address[] path;
    }

    function fillOrder(FillOrderArgs calldata args) external returns (uint256 amountOut);

    function fillOrders(FillOrderArgs[] calldata args)
        external
        returns (uint256[] memory amountsOut);

    function cancelOrder(
        address maker,
        address fromToken,
        address toToken,
        uint256 amountIn,
        uint256 amountOutMin,
        address recipient,
        uint256 deadline
    ) external;
}
