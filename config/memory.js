const multer = require("multer");
const path = require("path");

const storage = multer.memoryStorage();

// Upload middleware
module.exports = multer({ storage });