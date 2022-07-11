const { category } = require("../../database/models");

module.exports = {
  findAll() {
    return category.findAll();
  },
  find(id) {
    return category.findOne({
      where: {
        id: id,
      },
    });
  },
  create(createArgs) {
    return category.create(createArgs);
  },
  update(id, updateArgs) {
    return category.update(updateArgs, {
      where: {
        id,
      },
    });
  },
  delete(id) {
    return category.destroy({
      where: {
        id,
      },
    });
  },
};
