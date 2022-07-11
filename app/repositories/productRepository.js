const { Product, category, User } = require("../../database/models");

module.exports = {
  findAll() {
    try {
      const data = Product.findAll({
        include: [{ 
          model: category, 
          as: "categories",
          attributes: ["name"] 
        }, 
        { 
          model: User,
          as: "userAsSeller",
          attributes: ["id","role", "name", "email", "city", "address", "phone"] 
        }],
    });

      if (data) {
        return data;
      }
    } catch (error) {
      return error;
    }
  },
  
  findById(id) {
    try {
      const data = Product.findOne({
        include: [
          {
            model: category,
            as: "categories",
            attributes: ["name"]
          },
          {
            model: User,
            as: "userAsSeller",
            attributes: ["id","role","name","email","city","address","phone"]
          },
        ],
        where: {
          id: id,
        },
      });

      if (data) {
        return data;
      }
    } catch (error) {
      return error;
    }
  },

  findBySellerId(id, sellerId) {
    try {
      return Product.findOne({
        where: {
          id: id,
          userId: sellerId,
        },
        include: [
          {
            model: category,
            as: "categories",
            attributes: ["name"]
          },
          {
            model: User,
            as: "userAsSeller",
            attributes: ["id","role","name","email","city","address","phone"]
          },
        ],
      });
    } catch (error) {
      return error;
    }
  },

  findBySeller(sellerId) {
    try {
      return Product.findAll({
        where: {
          userId: sellerId,
        },
        include: [{
          model: category,
          as: "categories",
          attributes: ["name"],
        },
        {
          model: User,
          as: "userAsSeller",
          attributes: ["id","role", "name", "email", "city", "address", "phone"]
          },
        ],
      });
    } catch (error) {
      return error;
    }
  },

  find(id) {
    try {
      const data = Product.findOne({
        include: [{ 
          model: category, 
          as: "categories",
          attributes: ["name"] 
        }, 
        { 
          model: User,
          as: "userAsSeller",
          attributes: ["role", "name", "email", "city", "address", "phone"] 
        }],
        where: {
          id: id,
        }
    });

      if (data) {
        return data;
      }
    } catch (error) {
      return error;
    }
  },

  create(createArgs) {
    return Product.create(createArgs);
  },

  update(id, updateArgs) {
    return Product.update(updateArgs, {
      where: {
        id,
      },
    });
  },

  delete(id) {
    return Product.destroy({
      where: {
        id,
      },
    });
  },
};
