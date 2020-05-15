//
// Signal Sciences Jetty Simple Example Server
// Copyright 2015-2017 Signal Sciences
// Proprietary and Confidential
//

package com.signalsciences.example;

import org.eclipse.jetty.util.IO;
import org.eclipse.jetty.util.log.Log;
import org.eclipse.jetty.util.log.Logger;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class TestServlet extends HttpServlet {
    private static final Logger LOG = Log.getLogger(TestServlet.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleTestRequest(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleTestRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleTestRequest(req, resp);
    }

    private int getInt(HttpServletRequest req, String paramName, int defValue) {
        String val = req.getParameter(paramName);
        if (val == null) {
            return defValue;
        }
        return Integer.parseInt(val);
    }

    private long getLong(HttpServletRequest req, String paramName, int defValue) {
        String val = req.getParameter(paramName);
        if (val == null) {
            return defValue;
        }
        return Long.parseLong(val);
    }

    private void handleTestRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        long responseTime = getLong(req, "response_time", 0);
        int responseCode = getInt(req, "response_code", 200);

        if (responseTime > 0) {
            try {
                TimeUnit.MILLISECONDS.sleep(responseTime);
            } catch (InterruptedException ignore) {
            }
        }

        resp.setStatus(responseCode);
        if (responseCode == 301 || responseCode == 302) {
            resp.addHeader("Location", "/");
        }
        resp.setContentType("text/plain");
        ServletOutputStream out = resp.getOutputStream();
        long size = getLong(req, "size", -1);
        for (long i = 1; i <= size; i++) {
            if (i == size) {
                out.write((byte) '\n');
            } else {
                out.write((byte) 'a');
            }
        }

        LOG.warn("TestServlet Param Map=" + req.getParameterMap());
        LOG.warn("TestServlet param a=" + req.getParameter("a"));
        LOG.warn("TestServlet qp=" + req.getParameter("foo"));
        LOG.warn("TestServlet pv=" + req.getParameterValues("a"));
        LOG.warn("TestServlet header=" + req.getHeaders("X-Forwarded-For"));
        resp.setContentType(req.getContentType());
        IO.copy(req.getInputStream(), out);
        out.write((byte) '\n');
    }
}
