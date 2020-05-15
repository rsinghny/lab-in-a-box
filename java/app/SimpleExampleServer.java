//
// Signal Sciences Jetty Simple Example Server
// Copyright 2015-2017 Signal Sciences
// Proprietary and Confidential
//

package com.signalsciences.example;

// These imports are required to be added to the application.

import com.signalsciences.jetty.SignalSciencesHandler;
import com.signalsciences.rpc.util.Timeout;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.DefaultHandler;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.handler.RequestLogHandler;
import org.eclipse.jetty.servlet.DefaultServlet;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.util.resource.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.File;
import java.net.InetSocketAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

//import ch.qos.logback.access.jetty.RequestLogImpl;

public class SimpleExampleServer {
    private static final Logger LOG = LoggerFactory.getLogger(SimpleExampleServer.class);

    public static void main(String args[]) throws Exception {
        String remoteUrl = "unix:/var/run/sigsci.sock";
        boolean sigsciEnabled = true;

        for (String arg : args) {
            if (arg.equals("--no-sigsci")) {
                sigsciEnabled = false;
            } else if (arg.startsWith("tcp:/") || arg.startsWith("unix:/")) {
                remoteUrl = arg;
            } else {
                throw new IllegalArgumentException("Unknown argument [" + arg + "]");
            }
        }

        if (remoteUrl == null) {
            System.out.println("ERROR: Remote RPC URL not specified");
            System.out.println("Usage: java -jar sigsci-jetty-simple-example.jar [--no-sigsci] [rpc-remote-url]");
            System.out.println();
            System.out.println("[rpc-remote-url]");
            System.out.println("   tcp://remote:18181    = TCP based server at host 'remote' port 18181");
            System.out.println("   unix:/tmp/sigsci.sock = Unix Sockets based server at path '/tmp/sigsci.sock'");
            System.exit(2);
        }

        Server server = new Server(InetSocketAddress.createUnresolved("0.0.0.0", 8080));
        ServletContextHandler context = new ServletContextHandler();
        ServletHolder defHolder = new ServletHolder("default", DefaultServlet.class);
        ServletHolder testHolder = new ServletHolder("test", TestServlet.class);
        HandlerList handlers = new HandlerList();

        URI remoteUri = URI.create(remoteUrl);
        URI webroot = findWebRoot();

        // Setup base context
        context.setBaseResource(Resource.newResource(webroot));
        

        // Servlet: /test
        context.addServlet(testHolder, "/test/*");
        context.addServlet(testHolder, "/test/");
        context.addServlet(testHolder, "/test");

        // Servlet: /
        defHolder.setInitParameter("pathInfoOnly", "true");
        defHolder.setInitParameter("dirAllowed", "true");
        defHolder.setInitParameter("acceptRanges", "true");
        context.addServlet(defHolder, "/*");
        context.addServlet(defHolder, "/");

        handlers.addHandler(context);
        handlers.addHandler(new DefaultHandler());

        // Setup logging
        RequestLogHandler requestLogHandler = new RequestLogHandler();
        //RequestLogImpl requestLogger = new RequestLogImpl();
        //requestLogger.setResource("/logback-access.xml");
        RequestLogger requestLogger = new RequestLogger();
        requestLogHandler.setRequestLog(requestLogger);

        // SigSci Wrapper Handler
        // This is the IMPORTANT PART and really the only part that needs to be added
        // to an existing application. Here, if sigsci is enabled, then wrap
        // the handlers, otherwise just use the handlers as-is.
        SignalSciencesHandler sigsciHandler;
        if (sigsciEnabled) {
            LOG.info("Signal Sciences WAF: enabled");
            sigsciHandler = new SignalSciencesHandler();
            sigsciHandler.setRpcServerURI(remoteUri);
            sigsciHandler.setRpcTimeout(new Timeout(500, TimeUnit.MILLISECONDS));
            sigsciHandler.setHandler(handlers);
            requestLogHandler.setHandler(sigsciHandler);
        } else {
            LOG.info("Signal Sciences WAF: disabled");
            requestLogHandler.setHandler(handlers);
        }
        server.setHandler(requestLogHandler);

        try {
            server.start();
            LOG.info("Signal Science Simple Example Server started ({})", server.getURI().toString());
            server.join();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            server.stop();
            LOG.info("Signal Science Simple Example Server stopped");
        }
    }

    private static URI findWebRoot() throws URISyntaxException {

        File f = new File("/example/index.html");
        URI webRootUri = new URI(f.toURI().toASCIIString());
        LOG.info("WebRoot is {}", webRootUri);
        return webRootUri;
    }
}
