const port = 5432;

Bun.serve({
  port: port, // defaults to $BUN_PORT, $PORT, $NODE_PORT otherwise 3000
  fetch(req) {
    console.log(" ** Responding to", req.method, req.url);
    return new Response("Responding from " + port);
  },
});

console.log(` * Listening on http://localhost:${port}`);
