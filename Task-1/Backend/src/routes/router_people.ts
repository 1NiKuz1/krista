import express from "express";
const PersonRouter = express.Router();

import { PersonController } from "../controllers/controller_person";

const Person: PersonController = new PersonController();

PersonRouter.get("/people", Person.getAll);
PersonRouter.get("/people/:id", Person.getOne);
PersonRouter.post("/people/add", Person.add);
PersonRouter.put("/people/update/:id", Person.update);
PersonRouter.delete("/people/delete/:id", Person.delete);

export { PersonRouter };
