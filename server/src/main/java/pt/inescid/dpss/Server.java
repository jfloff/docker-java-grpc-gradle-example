package pt.inescid.dpss;

import java.io.IOException;

import io.grpc.ServerBuilder;

public class Server {
    public static void main(String[] args) throws IOException, InterruptedException {
        io.grpc.Server server = ServerBuilder.forPort(20000)
          .addService(new HelloServiceImpl()).build();

        System.out.println("Starting server...");
        server.start();
        System.out.println("Server started!");
        server.awaitTermination();
    }
}
