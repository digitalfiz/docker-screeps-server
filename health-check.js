// Add an endpoint /api/test to the HTTP server

module.exports = function(config) {
    if(config.backend) {
        config.backend.router.get('/health', (request, response) => {
            response.json({ ok: 1 });
        })
    }
};