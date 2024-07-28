import express from "express";
import { PersonRouter } from "./router_people";

const router = express.Router();

router.use("/api/", PersonRouter);

export { router };
