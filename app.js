import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { PrismaClient } from "@prisma/client";

dotenv.config();

const app = express();
const prisma = new PrismaClient();

app.use(cors());

app.get("/getCreators", async (req, res) => {
  try {
    const creators = await prisma.creator.findMany();
    return res.status(200).json(creators);
  } catch (error) {
    return res.status(400).json(error);
  }
});

app.get("/getBrands", async (req, res) => {
  try {
    const brands = await prisma.brand.findMany();
    return res.status(200).json(brands);
  } catch (error) {
    return res.status(400).json(error);
  }
});

app.listen(process.env.PORT, () => {
  console.log(`Listening on port ${process.env.PORT}...`);
});
