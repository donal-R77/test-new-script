const { createServer } = require("http");
const { createReadStream } = require("fs");

const sendFile = (res, status, type, file) => {
    res.writeHead(status,{"Content-Type": type});
    createReadStream(file).pipe(res);
};
createServer((req,res) => {
    switch(req.url) {
        case "/":
            return sendFile(
                res,
                200,
                "text/html",
                "./index.html"
            );
        case "/styles.css":
            return sendFile(res, 200, "text/css", "./styles.css"); 
        default:
            return sendFile(res,404, "text/html", "./notfound.html")
    }
}).listen(5000);
console.log("At 5000");
