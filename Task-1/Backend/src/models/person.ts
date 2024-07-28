import { DataTypes, Model, Sequelize } from "sequelize";

class Person extends Model {
  declare id_person: number;
  declare login: string;
  declare age: number;
  declare email: string;
}

export const PersonModel = (sequelize: Sequelize) => {
  Person.init(
    {
      id_person: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      login: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      age: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    },
    {
      tableName: "people",
      timestamps: false,
      sequelize,
      modelName: "Person",
    }
  );

  return Person;
};
