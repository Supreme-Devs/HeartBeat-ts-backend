import express from "express";
import { prismaClient } from "store/client";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.post("/website", async (req, res) => {
  if (!req.body.url || req.body.url.trim() === "") {
    res.status(411).json({ error: "URL is required" });
    return;
  }
  // for creating a new website
  const website = await prismaClient.website.create({
    data: {
      url: req.body.url,
      timeAdd: new Date(),
      // not using time series db right now
    },
  });
  res.json({
    id: website.id,
  });
});

app.get("/status/:websiteId", (req, res) => {
  // for fetching status of all websites
});

app.listen(PORT, () => {
  console.log("Server is running on port 3000");
});
