import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.post("/website", (req, res) => {
  // for creating a new website
});

app.get("/status/:websiteId", (req, res) => {
  // for fetching status of all websites
});

app.listen(PORT, () => {
  console.log("Server is running on port 3000");
});
