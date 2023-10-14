// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

interface IRewardPot {
    function addToRewardPot(uint256 amount) external;
}

contract Bitxchange is Ownable {
    IUniswapV2Router02 public uniswapRouter;
    IRewardPot public rewardPot;
    uint256 public feePercentage = 500;  // 0.5% fee, scaled by 10^4

    event FeeUpdated(uint256 newFee);
    event RewardPotUpdated(address newRewardPot);
    event SwapSuccessful(address indexed from, uint256 amount, uint256 receivedETH);

    constructor(address _uniswapRouter, address _rewardPot) Ownable(msg.sender) {
        uniswapRouter = IUniswapV2Router02(_uniswapRouter);
        rewardPot = IRewardPot(_rewardPot);
    }

    // Owner deposits ETH into the contract
    function depositETH() external payable onlyOwner {}

    // Owner can withdraw ETH
    function withdrawETH(uint256 amount) external onlyOwner {
        payable(owner()).transfer(amount);
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

    // Function to check if a swap is possible
    function canSwap(address token, uint256 amountIn, uint256 userGasPrice) public view returns (bool) {
        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = uniswapRouter.WETH();

        // Check if there's enough liquidity for the swap
        uint256[] memory amountsOut = uniswapRouter.getAmountsOut(amountIn, path);
        if (amountsOut[1] == 0) {
            return false;
        }

        // Estimate gas cost and check against the minimum output amount
        uint256 estimatedGasForSwap = 221428;  // Including 20% buffer
        uint256 estimatedGasCost = estimatedGasForSwap * userGasPrice;
        if (estimatedGasCost >= amountsOut[1]) {
            return false;
        }

        return true;
    }

    function getSwapQuote(address token, uint256 amount, uint256 slippage, uint256 userGasPrice) public view returns (uint256 minAmountOut, uint256 estimatedGasCost, bool canDoSwap) {
        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = uniswapRouter.WETH();

        // Get the expected output amount based on the input amount and path
        uint256[] memory amountsOut = uniswapRouter.getAmountsOut(amount, path);
        uint256 expectedAmountOut = amountsOut[1];

        // Apply slippage
        minAmountOut = expectedAmountOut * (10000 - slippage) / 10000;

        // Benchmark gas for Uniswap swap: 184,523 (from Ethereum.org)
        // Adding a 20% buffer for other operations and fluctuations: ~221,428
        uint256 estimatedGasForSwap = 221428;

        // Calculate estimated gas cost based on user-provided gas price
        estimatedGasCost = estimatedGasForSwap * userGasPrice;

        return (minAmountOut, estimatedGasCost, canSwap(token, amount, userGasPrice));
    }



    function swapTokensForETH(address token, uint256 amount, uint256 minAmountOut) external onlyOwner {
        // Estimate gas cost and check against minAmountOut
        uint256 estimatedGasForSwap = 221428;  // Including 20% buffer
        uint256 estimatedGasCost = estimatedGasForSwap * tx.gasprice;
        require(estimatedGasCost < minAmountOut, "Estimated gas cost exceeds minAmountOut");
        require(canSwap(token, amount,  tx.gasprice), "Swap Expected to Fail");
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
