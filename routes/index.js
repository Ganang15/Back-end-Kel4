const express = require("express");
const router = express.Router();
const main = require("../app/controllers/api/v1/main");

const userRouter = require("./userRouter");
const categoryRouter = require("./categoryRouter");
const productRouter = require("./productRouter");
const wishlistRouter = require("./wishlistRouter");
const transactionRouter = require("./transactionRouter");

router.use("/api/v1", userRouter);
router.use("/api/v1/category", categoryRouter);
router.use("/api/v1/product", productRouter);
router.use("/api/v1/wishlist", wishlistRouter);
router.use("/api/v1/transaction", transactionRouter);

router.use(main.onLost);
router.use(main.onError);

module.exports = router;
