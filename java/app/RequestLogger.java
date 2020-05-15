//
// Signal Sciences Jetty Simple Example Server
// Copyright 2015-2017 Signal Sciences
// Proprietary and Confidential
//

package com.signalsciences.example;

import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.RequestLog;
import org.eclipse.jetty.server.Response;
import org.eclipse.jetty.util.component.LifeCycle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestLogger implements RequestLog, LifeCycle {
    private static final Logger LOG = LoggerFactory.getLogger(RequestLogger.class);
    private boolean started = false;

    @Override
    public void log(Request request, Response response) {
        LOG.info("\"{} {} {}\" {}", request.getMethod(), request.getRequestURI(), request.getHttpVersion().asString(), response.getStatus());
    }

    @Override
    public void start() {
        started = true;
    }

    @Override
    public void stop() {
        started = false;
    }

    @Override
    public boolean isRunning() {
        return started;
    }

    @Override
    public boolean isStarted() {
        return started;
    }

    @Override
    public boolean isStarting() {
        return false;
    }

    @Override
    public boolean isStopping() {
        return false;
    }

    @Override
    public boolean isStopped() {
        return !started;
    }

    @Override
    public boolean isFailed() {
        return false;
    }

    @Override
    public void addLifeCycleListener(Listener listener) {
        // Not Implemented
    }

    @Override
    public void removeLifeCycleListener(Listener listener) {
        // Not Implemented
    }
}
