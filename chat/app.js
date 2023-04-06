const express = require("express")
const http = require("http")
const app = express();
const path = require("path")
const server = http.createServer(app)
const socketIO = require("socket.io")
const io = socketIO(server)
const moment = require("moment")
const oracledb = require('oracledb')
const config = {
    user:"HR",
    password:"1234",
    connectString:"localhost/XE"

}
console.log("app.js 실행")

app.use(express.static(path.join(__dirname,"src")))

const PORT = process.env.PORT || 5000;

server.listen(PORT, () => console.log(`server is running ${PORT}`))

io.on("connection",(socket)=>{
    // console.log("연결이 이루어 졌습니다.") // 연결 확인
    socket.on("chatting",(data)=>{
        const { name, msg } = data;
        console.log(data)
        io.emit("chatting",{
            name,
            msg,
            time:moment(new Date()).format("h:mm A")
        })

        oracledb.getConnection(config,(err,conn)=>{
            todoWork(err,conn,name,msg);
        });

    })
}) // end of io.on

function todoWork(err,connection,name,msg){
    if(err){
        console.error(err.message);
        return;
    }
    connection.execute(`INSERT INTO openText VALUES(textID_seq.nextval, '${name}', '공개', '${msg}', sysdate)`,[],{autoCommit:true}, function(err,result){
        if(err){
            console.error(err.message);
            doRelease(connection);
            return;
        }
        doRelease(connection);
    });
}
function doRelease(connection){
    connection.release(function (err){
        if(err){
            console.error(err.message);
        }
    });
}