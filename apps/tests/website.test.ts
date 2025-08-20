// supertest is a library for testing HTTP requests but it wont work with rust tests

import { describe, it, expect } from "bun:test";
import axios from "axios";

let BASE_URL = "http://localhost:3000";

describe("Website gets created", () => {
  it("Website not created if url is not present", async () => {
    try {
      await axios.post(`${BASE_URL}/website`, {
        // no url field sent
      });

      expect(false, "Website created when it shouldn't");
    } catch (e) {
      // expected failure, test passes
    }
  });
  it("Website is created if url is present", async () => {
    const response = await axios.post(`${BASE_URL}/website`, {
      url: "https://google.com",
    });

    expect(response.data.id).not.toBeNull();
  });
});
