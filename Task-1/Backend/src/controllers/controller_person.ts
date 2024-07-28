import type { Request, Response, NextFunction } from "express";
import { Person } from "../models";

interface IPersonController {
  getAll(req: Request, res: Response, next: NextFunction): Promise<Response>;
  getOne(req: Request, res: Response, next: NextFunction): Promise<Response>;
  add(req: Request, res: Response, next: NextFunction): Promise<Response>;
  update(req: Request, res: Response, next: NextFunction): Promise<Response>;
  delete(req: Request, res: Response, next: NextFunction): Promise<Response>;
}

class PersonController implements IPersonController {
  async getAll(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response> {
    try {
      const people = await Person.findAll();
      return res.json(people);
    } catch (error: any) {
      return res
        .status(500)
        .json({ error, message: "Ошибка при получении пользователей" });
    }
  }

  async getOne(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response> {
    try {
      const person = await Person.findByPk(req.params.id);
      return res.json(person);
    } catch (error: any) {
      return res
        .status(500)
        .json({ error, message: "Ошибка при получении пользователя" });
    }
  }

  async add(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response> {
    try {
      await Person.create(req.body);
      return res.json({ message: "Пользователь добавлен" });
    } catch (error: any) {
      return res
        .status(500)
        .json({ error, message: "Ошибка при создании пользователя" });
    }
  }

  async update(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response> {
    try {
      delete req.body.id_person;
      console.log(req.body);
      await Person.update(req.body, {
        where: { id_person: req.params.id },
      });
      return res.json({ message: "Пользователь обновлен" });
    } catch (error: any) {
      return res
        .status(500)
        .json({ error, message: "Ошибка при обновлении пользователя" });
    }
  }

  async delete(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response> {
    try {
      await Person.destroy({
        where: { id_person: req.params.id },
      });
      return res.json({ message: "Пользователь удален" });
    } catch (error: any) {
      return res
        .status(500)
        .json({ error, message: "Ошибка при удалении пользователя" });
    }
  }
}

export { PersonController };
