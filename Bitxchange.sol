// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

interface IRewardPot {
    function addToRewardPot(uint256 amount) external;
}

contract GaslessSwap is Ownable {
    IUniswapV2Router02 public uniswapRouter;
    IRewardPot public rewardPot;
    uint256 public feePercentage = 500;  // 0.5% fee, scaled by 10^4

    event FeeUpdated(uint256 newFee);
    event RewardPotUpdated(address newRewardPot);
    event SwapSuccessful(address indexed from, uint256 amount, uint256 receivedETH);

    constructor(address _uniswapRouter, address _rewardPot) {
        uniswapRouter = IUniswapV2Router02(_uniswapRouter);
        rewardPot = IRewardPot(_rewardPot);
    }

    function setFeePercentage(uint256 _newFee) external onlyOwner {
        feePercentage = _newFee;
        emit FeeUpdated(_newFee);
    }

    function setRewardPot(address _newRewardPot) external onlyOwner {
        require(_newRewardPot != address(0), "Invalid address");
        rewardPot = IRewardPot(_newRewardPot);
        emit RewardPotUpdated(_newRewardPot);
    }

    function getSwapQuote(uint256 amount, uint256 slippage, uint256 userGasPrice) public view returns (uint256 minAmountOut, uint256 estimatedGasCost) {
        // Dummy logic for minAmountOut, replace with actual logic
        minAmountOut = amount * (10000 - slippage) / 10000;

        // Benchmark gas for Uniswap swap: 184,523 (from Ethereum.org)
        // Adding a 20% buffer for other operations and fluctuations: ~221,428
        uint256 estimatedGasForSwap = 221428;

        // Calculate estimated gas cost based on user-provided gas price
        estimatedGasCost = estimatedGasForSwap * userGasPrice;

        return (minAmountOut, estimatedGasCost);
    }

    function swapTokensForETH(address token, uint256 amount, uint256 minAmountOut, uint256 userGasPrice) external onlyOwner {
        // Estimate gas cost and check against minAmountOut
        uint256 estimatedGasForSwap = 221428;  // Including 20% buffer
        uint256 estimatedGasCost = estimatedGasForSwap * userGasPrice;
        require(estimatedGasCost < minAmountOut, "Estimated gas cost exceeds minAmountOut");

        // Perform the swap
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        IERC20(token).approve(address(uniswapRouter), amount);

        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = uniswapRouter.WETH();

        uint256[] memory amounts = uniswapRouter.swapExactTokensForETH(amount, minAmountOut, path, address(this), block.timestamp);
        uint256 receivedETH = amounts[1];

        // Calculate and send the fee
        uint256 fee = (receivedETH * feePercentage) / 10000;
        uint256 rewardPotFee = (fee * 90) / 100;
        uint256 contractFee = fee - rewardPotFee;

        rewardPot.addToRewardPot(rewardPotFee);
        payable(owner()).transfer(contractFee);

        // Send the remaining ETH back to the original sender
        uint256 remainingETH = receivedETH - fee;
        payable(msg.sender).transfer(remainingETH);

        emit SwapSuccessful(msg.sender, amount, receivedETH);
    }
}
