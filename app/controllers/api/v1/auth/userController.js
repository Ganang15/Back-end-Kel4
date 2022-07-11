const userService = require("../../../../services/userService");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { promisify } = require("util");
const cloudinary = require("../../../../../config/cloudinary");
const cloudinaryUpload = promisify(cloudinary.uploader.upload);
const cloudinaryDestroy = promisify(cloudinary.uploader.destroy);

module.exports = {
  async register(req, res) {
    try {
      const hashPassword = await bcrypt.hashSync(req.body.password, 10);
      const data = await userService.create({
        role: req.body.role,
        name: req.body.name,
        email: req.body.email,
        password: hashPassword,
        city: req.body.city,
        address: req.body.address,
        phone: req.body.phone,
        image: req.body.image,
        createdAt: new Date(),
        updatedAt: new Date(),
      });
      res.status(201).json({
        status: true,
        message: "User successfully registered!",
        data: data,
      });
    } catch (err) {
      res.status(422).json({
        status: false,
        message: err.message,
      });
    }
  },

  async login(req, res) {
    try {
      // login user
      const mail = req.body.email;
      const user = await userService.getByEmail(mail);
      if (!user) return res.status(404).send({ message: "Email Not Found" });

      const match = await bcrypt.compare(req.body.password, user.password);
      if (!match) return res.status(400).json({ message: "Wrong Password" });

      const id = user.id;
      const role = user.role;
      const name = user.name;
      const email = user.email;
      const accessToken = jwt.sign(
        { id, role, name, email },
        process.env.ACCESS_TOKEN || "secret",
        {
          expiresIn: "1h",
        }
      );
      res.status(201).json({
        status: true,
        message: "Login Success!",
        accessToken: accessToken,
      });
    } catch (err) {
      res.status(404).json({
        status: false,
        message: err.message,
      });
    }
  },

  async profile(req, res) {
    try {
      const userTokenId = req.user.id
      const data = await userService.getById(userTokenId);
        res.status(200).json({
          status: true,
          message: "Successfully find data user",
          data: data,
        });
    } catch (err) {
      res.status(422).json({
        status: false,
        message: err.message,
      });
    }
  },
  async updateProfile(req, res) {
    try {
      console.log("file", req.file);
      const userTokenId = req.user.id;
      const user = JSON.parse(
        JSON.stringify(await userService.getById(userTokenId))
      );
      delete user.password;
      if (req.file === undefined || req.file === null) {
        user.name = req.body.name;
        user.email = req.body.email;
        user.city = req.body.city;
        user.address = req.body.address;
        user.phone = req.body.phone;
      } else {
        //hapus foto lama
        if (user.image !== null) {
          const oldImage = user.image.substring(65, 85);
          await cloudinaryDestroy(oldImage);
        }
        console.log("user before : ", user.name);
        // Upload foto baru
        const fileBase64 = req.file.buffer.toString("base64");
        const file = `data:${req.file.mimetype};base64,${fileBase64}`;
        const result = await cloudinaryUpload(file);
        const url = result.secure_url;

        // Masukan ke object Args
        user.name = req.body.name;
        user.email = req.body.email;
        user.city = req.body.city;
        user.address = req.body.address;
        user.phone = req.body.phone;
        user.image = url;
      }
      await userService.update(user.id, user);
      delete user.password;

      res.status(200).json({
        status: true,
        message: "User Updated",
        data: JSON.parse(JSON.stringify(user)),
      });
    } catch (err) {
      res.status(422).send(err.message);
    }
  },
  //     await userService.updateCurrentUser(userTokenId, req.body);
  //     const updatedData = await userService.getById(userTokenId);

  //     res.status(200).json({
  //       status: true,
  //       message: "Successfully update data user",
  //       data: updatedData,
  //     });
  //   } catch (err) {
  //     res.status(422).json({
  //       status: false,
  //       message: err.message,
  //     });
  //   }
  // },

  async changePassword(req, res) {
    try {
      const userTokenEmail = req.user.email;
      const userTokenId = req.user.id;
      const user = await userService.getByEmail(userTokenEmail);

      const isMatch = await bcrypt.compare(req.body.oldPassword, user.password);
      if (!isMatch) {
        res.status(400).json({
          status: false,
          message: "Password is incorrect!",
        });
        return;
      }
      await userService.updateCurrentUser(userTokenId, req.body);

      res.status(200).json({
        status: true,
        message: "Successfully change password!",
      });
    } catch (error) {
      res.status(422).json({
        status: false,
        message: error.message,
      });
    }
  },
};