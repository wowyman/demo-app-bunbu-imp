Account.create!(email: "example1@localhost.com", password: "12345678", name: "example11")
service = Service.create!(name: "Post service 1", url: "http://localhost:5001", token: "post-service-sample-token")
Route.create!(service: service, verb: "get", url_pattern: "posts", version: "v1")
